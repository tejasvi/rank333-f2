// e1pemit.h: the E1P block emitter in C++ (hcls/E1P).  Port of E1P/py/modelp.py (model check of a lineenum9qp --cert trace
// block) and E1P/py/e1p.py emit_blocks (E1P block streams), bit-identical to them.  Stream format: E1P/Check.lean.
//
//   e1p::IP ip; ip.load(ipfile, orderfile);                       // as lineenum9qp / ipload.py
//   e1p::Job job(ip); job.check(trace_bytes, len);                // model check; throws e1p::Fail on a bad trace
//   std::vector<e1p::Block> bl = job.emit(leafcert, LIMIT, RLIM);  // blocks in DFS order (block 0 = mode 0)
//
// leafcert(labels, out) must append the v7 certificate of the leaf with these labels to `out` and return true; it is needed
// only when the job has leaves.
#pragma once
#include <immintrin.h>
#include <bits/stdc++.h>

namespace e1p {
typedef unsigned long long u64;
// stream format: E1P (255 labels, 8-bit labels, 19-bit slot indices, 946-bit records) or E1G (127, 7, 15, 540); set once per
// process, before any emission (set_format_e1g)
static int NL = 255;                  // label fields
static int RW = 946;                  // delegated record width
static int LBITS = 8;                 // label width (pos, prefix labels, cut, fixings)
static int SIBITS = 19;               // slot-table index width
static inline void set_format_e1g() { NL = 127; RW = 540; LBITS = 7; SIBITS = 15; }
static const long long SC = 1LL << 30;

struct Fail : std::runtime_error { using std::runtime_error::runtime_error; };
#define E1P_REQ(c, msg) do { if (!(c)) throw ::e1p::Fail(std::string(msg) + " (" #c ")"); } while (0)

// ------------------------------------------------------------------------------------------------ bit writer
struct BW {
  std::vector<u64> w; size_t n = 0;
  void put(u64 x, int k) {
    E1P_REQ(k <= 64 && (k == 64 || x < (1ULL << k)), "field overflow");
    if (k == 0) return;
    size_t q = n >> 6; int s = n & 63;
    if (w.size() < ((n + k + 63) >> 6) + 1) w.resize(((n + k + 63) >> 6) + 1, 0);
    w[q] |= x << s;
    if (s && s + k > 64) w[q + 1] |= x >> (64 - s);
    n += k;
  }
  void cat(const BW& o) {
    size_t full = o.n >> 6;
    for (size_t i = 0; i < full; i++) put(o.w[i], 64);
    int r = o.n & 63;
    if (r) put(o.w[full] & ((1ULL << r) - 1), r);
  }
  // the value's bytes, little-endian, without trailing zero bytes (Python's int.to_bytes((v.bit_length()+7)//8))
  std::vector<uint8_t> bytes() const {
    std::vector<uint8_t> b((n + 7) / 8, 0);
    for (size_t i = 0; i < b.size(); i++) b[i] = (uint8_t)(w[i >> 3] >> (8 * (i & 7)));
    while (!b.empty() && b.back() == 0) b.pop_back();
    return b;
  }
};

// ------------------------------------------------------------------------------------------------ the IP
struct M256 { u64 w[4]; };
static inline bool tst(const M256& m, int l) { return (m.w[l >> 6] >> (l & 63)) & 1; }
static inline void setb(M256& m, int l) { m.w[l >> 6] |= 1ULL << (l & 63); }

struct IP {
  int R = 0, N = 0;
  std::vector<int> vecs, ub;
  std::vector<M256> mask; std::vector<int> cap; std::vector<int> kdim;
  // slot layout: normal rows (k != 0) in file order, then the N label caps, then the extra rows (k == 0, e.g. L479's case-II
  // row, which is not a subspace row); slotOf[r] = the slot of row r, rowOfSlot[s] = the row of slot s (-1: a label cap)
  std::vector<int> slotOf, rowOfSlot; int nnorm = 0;
  std::vector<std::vector<int>> rowl;   // labels of row r, ascending
  std::vector<std::vector<int>> inc;    // rows containing label l, ascending
  // the model's add/undo by 64-row words (AVX-512 masked byte adds): RBI[l][w] = rows 64w..64w+63 that contain l; NZW[l] = the
  // words with a row of l; CAP8 = the caps as bytes (rows padded to 64)
  int NWR = 0; std::vector<std::vector<u64>> RBI; std::vector<std::vector<int>> NZW; std::vector<uint8_t> CAP8;
  std::vector<std::vector<int>> G;      // label permutations, identity first
  std::unordered_map<int, int> lab;     // coset value -> label
  void load(const char* ipf, const char* ordf) {
    std::ifstream f(ipf); E1P_REQ(f.good(), "cannot open IP file");
    std::string tok; f >> tok >> R >> tok >> N; vecs.resize(N); for (int l = 0; l < N; l++) f >> vecs[l];
    E1P_REQ(N <= NL, "more labels than the format allows");
    ub.assign(N, R); std::string line; std::getline(f, line);
    while (std::getline(f, line)) {
      std::istringstream ss(line); std::string t; ss >> t;
      if (t == "C") {
        int k, c, n; ss >> k >> c >> n; std::vector<int> ls(n); for (int j = 0; j < n; j++) ss >> ls[j];
        if (n == 1) { ub[ls[0]] = std::min(ub[ls[0]], std::max(0, c)); continue; }
        M256 m{}; for (int l : ls) setb(m, l); mask.push_back(m); cap.push_back(c); kdim.push_back(k);
      } else if (t == "S") { throw Fail("S rows not supported"); }
      else if (t == "G") {
        int ng; ss >> ng;
        for (int g = 0; g < ng; g++) { std::getline(f, line); std::istringstream s2(line); std::vector<int> P(N); for (int l = 0; l < N; l++) s2 >> P[l]; G.push_back(P); }
        break;
      }
    }
    if (ordf) {
      std::vector<int> ord; { std::ifstream g(ordf); int x; while (g >> x) ord.push_back(x); }
      E1P_REQ((int)ord.size() == N, "order file size");
      std::vector<int> inv(N, -1); for (int i = 0; i < N; i++) { E1P_REQ(inv[ord[i]] == -1, "order not a permutation"); inv[ord[i]] = i; }
      std::vector<int> v2(N), u2(N); for (int i = 0; i < N; i++) { v2[i] = vecs[ord[i]]; u2[i] = ub[ord[i]]; } vecs = v2; ub = u2;
      for (auto& m : mask) { M256 m2{}; for (int l = 0; l < N; l++) if (tst(m, l)) setb(m2, inv[l]); m = m2; }
      for (auto& P : G) { std::vector<int> Q(N); for (int i = 0; i < N; i++) Q[i] = inv[P[ord[i]]]; P = Q; }
    }
    for (size_t g = 0; g < G.size(); g++) {
      bool id = true; for (int l = 0; l < N; l++) if (G[g][l] != l) { id = false; break; }
      if (id) { std::swap(G[0], G[g]); break; }
    }
    E1P_REQ(G.size() <= 2048, "group larger than 2048");
    rowl.assign(mask.size(), {}); inc.assign(N, {});
    for (size_t r = 0; r < mask.size(); r++)
      for (int l = 0; l < N; l++) if (tst(mask[r], l)) { rowl[r].push_back(l); inc[l].push_back((int)r); }
    for (int l = 0; l < N; l++) lab[vecs[l]] = l;
    NWR = (int)((mask.size() + 63) / 64); RBI.assign(N, std::vector<u64>(NWR, 0)); NZW.assign(N, {}); CAP8.assign((size_t)NWR * 64, 255);
    for (size_t r = 0; r < mask.size(); r++) CAP8[r] = (uint8_t)std::min(cap[r], 255);
    for (int l = 0; l < N; l++) { for (int r : inc[l]) RBI[l][r >> 6] |= 1ULL << (r & 63); for (int w = 0; w < NWR; w++) if (RBI[l][w]) NZW[l].push_back(w); }
    slotOf.assign(mask.size(), -1); nnorm = 0;
    for (size_t r = 0; r < mask.size(); r++) if (kdim[r] != 0) slotOf[r] = nnorm++;
    int ex = 0; for (size_t r = 0; r < mask.size(); r++) if (kdim[r] == 0) slotOf[r] = nnorm + N + ex++;
    rowOfSlot.assign(nnorm + N + ex, -1);
    for (size_t r = 0; r < mask.size(); r++) rowOfSlot[slotOf[r]] = (int)r;
  }
};

// ------------------------------------------------------------------------------------------------ the checked tree
typedef std::vector<std::pair<int, long long>> Dual;
struct Item {
  uint8_t code;          // 0 skip (budget 0), 3 non-canonical, 1 look-ahead-killed child (P record), 2 child subtree
  int l = 0, g = 0;      // label; witness (code 3)
  std::vector<int> sat;  // saturating rows of the child (codes 1, 2)
  int pk = 0, prow = -1; // code 1: P kind (1 row, 2 weight) and row
  int child = -1;        // code 2: node index
};
struct Node {
  char tag;              // 'L' leaf, 'F' frontier, 'K' kill, 'O' branch
  int cut = 0, kind = 0, crow = -1; bool hd = false;
  Dual dual;             // K: the dual; O: the node dual (hd)
  std::vector<std::pair<int, int>> fixes;
  std::vector<Item> items;
};

struct Block { BW bits; long long nodes; int mode; int parent_block, parent_rec; };

// ------------------------------------------------------------------------------------------------ one trace block (job)
struct Job {
  const IP& ip;
  // model state
  std::vector<uint8_t> cnt; std::vector<int> mult, u, seq;   // cnt: row counts as bytes (caps are below 255), padded to 64
  // result of check()
  std::vector<int> pre, sat0; std::vector<Node> nodes; int root = -1; long long blocknodes = 0;
  std::map<std::string, long long> st;
  explicit Job(const IP& p) : ip(p) {}

