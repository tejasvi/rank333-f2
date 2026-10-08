// e1pconv: lineenum9qp --cert traces -> E1P block literals (hcls/E1P), the C++ replacement of E1P/py/mklits.py.
// Usage: e1pconv IPFILE ORDER TRACE... --out OUT.bin [--limit L] [--rlim R] [--leafcerts F] [--leaves-out F] [--nomirror]
//   every block is checked by the semantic mirror (e1p::Mirror) and every delegated child glued, unless --nomirror;
//   --e1g writes the E1G stream format (N <= 127; hcls/E1G/Check.lean); --nolazy keeps every saturating row of look-ahead-killed children (the output of E1P/py/mklits.py, bit for bit);
//   OUT.bin    count (u32), then per literal its byte length (u32) and little-endian bytes (mkasm.py's data format);
//   OUT.bin.stats  per literal: st-nodes, bits, mode, parent block, parent record;
//   --ebasis E1,..  the IP's basis E: v7 leaf certificates computed in process by the C++ gen7 (gen7.h, e1pleaf.h);
//   --leafcerts F  lines "l1,..,lR HEX NBITS": v7 certificates of the leaves (labels in search order), the two-pass route;
//   --leaves-out F write the label lists of all leaves (for the certificate generator) and stop before emission.
#include "e1pleaf.h"
int main(int argc, char** argv) {
  if (argc < 4) { fprintf(stderr, "usage: e1pconv IPFILE ORDER TRACE... --out OUT.bin [--limit L] [--rlim R] [--leafcerts F] [--leaves-out F]\n"); return 1; }
  const char* ipf = argv[1]; const char* ordf = argv[2];
  std::vector<std::string> traces; std::string out, lcf, lof; long long LIMIT = 1 << 16; size_t RLIM = 4000; bool MIRROR = true; int FLIPS = 0; std::string CHECKLITS; bool LAZY = true; std::vector<int> EB;
  for (int i = 3; i < argc; i++) {
    std::string a = argv[i];
    if (a == "--out") out = argv[++i]; else if (a == "--limit") LIMIT = atoll(argv[++i]); else if (a == "--rlim") RLIM = atoll(argv[++i]);
    else if (a == "--leafcerts") lcf = argv[++i]; else if (a == "--nomirror") MIRROR = false; else if (a == "--nolazy") LAZY = false; else if (a == "--e1g") e1p::set_format_e1g(); else if (a == "--ebasis") { std::stringstream s2(argv[++i]); std::string t; while (std::getline(s2, t, ',')) EB.push_back(std::stoi(t)); } else if (a == "--fliptest") FLIPS = atoi(argv[++i]); else if (a == "--check-lits") CHECKLITS = argv[++i]; else if (a == "--leaves-out") lof = argv[++i]; else traces.push_back(a);
  }
  try {
    auto t0 = std::chrono::steady_clock::now();
    e1p::IP ip; ip.load(ipf, strcmp(ordf, "-") ? ordf : nullptr);
    fprintf(stderr, "IP: R %d N %d rows %zu group %zu (%.1f s)\n", ip.R, ip.N, ip.mask.size(), ip.G.size(),
            std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count());
    if (!CHECKLITS.empty()) {   // mirror verdicts for the literals of a .bin file (one line per literal: 1 accepted, 0 rejected)
      FILE* f = fopen(CHECKLITS.c_str(), "rb"); uint32_t c; if (!f || fread(&c, 4, 1, f) != 1) { fprintf(stderr, "cannot read %s\n", CHECKLITS.c_str()); return 2; }
      e1p::Mirror mir(ip);
      for (uint32_t i = 0; i < c; i++) {
        uint32_t n; if (fread(&n, 4, 1, f) != 1) return 2; std::vector<uint8_t> by(n); if (fread(by.data(), 1, n, f) != n) return 2;
        e1p::BW w; for (uint32_t k = 0; k < n; k++) w.put(by[k], 8);
        bool ok; try { ok = mir.block(w); } catch (e1p::Fail&) { ok = false; }
        printf("%d\n", ok ? 1 : 0);
      }
      return 0;
    }
    std::map<std::vector<int>, e1p::BW> certs;
    if (!lcf.empty()) {
      std::ifstream f(lcf); std::string line;
      while (std::getline(f, line)) {
        if (line.empty()) continue;
        std::istringstream ss(line); std::string labs, hex; size_t nb; ss >> labs >> hex >> nb;
        std::vector<int> pl; { std::stringstream s2(labs); std::string t; while (std::getline(s2, t, ',')) pl.push_back(std::stoi(t)); }
        e1p::BW w; // hex is big-endian text of the certificate value; write nb bits little-endian
        std::vector<uint8_t> by; for (size_t k = hex.size(); k > 0; k -= std::min<size_t>(2, k)) { size_t a = k >= 2 ? k - 2 : 0; by.push_back((uint8_t)std::stoul(hex.substr(a, k - a), nullptr, 16)); }
        for (size_t bit = 0; bit < nb; bit += 8) { int k = (int)std::min<size_t>(8, nb - bit); size_t ix = bit / 8; w.put(ix < by.size() ? (by[ix] & ((1u << k) - 1)) : 0, k); }
        certs[pl] = w;
      }
      fprintf(stderr, "leaf certificates: %zu\n", certs.size());
    }
    std::set<std::vector<int>> leaves;
    std::unique_ptr<e1p::LeafGen> lgen; if (!EB.empty()) lgen.reset(new e1p::LeafGen(ip, EB));
    std::vector<std::vector<uint8_t>> lits; std::vector<std::string> stats; long long totN = 0; size_t nblk = 0;
    for (auto& tf : traces) {
      FILE* f = fopen(tf.c_str(), "rb"); if (!f) { fprintf(stderr, "cannot open %s\n", tf.c_str()); return 2; }
      while (true) {
        uint32_t mg; uint64_t len;
        if (fread(&mg, 4, 1, f) != 1) break;
        if (fread(&len, 8, 1, f) != 1 || mg != 0x3342454C) { fprintf(stderr, "bad trace header\n"); return 2; }
        std::vector<uint8_t> buf(len); if (fread(buf.data(), 1, len, f) != len) { fprintf(stderr, "truncated trace\n"); return 2; }
        auto t1 = std::chrono::steady_clock::now();
        e1p::Job job(ip); job.check(buf.data(), buf.size());
        auto t2 = std::chrono::steady_clock::now();
        size_t nleaf = 0;
        for (size_t t = 0; t < job.nodes.size(); t++) if (job.nodes[t].tag == 'L') nleaf++;
        if (!lof.empty()) {   // collect leaf label lists by a walk
          std::vector<int> pl(job.pre);
          std::function<void(int)> walk = [&](int t) {
            const e1p::Node& nd = job.nodes[t];
            if (nd.tag == 'L') { leaves.insert(pl); return; }
            if (nd.tag != 'O') return;
            for (auto& it : nd.items) if (it.code == 2) { pl.push_back(it.l); walk(it.child); pl.pop_back(); }
          };
          walk(job.root); nblk++; totN += job.blocknodes; continue;
        }
        e1p::Job::LeafCert lc = nullptr;
        if (nleaf && !EB.empty()) lc = [&](const std::vector<int>& pl, e1p::BW& c) { return (*lgen)(pl, c); };   // gen7 in process
        else if (nleaf) lc = [&](const std::vector<int>& pl, e1p::BW& c) { auto it = certs.find(pl); if (it == certs.end()) return false; c.cat(it->second); return true; };
        job.LAZY = LAZY;
        auto bl = job.emit(lc, LIMIT, RLIM);
        auto t3 = std::chrono::steady_clock::now();
        if (MIRROR) {   // every block accepted by the semantic mirror, every delegated child glued to its record
          e1p::Mirror mir(ip); std::vector<std::vector<std::pair<size_t, size_t>>> Hs;
          for (size_t i = 0; i < bl.size(); i++) {
            if (!mir.block(bl[i].bits)) throw e1p::Fail("mirror rejects block " + std::to_string(i));
            Hs.push_back(mir.H);
            if (bl[i].parent_block >= 0 && !e1p::Mirror::glue(bl[bl[i].parent_block].bits, Hs[bl[i].parent_block][bl[i].parent_rec], bl[i].bits))
              throw e1p::Fail("block " + std::to_string(i) + " not glued to its record");
          }
        }
        if (FLIPS) {    // negative test of the mirror: flip one random bit of a block, count rejections
          std::mt19937_64 rng(12345); e1p::Mirror mir(ip); long long rej = 0, acc = 0;
          for (int f = 0; f < FLIPS; f++) {
            size_t i = rng() % bl.size(); e1p::BW w = bl[i].bits; size_t bit = rng() % w.n;
            w.w[bit >> 6] ^= 1ULL << (bit & 63);
            bool ok; try { ok = mir.block(w); } catch (e1p::Fail&) { ok = false; }
            if (ok) acc++; else rej++;
          }
          fprintf(stderr, "fliptest: %d single-bit flips, %lld rejected, %lld accepted\n", FLIPS, rej, acc);
        }
        auto t4 = std::chrono::steady_clock::now();
        for (auto& b : bl) {
          lits.push_back(b.bits.bytes());
          stats.push_back(std::to_string(b.nodes) + " " + std::to_string(b.bits.n) + " " + std::to_string(b.mode) + " " +
                          std::to_string(b.parent_block) + " " + std::to_string(b.parent_rec));
        }
        totN += job.blocknodes; nblk++;
        fprintf(stderr, "trace block %zu: st-nodes %lld, leaves %zu, literals %zu, lazy-dropped rows %lld; check %.3f s, emit %.3f s, mirror %.3f s\n", nblk - 1,
                job.blocknodes, nleaf, bl.size(), job.st["lazyDropped"] + job.st["lazyDroppedK"], std::chrono::duration<double>(t2 - t1).count(), std::chrono::duration<double>(t3 - t2).count(),
                std::chrono::duration<double>(t4 - t3).count());
        if (getenv("E1P_STATS")) { fprintf(stderr, "  model stats:"); for (auto& [k, v] : job.st) fprintf(stderr, " %s=%lld", k.c_str(), v); fprintf(stderr, "\n"); }
      }
      fclose(f);
    }
    if (!lof.empty()) {
      FILE* g = fopen(lof.c_str(), "w");
      for (auto& pl : leaves) { for (size_t i = 0; i < pl.size(); i++) fprintf(g, "%s%d", i ? "," : "", pl[i]); fprintf(g, "\n"); }
      fclose(g); fprintf(stderr, "%zu trace blocks, %lld st-nodes, %zu distinct leaves -> %s\n", nblk, totN, leaves.size(), lof.c_str());
      return 0;
    }
    FILE* g = fopen(out.c_str(), "wb"); uint32_t c = (uint32_t)lits.size(); fwrite(&c, 4, 1, g);
    for (auto& b : lits) { uint32_t n = (uint32_t)b.size(); fwrite(&n, 4, 1, g); fwrite(b.data(), 1, n, g); }
    fclose(g);
    FILE* h = fopen((out + ".stats").c_str(), "w"); for (auto& s : stats) fprintf(h, "%s\n", s.c_str()); fclose(h);
    if (lgen) fprintf(stderr, "gen7: %lld leaf certificates (%lld by the fit fallback) in %.2f s, %lld over maxnodes, %lld SAT, %lld not encodable\n", lgen->ncerts, lgen->nfit, lgen->secs, lgen->nbig, lgen->nsat, lgen->nenc);
    fprintf(stderr, "total: %zu trace blocks, %lld st-nodes, %zu literals, %.2f s\n", nblk, totN, lits.size(),
            std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count());
  } catch (e1p::Fail& e) { fprintf(stderr, "e1pconv: %s\n", e.what()); return 3; }
  return 0;
}
