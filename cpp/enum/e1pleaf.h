// e1pleaf.h: v7 certificates for the leaves of E1P blocks, computed in process by the C++ gen7 (gen7.h).  A leaf with labels
// pl has the terms vecs[l] and the IP's domain (X with <X, e> = 0 for e in the IP's basis E), as py/leafcerts.py.
#pragma once
#include "e1pemit.h"
#include "gen7.h"
#include <set>
namespace e1p {
struct LeafGen {
  const IP& ip; std::vector<int> doml; int K = 4; long long maxnodes = 300000; int deadk = 6;
  std::map<std::vector<int>, BW> cache; long long ncerts = 0, nbig = 0, nsat = 0, nenc = 0; double secs = 0;
  LeafGen(const IP& p, const std::vector<int>& E) : ip(p) {
    // env E1_GEN7_MAXNODES: gen7's call budget per leaf (default 300000, gen6la's); a leaf over it becomes external (BIG)
    if (const char* m = getenv("E1_GEN7_MAXNODES")) { long long v = atoll(m); if (v > 0) maxnodes = v; }
    for (int X = 1; X < 512; X++) { bool ok = true; for (int e : E) if (__builtin_popcount(X & e) & 1) { ok = false; break; } if (ok) doml.push_back(X); }
  }
  std::set<std::vector<int>> failed;   // leaves without a certificate (the emitter asks twice: size, then emission)
  long long nfit = 0;                  // certificates from the fit fallback (gen7.h), after a field overflow
  // the caches only serve one job (the emitter asks for a leaf's certificate twice, for the size and for the stream): release
  // them after every job, or they grow with the run (a few hundred bytes per leaf; the cause of the 733 GB OOM of job 863)
  void reset() { std::map<std::vector<int>, BW>().swap(cache); std::set<std::vector<int>>().swap(failed); }
  bool operator()(const std::vector<int>& pl, BW& out) {
    auto it = cache.find(pl);
    if (it == cache.end()) {
      if (failed.count(pl)) return false;
      auto t0 = std::chrono::steady_clock::now();
      auto done = [&]() { secs += std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count(); };
      std::vector<int> terms; for (int l : pl) terms.push_back(ip.vecs[l]);
      BW w; bool ok = false;
      for (int att = 0; att < 2 && !ok; att++) {   // att 1: the fit fallback, only after a field overflow
        g7::Leaf L(terms, doml, false); L.fit = att == 1;
        try {
          g7::Cert* c = L.finalize(L.gen(K, maxnodes, deadk));
          g7::BW gw; g7::enc_cert(gw, c);
          for (size_t i = 0; i < gw.n; i += 64) { int k = (int)std::min<size_t>(64, gw.n - i); w.put(gw.w[i / 64] & (k == 64 ? ~0ULL : ((1ULL << k) - 1)), k); }
          ncerts++; nfit += att; ok = true;
        } catch (g7::Big&) { nbig++; break; }
        catch (g7::Sat&) { nsat++; break; }
        catch (std::runtime_error& e) {
          if (att == 0 && std::string(e.what()).find("overflow") != std::string::npos) continue;
          nenc++; fprintf(stderr, "gen7: leaf not certified (%s)\n", e.what()); break;
        }
      }
      done();
      if (!ok) { failed.insert(pl); return false; }
      it = cache.emplace(pl, std::move(w)).first;
    }
    out.cat(it->second);
    return true;
  }
};
}  // namespace e1p