  // ---- trace reader
  const uint8_t* b = nullptr; size_t bi = 0, bn = 0;
  int u8() { E1P_REQ(bi < bn, "trace truncated"); return b[bi++]; }
  int u16() { int x = u8(); return x | (u8() << 8); }
  u64 v() { u64 x = 0; int s = 0; while (true) { int c = u8(); x |= (u64)(c & 127) << s; s += 7; if (c < 128) return x; E1P_REQ(s < 63, "varint"); } }
  Dual dual() { u64 n = v(); Dual d; d.reserve(n); for (u64 i = 0; i < n; i++) { u64 r = v(); u64 Y = v(); E1P_REQ(r < ip.mask.size(), "dual row"); d.push_back({(int)r, (long long)Y}); } return d; }

  // ---- model
  int resid(int r) const { return ip.cap[r] - cnt[r]; }
  long long bound(const Dual& du, int lo, std::vector<long long>& T) {
    T.assign(ip.N, 0); long long B = 0;
    for (auto& [r, Y] : du) { B += Y * resid(r); for (int x : ip.rowl[r]) T[x] += Y; }
    for (int l = lo; l < ip.N; l++) if (u[l] > 0 && T[l] < SC) B += (long long)u[l] * (SC - T[l]);
    return B;
  }
  long long weight(int lo, int notin_row = -1) const {
    long long s = 0;
    for (int l = lo; l < ip.N; l++) if (notin_row < 0 || !tst(ip.mask[notin_row], l)) s += u[l];
    return s;
  }
  std::vector<int> start(const std::vector<int>& p) {
    cnt.assign((size_t)ip.NWR * 64, 0); mult.assign(ip.N, 0); u = ip.ub; seq.clear();
    for (int l : p) { mult[l]++; seq.push_back(l); u[l]--; for (int r : ip.inc[l]) cnt[r]++; }
    for (int l = 0; l < ip.N; l++) E1P_REQ(u[l] >= 0, "prefix exceeds a label cap");
    std::vector<int> sat;
    for (size_t r = 0; r < ip.mask.size(); r++) {
      E1P_REQ(cnt[r] <= ip.cap[r], "prefix exceeds a row cap");
      if (cnt[r] == ip.cap[r]) {
        bool z = false; for (int x : ip.rowl[r]) if (u[x] > 0) { u[x] = 0; z = true; }
        if (z) sat.push_back((int)r);
      }
    }
    return sat;
  }
  std::vector<int> add(int l, int pos_after, std::vector<int>& saved) {
    saved = u; mult[l]++; seq.push_back(l); u[l]--; E1P_REQ(u[l] >= 0, "label over its cap");
    std::vector<int> sat;
    auto satrow = [&](int r) {
      bool z = false;
      for (int x : ip.rowl[r]) if (u[x] > 0) { u[x] = 0; if (x >= pos_after) z = true; }
      if (z) sat.push_back(r);
    };
#ifdef __AVX512BW__
    // the rows of l in ascending order, 64 at a time: the same increments and the same saturations as the scalar loop
    const u64* rb = ip.RBI[l].data(); uint8_t* c = cnt.data(); const uint8_t* cp = ip.CAP8.data(); const __m512i one = _mm512_set1_epi8(1);
    for (int w : ip.NZW[l]) {
      const __mmask64 bits = (__mmask64)rb[w];
      const __m512i cv = _mm512_mask_add_epi8(_mm512_loadu_si512(c + 64 * w), bits, _mm512_loadu_si512(c + 64 * w), one);
      _mm512_storeu_si512(c + 64 * w, cv);
      __mmask64 hit = _mm512_mask_cmpeq_epi8_mask(bits, cv, _mm512_loadu_si512(cp + 64 * w));
      while (hit) { satrow(64 * w + __builtin_ctzll(hit)); hit &= hit - 1; }
    }
#else
    for (int r : ip.inc[l]) if (++cnt[r] == ip.cap[r]) satrow(r);
#endif
    return sat;
  }
  void undo(int l, std::vector<int>& saved) {
    mult[l]--; seq.pop_back(); u.swap(saved);
#ifdef __AVX512BW__
    const u64* rb = ip.RBI[l].data(); uint8_t* c = cnt.data(); const __m512i one = _mm512_set1_epi8(1);
    for (int w : ip.NZW[l]) _mm512_storeu_si512(c + 64 * w, _mm512_mask_sub_epi8(_mm512_loadu_si512(c + 64 * w), (__mmask64)rb[w], _mm512_loadu_si512(c + 64 * w), one));
#else
    for (int r : ip.inc[l]) cnt[r]--;
#endif
  }
  int noncanon(int l) const {
    std::vector<int> s(seq); s.push_back(l); std::sort(s.begin(), s.end());
    std::vector<int> t(s.size());
    for (size_t gi = 1; gi < ip.G.size(); gi++) {
      const auto& P = ip.G[gi];
      for (size_t i = 0; i < s.size(); i++) t[i] = P[s[i]];
      std::sort(t.begin(), t.end());
      if (t < s) return (int)gi;
    }
    return -1;
  }
  void skip(Node& nd, int s) {
    Item it; it.l = s;
    if (u[s] == 0) { it.code = 0; st["skip0"]++; }
    else { int g = noncanon(s); E1P_REQ(g >= 0, "skip not justified"); it.code = 3; it.g = g; st["skipNC"]++; }
    nd.items.push_back(std::move(it));
  }
  // parse one node record of the trace and discard it (a subtree the model knows to be empty, see node2)
  void skipnode() {
    int tag = u8();
    if (tag == 'L' || tag == 'F') return;
    if (tag == 'K') { dual(); return; }
    E1P_REQ(tag == 'O', "unknown node tag");
    u8(); int kind = u8(); if (kind == 1) v(); int hd = u8(); if (hd) dual();
    while (true) {
      int c = u8(); if (c == 'E') break;
      E1P_REQ(c == 'C', "expected C"); u8();
      if (bi < bn && b[bi] == 'P') { bi++; int k = u8(); if (k == 1) v(); } else skipnode();
    }
  }
  int node2(int pos) {
    int d = (int)seq.size(), rem = ip.R - d;
    int tag = u8();
    int me = (int)nodes.size(); nodes.emplace_back(); nodes[me].tag = (char)tag;
    if (tag == 'L') { E1P_REQ(rem == 0, "leaf with rem > 0"); st["L"]++; return me; }
    if (tag == 'F') { st["F"]++; return me; }
    E1P_REQ(rem > 0, "node at depth R");
    std::vector<long long> T;
    if (tag == 'K') {
      Dual du = dual(); long long B = bound(du, pos, T);
      E1P_REQ(B < (long long)rem * SC, "K fails");
      st["K"]++; st["Krows"] += du.size(); nodes[me].dual = std::move(du); return me;
    }
    E1P_REQ(tag == 'O', "unknown node tag");
    st["O"]++;
    int cut = u8(), kind = u8(); int row = -1; if (kind == 1) { u64 r = v(); E1P_REQ(r < ip.mask.size(), "cut row"); row = (int)r; }
    int hd = u8(); Dual du; if (hd) du = dual();
    std::vector<int> saved_u = u; std::vector<std::pair<int, int>> fixes;
    if (hd) {
      long long B = bound(du, pos, T); long long gap = B - (long long)rem * SC; E1P_REQ(gap >= 0, "node dual kills");
      st["Odual"]++; st["Odrows"] += du.size();
      for (int l = pos; l < ip.N; l++)
        if (u[l] > 0 && T[l] > SC) { long long km = gap / (T[l] - SC); if (km < u[l]) { u[l] = (int)std::max(0LL, km); st["fixed"]++; fixes.push_back({l, u[l]}); } }
    }
    if (kind == 0) E1P_REQ(cut >= ip.N, "cut kind 0");
    else if (kind == 1) { long long need = rem - resid(row); E1P_REQ(need >= 1, "cut1 need"); E1P_REQ(weight(cut, row) < need, "cut1"); }
    else if (kind == 2) E1P_REQ(weight(cut) < rem, "cut2");
    else if (kind == 3) { E1P_REQ(hd, "cut3 without dual"); long long B3 = bound(du, cut, T); E1P_REQ(B3 < (long long)rem * SC, "cut3"); }
    else throw Fail("cut kind");
    st["cut" + std::to_string(kind)]++;
    { Node& nd = nodes[me]; nd.cut = cut; nd.kind = kind; nd.crow = row; nd.hd = hd; nd.dual = std::move(du); nd.fixes = fixes; }
    int nxt = pos; std::vector<int> saved;
    while (true) {
      int c = u8();
      if (c == 'E') break;
      E1P_REQ(c == 'C', "expected C");
      int l = u8();
      E1P_REQ(pos <= l && l < std::min(cut, ip.N), "child label range");
      for (int s = nxt; s < l; s++) skip(nodes[me], s);
      nxt = l + 1;
      if (u[l] == 0) {
        // the search branched on a label whose budget is used up in the model: an ancestor's LP fixing capped the label's
        // copies, and lineenum's add() recomputes a label's masks from its cap alone, so it may take one copy more.  The
        // fixing (an exact consequence of that node's dual) shows the subtree is empty: emit the skip and drop the subtree.
        st["fixPruned"]++; skip(nodes[me], l);
        if (bi < bn && b[bi] == 'P') { bi++; int k = u8(); if (k == 1) v(); } else skipnode();
        continue;
      }
      std::vector<int> sat = add(l, l, saved);
      st["child"]++; st["satev"] += sat.size(); if (!sat.empty()) st["satchild"]++;
      Item it; it.l = l; it.sat = std::move(sat);
      if (bi < bn && b[bi] == 'P') {
        bi++; int k = u8(); int prow = -1; if (k == 1) { u64 r = v(); E1P_REQ(r < ip.mask.size(), "P row"); prow = (int)r; }
        int rem2 = rem - 1;
        if (k == 2) E1P_REQ(weight(l) < rem2, "P2");
        else { E1P_REQ(k == 1, "P kind"); long long need = rem2 - resid(prow); E1P_REQ(need >= 1, "P1 need"); E1P_REQ(weight(l, prow) < need, "P1"); }
        st["P" + std::to_string(k)]++;
        it.code = 1; it.pk = k; it.prow = prow;
        nodes[me].items.push_back(std::move(it));
      } else {
        it.code = 2;
        size_t ix = nodes[me].items.size(); nodes[me].items.push_back(std::move(it));
        int ch = node2(l);
        nodes[me].items[ix].child = ch;
      }
      undo(l, saved);
    }
    for (int s = nxt; s < std::min(cut, ip.N); s++) skip(nodes[me], s);
    u = saved_u;
    return me;
  }
  void check(const uint8_t* data, size_t len) {
    b = data; bi = 0; bn = len; nodes.clear(); st.clear();
    int t = u8(); int n = u8(); pre.clear();
    for (int i = 0; i < n; i++) { int vv = u16(); auto itl = ip.lab.find(vv); E1P_REQ(itl != ip.lab.end(), "prefix vector"); pre.push_back(itl->second); }
    if (t == 'T') u8();
    sat0 = start(pre); st["startsat"] += sat0.size();
    root = node2(pre.empty() ? 0 : pre.back());
    E1P_REQ(u8() == 'Z', "expected Z");
    blocknodes = (long long)v(); st["blocknodes"] += blocknodes;
    E1P_REQ(bi == bn, "trailing bytes");
  }

