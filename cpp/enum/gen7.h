// gen7.h, fast drop-in (native/leaf/gen7fast, 2026-10-07): the same certificates, bit for bit, 4-8x faster.  Exact changes:
//  * minimize: removals tried in (cost, order) and the first that passes okset taken (the original's choice); the costs by
//    prefix/suffix ANDs; okset compares per-b candidate masks with the target's instead of listing pairs;
//  * look-ahead: min_cands counts candidates (popcount) and stops at the running minimum / the score bound;
//  * rgen: candidate counts for every term, lists only for the options used (the first max(K, deadk) of the same order);
//  * records: xof by two lookup tables per record (built in mkrec), resRoot cached, child nodes reuse the parent's records for
//    X with par(X & a_new) = 0 (the same R(X) and count).
// Original header follows.
// gen7.h: the v7 leaf-certificate generator in C++ (hcls/E1P).  Port of leaf2/gen7.py (gen6la look-ahead branching with the
// v7 GL3 pair filter), branch6/bmodel4lg6.py (records, candidates, claim minimisation, finalize = attach + hoist) and
// branch6/emit6.py enc_cert, with the same output bit for bit.  The checker side (check7) is not ported: certificates are
// checked by the kernel (BC7.leafS), and by Python's check7 in the comparison tool.
//
//   g7::Leaf L(terms, dom_list, lg);            // terms: 9-bit first factors (at most 32); dom_list: functionals X, ascending
//   g7::Cert* c = L.gen(K, maxnodes, deadk);     // throws g7::Big past maxnodes, g7::Sat if a decomposition exists
//   c = L.finalize(c);  BW w; g7::enc_cert(w, c);
//
// Doubles: node costs are computed operation by operation as Python's floats (volatile temporaries, no FMA).
#pragma once
#include <array>
#include <bits/stdc++.h>

