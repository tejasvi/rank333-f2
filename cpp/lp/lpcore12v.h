// lpcore12v.h (prof7L90): lpcore12t.h with a dense AVX-512 kept-row tracker (trkAdd/trkDel), same lists in the same order.
// lpcore.h: the exact node LP of lpc.cc (same code, in namespace lpx) for use inside the search (prof7L).
// See lpc.cc for the bound.  LPR is the target rank (prune iff the exact bound is < LPR).
#pragma once
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdint>
#include <cmath>
#include <climits>
#include <vector>
#include <string>
#include <algorithm>
#include <chrono>
#include <ctime>
#include <atomic>
#include <sys/mman.h>
#include <immintrin.h>
namespace lpx {
typedef int HInt;
extern "C" {
void* Highs_create(void); void Highs_destroy(void* h); HInt Highs_run(void* h);
HInt Highs_setBoolOptionValue(void* h, const char* o, const HInt v);
HInt Highs_setIntOptionValue(void* h, const char* o, const HInt v);
HInt Highs_setDoubleOptionValue(void* h, const char* o, const double v);
HInt Highs_setStringOptionValue(void* h, const char* o, const char* v);
HInt Highs_addVars(void* h, const HInt n, const double* lo, const double* up);
HInt Highs_addRows(void* h, const HInt n, const double* lo, const double* up, const HInt nnz, const HInt* starts, const HInt* idx, const double* val);
HInt Highs_changeColsCostByRange(void* h, const HInt from, const HInt to, const double* cost);
HInt Highs_changeObjectiveSense(void* h, const HInt sense);
HInt Highs_changeColsBoundsByRange(void* h, const HInt from, const HInt to, const double* lo, const double* up);
HInt Highs_getModelStatus(const void* h);
double Highs_getObjectiveValue(const void* h);
HInt Highs_getSolution(const void* h, double* cv, double* cd, double* rv, double* rd);
HInt Highs_getNumRow(const void* h);
HInt Highs_getSimplexIterationCount(const void* h);
double Highs_getInfinity(const void* h);
}
static int LPR = 21; static const int NX = 512, NE = 575, OPT = 7, OBJBOUND = 11;
static double MPEN = 1000.0; static const int64_t SC = 1LL << 32; static int EDGE = -1, SCALE = 2, BENCH = 0, CHILDLP = 0; static const char* CHILDF = nullptr;
static int64_t NR; static std::vector<int64_t> RS; static std::vector<uint16_t> RE; static std::vector<int8_t> RCAP, RDIM;
static std::vector<int64_t> CS; static std::vector<int32_t> CR;
// lpcore12v: PB[v*NW + j] bit b = row 64j+b contains point v (rows of v as a bitmap); DENSE[v]: trkAdd/trkDel sweep the bitmap for v
static int64_t NW = 0; static uint64_t* PB = nullptr; static std::vector<uint8_t> DENSE;
static int8_t GX[NE][NX]; static int NEED[NE];
static int pv[511], lab[512];
static double SGN_UP = 1, SGN_LO = -1;
static int MAXIT = 40, SEPK = 100, SEPKF = 300, INITDIM = 8, CHEAPDIM = 7, CHUNK = 32; static size_t POOLMAX = 4000; static bool FULLSEP = true;
static std::vector<int32_t> CHEAP;
// profiling (thread CPU time, per depth) and separation variants; the defaults reproduce lpcore_v1.h exactly
static int FULLMAXD = 99, FULLMODE = 0; static bool PROF = false, ALIVEM = false;
// early stop of the dual simplex (HiGHS objective_bound = OBJBV) once its bound falls below the target; the prune is still decided by exact_bound
// HiGHS honours objective_bound only when minimising, so OBJB also sets MINF: the LP becomes  min -sum x  (same duals up to sign; calib() follows)
static bool OBJB = false, MINF = false; static double OBJBV = 0;
// INC: the node box comes from row counts the search keeps up to date (LP::trkAdd/trkDel) instead of a recount over P; BOXCHK: compare both
static bool INC = false; static long long BOXCHK = 0; static std::atomic<long long> gBoxChk{0};
// KEEPSTOP > 0: stop separating once the float LP is at least LPR + KEEPSTOP (the node is kept; its duals stay valid, only weaker)
// SFXKEEPSTOP: the same for suffix solves; SFXNOFULL: suffix solves never run the full separation
static double KEEPSTOP = 0, SFXKEEPSTOP = 0; static bool SFXNOFULL = false;
enum { PF_CALLS, PF_PRUNE, PF_VIOL, PF_KEEP, PF_TOTAL, PF_TPRUNE, PF_TKEEP, PF_BOX, PF_SOLVE, PF_NSOLVE, PF_NSPX, PF_BOUND, PF_CHEAP, PF_NCHEAP,
       PF_FULL, PF_NFULL, PF_SUPP, PF_ALIVE, PF_NADD, PF_NOB, PF_OBFAIL, PF_N };
static std::atomic<long long> PF[24][PF_N];
static inline long long tcpu() { timespec ts; clock_gettime(CLOCK_THREAD_CPUTIME_ID, &ts); return ts.tv_sec * 1000000000LL + ts.tv_nsec; }

static int rank3(int v) {
  int rows[3] = {v & 7, (v >> 3) & 7, (v >> 6) & 7}; int r = 0;
  for (int b = 2; b >= 0; b--) { int p = -1; for (int i = r; i < 3; i++) if ((rows[i] >> b) & 1) { p = i; break; }
    if (p < 0) continue; std::swap(rows[r], rows[p]); for (int i = 0; i < 3; i++) if (i != r && ((rows[i] >> b) & 1)) rows[i] ^= rows[r]; r++; }
  return r; }

static void load_kept(const char* path) {
  FILE* f = fopen(path, "rb"); if (!f) { fprintf(stderr, "no %s\n", path); exit(2); }
  fseek(f, 0, SEEK_END); long sz = ftell(f); fseek(f, 0, SEEK_SET);
  std::vector<char> buf(sz + 1); if (fread(buf.data(), 1, sz, f) != (size_t)sz) exit(2); fclose(f); buf[sz] = 0;
  RE.reserve(110000000); RS.reserve(4400000); RS.push_back(0);
  const char* p = buf.data(); const char* end = p + sz;
  while (p < end) {
    int d = 0; while (*p >= '0' && *p <= '9') d = d * 10 + (*p++ - '0');
    if (*p != ' ') { fprintf(stderr, "parse\n"); exit(2); } p++;
    int c = 0; while (*p >= '0' && *p <= '9') c = c * 10 + (*p++ - '0');
    int k = 0, prev = 0;
    while (*p == ' ') { p++; int v = 0; while (*p >= '0' && *p <= '9') v = v * 10 + (*p++ - '0');
      if (v <= prev || v > 511) { fprintf(stderr, "bad element\n"); exit(2); } prev = v; RE.push_back((uint16_t)v); k++; }
    if (*p == '\n') p++;
    if (k != (1 << d) - 1 || c < 0 || c >= k) { fprintf(stderr, "bad row d=%d k=%d c=%d\n", d, k, c); exit(2); }
    RDIM.push_back((int8_t)d); RCAP.push_back((int8_t)c); RS.push_back((int64_t)RE.size()); }
  NR = (int64_t)RCAP.size();
  CS.assign(NX + 1, 0); for (uint16_t v : RE) CS[v + 1]++; for (int v = 0; v < NX; v++) CS[v + 1] += CS[v];
  CR.resize(RE.size()); std::vector<int64_t> pos(CS.begin(), CS.end() - 1);
  for (int64_t r = 0; r < NR; r++) for (int64_t e = RS[r]; e < RS[r + 1]; e++) CR[pos[RE[e]]++] = (int32_t)r;
#if defined(__AVX512BW__)
  NW = (NR + 63) / 64; DENSE.assign(NX, 0); size_t nb = (size_t)NX * NW * 8, al = (size_t)2 << 20; void* pbm = nullptr;
  if (posix_memalign(&pbm, al, (nb + al - 1) & ~(al - 1))) { fprintf(stderr, "PB alloc\n"); exit(2); }
  madvise(pbm, (nb + al - 1) & ~(al - 1), MADV_HUGEPAGE); memset(pbm, 0, nb); PB = (uint64_t*)pbm;
  for (int v = 0; v < NX; v++) { uint64_t* B = PB + (size_t)v * NW; for (int64_t k = CS[v]; k < CS[v + 1]; k++) { int32_t r = CR[k]; B[r >> 6] |= 1ULL << (r & 63); }
    DENSE[v] = (CS[v + 1] - CS[v]) * 2 > NW; }   // a sweep of NW words beats the row list once the list has more than NW/2 rows
#endif
  }

static void build_extra() {
  int ne = 0;
  for (int X = 1; X < 512; X++) { for (int v = 0; v < NX; v++) GX[ne][v] = v ? (int8_t)__builtin_parity(v & X) : 0; NEED[ne] = 3 * rank3(X); ne++; }
  std::vector<std::vector<int>> subs[4];
  for (int d = 2; d <= 3; d++) { std::vector<int> seen;
    for (int a = 1; a < 8; a++) for (int b = a + 1; b < 8; b++) for (int c = (d == 3 ? b + 1 : 8); c < (d == 3 ? 8 : 9); c++) {
      if (d == 2 && c != 8) continue; std::vector<int> bs = {a, b}; if (d == 3) bs.push_back(c);
      int span = 0; for (int s = 1; s < (1 << d); s++) { int v = 0; for (int t = 0; t < d; t++) if ((s >> t) & 1) v ^= bs[t]; span |= 1 << v; }
      if (__builtin_popcount(span) != (1 << d) - 1) continue; if (std::find(seen.begin(), seen.end(), span) != seen.end()) continue;
      seen.push_back(span); subs[d].push_back(bs); } }
  for (int a = 2; a <= 3; a++) for (int b = 2; b <= 3; b++) for (auto& J : subs[a]) for (auto& K : subs[b]) {
    for (int v = 0; v < NX; v++) { if (!v) { GX[ne][v] = 0; continue; }
      int rows[3] = {0, 0, 0};
      for (size_t s = 0; s < J.size(); s++) { int rw = 0; for (size_t t = 0; t < K.size(); t++) { int x = J[s], y = K[t]; int val = 0;
          for (int i = 0; i < 3; i++) for (int j = 0; j < 3; j++) val ^= ((x >> i) & 1) & ((v >> (3 * i + j)) & 1) & ((y >> j) & 1);
          rw |= val << t; } rows[s] = rw; }
      int rr = 0; for (int bb = 2; bb >= 0; bb--) { int p = -1; for (int i = rr; i < (int)J.size(); i++) if ((rows[i] >> bb) & 1) { p = i; break; }
        if (p < 0) continue; std::swap(rows[rr], rows[p]); for (int i = 0; i < (int)J.size(); i++) if (i != rr && ((rows[i] >> bb) & 1)) rows[i] ^= rows[rr]; rr++; }
      GX[ne][v] = (int8_t)rr; }
    NEED[ne] = 3 * a * b; ne++; }
  if (ne != NE) { fprintf(stderr, "extra rows %d\n", ne); exit(2); } }

static void setopts(void* h) {
  Highs_setBoolOptionValue(h, "output_flag", 0); Highs_setStringOptionValue(h, "presolve", "off");
  Highs_setIntOptionValue(h, "threads", 1); Highs_setStringOptionValue(h, "solver", "simplex");
  Highs_setIntOptionValue(h, "simplex_strategy", 1);
  Highs_setIntOptionValue(h, "simplex_dual_edge_weight_strategy", EDGE); Highs_setIntOptionValue(h, "simplex_scale_strategy", SCALE);
  if (OBJB) Highs_setDoubleOptionValue(h, "objective_bound", OBJBV); }

// duals sign convention of this HiGHS build, from two tiny maximisation LPs
static void calib() {
  const bool ob = OBJB; OBJB = false;
  for (int t = 0; t < 2; t++) {
    void* h = Highs_create(); setopts(h); double inf = Highs_getInfinity(h);
    double lo = 0, up = 10, c = MINF ? -1 : 1; Highs_addVars(h, 1, &lo, &up); Highs_changeColsCostByRange(h, 0, 0, &c); Highs_changeObjectiveSense(h, MINF ? 1 : -1);
    HInt st = 0, ix = 0; double val = t ? -1.0 : 1.0, rl = t ? -1.0 : -inf, ru = t ? inf : 1.0;
    Highs_addRows(h, 1, &rl, &ru, 1, &st, &ix, &val); Highs_run(h);
    double cv, cd, rv, rd; Highs_getSolution(h, &cv, &cd, &rv, &rd);
    if (Highs_getModelStatus(h) != OPT || fabs(cv - 1) > 1e-9 || fabs(fabs(rd) - 1) > 1e-9) { fprintf(stderr, "calib failed\n"); exit(3); }
    if (t == 0) SGN_UP = rd > 0 ? 1 : -1; else SGN_LO = rd > 0 ? 1 : -1;   // multiplier of  x <= 1  is +1; of  -x >= -1  is +1
    Highs_destroy(h); }
  OBJB = ob;
  fprintf(stderr, "dual signs: upper-row %+g lower-row %+g%s\n", SGN_UP, SGN_LO, MINF ? " (min form)" : ""); }

struct LP {
  void* h = nullptr; double inf = 0; std::vector<int32_t> rowOf; std::vector<uint8_t> inm;
  std::vector<double> cv, cd, rv, rd; std::vector<int16_t> cnt; std::vector<int32_t> touched; std::vector<int32_t> init;
  long long nbuild = 0;
  std::vector<long long> lastUse; long long clock = 0; double tlp = 0, tsep = 0;
  void build() {
    if (h) Highs_destroy(h); h = Highs_create(); inf = Highs_getInfinity(h); setopts(h); nbuild++;
    const double sg = MINF ? -1.0 : 1.0;
    std::vector<double> lo(NX + NE, 0.0), up(NX + NE, 1.0), cost(NX + NE, sg);
    for (int k = 0; k < NE; k++) { up[NX + k] = inf; cost[NX + k] = -sg * MPEN; } up[0] = 0;
    Highs_addVars(h, NX + NE, lo.data(), up.data()); Highs_changeColsCostByRange(h, 0, NX + NE - 1, cost.data()); Highs_changeObjectiveSense(h, MINF ? 1 : -1);
    std::vector<HInt> st, ix; std::vector<double> va, rl, ru;
    for (int k = 0; k < NE; k++) { st.push_back((HInt)ix.size());
      for (int v = 1; v < NX; v++) if (GX[k][v]) { ix.push_back(v); va.push_back(GX[k][v]); }
      ix.push_back(NX + k); va.push_back(1.0); rl.push_back(NEED[k]); ru.push_back(inf); }
    Highs_addRows(h, NE, rl.data(), ru.data(), (HInt)ix.size(), st.data(), ix.data(), va.data());
    rowOf.clear(); lastUse.clear(); inm.assign(NR, 0); addCaps(init); }
  // shrink the pool to the base rows plus the most recently useful ones
  void rebuild() {
    std::vector<std::pair<long long, int32_t>> u; for (size_t i = 0; i < rowOf.size(); i++) u.push_back({lastUse[i], rowOf[i]});
    std::sort(u.begin(), u.end(), [](auto& a, auto& b) { return a.first > b.first; });
    std::vector<int32_t> keep = init; for (size_t i = 0; i < u.size() && i < POOLMAX / 2; i++) if (u[i].first > 0) keep.push_back(u[i].second);
    std::vector<int32_t> base = init; init = keep; build(); init = base; }
  // INC: cntP[r] = |P n U_r| for the search's current prefix P (trkP, in order); full = rows with 1 <= cntP = cap, over = rows with cntP > cap
  bool trk = false; std::vector<int8_t> resP; std::vector<int32_t> fpos, full, opos, over; std::vector<int> trkP;   // lpcore12: resP[r] = cap - |P n U_r| (one byte per row instead of a count plus RCAP)
  // lpcore11: res1 = rows with 1 <= cntP = cap - 1 (residual capacity 1), as a stack: trkAdd(v) pushes the rows v brings to cap - 1,
  // trkDel(v) drops them again (r1mark); rows that later fill stay on the stack (users filter by cntP)
  std::vector<int32_t> res1; std::vector<size_t> r1mark;
  // lpcore12t: res2 = rows that trkAdd brought to residual 2 (stack like res1; users filter by resP == 2)
  std::vector<int32_t> res2; std::vector<size_t> r2mark;
  void fullIn(int32_t r) { fpos[r] = (int32_t)full.size(); full.push_back(r); }
  void fullOut(int32_t r) { int32_t p = fpos[r], b = full.back(); full[p] = b; fpos[b] = p; full.pop_back(); fpos[r] = -1; }
  void overIn(int32_t r) { opos[r] = (int32_t)over.size(); over.push_back(r); }
  void overOut(int32_t r) { int32_t p = opos[r], b = over.back(); over[p] = b; opos[b] = p; over.pop_back(); opos[r] = -1; }
  void trkAdd(int v) { trkP.push_back(v); r1mark.push_back(res1.size()); r2mark.push_back(res2.size());
#if defined(__AVX512BW__)
    if (DENSE[v]) {   // lpcore12v: 64 rows per step; the rows reaching residual <= 2 are handled in increasing row order, as in the list loop
      const uint64_t* B = PB + (size_t)v * NW; int8_t* R8 = resP.data(); const __m512i one = _mm512_set1_epi8(1), two = _mm512_set1_epi8(2);
      for (int64_t j = 0; j < NW; j++) { const uint64_t bits = B[j]; if (!bits) continue;
        __m512i x = _mm512_loadu_si512(R8 + 64 * j); x = _mm512_mask_sub_epi8(x, bits, x, one); _mm512_storeu_si512(R8 + 64 * j, x);
        uint64_t ev = _mm512_mask_cmple_epi8_mask(bits, x, two);
        while (ev) { const int32_t r = (int32_t)(64 * j + __builtin_ctzll(ev)); ev &= ev - 1; const int c = R8[r];
          if (c == 0) fullIn(r); else if (c == -1) { if (fpos[r] >= 0) fullOut(r); overIn(r); } else if (c == 1) res1.push_back(r); else if (c == 2) res2.push_back(r); } }
      return; }
#endif
    const int64_t k1 = CS[v + 1]; int8_t* R8 = resP.data();
    for (int64_t k = CS[v]; k < k1; k++) { if (k + 32 < k1) __builtin_prefetch(R8 + CR[k + 32], 1, 0);
      int32_t r = CR[k]; int c = --R8[r];
      if (c == 0) fullIn(r); else if (c == -1) { if (fpos[r] >= 0) fullOut(r); overIn(r); } else if (c == 1) res1.push_back(r); else if (c == 2) res2.push_back(r); } }
  void trkDel(int v) { if (trkP.empty() || trkP.back() != v) { fprintf(stderr, "trkDel out of order\n"); exit(6); } trkP.pop_back();
    res1.resize(r1mark.back()); r1mark.pop_back(); res2.resize(r2mark.back()); r2mark.pop_back();
#if defined(__AVX512BW__)
    if (DENSE[v]) {   // lpcore12v: the rows whose old residual is <= 0 are handled in increasing row order
      const uint64_t* B = PB + (size_t)v * NW; int8_t* R8 = resP.data(); const __m512i one = _mm512_set1_epi8(1), zero = _mm512_setzero_si512();
      for (int64_t j = 0; j < NW; j++) { const uint64_t bits = B[j]; if (!bits) continue;
        const __m512i x = _mm512_loadu_si512(R8 + 64 * j); _mm512_storeu_si512(R8 + 64 * j, _mm512_mask_add_epi8(x, bits, x, one));
        uint64_t ev = _mm512_mask_cmple_epi8_mask(bits, x, zero);
        while (ev) { const int32_t r = (int32_t)(64 * j + __builtin_ctzll(ev)); ev &= ev - 1; const int b = R8[r] - 1;
          if (b == -1) { overOut(r); if (RCAP[r] >= 1) fullIn(r); } else if (b == 0) { if (fpos[r] >= 0) fullOut(r); } } }
      return; }
#endif
    const int64_t k1 = CS[v + 1]; int8_t* R8 = resP.data();
    for (int64_t k = CS[v]; k < k1; k++) { if (k + 32 < k1) __builtin_prefetch(R8 + CR[k + 32], 1, 0);
      int32_t r = CR[k]; int b = R8[r]++;
      if (b == -1) { overOut(r); if (RCAP[r] >= 1) fullIn(r); } else if (b == 0) { if (fpos[r] >= 0) fullOut(r); } } }
  void trkInit(const std::vector<int>& P) { resP.assign(RCAP.begin(), RCAP.end()); if (NW) resP.resize((size_t)NW * 64, 0); /* lpcore12v: whole 64-row blocks */ fpos.assign(NR, -1); opos.assign(NR, -1); full.clear(); over.clear(); trkP.clear(); res1.clear(); r1mark.clear(); res2.clear(); r2mark.clear(); trk = true;
    for (int v : P) trkAdd(v); }
  void addCaps(const std::vector<int32_t>& rows) {
    std::vector<HInt> st, ix; std::vector<double> va, rl, ru; int n = 0;
    for (int32_t r : rows) { if (inm[r]) continue; inm[r] = 1; rowOf.push_back(r); st.push_back((HInt)ix.size());
      for (int64_t e = RS[r]; e < RS[r + 1]; e++) { ix.push_back(RE[e]); va.push_back(1.0); }
      rl.push_back(-inf); ru.push_back(RCAP[r]); lastUse.push_back(0); n++; }
    if (n) Highs_addRows(h, n, rl.data(), ru.data(), (HInt)ix.size(), st.data(), ix.data(), va.data()); }
};

struct Cert { int32_t viol = -1; std::vector<std::pair<int, int32_t>> blk; std::vector<std::pair<int32_t, int64_t>> lam; std::vector<std::pair<int, int64_t>> mu; __int128 B;
  __int128 B0; __int128 Rj[NX]; };   // B0 = lambda.cap - mu.need, Rj = reduced costs (scaled by 2^32), for inherited bounds

// exact bound from the current duals (rounded down to the 2^-32 grid); returns B (scaled by 2^32)
static __int128 exact_bound(LP& L, const double* lo, const double* hi, Cert* C) {
  static thread_local __int128 Rj[NX];
  for (int j = 0; j < NX; j++) Rj[j] = SC;
  __int128 B = 0; if (C) { C->lam.clear(); C->mu.clear(); }
  for (int k = 0; k < NE; k++) { double mu = SGN_LO * L.rd[k]; if (!(mu > 0)) continue; if (mu > MPEN) mu = MPEN;
    int64_t Mk = (int64_t)floor(mu * (double)SC); if (Mk <= 0) continue;
    B -= (__int128)Mk * NEED[k]; for (int v = 1; v < NX; v++) if (GX[k][v]) Rj[v] += (__int128)Mk * GX[k][v];
    if (C) C->mu.push_back({k, Mk}); }
  for (size_t i = 0; i < L.rowOf.size(); i++) { double lm = SGN_UP * L.rd[NE + i]; if (!(lm > 0)) continue;
    int64_t Li = (int64_t)floor(lm * (double)SC); if (Li <= 0) continue; int32_t r = L.rowOf[i];
    B += (__int128)Li * RCAP[r]; for (int64_t e = RS[r]; e < RS[r + 1]; e++) Rj[RE[e]] -= Li;
    if (C) C->lam.push_back({r, Li}); }
  if (C) { C->B0 = B; memcpy(C->Rj, Rj, sizeof Rj); }
  for (int j = 1; j < NX; j++) { if (hi[j] == 0) continue; if (lo[j] == 1) B += Rj[j]; else if (Rj[j] > 0) B += Rj[j]; }
  if (C) C->B = B;
  return B; }

// bound of fixed duals (B0, Rj) over another box: valid for every box, exact
static __int128 box_bound(__int128 B0, const __int128* Rj, const double* lo, const double* hi) {
  __int128 B = B0; for (int j = 1; j < NX; j++) { if (hi[j] == 0) continue; if (lo[j] == 1) B += Rj[j]; else if (Rj[j] > 0) B += Rj[j]; } return B; }

static std::string i128s(__int128 x) { if (x == 0) return "0"; bool neg = x < 0; unsigned __int128 u = neg ? -(unsigned __int128)x : x; std::string s;
  while (u) { s += char('0' + (int)(u % 10)); u /= 10; } if (neg) s += '-'; std::reverse(s.begin(), s.end()); return s; }

struct NodeRes { int st; double obj; double bnd; int it; long long lpit; int rows; double ms; int nblk; int full; bool prune; bool hasB; };   // hasB: C holds duals of this node

// node box: x = 1 on P, 0 on unchosen labels below last(P) and on labels of kept21 rows that P saturates; false if P breaks a cap
// zl >= 0: also 0 on every label below zl (the children of P at labels >= zl, for suffix LPs)
static bool make_box(LP& L, const std::vector<int>& P, double* lo, double* hi, int& nblk, Cert* C, int zl = -1) {
  for (int j = 0; j < NX; j++) { lo[j] = 0; hi[j] = 1; } hi[0] = 0; nblk = 0;
  int last = -1; for (int v : P) last = std::max(last, lab[v]); if (zl > last) last = zl;
  for (int l = 0; l < last; l++) hi[pv[l]] = 0;
  for (int v : P) { lo[v] = 1; hi[v] = 1; }
  if (C) { C->blk.clear(); C->viol = -1; }
  for (int v : P) for (int64_t k = CS[v]; k < CS[v + 1]; k++) { int32_t r = CR[k]; if (L.cnt[r] == 0) L.touched.push_back(r); L.cnt[r]++; }
  bool bad = false;
  for (int32_t r : L.touched) { int c = L.cnt[r];
    if (c > RCAP[r]) { if (!bad && C) C->viol = r; bad = true; }
    else if (c == RCAP[r]) for (int64_t e = RS[r]; e < RS[r + 1]; e++) { int u = RE[e]; if (lo[u] == 0 && hi[u] == 1) { hi[u] = 0; nblk++; if (C) C->blk.push_back({u, r}); } } }
  for (int32_t r : L.touched) L.cnt[r] = 0; L.touched.clear();
  return !bad; }

// make_box from the tracked counts (INC); L.trkP must be the node's P
static bool make_box_trk(LP& L, double* lo, double* hi, int& nblk, Cert* C, int zl) {
  for (int j = 0; j < NX; j++) { lo[j] = 0; hi[j] = 1; } hi[0] = 0; nblk = 0;
  int last = -1; for (int v : L.trkP) last = std::max(last, lab[v]); if (zl > last) last = zl;
  for (int l = 0; l < last; l++) hi[pv[l]] = 0;
  for (int v : L.trkP) { lo[v] = 1; hi[v] = 1; }
  if (C) { C->blk.clear(); C->viol = -1; }
  if (!L.over.empty()) { if (C) C->viol = L.over[0]; return false; }
  for (int32_t r : L.full) for (int64_t e = RS[r]; e < RS[r + 1]; e++) { int u = RE[e]; if (lo[u] == 0 && hi[u] == 1) { hi[u] = 0; nblk++; if (C) C->blk.push_back({u, r}); } }
  return true; }

static NodeRes eval_node(LP& L, const std::vector<int>& P, Cert* C, int zl = -1) {   // zl: see make_box; suffix solves are profiled as depth 0
  auto t0 = std::chrono::steady_clock::now(); NodeRes res{}; res.prune = false; res.hasB = false; bool obOff = false;
  const int dd = zl >= 0 ? 0 : std::min((int)P.size(), 23); long long c0 = PROF ? tcpu() : 0, c1 = 0;
  double lo[NX], hi[NX];
  bool boxok;
  if (INC && L.trk) { boxok = make_box_trk(L, lo, hi, res.nblk, C, zl);
    if (BOXCHK && gBoxChk.fetch_add(1) < BOXCHK) {   // the recount must give the same box and the same verdict
      std::vector<int> a = P, b = L.trkP; std::sort(a.begin(), a.end()); std::sort(b.begin(), b.end());
      double lo2[NX], hi2[NX]; int nb2 = 0; bool ok2 = make_box(L, P, lo2, hi2, nb2, nullptr, zl); bool same = a == b && ok2 == boxok;
      if (same && boxok) for (int j = 0; j < NX; j++) if (lo2[j] != lo[j] || hi2[j] != hi[j]) same = false;
      if (!same || (boxok && nb2 != res.nblk)) { fprintf(stderr, "BOXCHK mismatch\n"); exit(7); } } }
  else boxok = make_box(L, P, lo, hi, res.nblk, C, zl);
  if (!boxok) { res.st = -2; res.ms = std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - t0).count();
    if (PROF) { long long c = tcpu() - c0; PF[dd][PF_CALLS]++; PF[dd][PF_VIOL]++; PF[dd][PF_BOX] += c; PF[dd][PF_TOTAL] += c; PF[dd][PF_TPRUNE] += c; }
    return res; }
  if (PROF) { c1 = tcpu(); PF[dd][PF_BOX] += c1 - c0; }
  Highs_changeColsBoundsByRange(L.h, 0, NX - 1, lo, hi);
  for (int it = 1; it <= MAXIT; it++) {
    res.it = it;
    auto tl = std::chrono::steady_clock::now(); long long cs = PROF ? tcpu() : 0;
    Highs_run(L.h); res.st = Highs_getModelStatus(L.h); HInt spx = Highs_getSimplexIterationCount(L.h); res.lpit += spx;
    L.tlp += std::chrono::duration<double>(std::chrono::steady_clock::now() - tl).count();
    if (PROF) { PF[dd][PF_SOLVE] += tcpu() - cs; PF[dd][PF_NSOLVE]++; PF[dd][PF_NSPX] += spx; }
    const bool ob = res.st == OBJBOUND;
    if (ob && PROF) PF[dd][PF_NOB]++;
    if (res.st != OPT && !ob) break;
    res.obj = (MINF ? -1.0 : 1.0) * Highs_getObjectiveValue(L.h);
    long long cb = PROF ? tcpu() : 0;
    size_t nr = (size_t)Highs_getNumRow(L.h); L.cv.resize(NX + NE); L.cd.resize(NX + NE); L.rv.resize(nr); L.rd.resize(nr);
    Highs_getSolution(L.h, L.cv.data(), L.cd.data(), L.rv.data(), L.rd.data());
    __int128 B = exact_bound(L, lo, hi, C); res.bnd = (double)B / (double)SC; res.hasB = true;
    if (PROF) PF[dd][PF_BOUND] += tcpu() - cb;
    if (B < (__int128)LPR * SC) { res.prune = true; res.st = OPT; break; }
    if (ob) {   // stopped early but the exact bound does not prune: finish this solve without the bound
      if (PROF) PF[dd][PF_OBFAIL]++; Highs_setDoubleOptionValue(L.h, "objective_bound", L.inf); obOff = true; it--; continue; }
    if (res.obj < LPR - 1e-6) break;    // float LP says prune but the exact bound does not: keep (numerics)
    { const double ks = zl >= 0 ? SFXKEEPSTOP : KEEPSTOP; if (ks > 0 && res.obj >= LPR + ks) break; }
    // separation: violated kept21 rows not in the model, most violated first; the cheap (high-dim) rows first
    auto ts = std::chrono::steady_clock::now(); long long cc = PROF ? tcpu() : 0;
    float xf[NX]; for (int j = 0; j < NX; j++) xf[j] = (float)L.cv[j];
    std::vector<std::pair<float, int32_t>> vio; int K = SEPK;
    for (int32_t r : CHEAP) { if (L.inm[r]) continue; float s = 0; for (int64_t e = RS[r]; e < RS[r + 1]; e++) s += xf[RE[e]];
      float vv = s - RCAP[r]; if (vv > 1e-5f) vio.push_back({vv, r}); }
    if (PROF) { long long c = tcpu(); PF[dd][PF_CHEAP] += c - cc; PF[dd][PF_NCHEAP]++; cc = c; }
    if (vio.empty() && FULLSEP && (int)P.size() <= FULLMAXD && !(zl >= 0 && SFXNOFULL)) { K = SEPKF; res.full++;
      if (FULLMODE == 0) {
        for (int64_t r = 0; r < NR; r++) { if (L.inm[r]) continue; float s = 0; for (int64_t e = RS[r]; e < RS[r + 1]; e++) s += xf[RE[e]];
          float vv = s - RCAP[r]; if (vv > 1e-5f) vio.push_back({vv, (int32_t)r}); }
      } else {   // column-wise over the support of x
        static thread_local std::vector<float> acc; static thread_local std::vector<int32_t> tch; if (acc.empty()) acc.assign(NR, 0.f);
        for (int j = 1; j < NX; j++) { float xj = xf[j]; if (!(xj > 1e-9f)) continue;
          for (int64_t k = CS[j]; k < CS[j + 1]; k++) { int32_t r = CR[k]; if (acc[r] == 0.f) tch.push_back(r); acc[r] += xj; } }
        for (int32_t r : tch) { float vv = acc[r] - RCAP[r]; acc[r] = 0.f; if (!L.inm[r] && vv > 1e-5f) vio.push_back({vv, r}); }
        tch.clear(); }
      if (PROF) { long long c = tcpu(); PF[dd][PF_FULL] += c - cc; PF[dd][PF_NFULL]++;
        int sp = 0; for (int j = 1; j < NX; j++) if (xf[j] > 1e-9f) sp++; PF[dd][PF_SUPP] += sp;
        if (ALIVEM) { long long al = 0;   // rows that some x in this node's box could violate
          for (int64_t r = 0; r < NR; r++) { if (L.inm[r]) continue; int s = 0; for (int64_t e = RS[r]; e < RS[r + 1]; e++) s += hi[RE[e]] > 0; if (s > RCAP[r]) al++; }
          PF[dd][PF_ALIVE] += al; } } }
    L.tsep += std::chrono::duration<double>(std::chrono::steady_clock::now() - ts).count();
    if (vio.empty()) break;
    if ((int)vio.size() > K) { std::nth_element(vio.begin(), vio.begin() + K, vio.end(), [](auto& a, auto& b) { return a.first > b.first; }); vio.resize(K); }
    if (PROF) PF[dd][PF_NADD] += (long long)vio.size();
    std::vector<int32_t> add; for (auto& p : vio) add.push_back(p.second); L.addCaps(add); }
  if (obOff) Highs_setDoubleOptionValue(L.h, "objective_bound", OBJBV);
  L.clock++;
  for (size_t i = 0; i < L.rowOf.size() && NE + i < L.rd.size(); i++) if (SGN_UP * L.rd[NE + i] > 1e-12) L.lastUse[i] = L.clock;
  res.rows = (int)L.rowOf.size();
  res.ms = std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - t0).count();
  if (PROF) { long long c = tcpu() - c0; PF[dd][PF_CALLS]++; PF[dd][PF_TOTAL] += c;
    if (res.st == OPT && res.prune) { PF[dd][PF_PRUNE]++; PF[dd][PF_TPRUNE] += c; } else { PF[dd][PF_KEEP]++; PF[dd][PF_TKEEP] += c; } }
  return res; }