  // ---- emission (e1p.emit_blocks)
  typedef std::function<bool(const std::vector<int>&, BW&)> LeafCert;
  LeafCert leafcert; long long LIMIT = 1 << 16; size_t RLIM = 4000;
  // external leaves (E1G's Ctx.EXT): with allow_ext, a leaf without a certificate is emitted with an empty one and listed
  bool allow_ext = false; std::set<std::vector<int>> ext_out;
  bool getcert(const std::vector<int>& pl, BW& c) {
    if (leafcert && leafcert(pl, c)) return true;
    E1P_REQ(allow_ext, "no leaf certificate");
    ext_out.insert(pl); return false;
  }
  std::vector<long long> szc; std::vector<char> deleg;
  std::vector<int> seen; int qid = 0;

  void own_rows(int t, std::vector<int>& acc) const {
    const Node& nd = nodes[t];
    if (nd.tag == 'K') { for (auto& p : nd.dual) acc.push_back(p.first); }
    else if (nd.tag == 'O') {
      if (nd.kind == 1) acc.push_back(nd.crow);
      if (nd.hd) for (auto& p : nd.dual) acc.push_back(p.first);
      for (auto& it : nd.items) if (it.code == 1 || it.code == 2) {
        for (int r : it.sat) acc.push_back(r);
        if (it.code == 1 && it.pk == 1) acc.push_back(it.prow);
      }
    }
  }
  long long size_est(int t, std::vector<int>& pl) {
    if (szc[t] >= 0) return szc[t];
    const Node& nd = nodes[t]; long long n;
    if (nd.tag == 'F') n = 2;
    else if (nd.tag == 'L') { if (leafcert || allow_ext) { BW c; n = getcert(pl, c) ? 2 + (long long)c.n : 2; } else n = 2 + 64; }
    else if (nd.tag == 'K') n = 8 + 48 * (long long)nd.dual.size();
    else {
      n = 40;
      for (auto& it : nd.items) {
        n += 2;
        if (it.code == 1 || it.code == 2) {
          n += 30 + 12 * (long long)it.sat.size();
          if (it.code == 2) { pl.push_back(it.l); n += size_est(it.child, pl); pl.pop_back(); }
        }
      }
    }
    return szc[t] = n;
  }
  // |R ∪ sub_rows(c)| > RLIM ?  (sub_rows: all rows of the subtree below c, frontier children excluded)
  bool too_many_rows(int c, const std::unordered_set<int>& R) {
    qid++; size_t extra = 0; std::vector<int> stack{c}, acc;
    while (!stack.empty()) {
      int t = stack.back(); stack.pop_back();
      acc.clear(); own_rows(t, acc);
      for (int r : acc) if (seen[r] != qid) { seen[r] = qid; if (!R.count(r)) { if (R.size() + ++extra > RLIM) return true; } }
      const Node& nd = nodes[t];
      if (nd.tag == 'O') for (auto& it : nd.items) if (it.code == 2 && nodes[it.child].tag != 'F') stack.push_back(it.child);
    }
    return false;
  }
  void plan(int t, std::unordered_set<int>& R, std::vector<int>& pl) {
    std::vector<int> acc; own_rows(t, acc); for (int r : acc) R.insert(r);
    const Node& nd = nodes[t];
    if (nd.tag != 'O') return;
    for (auto& it : nd.items) {
      if (it.code != 2 || nodes[it.child].tag == 'F') continue;
      int c = it.child; pl.push_back(it.l);
      if (size_est(c, pl) > LIMIT || too_many_rows(c, R)) { deleg[c] = 1; std::unordered_set<int> R2; plan(c, R2, pl); }
      else plan(c, R, pl);
      pl.pop_back();
    }
  }
  // records of the block part rooted at t: a frontier or delegated child counts 1, an inlined child its own records
  int brecs(int t) const {
    const Node& nd = nodes[t]; if (nd.tag != 'O') return 0;
    int r = 0;
    for (auto& it : nd.items) if (it.code == 2) r += (nodes[it.child].tag == 'F' || deleg[it.child]) ? 1 : brecs(it.child);
    return r;
  }
  // at most 255 delegated records per block (the [8] count and index): while a block has more, delegate its inlined subtree
  // with the most records (only frontier-heavy top parts reach this; Python's e1p.py has no such case)
  void fixnd(int t) {
    while (brecs(t) > 255) {
      int best = -1, bv = 1; std::vector<int> stk{t};
      while (!stk.empty()) {
        int u = stk.back(); stk.pop_back(); const Node& nd = nodes[u]; if (nd.tag != 'O') continue;
        for (auto& it : nd.items) if (it.code == 2 && nodes[it.child].tag != 'F' && !deleg[it.child]) {
          int v = brecs(it.child); if (v > bv) { bv = v; best = it.child; } stk.push_back(it.child);
        }
      }
      E1P_REQ(best >= 0, "block records: no subtree to delegate");
      deleg[best] = 1; st["ndSplit"]++;
    }
    std::vector<int> stk{t};
    while (!stk.empty()) {
      int u = stk.back(); stk.pop_back(); const Node& nd = nodes[u]; if (nd.tag != 'O') continue;
      for (auto& it : nd.items) if (it.code == 2 && nodes[it.child].tag != 'F') { if (deleg[it.child]) fixnd(it.child); else stk.push_back(it.child); }
    }
  }
  void block_rows(int t, std::unordered_set<int>& acc) const {
    std::vector<int> a; own_rows(t, a); for (int r : a) acc.insert(r);
    const Node& nd = nodes[t];
    if (nd.tag == 'O') for (auto& it : nd.items) if (it.code == 2 && nodes[it.child].tag != 'F' && !deleg[it.child]) block_rows(it.child, acc);
  }
  void count_refs(int t, std::unordered_map<int, int>& cnt_) const {
    const Node& nd = nodes[t];
    if (nd.tag == 'K') { for (auto& p : nd.dual) cnt_[p.first]++; }
    else if (nd.tag == 'O') {
      if (nd.kind == 1) cnt_[nd.crow]++;
      if (nd.hd) for (auto& p : nd.dual) cnt_[p.first]++;
      for (auto& it : nd.items) {
        if (it.code != 1 && it.code != 2) continue;
        for (int r : it.sat) cnt_[r]++;
        if (it.code == 1 && it.pk == 1) cnt_[it.prow]++;
        if (it.code == 2 && nodes[it.child].tag != 'F' && !deleg[it.child]) count_refs(it.child, cnt_);
      }
    }
  }
  struct Sub { bool front; int t; int d, pos; std::vector<int> pl, mult, u; };
  BW staterec(int d, int pos, const std::vector<int>& pl, const std::vector<int>* uu) const {
    BW h; h.put(d, 5); h.put(pos, LBITS); for (int l : pl) h.put(l, LBITS);
    if (uu) for (int l = 0; l < NL; l++) h.put(l < ip.N ? (*uu)[l] : 0, 3);
    return h;
  }
  long long emit_tree(int t, int d, int pos, std::vector<int>& pl, std::vector<int> mult_, std::vector<int> uu,
                      const std::unordered_map<int, int>& slots, std::vector<Sub>& out, BW& w) {
    long long nn = 1; const Node& nd = nodes[t];
    auto slot = [&](int r) { auto it = slots.find(r); E1P_REQ(it != slots.end(), "row not in block table"); return (u64)it->second; };
    if (nd.tag == 'L') {
      w.put(0, 2);
      if (leafcert || allow_ext) { BW c; if (getcert(pl, c)) w.cat(c); }
      return nn;
    }
    if (nd.tag == 'K') {
      w.put(1, 2); w.put(nd.dual.size(), 6);
      for (auto& [r, Y] : nd.dual) { w.put(slot(r), 12); w.put((u64)Y, 36); }
      return nn;
    }
    E1P_REQ(nd.tag == 'O', "emit: node tag");
    w.put(2, 2); w.put(std::min(nd.cut, NL), LBITS); w.put(nd.kind, 2);
    if (nd.kind == 1) w.put(slot(nd.crow), 12);
    w.put(nd.hd ? 1 : 0, 1);
    if (nd.hd) {
      w.put(nd.dual.size(), 6);
      for (auto& [r, Y] : nd.dual) { w.put(slot(r), 12); w.put((u64)Y, 36); }
      w.put(nd.fixes.size(), LBITS);
      for (auto& [l, nu] : nd.fixes) { w.put(l, LBITS); w.put(nu, 3); uu[l] = nu; }
    }
    for (auto& it : nd.items) {
      if (it.code == 0) { w.put(0, 2); continue; }
      if (it.code == 3) { w.put(3, 2); w.put(it.g, 11); continue; }
      int l = it.l;
      std::vector<int> m2 = mult_; m2[l]++; std::vector<int> u2 = uu; u2[l]--;
      for (int r : it.sat) for (int x : ip.rowl[r]) u2[x] = 0;
      w.put(it.code == 1 ? 1 : 2, 2); E1P_REQ(it.sat.size() < 64, "more than 63 saturating rows"); w.put(it.sat.size(), 6);
      for (int r : it.sat) w.put(slot(r), 12);
      if (it.code == 1) {
        w.put(it.pk == 1 ? 1 : 0, 1);
        if (it.pk == 1) w.put(slot(it.prow), 12);
      } else {
        pl.push_back(l);
        const Node& ch = nodes[it.child];
        if (ch.tag == 'F' || deleg[it.child]) {
          w.put(0, 24); w.put(out.size(), 8);
          out.push_back(Sub{ch.tag == 'F', it.child, d + 1, l, pl, m2, u2});
        } else {
          BW c; nn += emit_tree(it.child, d + 1, l, pl, m2, u2, slots, out, c);
          w.put(c.n, 24); w.cat(c);
        }
        pl.pop_back();
      }
    }
    return nn;
  }
  // lazy saturation: a look-ahead-killed child (code 1) keeps only the saturating rows its weight check needs, and a child
  // whose node is a kill (tag K) only those its dual's inequality needs; chosen greedily (most budget, or most deficit,
  // removed first) on the checker's budget state; the kept rows stay in trace order.  Other children keep all their rows.
  void prune1(int t, int d, std::vector<int>& mult_, std::vector<int> uu) {
    Node& nd = nodes[t]; if (nd.tag != 'O') return;
    for (auto& [l, nu] : nd.fixes) uu[l] = nu;
    int rem = ip.R - d;
    for (auto& it : nd.items) {
      if (it.code != 1 && it.code != 2) continue;
      int l = it.l; mult_[l]++; std::vector<int> u2 = uu; u2[l]--;
      if (it.code == 2 && nodes[it.child].tag == 'K') {
        // a child killed by a dual Y: keep the rows its kill needs, BC + deficit(T, U, l) < rem' SC + sum_x mult'_x T_x,
        // deficit = sum_{x >= l} U_x max(0, SC - T_x): greedy by the deficit each row removes
        const Node& kn = nodes[it.child];
        std::vector<long long> T(ip.N, 0); long long BC = 0;
        for (auto& [r, Y] : kn.dual) { BC += Y * ip.cap[r]; for (int x : ip.rowl[r]) T[x] += Y; }
        long long rhs = (long long)(rem - 1) * SC; for (int x = 0; x < ip.N; x++) rhs += (long long)mult_[x] * T[x];
        auto wt = [&](int x) -> long long { return x >= l && T[x] < SC ? SC - T[x] : 0; };
        long long lhs = BC; for (int x = l; x < ip.N; x++) lhs += (long long)u2[x] * wt(x);
        std::vector<char> keep(it.sat.size(), 0);
        while (lhs >= rhs) {
          int best = -1; long long bg = 0;
          for (size_t i = 0; i < it.sat.size(); i++) if (!keep[i]) {
            long long g = 0; for (int x : ip.rowl[it.sat[i]]) g += (long long)u2[x] * wt(x);
            if (g > bg) { bg = g; best = (int)i; }
          }
          if (best < 0) break;
          keep[best] = 1; for (int x : ip.rowl[it.sat[best]]) { lhs -= (long long)u2[x] * wt(x); u2[x] = 0; }
        }
        if (lhs < rhs) { std::vector<int> k2; for (size_t i = 0; i < it.sat.size(); i++) if (keep[i]) k2.push_back(it.sat[i]); st["lazyDroppedK"] += it.sat.size() - k2.size(); it.sat.swap(k2); }
        mult_[l]--; continue;
      }
      if (it.code == 2) {
        for (int r : it.sat) for (int x : ip.rowl[r]) u2[x] = 0;
        prune1(it.child, d + 1, mult_, u2); mult_[l]--; continue;
      }
      int pr = it.pk == 1 ? it.prow : -1; long long target = rem - 1;
      if (pr >= 0) { long long ms = 0; for (int x : ip.rowl[pr]) ms += mult_[x]; target = rem - 1 + ms - ip.cap[pr]; }
      auto counted = [&](int x) { return x >= l && (pr < 0 || !tst(ip.mask[pr], x)); };
      long long w = 0; for (int x = l; x < ip.N; x++) if (counted(x)) w += u2[x];
      std::vector<char> keep(it.sat.size(), 0);
      while (w >= target) {
        int best = -1; long long bg = 0;
        for (size_t i = 0; i < it.sat.size(); i++) if (!keep[i]) {
          long long g = 0; for (int x : ip.rowl[it.sat[i]]) if (counted(x)) g += u2[x];
          if (g > bg) { bg = g; best = (int)i; }
        }
        if (best < 0) break;
        keep[best] = 1; for (int x : ip.rowl[it.sat[best]]) { if (counted(x)) w -= u2[x]; u2[x] = 0; }
      }
      if (w < target) { std::vector<int> k2; for (size_t i = 0; i < it.sat.size(); i++) if (keep[i]) k2.push_back(it.sat[i]); st["lazyDropped"] += it.sat.size() - k2.size(); it.sat.swap(k2); }
      mult_[l]--;
    }
  }
  bool LAZY = true;
  std::vector<Block> emit(LeafCert lc, long long limit = 1 << 16, size_t rlim = 4000) {
    leafcert = lc; LIMIT = limit; RLIM = rlim;
    if (LAZY) {
      std::vector<int> m0(ip.N, 0), u0p = ip.ub; for (int l : pre) { m0[l]++; u0p[l]--; }
      for (int r : sat0) for (int x : ip.rowl[r]) u0p[x] = 0;
      prune1(root, (int)pre.size(), m0, u0p);
    }
    szc.assign(nodes.size(), -1); deleg.assign(nodes.size(), 0); seen.assign(ip.mask.size(), 0); qid = 0;
    { std::unordered_set<int> R(sat0.begin(), sat0.end()); std::vector<int> pl(pre); plan(root, R, pl); }
    fixnd(root);
    std::vector<int> mult0(ip.N, 0), u0 = ip.ub;
    for (int l : pre) { mult0[l]++; u0[l]--; }
    for (int r : sat0) for (int x : ip.rowl[r]) u0[x] = 0;
    struct Work { bool isroot; int t, d, pos; std::vector<int> pl, mult, u; int pb, pr; };
    std::vector<Work> work; work.push_back(Work{true, root, (int)pre.size(), pre.empty() ? 0 : pre.back(), pre, mult0, u0, -1, -1});
    std::vector<Block> blocks;
    while (!work.empty()) {
      Work wk = std::move(work.back()); work.pop_back();
      std::unordered_set<int> rset; block_rows(wk.t, rset);
      std::unordered_map<int, int> cnt_;
      if (wk.isroot) for (int r : sat0) { rset.insert(r); cnt_[r]++; }
      count_refs(wk.t, cnt_);
      std::vector<int> rs(rset.begin(), rset.end());
      std::sort(rs.begin(), rs.end(), [&](int a, int bb) { int ca = cnt_.count(a) ? cnt_.at(a) : 0, cb = cnt_.count(bb) ? cnt_.at(bb) : 0; return ca != cb ? ca < cb : a < bb; });
      std::unordered_map<int, int> slots; for (size_t j = 0; j < rs.size(); j++) slots[rs[j]] = (int)j;
      std::vector<Sub> sub; BW nw; std::vector<int> pl = wk.pl;
      long long nn = emit_tree(wk.t, wk.d, wk.pos, pl, wk.mult, wk.u, slots, sub, nw);
      BW h; h.put(wk.isroot ? 0 : 1, 1); h.cat(staterec(wk.d, wk.pos, wk.pl, wk.isroot ? nullptr : &wk.u));
      E1P_REQ(sub.size() < 256, "more than 255 delegated children");
      h.put(sub.size(), 8);
      for (auto& s : sub) { BW r = staterec(s.d, s.pos, s.pl, &s.u); E1P_REQ((int)r.n <= RW, "record width"); h.cat(r); for (int z = (int)r.n; z < RW; z += 64) h.put(0, std::min(64, RW - z)); }
      E1P_REQ(rs.size() < 4096, "more than 4095 rows in a block");
      h.put(rs.size(), 12);
      for (int r : rs) { int sl = ip.slotOf[r]; E1P_REQ(sl < (1 << SIBITS), "slot index"); h.put(sl, SIBITS); }
      if (wk.isroot) { E1P_REQ(sat0.size() < 256, "more than 255 start rows"); h.put(sat0.size(), 8); for (int r : sat0) h.put(slots.at(r), 12); }
      h.cat(nw);
      int bix = (int)blocks.size();
      blocks.push_back(Block{std::move(h), nn, wk.isroot ? 0 : 1, wk.pb, wk.pr});
      for (int j = (int)sub.size() - 1; j >= 0; j--) if (!sub[j].front)
        work.push_back(Work{false, sub[j].t, sub[j].d, sub[j].pos, sub[j].pl, sub[j].mult, sub[j].u, bix, j});
    }
    return blocks;
  }
};
// ------------------------------------------------------------------------------------------------ semantic mirror
// An independent decoder of E1P block streams that checks what E1P.block checks, on plain integer arrays (the packed
// arithmetic of Check.lean computes the same sums: fsum(MV & fmask m) = sum of MV over m; deficit(T, UFR, lo) =
// sum_{l >= lo} u_l max(0, SC - T_l); dot(MVR, T) = sum_l MV_l T_l; VR comparisons are lexicographic from label 0).
// Leaf certificates are not checked (only their presence).  Port of the Python Mirror (E1P/py/e1p.py).
struct BR {
  const BW* b; size_t i = 0, end;
  BR(const BW& w, size_t from = 0, size_t to = SIZE_MAX) : b(&w), i(from), end(std::min(to, w.n)) {}
  // bits at positions >= end read as 0, as the kernel reads a stream (a number) past its top bit
  u64 get(int k) {
    u64 x = 0;
    for (int j = 0; j < k; ) {
      size_t q = i >> 6; int s = i & 63; int take = std::min(64 - s, k - j);
      u64 part = (i < end && q < b->w.size()) ? (b->w[q] >> s) & (take == 64 ? ~0ULL : ((1ULL << take) - 1)) : 0;
      if (i < end && i + take > end) part &= (1ULL << (end - i)) - 1;
      x |= part << j; j += take; i += take;
    }
    return x;
  }
  // some bit of [i, end) is set
  bool rest_nonzero() const {
    for (size_t p = i; p < end; p++) if ((b->w[p >> 6] >> (p & 63)) & 1) return true;
    return false;
  }
};
struct Mirror {
  const IP& ip; bool allow_ext = false;
  explicit Mirror(const IP& p) : ip(p) {}
  struct Slot { const M256* m; int cap; M256 own; };
  std::vector<int> rt;                       // the block's row table: slot-table indices
  std::vector<std::pair<size_t, size_t>> H;  // header records: bit ranges in the block
  const BW* blk = nullptr;
  // slot j of the row table; past the table (j >= k) and past the slot table the slot is 0: no labels, cap 0
  bool inrow(int j, int l) const {
    if (j >= (int)rt.size()) return false; int i = rt[j];
    if (i < (int)ip.rowOfSlot.size() && ip.rowOfSlot[i] >= 0) return tst(ip.mask[ip.rowOfSlot[i]], l);
    return i >= ip.nnorm && i < ip.nnorm + ip.N && i - ip.nnorm == l;
  }
  int rcap(int j) const {
    if (j >= (int)rt.size()) return 0; int i = rt[j];
    if (i < (int)ip.rowOfSlot.size() && ip.rowOfSlot[i] >= 0) return ip.cap[ip.rowOfSlot[i]];
    return (i >= ip.nnorm && i < ip.nnorm + ip.N) ? ip.ub[i - ip.nnorm] : 0;
  }
  long long msum(const std::vector<int>& MV, int j) const { long long s = 0; for (int l = 0; l < ip.N; l++) if (inrow(j, l)) s += MV[l]; return s; }
  long long wout(const std::vector<int>& UF, int j, int lo) const { long long s = 0; for (int l = lo; l < ip.N; l++) if (j < 0 || !inrow(j, l)) s += UF[l]; return s; }
  void zap(std::vector<int>& UF, int j) const { for (int l = 0; l < ip.N; l++) if (inrow(j, l)) UF[l] = 0; }
  std::pair<long long, std::vector<long long>> rdual(BR& s) {
    int k = (int)s.get(6); long long BC = 0; std::vector<long long> T(ip.N, 0);
    for (int i = 0; i < k; i++) {
      int j = (int)s.get(12); long long Y = (long long)s.get(36);
      BC += Y * rcap(j); for (int l = 0; l < ip.N; l++) if (inrow(j, l)) T[l] += Y;
    }
    return {BC, T};
  }
  long long deficit(const std::vector<long long>& T, const std::vector<int>& UF, int lo) const {
    long long s = 0; for (int l = lo; l < ip.N; l++) if (T[l] < SC) s += (long long)UF[l] * (SC - T[l]); return s;
  }
  long long dotMT(const std::vector<int>& MV, const std::vector<long long>& T) const { long long s = 0; for (int l = 0; l < ip.N; l++) s += MV[l] * T[l]; return s; }
  bool steq(size_t rec, int d, int pos, const std::vector<int>& pl, const std::vector<int>& UF) const {
    BR r(*blk, H[rec].first, H[rec].second);
    if ((int)r.get(5) != d || (int)r.get(LBITS) != pos) return false;
    for (int i = 0; i < d; i++) if ((int)r.get(LBITS) != pl[i]) return false;
    for (int l = 0; l < NL; l++) if ((int)r.get(3) != (l < ip.N ? UF[l] : 0)) return false;
    return true;
  }
  bool node(BR& s, int d, int pos, std::vector<int>& pl, std::vector<int>& MV, std::vector<int> UF) {
    int R = ip.R, N = ip.N, rem = R - d;
    int tag = (int)s.get(2);
    if (tag == 0) { if (rem != 0) return false; return allow_ext || s.rest_nonzero(); }   // a certificate follows (not checked), or an external leaf
    if (rem < 1) return false;
    if (tag == 1) { auto [BC, T] = rdual(s); return BC + deficit(T, UF, pos) < (long long)rem * SC + dotMT(MV, T); }
    if (tag != 2) return false;
    int cut = (int)s.get(LBITS), kind = (int)s.get(2); int cj = kind == 1 ? (int)s.get(12) : -1; int hd = (int)s.get(1);
    long long BC = 0, MT = 0; std::vector<long long> T(N, 0);
    if (hd) {
      auto pr = rdual(s); BC = pr.first; T = pr.second; MT = dotMT(MV, T);
      long long B = BC + deficit(T, UF, pos), RS = (long long)rem * SC + MT;
      if (B < RS) return false;
      long long gap = B - RS; int nf = (int)s.get(LBITS);
      for (int i = 0; i < nf; i++) {
        int l = (int)s.get(LBITS), nu = (int)s.get(3); if (l >= N) return false;
        int u = UF[l]; long long t = T[l];
        if (!(t > SC && nu < u && (long long)(nu + 1) * (t - SC) > gap)) return false;
        UF[l] = nu;
      }
    }
    int top = std::min(cut, N);
    if (kind == 0) { if (cut < N) return false; }
    else if (kind == 1) { long long need = rem + msum(MV, cj) - rcap(cj); if (need < 1 || !(wout(UF, cj, cut) < need)) return false; }
    else if (kind == 2) { if (!(wout(UF, -1, cut) < rem)) return false; }
    else { if (!hd || !(BC + deficit(T, UF, cut) < (long long)rem * SC + MT)) return false; }
    for (int l = pos; l < top; l++) {
      int code = (int)s.get(2);
      if (code == 0) { if (UF[l] != 0) return false; continue; }
      if (code == 3) {
        int g = (int)s.get(11);
        std::vector<int> a(MV); a[l]++; std::vector<int> bimg(N, 0);
        for (int x : pl) bimg[g < (int)ip.G.size() ? ip.G[g][x] : x]++;
        bimg[g < (int)ip.G.size() ? ip.G[g][l] : l]++;
        // MVR + oner(l) < imgR: reversed packings compare lexicographically from label 0
        int c = 0; for (int x = 0; x < N && !c; x++) if (a[x] != bimg[x]) c = a[x] < bimg[x] ? -1 : 1;
        if (c != -1) return false;
        continue;
      }
      if (UF[l] == 0) return false;
      std::vector<int> MV2(MV); MV2[l]++; std::vector<int> UF2(UF); UF2[l]--;
      int ns = (int)s.get(6);
      for (int i = 0; i < ns; i++) {
        int j = (int)s.get(12);
        if (msum(MV2, j) != rcap(j)) return false;
        zap(UF2, j);
      }
      int rem2 = rem - 1;
      if (code == 1) {
        if (s.get(1) == 0) { if (!(wout(UF2, -1, l) < rem2)) return false; }
        else {
          int j = (int)s.get(12);
          long long need = rem2 + msum(MV2, j) - rcap(j);
          if (need < 1 || !(wout(UF2, j, l) < need)) return false;
        }
      } else {
        size_t ln = (size_t)s.get(24);
        pl.push_back(l);
        bool ok;
        if (ln == 0) { size_t idx = (size_t)s.get(8); ok = idx < H.size() && steq(idx, d + 1, l, pl, UF2); }
        else { BR sub(*blk, s.i, std::min(s.i + ln, s.end)); s.i += ln; ok = node(sub, d + 1, l, pl, MV2, UF2); }
        pl.pop_back();
        if (!ok) return false;
      }
    }
    return true;
  }
  // the block; the header records' bit ranges are left in H
  bool block(const BW& w) {
    blk = &w; BR s(w);
    int mode = (int)s.get(1), d = (int)s.get(5), pos = (int)s.get(LBITS);
    std::vector<int> pl(d); for (int i = 0; i < d; i++) { pl[i] = (int)s.get(LBITS); if (pl[i] >= ip.N) return false; }
    std::vector<int> MV(ip.N, 0); for (int l : pl) MV[l]++;
    std::vector<int> UF(ip.N);
    if (mode == 1) { for (int l = 0; l < NL; l++) { int b = (int)s.get(3); if (l < ip.N) UF[l] = b; } }
    else { for (int l = 0; l < ip.N; l++) { UF[l] = ip.ub[l] - MV[l]; if (UF[l] < 0) return false; } }
    int nd = (int)s.get(8); H.clear(); for (int i = 0; i < nd; i++) { H.push_back({s.i, s.i + RW}); s.i += RW; }
    int k = (int)s.get(12); rt.resize(k); for (int i = 0; i < k; i++) rt[i] = (int)s.get(SIBITS);
    if (mode == 0) {
      int n = (int)s.get(8);
      for (int i = 0; i < n; i++) { int j = (int)s.get(12); if (msum(MV, j) != rcap(j)) return false; zap(UF, j); }
    }
    if (d > ip.R) return false;
    return node(s, d, pos, pl, MV, UF);
  }
  // glue: block `child` (mode 1) starts in the state recorded as header record `rec` of `parent`
  static bool glue(const BW& parent, std::pair<size_t, size_t> rec, const BW& child) {
    BR r(parent, rec.first, rec.second); int d = (int)r.get(5);
    size_t wbits = 5 + LBITS + 3 * NL + LBITS * d;
    BR a(parent, rec.first, rec.second), c(child);
    if (c.get(1) != 1) return false;
    for (size_t i = 0; i < wbits; ) { int k = (int)std::min<size_t>(64, wbits - i); if (a.get(k) != c.get(k)) return false; i += k; }
    for (size_t i = wbits; i < (size_t)RW; ) { int k = (int)std::min<size_t>(64, RW - i); if (a.get(k) != 0) return false; i += k; }
    return true;
  }
};
}  // namespace e1p