namespace g7 {

typedef unsigned long long u64;
struct Big : std::runtime_error { Big() : std::runtime_error("maxnodes") {} };
struct Sat : std::runtime_error { Sat() : std::runtime_error("SAT") {} };

// ------------------------------------------------------------------------------------------------ 512-bit masks
struct M { u64 w[8]; };
static inline M mand(const M& a, const M& b) { M r; for (int i = 0; i < 8; i++) r.w[i] = a.w[i] & b.w[i]; return r; }
static inline M mor(const M& a, const M& b) { M r; for (int i = 0; i < 8; i++) r.w[i] = a.w[i] | b.w[i]; return r; }
static inline M mnot(const M& a) { M r; for (int i = 0; i < 8; i++) r.w[i] = ~a.w[i]; return r; }
static inline bool mz(const M& a) { u64 o = 0; for (int i = 0; i < 8; i++) o |= a.w[i]; return o == 0; }
static inline bool meq(const M& a, const M& b) { for (int i = 0; i < 8; i++) if (a.w[i] != b.w[i]) return false; return true; }
static inline int mpop(const M& a) { int s = 0; for (int i = 0; i < 8; i++) s += __builtin_popcountll(a.w[i]); return s; }
static inline bool mbit(const M& a, int i) { return (a.w[i >> 6] >> (i & 63)) & 1; }
static inline void mset(M& a, int i) { a.w[i >> 6] |= 1ULL << (i & 63); }
static inline M mfull() { M r; for (int i = 0; i < 8; i++) r.w[i] = ~0ULL; return r; }
static inline M mzero() { M r; for (int i = 0; i < 8; i++) r.w[i] = 0; return r; }
template <class F> static inline void mbits(const M& a, F f) {
  for (int q = 0; q < 8; q++) for (u64 x = a.w[q]; x; x &= x - 1) f(64 * q + __builtin_ctzll(x));
}

// ------------------------------------------------------------------------------------------------ tables (bmodel, bmodel4)
struct Tables {
  int PAR[512];
  int TX[512][9];               // rows of T(X), 9-bit over z (TX[0] = 0)
  bool ORBMIN[512]; M ORBM, ALLNZ, M512F;
  M NPM[512];                   // {c : par(c & v) = 1}
  M CORB[512];                  // v7: c minimal in their Stab(b)-orbit (b orbit-min)
  struct Root { uint32_t P[9]; int PM, rk; M lm, rm, lm2; uint16_t xlo[32], xhi[16]; } ROOT[512];
  int RKV[512]; M RANKGE[4];
  Tables() {
    for (int i = 0; i < 512; i++) PAR[i] = __builtin_popcount(i) & 1;
    int Tt[9][9][9] = {};
    for (int i = 0; i < 3; i++) for (int j = 0; j < 3; j++) for (int k = 0; k < 3; k++) Tt[3 * i + j][3 * j + k][3 * k + i] = 1;
    for (int y = 0; y < 9; y++) TX[0][y] = 0;
    for (int X = 1; X < 512; X++) for (int y = 0; y < 9; y++) {
      int r = 0;
      for (int z = 0; z < 9; z++) { int v = 0; for (int x = 0; x < 9; x++) if ((X >> x) & 1) v ^= Tt[x][y][z]; r |= v << z; }
      TX[X][y] = r;
    }
    // GL3 and orbit minima (b -> b S)
    std::vector<int> G;
    for (int r0 = 1; r0 < 8; r0++) for (int r1 = 1; r1 < 8; r1++) for (int r2 = 1; r2 < 8; r2++) {
      int m[3] = {r0, r1, r2}; std::map<int, int> bas; bool ok = true;
      for (int v0 : m) { int v = v0; while (v) { int h = 31 - __builtin_clz(v); if (!bas.count(h)) { bas[h] = v; break; } v ^= bas[h]; } if (!v) ok = false; }
      if (ok) G.push_back(r0 | (r1 << 3) | (r2 << 6));
    }
    if (G.size() != 168) throw std::runtime_error("GL3");
    auto mul3 = [](int u, int v) { int r = 0; for (int j = 0; j < 3; j++) { int row = (u >> (3 * j)) & 7, o = 0; for (int k = 0; k < 3; k++) if ((row >> k) & 1) o ^= (v >> (3 * k)) & 7; r |= o << (3 * j); } return r; };
    std::map<int, int> INV; for (int s : G) for (int t : G) if (mul3(s, t) == 273) INV[s] = t;
    ORBM = mzero(); ALLNZ = mfull(); ALLNZ.w[0] &= ~1ULL; M512F = mfull();
    for (int b = 0; b < 512; b++) {
      bool mn = true; for (int s : G) if (mul3(b, s) < b) { mn = false; break; }
      ORBMIN[b] = mn; if (mn && b > 0) mset(ORBM, b);
      CORB[b] = mzero();
    }
    for (int b = 1; b < 512; b++) if (ORBMIN[b]) {
      std::vector<int> st; for (int s : G) if (mul3(b, s) == b) st.push_back(s);
      for (int c = 1; c < 512; c++) { bool ok = true; for (int s : st) if (mul3(INV[s], c) < c) { ok = false; break; } if (ok) mset(CORB[b], c); }
    }
    for (int v = 0; v < 512; v++) { NPM[v] = mzero(); for (int c = 0; c < 512; c++) if (PAR[c & v]) mset(NPM[v], c); }
    for (int X = 0; X < 512; X++) {
      uint32_t Mc[9], Mr[9]; resRoot(X, Mc, Mr);
      Root& R = ROOT[X]; uint32_t P[9], P2[9]; int PM, rk, PM2, rk2;
      elim(Mc, P, PM, rk); elim(Mr, P2, PM2, rk2);
      memcpy(R.P, P, sizeof P); R.PM = PM; R.rk = rk; R.lm = lm_compl(P, PM); R.rm = ker_mask(Mc); R.lm2 = ker_mask(Mr);
      { uint16_t v[9]; for (int h = 0; h < 9; h++) v[h] = (uint16_t)((P[h] >> 9) & 511);
        R.xlo[0] = 0; for (int i = 1; i < 32; i++) R.xlo[i] = R.xlo[i & (i - 1)] ^ v[__builtin_ctz(i)];
        R.xhi[0] = 0; for (int i = 1; i < 16; i++) R.xhi[i] = R.xhi[i & (i - 1)] ^ v[5 + __builtin_ctz(i)]; }
      if (!meq(R.lm, R.lm2)) throw std::runtime_error("root masks");
    }
    for (int v = 0; v < 512; v++) {
      if (!v) { RKV[v] = 0; continue; }
      int rows[3] = {v & 7, (v >> 3) & 7, (v >> 6) & 7}; std::vector<int> basis; int rk = 0;
      for (int x : rows) { for (int bv : basis) x = std::min(x, x ^ bv); if (x) { basis.push_back(x); rk++; } }
      RKV[v] = rk;
    }
    for (int k = 0; k < 4; k++) { RANKGE[k] = mzero(); for (int v = 0; v < 512; v++) if (RKV[v] >= k) mset(RANKGE[k], v); }
    for (int X = 0; X < 512; X++) resRoot0(X, RMc[X], RMr[X]);
    rmc_ok = true;
  }
  uint32_t RMc[512][9], RMr[512][9]; bool rmc_ok = false;   // resRoot, cached once the tables are built
  void resRoot0(int X, uint32_t* Mc, uint32_t* Mr) const {
    for (int z = 0; z < 9; z++) { int col = 0; for (int y = 0; y < 9; y++) col |= ((TX[X][y] >> z) & 1) << y; Mc[z] = (uint32_t)col | (1u << (9 + z)); }
    for (int y = 0; y < 9; y++) Mr[y] = (uint32_t)TX[X][y] | (1u << (9 + y));
  }
  void resRoot(int X, uint32_t* Mc, uint32_t* Mr) const {
    if (rmc_ok) { memcpy(Mc, RMc[X], sizeof RMc[X]); memcpy(Mr, RMr[X], sizeof RMr[X]); return; }
    resRoot0(X, Mc, Mr);
  }
  // bmodel4.elim on 9 slots of 18 bits: pivots from bit 8 down, the lowest slot with the bit; P = pivot rows by pivot index
  static void elim(uint32_t* Ms, uint32_t* P, int& PM, int& rk) {
    for (int i = 0; i < 9; i++) P[i] = 0;
    PM = 0; rk = 0;
    for (int h = 8; h >= 0; h--) {
      int z0 = -1; for (int z = 0; z < 9; z++) if ((Ms[z] >> h) & 1) { z0 = z; break; }
      if (z0 < 0) continue;
      uint32_t p = Ms[z0];
      for (int z = 0; z < 9; z++) if ((Ms[z] >> h) & 1) Ms[z] ^= p;
      for (int z = 0; z < 9; z++) if ((P[z] >> h) & 1) P[z] ^= p;
      P[h] |= p; PM |= 1 << h; rk++;
    }
  }
  static bool elim_ok(const uint32_t* Ms, const uint32_t* P, int PM) {
    for (int z = 0; z < 9; z++) if (Ms[z] & 511) return false;                       // left halves of the leftover rows
    for (int h = 0; h < 9; h++) if (P[h] & (511u & ~((2u << h) - 1))) return false;  // no bits above h in slot h
    for (int z = 0; z < 9; z++) for (int h = 0; h < 9; h++) if ((PM >> h) & 1) { int bitv = (P[z] >> h) & 1; if (bitv != (z == h)) return false; }
    for (int z = 0; z < 9; z++) if (!((PM >> z) & 1) && P[z]) return false;
    return true;
  }
  M perp(int v) const { return mnot(NPM[v & 511]); }
  static int gather(const uint32_t* P, int j) { int r = 0; for (int h = 0; h < 9; h++) r |= ((P[h] >> j) & 1) << h; return r; }
  M lm_compl(const uint32_t* P, int PM) const { M lm = M512F; for (int j = 0; j < 9; j++) if (!((PM >> j) & 1)) lm = mand(lm, perp(gather(P, j) | (1 << j))); return lm; }
  M ker_mask(const uint32_t* Ms) const { M m = M512F; for (int z = 0; z < 9; z++) if (Ms[z]) m = mand(m, perp((int)(Ms[z] >> 9))); return m; }
  static int xof(const uint32_t* P, int b) { int x = 0; for (int h = 0; h < 9; h++) if ((b >> h) & 1) x ^= (P[h] >> 9) & 511; return x; }
  int gof(const uint32_t* P, int c) const { int g = 0; for (int h = 0; h < 9; h++) g |= PAR[((P[h] >> 9) & 511) & c] << h; return g; }
};
static const Tables& T() { static Tables t; return t; }

// ------------------------------------------------------------------------------------------------ certificates
struct Cert {
  bool over = false; int X = 0;                       // OVER(X)
  int t = 0; std::vector<int> NT, SL; std::vector<Cert*> kids; bool sym = false, cdir = false;
  std::vector<std::pair<int, int>> cs;                // attach_cands annotation
  bool sat = false; std::vector<u64> sw; size_t swn = 0;   // SAT leaf (satmode): the bits w of leaf2's BC7L (S7L.liftTest)
};

struct BW {
  std::vector<u64> w; size_t n = 0;
  void put(u64 x, int k) {
    if (k < 64 && x >= (1ULL << k)) throw std::runtime_error("cert field overflow");
    if (!k) return;
    size_t q = n >> 6; int s = n & 63;
    if (w.size() < q + 2) w.resize(q + 2, 0);
    w[q] |= x << s; if (s && s + k > 64) w[q + 1] |= x >> (64 - s);
    n += k;
  }
};
static void enc_cert(BW& w, const Cert* c) {
  if (c->sat) {   // BC7L SAT leaf: br flag 1 and term field 31, [24] len, then len bits of w
    w.put(63, 6); w.put(c->swn, 24);
    for (size_t i = 0; i < c->swn; i += 64) { int k = (int)std::min<size_t>(64, c->swn - i); w.put(c->sw[i / 64] & (k == 64 ? ~0ULL : ((1ULL << k) - 1)), k); }
    return;
  }
  if (c->over) { w.put(0, 1); w.put(c->X, 9); return; }
  w.put(1, 1); w.put(c->t, 5); w.put(c->sym, 1); w.put(c->cdir, 1);
  w.put(c->NT.size(), 4); for (int X : c->NT) w.put(X, 9);
  w.put(c->SL.size(), 3); for (int X : c->SL) w.put(X, 9);
  for (auto* k : c->kids) enc_cert(w, k);
}

// ------------------------------------------------------------------------------------------------ one leaf
struct XT { uint16_t lo[32], hi[16]; };
static inline void mkxt(const uint32_t* P, XT& t) {
  uint16_t v[9]; for (int h = 0; h < 9; h++) v[h] = (uint16_t)((P[h] >> 9) & 511);
  t.lo[0] = 0; for (int i = 1; i < 32; i++) { int h = __builtin_ctz(i); t.lo[i] = t.lo[i & (i - 1)] ^ v[h]; }
  t.hi[0] = 0; for (int i = 1; i < 16; i++) { int h = __builtin_ctz(i); t.hi[i] = t.hi[i & (i - 1)] ^ v[5 + h]; }
}
struct Rec { int X; uint32_t P[9]; int PM; M lm, rm; XT xt; };
struct Slk { M lm, rm; };
struct Asg { int a, b, c; };

struct Leaf {
  const Tables& Tb;
  std::vector<int> terms; std::vector<int> dom;         // dom_list, ascending
  int n; uint32_t hxm[512];                             // terms through X
  bool lg = false; std::vector<int> need;               // Lemma G (TF hook)
  int CURT = -1;
  long long cnt = 0, maxnodes = 300000; int deadk = 6, K = 4;
  // fit: the overflow fallback (not in the Python reference).  enc_cert writes |NT| in 4 bits and |SL| in 3; with fit, a node's
  // chosen sets are cut to 15 / 7 (dropping the entry whose removal leaves the fewest candidates; the extra candidates become
  // kids, refuted as usual) and hoist lifts at most 15 - |NT| claims (the most shared).  Off by default: the certificate is then
  // bit-identical to branch6's.
  bool fit = false;
  // satmode: a complete assignment (a decomposition) becomes a SAT leaf of leaf2's BC7L (`BC7L.leafSL S7L.liftTest`) instead of
  // throwing Sat.  w = [7] nH, then nH functionals of 81 bits (entry (y, z) at bit 9y + z): a basis of the annihilator of
  // span{b_e c_eᵀ} over the path's assignment (S7L.liftTest checks that they kill every b_e c_eᵀ, then the rank-1 test).
  bool satmode = false;
  static void satw(const std::vector<Asg>& asg, Cert* c) {
    std::vector<std::array<u64, 2>> rows;
    for (auto& e : asg) {
      std::array<u64, 2> m{0, 0};
      for (int y = 0; y < 9; y++) if ((e.b >> y) & 1) for (int z = 0; z < 9; z++) if ((e.c >> z) & 1) { int k = 9 * y + z; m[k >> 6] |= 1ULL << (k & 63); }
      rows.push_back(m);
    }
    auto bit = [](const std::array<u64, 2>& v, int k) { return (v[k >> 6] >> (k & 63)) & 1; };
    std::vector<int> piv; size_t r = 0;
    for (int col = 0; col < 81 && r < rows.size(); col++) {
      size_t p = r; while (p < rows.size() && !bit(rows[p], col)) p++;
      if (p == rows.size()) continue;
      std::swap(rows[r], rows[p]);
      for (size_t i = 0; i < rows.size(); i++) if (i != r && bit(rows[i], col)) { rows[i][0] ^= rows[r][0]; rows[i][1] ^= rows[r][1]; }
      piv.push_back(col); r++;
    }
    std::vector<char> isp(81, 0); for (int q : piv) isp[q] = 1;
    BW w; w.put(81 - r, 7);
    for (int f = 0; f < 81; f++) if (!isp[f]) {
      std::array<u64, 2> h{0, 0}; h[f >> 6] |= 1ULL << (f & 63);
      for (size_t i = 0; i < r; i++) if (bit(rows[i], f)) h[piv[i] >> 6] |= 1ULL << (piv[i] & 63);
      w.put(h[0], 64); w.put(h[1], 17);
    }
    c->sw = w.w; c->swn = w.n;
  }
  std::deque<Cert> pool;
  Leaf(const std::vector<int>& tm, const std::vector<int>& dl, bool lg_ = false) : Tb(T()), terms(tm), dom(dl), n((int)tm.size()) {
    if (n > 32) throw std::runtime_error("more than 32 terms");
    for (int X = 0; X < 512; X++) { uint32_t m = 0; for (int s = 0; s < n; s++) if (Tb.PAR[terms[s] & X]) m |= 1u << s; hxm[X] = m; }
    if (lg_) {   // bmodel6.lg_need; run7 sets TF only when Delta >= 0
      int D = -27; for (int a : terms) D += Tb.RKV[a];
      if (D >= 0) { lg = true; for (int a : terms) need.push_back(std::max(0, Tb.RKV[a] - D)); }
    }
  }
  Cert* mk() { pool.emplace_back(); return &pool.back(); }
  int ucnt(uint32_t act, int X) const { return __builtin_popcount(hxm[X] & act); }
  bool noasg(int X, const std::vector<Asg>& asg) const { for (auto& g : asg) if (Tb.PAR[g.a & X]) return false; return true; }
  void resC(int X, const std::vector<Asg>& asg, uint32_t* Ms) const {
    uint32_t Mr[9]; Tb.resRoot(X, Ms, Mr);
    for (auto& g : asg) if (Tb.PAR[g.a & X]) for (int z = 0; z < 9; z++) if ((g.c >> z) & 1) Ms[z] ^= (uint32_t)g.b;
  }
  void resR(int X, const std::vector<Asg>& asg, uint32_t* Ms) const {
    uint32_t Mc[9]; Tb.resRoot(X, Mc, Ms);
    for (auto& g : asg) if (Tb.PAR[g.a & X]) for (int y = 0; y < 9; y++) if ((g.b >> y) & 1) Ms[y] ^= (uint32_t)g.c;
  }
  // rank of R(X)
  int rankR(int X, const std::vector<Asg>& asg, bool* ok = nullptr) const {
    uint32_t Ms[9], P[9]; int PM, rk; resC(X, asg, Ms); Tables::elim(Ms, P, PM, rk);
    if (ok) *ok = Tables::elim_ok(Ms, P, PM);
    return rk;
  }
  bool mkrec(int X, uint32_t act, const std::vector<Asg>& asg, Rec& r) const {
    if (noasg(X, asg)) {
      auto& R = Tb.ROOT[X]; if (R.rk < ucnt(act, X)) return false;
      r.X = X; memcpy(r.P, R.P, sizeof r.P); r.PM = R.PM; r.lm = R.lm; r.rm = R.rm;
      memcpy(r.xt.lo, R.xlo, sizeof r.xt.lo); memcpy(r.xt.hi, R.xhi, sizeof r.xt.hi); return true;
    }
    uint32_t Ms[9], P[9]; int PM, rk; resC(X, asg, Ms); Tables::elim(Ms, P, PM, rk);
    if (!Tables::elim_ok(Ms, P, PM) || rk < ucnt(act, X)) return false;
    r.X = X; memcpy(r.P, P, sizeof P); r.PM = PM; r.lm = Tb.lm_compl(P, PM); r.rm = Tb.ker_mask(Ms); mkxt(P, r.xt); return true;
  }
  bool mkslack(int X, uint32_t act, const std::vector<Asg>& asg, Slk& s) const {
    if (noasg(X, asg)) {
      auto& R = Tb.ROOT[X]; if (R.rk + 1 < ucnt(act, X)) return false;
      s.lm = R.lm2; s.rm = R.rm; return true;
    }
    uint32_t Ms[9], P[9]; int PM, rk; resC(X, asg, Ms); Tables::elim(Ms, P, PM, rk);
    if (!Tables::elim_ok(Ms, P, PM) || rk + 1 < ucnt(act, X)) return false;
    uint32_t M2[9], P2[9]; int PM2, rk2; resR(X, asg, M2); Tables::elim(M2, P2, PM2, rk2);
    if (!Tables::elim_ok(M2, P2, PM2)) return false;
    s.lm = Tb.ker_mask(M2); s.rm = Tb.ker_mask(Ms); return true;
  }
  Rec upd(const Rec& r, int a, int b, int c) const {
    if (!Tb.PAR[r.X & a]) return r;
    Rec q = r; q.lm = mand(r.lm, Tb.perp(Tb.gof(r.P, c))); q.rm = mand(r.rm, Tb.perp(Tables::xof(r.P, b))); return q;
  }
  // bmodel4lg6.cands with the TF hook and gen7's v7 filter (sym and not cdir: c in CORB[b])
  void cands(const std::vector<const Rec*>& recs, const std::vector<const Slk*>& slack, bool sym, bool cdir,
             std::vector<std::pair<int, int>>& out) const {
   
    out.clear();
    M B = mand(Tb.ALLNZ, sym ? Tb.ORBM : Tb.M512F), Cb = Tb.ALLNZ;
    if (lg && CURT >= 0) { const M& g = Tb.RANKGE[need[CURT]]; B = mand(B, g); Cb = mand(Cb, g); }
    for (auto* r : recs) B = mand(B, r->lm);
    if (mz(B)) return;
    for (auto* r : recs) Cb = mand(Cb, r->rm);
    if (!cdir) {
      mbits(B, [&](int b) {
        M m = Cb; int bl = b & 31, bh = b >> 5;
        for (auto* r : recs) m = mand(m, Tb.NPM[r->xt.lo[bl] ^ r->xt.hi[bh]]);
        for (auto* s : slack) if (!mbit(s->lm, b)) m = mand(m, s->rm);
        if (sym) m = mand(m, Tb.CORB[b]);
        mbits(m, [&](int c) { out.push_back({b, c}); });
      });
    } else {
      mbits(Cb, [&](int c) {
        M m = B;
        for (auto* r : recs) m = mand(m, Tb.NPM[Tb.gof(r->P, c)]);
        for (auto* s : slack) if (!mbit(s->rm, c)) m = mand(m, s->lm);
        mbits(m, [&](int b) { out.push_back({b, c}); });
      });
    }
  }
  std::pair<int, int> domsize(const std::vector<const Rec*>& recs, bool sym) const {
    M B = mand(Tb.ALLNZ, sym ? Tb.ORBM : Tb.M512F), C = Tb.ALLNZ;
    if (lg && CURT >= 0) { const M& g = Tb.RANKGE[need[CURT]]; B = mand(B, g); C = mand(C, g); }
    for (auto* r : recs) { B = mand(B, r->lm); C = mand(C, r->rm); }
    return {mpop(B), mpop(C)};
  }
  // Python's float expression CT*nt + CS*ns + (CE + CR*len(part)) * n, each operation rounded to double: the volatile
  // temporaries keep the compiler from fusing a multiply-add (FMA) whatever -ffp-contract is
  static double node_cost(int nt, int ns, size_t npart, int nb, int nc, bool cdir) {
    const double CT = 3.0, CS = 6.0, CE = 0.2, CR = 0.3;
    volatile double a = CT * (double)nt; volatile double b = CS * (double)ns; volatile double c = CR * (double)npart;
    volatile double d = CE + c; volatile double e = d * (double)(cdir ? nc : nb); volatile double f = a + b;
    return f + e;
  }