static void prof_print(FILE* o) {
  fprintf(o, "LPPROF depth calls prune viol keep | ms/call ms/prune ms/keep | box solve(n,spx) bound cheap(n) full(n,supp,alive) | rows added | objbound stops, failed\n");
  for (int d = 0; d < 24; d++) { long long n = PF[d][PF_CALLS]; if (!n) continue; auto ms = [&](int k) { return PF[d][k] / 1e6; };
    long long np = PF[d][PF_PRUNE] + PF[d][PF_VIOL], nk = PF[d][PF_KEEP], nf = PF[d][PF_NFULL];
    fprintf(o, "LPPROF %2d %6lld %6lld %6lld %6lld | %8.2f %8.2f %8.2f | %9.0f %9.0f(%lld,%lld) %7.0f %8.0f(%lld) %9.0f(%lld,%.0f,%.0f) | %lld\n", d, n, (long long)PF[d][PF_PRUNE],
            (long long)PF[d][PF_VIOL], nk, ms(PF_TOTAL) / n, np ? ms(PF_TPRUNE) / np : 0.0, nk ? ms(PF_TKEEP) / nk : 0.0, ms(PF_BOX), ms(PF_SOLVE), (long long)PF[d][PF_NSOLVE],
            (long long)PF[d][PF_NSPX], ms(PF_BOUND), ms(PF_CHEAP), (long long)PF[d][PF_NCHEAP], ms(PF_FULL), nf, nf ? (double)PF[d][PF_SUPP] / nf : 0.0,
            nf ? (double)PF[d][PF_ALIVE] / nf : 0.0, (long long)PF[d][PF_NADD]);
    if (OBJB) fprintf(o, "LPPROF %2d objbound stops %lld failed %lld\n", d, (long long)PF[d][PF_NOB], (long long)PF[d][PF_OBFAIL]); } }

}  // namespace lpx
