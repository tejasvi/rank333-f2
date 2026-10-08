// packlp.h: dense bounded-variable primal simplex for the line-IP node LPs
//   max sum_j x_j   s.t.   sum_{j in S_i} x_j <= b_i  (i < m, b_i >= 0),   0 <= x_j <= u_j.
// Dictionary over the nonbasic variables, current values kept explicitly; start from the slack basis (x = 0 is
// feasible because b >= 0).  Dantzig pricing, Bland's rule after a run of degenerate pivots, iteration cap.
// solve() returns false on any trouble; the caller then uses HiGHS.  Nothing here is trusted: the caller turns the
// duals into an integer certificate and checks weak duality exactly (lineenum certB), and any y >= 0 is a valid bound.
#pragma once
#include <vector>
#include <cmath>
#include <cstring>
struct PackLP {
  int n = 0, m = 0;
  std::vector<double> a;          // m x n: x_B[i] = cur[i] - sum_j a[i*n+j] * (x_N[j] - val_N[j])
  std::vector<double> cur, d, ubv;// cur: values of basic vars; d: reduced costs of nonbasic columns; ubv: upper bound by var
  std::vector<int> B, Nv;         // B[i]: var in row i; Nv[j]: var of nonbasic column j (var < n structural, n+i slack i)
  std::vector<char> atU;          // nonbasic column j sits at its upper bound
  double z = 0;
  int iters = 0;
  static constexpr double INF = 1e300, EPS = 1e-9, PIV = 1e-9;
  // rows[i] = column indices of S_i; b[i] = rhs; u[j] = upper bound of x_j
  bool solve(int n_, const std::vector<std::vector<int>>& rows, const std::vector<double>& b, const double* u, int maxIt = 0) {
    n = n_; m = (int)rows.size(); iters = 0; z = 0;
    a.assign((size_t)m * n, 0.0); cur.assign(m, 0.0); d.assign(n, 1.0); ubv.assign(n + m, INF); B.resize(m); Nv.resize(n); atU.assign(n, 0);
    for (int j = 0; j < n; j++) { Nv[j] = j; ubv[j] = u[j]; }
    for (int i = 0; i < m; i++) { B[i] = n + i; cur[i] = b[i]; if (b[i] < -EPS) return false; for (int j : rows[i]) a[(size_t)i * n + j] = 1.0; }
    if (maxIt <= 0) maxIt = 50 * (n + m) + 100;
    int degen = 0;
    while (true) {
      if (++iters > maxIt) return false;
      bool bland = degen > 50;
      // pricing: entering column s and direction dir
      int s = -1; int dir = 0; double best = 0;
      for (int j = 0; j < n; j++) {
        double dj = d[j]; int dj_dir = 0;
        if (!atU[j] && dj > EPS) dj_dir = 1; else if (atU[j] && dj < -EPS) dj_dir = -1;
        if (!dj_dir) continue;
        if (bland) { if (s < 0 || Nv[j] < Nv[s]) { s = j; dir = dj_dir; } }
        else if (std::fabs(dj) > best) { best = std::fabs(dj); s = j; dir = dj_dir; }
      }
      if (s < 0) break;   // optimal
      // ratio test: x_N[s] moves by dir*t, x_B[i] moves by c_i*t with c_i = -a[i][s]*dir
      double tmax = ubv[Nv[s]] < INF ? ubv[Nv[s]] : INF; int r = -1; bool toUpper = false;
      for (int i = 0; i < m; i++) {
        double c = -a[(size_t)i * n + s] * dir; double lim;
        if (c < -PIV) { lim = cur[i] / (-c); if (lim < 0) lim = 0; }
        else if (c > PIV && ubv[B[i]] < INF) { lim = (ubv[B[i]] - cur[i]) / c; if (lim < 0) lim = 0; }
        else continue;
        if (lim < tmax - 1e-12 || (lim <= tmax + 1e-12 && r >= 0 && B[i] < B[r])) { tmax = lim; r = i; toUpper = (c > 0); }
      }
      if (tmax >= INF) return false;   // cannot happen for this LP family
      degen = (tmax <= 1e-12) ? degen + 1 : 0;
      for (int i = 0; i < m; i++) cur[i] += -a[(size_t)i * n + s] * dir * tmax;
      z += d[s] * dir * tmax;
      double enteringVal = (atU[s] ? ubv[Nv[s]] : 0.0) + dir * tmax;
      if (r < 0) { atU[s] = !atU[s]; continue; }   // bound flip
      // pivot: B[r] leaves at a bound, Nv[s] enters with value enteringVal
      double* ar = &a[(size_t)r * n]; double p = ar[s]; if (std::fabs(p) < PIV) return false;
      double leaveAtUpper = toUpper;
      // new row r expresses x_N[s] in terms of the new nonbasic (old B[r]) and the other nonbasics
      double inv = 1.0 / p;
      for (int j = 0; j < n; j++) ar[j] *= inv;
      ar[s] = inv;
      for (int i = 0; i < m; i++) {
        if (i == r) continue; double* ai = &a[(size_t)i * n]; double f = ai[s]; if (f == 0) continue;
        for (int j = 0; j < n; j++) ai[j] -= f * ar[j];
        ai[s] = -f * inv;
      }
      double ds = d[s];
      for (int j = 0; j < n; j++) d[j] -= ds * ar[j];
      d[s] = -ds * inv;
      int leaving = B[r]; B[r] = Nv[s]; Nv[s] = leaving; atU[s] = leaveAtUpper ? 1 : 0; cur[r] = enteringVal;
    }
    return true;
  }
  // primal value of structural j, row dual y_i (>= 0), after a successful solve
  void primal(std::vector<double>& x) const {
    x.assign(n, 0.0);
    for (int j = 0; j < n; j++) if (Nv[j] < n && atU[j]) x[Nv[j]] = ubv[Nv[j]];
    for (int i = 0; i < m; i++) if (B[i] < n) x[B[i]] = cur[i];
  }
  void duals(std::vector<double>& y) const {
    y.assign(m, 0.0);
    for (int j = 0; j < n; j++) if (Nv[j] >= n) { double v = -d[j]; y[Nv[j] - n] = v > 0 ? v : 0; }
  }
};