  // ---- gen6la.analyze
  struct Info { int rk, u; };
  // returns -1 = live (info filled), -2 = SAT, X >= 0 = OVER(X)
  int analyze(uint32_t act, const std::vector<Asg>& asg, const std::vector<Info>* info0, int a_new, std::vector<Info>& info) const {
   
    info.assign(512, Info{0, 0});
    for (int X : dom) {
      if (info0 && !Tb.PAR[X & a_new]) { info[X] = (*info0)[X]; continue; }
      int rk = rankR(X, asg); int u = ucnt(act, X);
      if (rk > u) return X;
      info[X] = Info{rk, u};
    }
    if (!act) return -2;
    return -1;
  }
  // ---- gen6la.Node: memoised records of a node
  struct Node {
    const Leaf* L; uint32_t act; const std::vector<Asg>* asg; const std::vector<Rec>* recs; bool sym;
    M have; std::vector<int> tight, slack;
    int16_t ri[512], si[512];               // memo indices (-1: not computed, -2: failed)
    std::deque<Rec> rv; std::deque<Slk> sv;   // stable addresses
    // the parent node and the new term: for X with par(X & anew) = 0 the records are the parent's (same R(X), same count)
    Node* par = nullptr; int anew = 0;
    Node(const Leaf* L_, uint32_t act_, const std::vector<Asg>* asg_, const std::vector<Rec>* recs_, const std::vector<Info>& info,
         Node* par_ = nullptr, int anew_ = 0)
      : L(L_), act(act_), asg(asg_), recs(recs_), sym(asg_->empty()), have(mzero()), par(par_), anew(anew_) {
      for (int i = 0; i < 512; i++) { ri[i] = -1; si[i] = -1; }
      for (auto& r : *recs) mset(have, r.X);
      for (int X : L->dom) { if (info[X].rk >= info[X].u) tight.push_back(X); if (info[X].rk + 1 == info[X].u) slack.push_back(X); }
    }
    const Rec* rec_of(int X) {
      if (par && !L->Tb.PAR[X & anew]) return par->rec_of(X);
      if (ri[X] == -1) { Rec r; if (L->mkrec(X, act, *asg, r)) { ri[X] = (int16_t)rv.size(); rv.push_back(r); } else ri[X] = -2; }
      if (ri[X] < 0) throw std::runtime_error("rec_of: not tight");
      return &rv[ri[X]];
    }
    const Slk* sl_of(int X) {
      if (par && !L->Tb.PAR[X & anew]) return par->sl_of(X);
      if (si[X] == -1) { Slk q; if (L->mkslack(X, act, *asg, q)) { si[X] = (int16_t)sv.size(); sv.push_back(q); } else si[X] = -2; }
      if (si[X] < 0) throw std::runtime_error("sl_of: not slack");
      return &sv[si[X]];
    }
    void term_data(int t, std::vector<const Rec*>& inh, std::vector<int>& NT, std::vector<int>& SL) const {
      int a = L->terms[t]; inh.clear(); NT.clear(); SL.clear();
      for (auto& r : *recs) if (L->Tb.PAR[r.X & a]) inh.push_back(&r);
      for (int X : tight) if (L->Tb.PAR[X & a] && !mbit(have, X)) NT.push_back(X);
      for (int X : slack) if (L->Tb.PAR[X & a]) SL.push_back(X);
    }
  };
  void part_of(Node& nd, const std::vector<const Rec*>& inh, const std::vector<int>& NT, std::vector<const Rec*>& part) {
    part = inh; for (int X : NT) part.push_back(nd.rec_of(X));
  }
  void slacks_of(Node& nd, const std::vector<int>& SL, std::vector<const Slk*>& sl) { sl.clear(); for (int X : SL) sl.push_back(nd.sl_of(X)); }
  size_t full_cands(Node& nd, int t, const std::vector<const Rec*>& inh, const std::vector<int>& NT, const std::vector<int>& SL,
                    std::vector<std::pair<int, int>>* out) {
    CURT = t; std::vector<const Rec*> part; part_of(nd, inh, NT, part); std::vector<const Slk*> sl; slacks_of(nd, SL, sl);
    std::vector<std::pair<int, int>> tmp; cands(part, sl, nd.sym, false, out ? *out : tmp);
    return out ? out->size() : tmp.size();
  }
  // the number of candidates of term t, or some value >= lim once the count reaches lim (exact below lim)
  long long count_cands(Node& nd, int t, const std::vector<const Rec*>& inh, const std::vector<int>& NT, const std::vector<int>& SL, long long lim) {
    CURT = t; std::vector<const Rec*>& part = sc_part; part_of(nd, inh, NT, part); std::vector<const Slk*>& sl = sc_sl; slacks_of(nd, SL, sl);
    bool sym = nd.sym;
    M B = mand(Tb.ALLNZ, sym ? Tb.ORBM : Tb.M512F), Cb = Tb.ALLNZ;
    if (lg && CURT >= 0) { const M& g = Tb.RANKGE[need[CURT]]; B = mand(B, g); Cb = mand(Cb, g); }
    for (auto* r : part) B = mand(B, r->lm);
    if (mz(B)) return 0;
    for (auto* r : part) Cb = mand(Cb, r->rm);
    long long cnt_ = 0;
    for (int q = 0; q < 8; q++) for (u64 x = B.w[q]; x; x &= x - 1) {
      int b = 64 * q + __builtin_ctzll(x);
      M m = cmask(part, sl, sym, Cb, b);
      cnt_ += mpop(m);
      if (cnt_ >= lim) return cnt_;
    }
    return cnt_;
  }
  long long min_cands(uint32_t act, const std::vector<Asg>& asg, const std::vector<Rec>& recs, const std::vector<Info>& info0, int a_new, long long bound,
                      Node* pnd = nullptr) {
   
    std::vector<Info> info; int r = analyze(act, asg, &info0, a_new, info);
    if (r >= 0) return 0;
    if (r == -2) return 1000000000LL;
    Node nd(this, act, &asg, &recs, info, pnd, a_new);
    long long best = bound; std::vector<const Rec*> inh; std::vector<int> NT, SL;
    for (int t = 0; t < n; t++) if ((act >> t) & 1) {
      nd.term_data(t, inh, NT, SL);
      long long k = count_cands(nd, t, inh, NT, SL, best);
      if (k < best) { best = k; if (best == 0) break; }
    }
    return best;
  }
  // ---- gen7._gen
  struct Opt { size_t n0; int t; int a; std::vector<const Rec*> inh; std::vector<int> NT, SL; std::vector<std::pair<int, int>> target; };
  // xof(P, b) = XL[b & 31] ^ XH[b >> 5] (per record, built on demand in the candidate loops)
  std::vector<XT> sc_xt;
  void mkxts(const std::vector<const Rec*>& part) { sc_xt.resize(part.size()); for (size_t i = 0; i < part.size(); i++) mkxt(part[i]->P, sc_xt[i]); }
  // the c-mask of b: Cb, the records' NPM[xof], the slacks, CORB (sym)
  M cmask(const std::vector<const Rec*>& part, const std::vector<const Slk*>& sl, bool sym, const M& Cb, int b) const {
    M m = Cb; int bl = b & 31, bh = b >> 5;
    for (auto* r : part) m = mand(m, Tb.NPM[r->xt.lo[bl] ^ r->xt.hi[bh]]);
    for (auto* s : sl) if (!mbit(s->lm, b)) m = mand(m, s->rm);
    if (sym) m = mand(m, Tb.CORB[b]);
    return m;
  }
  // target as per-b masks (TB = the b's of target, TM[b] = their c's); built once per minimize call
  M TB; M TM[512];
  void set_target(const std::vector<std::pair<int, int>>& target) {
    mbits(TB, [&](int b) { TM[b] = mzero(); });
    TB = mzero();
    for (auto& [b, c] : target) { if (!mbit(TB, b)) { mset(TB, b); TM[b] = mzero(); } mset(TM[b], c); }
  }
  // cands(part, sl, sym, false) == target, decided per b without listing the pairs (exact)
  bool okset(Node& nd, const std::vector<const Rec*>& inh, const std::vector<int>& NT2, const std::vector<int>& SL2, const std::vector<std::pair<int, int>>& target) {
    (void)target;
    std::vector<const Rec*>& part = sc_part; part_of(nd, inh, NT2, part); std::vector<const Slk*>& sl = sc_sl; slacks_of(nd, SL2, sl);
    bool sym = nd.sym;
    M B = mand(Tb.ALLNZ, sym ? Tb.ORBM : Tb.M512F), Cb = Tb.ALLNZ;
    if (lg && CURT >= 0) { const M& g = Tb.RANKGE[need[CURT]]; B = mand(B, g); Cb = mand(Cb, g); }
    for (auto* r : part) B = mand(B, r->lm);
    // every target b must stay in B (cands lists only b in B)
    for (int i = 0; i < 8; i++) if (TB.w[i] & ~B.w[i]) return false;
    if (mz(B)) return true;   // no candidates; TB is empty here
    for (auto* r : part) Cb = mand(Cb, r->rm);
    for (int q = 0; q < 8; q++) for (u64 x = B.w[q]; x; x &= x - 1) {
      int b = 64 * q + __builtin_ctzll(x);
      M m = cmask(part, sl, sym, Cb, b);
      if (mbit(TB, b)) { if (!meq(m, TM[b])) return false; }
      else if (!mz(m)) return false;
    }
    return true;
  }
  std::vector<const Rec*> sc_part; std::vector<const Slk*> sc_sl; std::vector<M> sc_pb, sc_pc, sc_sb, sc_sc;
  double costset(Node& nd, const std::vector<const Rec*>& inh, const std::vector<int>& NT2, const std::vector<int>& SL2) {
    std::vector<const Rec*> part; part_of(nd, inh, NT2, part);
    auto [nb, nc] = domsize(part, nd.sym);
    return node_cost((int)NT2.size(), (int)SL2.size(), part.size(), nb, nc, (nc < nb) && !nd.sym);
  }
  void fitset(Node& nd, const std::vector<const Rec*>& inh, std::vector<int>& NT, std::vector<int>& SL) {
    for (int li = 0; li < 2; li++) {
      std::vector<int>& lst = li == 0 ? SL : NT; size_t cap = li == 0 ? 7 : 15;
      while (lst.size() > cap) {
        size_t bi = 0, bn = SIZE_MAX;
        for (size_t i = 0; i < lst.size(); i++) {
          int X = lst[i]; lst.erase(lst.begin() + i);
          std::vector<const Rec*> part; part_of(nd, inh, NT, part); std::vector<const Slk*> sl; slacks_of(nd, SL, sl);
          std::vector<std::pair<int, int>> cs; cands(part, sl, nd.sym, false, cs);
          if (cs.size() < bn) { bn = cs.size(); bi = i; }
          lst.insert(lst.begin() + i, X);
        }
        lst.erase(lst.begin() + bi);
      }
    }
  }
  struct MinRes { double c; std::vector<int> NT, SL; };
  MinRes minimize(Node& nd, const std::vector<const Rec*>& inh, std::vector<int> NT, std::vector<int> SL, const std::vector<std::pair<int, int>>& target) {
    set_target(target);
    double cur = costset(nd, inh, NT, SL);
    bool improved = true;
    // the original picks, among removals that keep the candidates (okset) and do not raise the cost, one of least cost, the
    // first in (SL, NT) order on ties.  Testing removals by (cost, order) and taking the first that passes okset is the same.
    struct Rm { double c; int li; size_t i; };
    std::vector<Rm> rms;
    while (improved) {
      improved = false;
      rms.clear();
      {   // the cost of every single removal: costset's domsize by prefix / suffix ANDs (same masks, same node_cost arguments)
        bool sym = nd.sym;
        M B0 = mand(Tb.ALLNZ, sym ? Tb.ORBM : Tb.M512F), C0 = Tb.ALLNZ;
        if (lg && CURT >= 0) { const M& g = Tb.RANKGE[need[CURT]]; B0 = mand(B0, g); C0 = mand(C0, g); }
        for (auto* r : inh) { B0 = mand(B0, r->lm); C0 = mand(C0, r->rm); }
        size_t k = NT.size();
        std::vector<const Rec*>& nr = sc_part; nr.clear(); for (int X : NT) nr.push_back(nd.rec_of(X));
        std::vector<M>& pb = sc_pb; std::vector<M>& pc = sc_pc; pb.resize(k + 1); pc.resize(k + 1);
        std::vector<M>& sb = sc_sb; std::vector<M>& scm = sc_sc; sb.resize(k + 1); scm.resize(k + 1);
        pb[0] = B0; pc[0] = C0;
        for (size_t j = 0; j < k; j++) { pb[j + 1] = mand(pb[j], nr[j]->lm); pc[j + 1] = mand(pc[j], nr[j]->rm); }
        sb[k] = Tb.M512F; scm[k] = Tb.M512F;
        for (size_t j = k; j > 0; j--) { sb[j - 1] = mand(sb[j], nr[j - 1]->lm); scm[j - 1] = mand(scm[j], nr[j - 1]->rm); }
        size_t np = inh.size() + k;
        int nbA = mpop(pb[k]), ncA = mpop(pc[k]);
        for (size_t i = 0; i < SL.size(); i++) {
          double c = node_cost((int)k, (int)SL.size() - 1, np, nbA, ncA, (ncA < nbA) && !sym);
          if (c <= cur) rms.push_back(Rm{c, 0, i});
        }
        for (size_t j = 0; j < k; j++) {
          int nb = mpop(mand(pb[j], sb[j + 1])), nc = mpop(mand(pc[j], scm[j + 1]));
          double c = node_cost((int)k - 1, (int)SL.size(), np - 1, nb, nc, (nc < nb) && !sym);
          if (c <= cur) rms.push_back(Rm{c, 1, j});
        }
      }
      std::stable_sort(rms.begin(), rms.end(), [](const Rm& x, const Rm& y) { return x.c < y.c; });
      for (auto& r : rms) {
        std::vector<int>& lst = r.li == 0 ? SL : NT;
        int X = lst[r.i]; lst.erase(lst.begin() + r.i);
        if (okset(nd, inh, NT, SL, target)) { cur = r.c; improved = true; break; }
        lst.insert(lst.begin() + r.i, X);
      }
    }
    return MinRes{cur, NT, SL};
  }
  Cert* rgen(uint32_t act, const std::vector<Asg>& asg, const std::vector<Rec>& recs, const std::vector<Info>* info0, int a_new,
             Node* pnd = nullptr) {
    if (++cnt > maxnodes) throw Big();
    std::vector<Info> info; int r = analyze(act, asg, info0, a_new, info);
    if (r >= 0) { Cert* c = mk(); c->over = true; c->X = r; return c; }
    if (r == -2) {   // every term assigned: a decomposition of the leaf's tensor
      if (!satmode) throw Sat();
      Cert* c = mk(); c->sat = true; satw(asg, c); return c;
    }
    Node nd(this, act, &asg, &recs, info, pnd, a_new);
    bool sym = nd.sym;
    // Only the first max(K, deadk) options of the stable sort by (n0, |NT| + 2|SL|) are ever used.  Keep them in a sorted
    // list while scanning the terms in index order; once it is full, a term needs an exact count only up to the last kept
    // n0 (count_cands stops beyond it).  The kept list equals the prefix of the full stable sort.
    std::vector<Opt> opts;
    size_t keep = (size_t)std::max(std::max(K, 1), deadk);
    auto before = [](const Opt& x, const Opt& y) {
      if (x.n0 != y.n0) return x.n0 < y.n0;
      return x.NT.size() + 2 * x.SL.size() < y.NT.size() + 2 * y.SL.size();
    };
    for (int t = 0; t < n; t++) if ((act >> t) & 1) {
      Opt o; o.t = t; o.a = terms[t]; nd.term_data(t, o.inh, o.NT, o.SL);
      long long lim = opts.size() < keep ? LLONG_MAX : (long long)opts.back().n0 + 1;
      long long k = count_cands(nd, t, o.inh, o.NT, o.SL, lim);
      if (k >= lim) continue;   // strictly after every kept option
      o.n0 = (size_t)k;
      // insert after every kept option that is not after o (stable: o comes later in index order)
      size_t pos = opts.size();
      while (pos > 0 && before(o, opts[pos - 1])) pos--;
      if (pos >= keep) continue;
      opts.insert(opts.begin() + pos, std::move(o));
      if (opts.size() > keep) opts.pop_back();
    }
    // the candidate lists, only where they are used: the look-ahead's first K options (live case)
    if (opts[0].n0 != 0)
      for (size_t oi = 0; oi < opts.size() && (int)oi < std::max(K, 1); oi++)
        full_cands(nd, opts[oi].t, opts[oi].inh, opts[oi].NT, opts[oi].SL, &opts[oi].target);
    bool hb = false; double bc = 0; int bt = -1, ba = 0; std::vector<const Rec*> binh; std::vector<int> bNT, bSL;
    if (opts[0].n0 == 0) {
      for (size_t oi = 0; oi < opts.size() && (int)oi < deadk; oi++) {
        Opt& o = opts[oi]; if (o.n0) break;
        CURT = o.t;
        std::vector<MinRes> sets; sets.push_back(minimize(nd, o.inh, o.NT, o.SL, {}));
        if (!sym) {
          std::vector<int> chosen, pool = o.NT;
          auto mind = [&](const std::vector<int>& ch) { std::vector<const Rec*> part; part_of(nd, o.inh, ch, part); auto d = domsize(part, sym); return std::min(d.first, d.second); };
          while (!pool.empty() && mind(chosen) > 0) {
            size_t bi = 0; int bv = INT_MAX;
            for (size_t i = 0; i < pool.size(); i++) { std::vector<int> ch = chosen; ch.push_back(pool[i]); int v = mind(ch); if (v < bv) { bv = v; bi = i; } }
            chosen.push_back(pool[bi]); pool.erase(pool.begin() + bi);
          }
          if (mind(chosen) == 0) sets.push_back(minimize(nd, o.inh, chosen, {}, {}));
        }
        for (auto& s : sets) if (!hb || s.c < bc) { hb = true; bc = s.c; bt = o.t; ba = o.a; binh = o.inh; bNT = s.NT; bSL = s.SL; }
      }
    } else {
      size_t pick = 0;
      if (K > 1) {
        bool hs = false; long long bsc = 0;
        for (size_t oi = 0; oi < opts.size() && (int)oi < K; oi++) {
          Opt& o = opts[oi]; if (o.n0 == 0) continue;
          std::vector<Rec> allrecs = recs; for (int X : o.NT) allrecs.push_back(*nd.rec_of(X));
          uint32_t act2 = act ^ (1u << o.t); long long sc = 0;
          for (auto& [b, c] : o.target) {
            if (hs && sc >= bsc) break;
            std::vector<Asg> asg2; asg2.reserve(asg.size() + 1); asg2.push_back(Asg{o.a, b, c}); asg2.insert(asg2.end(), asg.begin(), asg.end());
            std::vector<Rec> recs2; recs2.reserve(allrecs.size()); for (auto& q : allrecs) recs2.push_back(upd(q, o.a, b, c));
            long long mc = min_cands(act2, asg2, recs2, info, o.a, hs ? std::max(1LL, bsc - sc) : 1000000000LL, &nd);
            sc += mc == 0 ? 1 : 1 + mc;
          }
          if (!hs || sc < bsc) { hs = true; bsc = sc; pick = oi; }
        }
      }
      Opt& o = opts[pick];
      CURT = o.t;
      MinRes m = minimize(nd, o.inh, o.NT, o.SL, o.target);
      hb = true; bc = m.c; bt = o.t; ba = o.a; binh = o.inh; bNT = m.NT; bSL = m.SL;
    }
    CURT = bt;
    if (fit) fitset(nd, binh, bNT, bSL);
    std::vector<const Rec*> part; part_of(nd, binh, bNT, part);
    auto [nb, nc] = domsize(part, sym);
    bool cdir = (nc < nb) && !sym;
    std::vector<const Slk*> sl; slacks_of(nd, bSL, sl);
    std::vector<std::pair<int, int>> cs; cands(part, sl, sym, cdir, cs);
    std::vector<Rec> allrecs = recs; for (int X : bNT) allrecs.push_back(*nd.rec_of(X));
    uint32_t act2 = act ^ (1u << bt);
    Cert* out = mk(); out->t = bt; out->NT = bNT; out->SL = bSL; out->sym = sym; out->cdir = cdir;
    for (auto& [b, c] : cs) {
      std::vector<Asg> asg2; asg2.reserve(asg.size() + 1); asg2.push_back(Asg{ba, b, c}); asg2.insert(asg2.end(), asg.begin(), asg.end());
      std::vector<Rec> recs2; recs2.reserve(allrecs.size()); for (auto& q : allrecs) recs2.push_back(upd(q, ba, b, c));
      out->kids.push_back(rgen(act2, asg2, recs2, &info, ba, &nd));
    }
    return out;
  }
  Cert* gen(int K_ = 4, long long maxnodes_ = 300000, int deadk_ = 6) {
   
    K = K_; maxnodes = maxnodes_; deadk = deadk_; cnt = 0; CURT = -1;
    std::vector<Asg> asg; std::vector<Rec> recs;
    return rgen(n == 32 ? 0xffffffffu : ((1u << n) - 1), asg, recs, nullptr, 0);
  }

  // ---- finalize = hoist(attach_cands(cert))
  void mkrecs(const std::vector<int>& NT, uint32_t act, const std::vector<Asg>& asg, std::vector<Rec>& out) const {
    for (int X : NT) { Rec r; if (!mkrec(X, act, asg, r)) throw std::runtime_error("finalize: claim not tight"); out.push_back(r); }
  }
  void attach(Cert* c, uint32_t act, const std::vector<Asg>& asg, const std::vector<Rec>& recs) {
    if (c->over || c->sat) return;
    int a = terms[c->t]; CURT = c->t;
    std::vector<Rec> allrecs = recs; mkrecs(c->NT, act, asg, allrecs);
    std::vector<const Rec*> part; for (auto& r : allrecs) if (Tb.PAR[r.X & a]) part.push_back(&r);
    std::vector<Slk> slv(c->SL.size()); std::vector<const Slk*> sl;
    for (size_t i = 0; i < c->SL.size(); i++) { if (!mkslack(c->SL[i], act, asg, slv[i])) throw std::runtime_error("finalize: slack"); sl.push_back(&slv[i]); }
    cands(part, sl, c->sym, c->cdir, c->cs);
    if (c->cs.size() != c->kids.size()) throw std::runtime_error("attach: candidate count");
    uint32_t act2 = act ^ (1u << c->t);
    for (size_t i = 0; i < c->kids.size(); i++) {
      auto [b, cc] = c->cs[i];
      std::vector<Asg> asg2; asg2.push_back(Asg{a, b, cc}); asg2.insert(asg2.end(), asg.begin(), asg.end());
      std::vector<Rec> recs2; for (auto& q : allrecs) recs2.push_back(upd(q, a, b, cc));
      attach(c->kids[i], act2, asg2, recs2);
    }
  }
  static void claimed_below(const Cert* c, std::set<int>& s) { if (c->over || c->sat) return; for (int X : c->NT) s.insert(X); for (auto* k : c->kids) claimed_below(k, s); }
  Cert* strip(const Cert* c, const std::set<int>& ex) {
    if (c->over || c->sat) return const_cast<Cert*>(c);
    Cert* d = mk(); *d = *c; d->NT.clear(); for (int X : c->NT) if (!ex.count(X)) d->NT.push_back(X);
    for (auto& k : d->kids) k = strip(k, ex);
    return d;
  }
  bool tight_at(int X, uint32_t act, const std::vector<Asg>& asg) const { bool ok; int rk = rankR(X, asg, &ok); return ok && rk >= ucnt(act, X); }
  Cert* hoist(const Cert* c, uint32_t act, const std::vector<Asg>& asg, const std::vector<Rec>& recs) {
    if (c->over || c->sat) return const_cast<Cert*>(c);
    std::set<int> have; for (auto& r : recs) have.insert(r.X); for (int X : c->NT) have.insert(X);
    std::map<int, int> cntX;
    for (auto* k : c->kids) { std::set<int> s; claimed_below(k, s); for (int X : s) cntX[X]++; }
    std::vector<int> extra;   // sorted (std::map order)
    for (auto& [X, m] : cntX) if (m >= 2 && !have.count(X) && tight_at(X, act, asg)) extra.push_back(X);
    if (fit && c->NT.size() + extra.size() > 15) {   // keep the most shared claims, then X order
      size_t keep = c->NT.size() >= 15 ? 0 : 15 - c->NT.size();
      std::stable_sort(extra.begin(), extra.end(), [&](int x, int y) { return cntX[x] > cntX[y]; });
      extra.resize(keep); std::sort(extra.begin(), extra.end());
    }
    std::vector<int> NT2 = c->NT; NT2.insert(NT2.end(), extra.begin(), extra.end());
    int a = terms[c->t]; CURT = c->t;
    std::vector<Rec> allrecs = recs; mkrecs(NT2, act, asg, allrecs);
    std::vector<const Rec*> part; for (auto& r : allrecs) if (Tb.PAR[r.X & a]) part.push_back(&r);
    std::vector<Slk> slv(c->SL.size()); std::vector<const Slk*> sl;
    for (size_t i = 0; i < c->SL.size(); i++) { if (!mkslack(c->SL[i], act, asg, slv[i])) throw std::runtime_error("hoist: slack"); sl.push_back(&slv[i]); }
    std::vector<std::pair<int, int>> cs; cands(part, sl, c->sym, c->cdir, cs);
    std::map<std::pair<int, int>, size_t> pos; for (size_t i = 0; i < c->cs.size(); i++) pos[c->cs[i]] = i;
    std::set<int> ex(extra.begin(), extra.end());
    uint32_t act2 = act ^ (1u << c->t);
    Cert* d = mk(); d->t = c->t; d->NT = NT2; d->SL = c->SL; d->sym = c->sym; d->cdir = c->cdir;
    for (auto& [b, cc] : cs) {
      auto it = pos.find({b, cc}); if (it == pos.end()) throw std::runtime_error("hoist: candidate not in the old list");
      std::vector<Asg> asg2; asg2.push_back(Asg{a, b, cc}); asg2.insert(asg2.end(), asg.begin(), asg.end());
      std::vector<Rec> recs2; for (auto& q : allrecs) recs2.push_back(upd(q, a, b, cc));
      d->kids.push_back(hoist(strip(c->kids[it->second], ex), act2, asg2, recs2));
    }
    return d;
  }
  Cert* finalize(Cert* c) {
   
    uint32_t act = n == 32 ? 0xffffffffu : ((1u << n) - 1);
    std::vector<Asg> asg; std::vector<Rec> recs;
    attach(c, act, asg, recs);
    return hoist(c, act, asg, recs);
  }
};

static void stats(const Cert* c, long long& nodes) { nodes++; if (!c->over && !c->sat) for (auto* k : c->kids) stats(k, nodes); }
static long long count_sat(const Cert* c) { if (c->sat) return 1; if (c->over) return 0; long long s = 0; for (auto* k : c->kids) s += count_sat(k); return s; }
static long long count_over(const Cert* c) { if (c->sat) return 0; if (c->over) return 1; long long s = 0; for (auto* k : c->kids) s += count_over(k); return s; }
}  // namespace g7
