# (B+) module port: validation of the final environment of `R22B.rank_ge_23 : Top.RankGe23`

The port turns the closure of the final theorem (the kernel-checked tiers, the native refinement layers, the bridges, the class
crowns, the Gram closure, the L479 tier) from non-module Lean files into Lean 4.30 `module` files, compiled into one environment
together with the run's generated glue modules, so that the final theorem is checked in a single Lean environment with no
external step. Every port module is compiled from a frozen copy of its owner's source; the original (non-module) build is the
reference that the port is compared with.

## The validated tree

- Frozen snapshot of 2026-10-08 06:54:17 UTC: 43,912 non-module files in the closure (plus 174 used only by the V4 tests) and 116
  module files of ours (compiled from their frozen sources).
- `MANIFEST_FULL.md5`: md5 of 315,565 files (frozen sources and data, ported sources, every build part, `libnative.so`); file
  md5 7c5a67484a5335c4d4c4b5b69ac3ddb1. The tree has been read-only since 2026-10-08 08:05 UTC (`reports/FROZEN.txt`).
- Toolchain: Lean v4.30.0 (`leanprover/lean4:v4.30.0`); Mathlib tag v4.30.0 (commit c5ea00351c28e24afc9f0f84379aa41082b1188f);
  aesop, Qq and Cli v4.30.0, batteries 32dc18cde368, ProofWidgets v0.0.99, plausible a456461b368b, LeanSearchClient c5d5b8fe6e51,
  importGraph 515cf9d0c00e.
- Closure of `R22B.FinalTop` (`reports/closure_modules.txt`): 43,888 port modules (43,675 ported non-module files, 108 module
  files of ours, 105 umbrellas re-exporting the external libraries), plus Lean core, Mathlib and its dependencies, and the run's
  glue modules (54 imported directly by the final files; they import the checked chunks).
- Build machine: one VM with 384 vCPUs and 708 GB of memory.

## Results (final run 2026-10-08 06:53-07:56 UTC; V5 re-run 08:28-08:47 UTC over the same, verified tree)

| check | what is compared | result |
|---|---|---|
| V1 build | every module of the tree from its ported source (44,314 traces) | 0 failures; R22B.FinalTop 194 s, peak 14.7 GB |
| V2 statements | per constant, a structural hash of its type (and of its value for definitions) in the port vs the original build, over the 44,137 modules that have an original olean | 2,062,872 user-level constants in both builds: 2,062,866 equal (8 of them only up to proofs inside a definition's value), 6 expected differences (loader helpers whose code was patched to pass `forceExpose`), 0 missing, 0 added; **0 types differ**; loader data: 1,309,231 definitions of 6,225 loader modules, 0 differ |
| V3 axioms | per declaration, the set of axioms its type and body depend on (strongly-connected-component walk over the whole reference graph), port vs original build | **2,062,954 user-level declarations, 0 differ, 0 missing** (all 2,062,872 V2 constants plus 82 macro/elab-rule auxiliaries); none outside `propext`, `Classical.choice`, `Quot.sound` and the 23 `#ndbool` native axioms (used by 55 declarations); 2,756 roots (every `#print axioms` target and the listed top theorems) agree in all five readings: old and new world, Lean's `collectAxioms` and the walk, and a `module` root |
| V4 behaviour | 18 test files that must accept or reject, compiled in both worlds | 18/18: accepts stay accepts, rejects stay rejects with the same errors |
| smoke, target, probes | `module` roots importing the modules of the 2,729 roots / the case modules / the crowns and final files | all compile; crowns: a root importing R22B.FinalMain loads 12,305 modules and none of the crowns' private subtrees |
| P-2 statement chain | the constants the final statements depend on (statement constants, definition values, constructors), as a `module` root sees them (exported level), vs the private level and the original build | 28,350 constants (26,044 of port modules): 0 types differ, every port definition keeps its value; vs the original build: 27,505 constants, 0 types differ, 2 values differ only in proofs; the final files' chain (3,435 constants) agrees on all 3,009 shared constants |
| 6.2 chunk libraries | the port's module files vs the chunk workers' libraries, byte for byte | identical to all five libraries (96 to 104 module files x 4 parts each; md5 over each library's MANIFEST paths in the port reproduces the library's name); FROZEN_L479 288/288; `libnative.so` identical |
| 6.3 / V5 axiom names | infra's `AxAudit` (`#print axioms` of `R22B.rank_ge_23` from a `module` root) and `axallow` (exact-name allow-list) | 4,381,050 axioms = 3 standard + 4,381,024 chunk axioms + the 23 `#ndbool` axioms; **0 deviations**: every chunk axiom belongs to a used chunk with an allow-listed checker pair (4,193,446 recorded when the chunk was checked, 187,578 derived from the chunk's exported statement for early L479/pt batches; 0 missing or not allowed); the 23 `#ndbool` axioms match their recorded names and heads |

## Scope

- V2 and V3 compare the port with the original build, so they cover the modules that have an original build: 25 source-only
  modules (1,689 constants: infra's bridge files and a few modules never built in non-module form) and the 30 modules that import
  the run's glue modules (R22B.FinalRun, R22B.FinalTop, the E1 wrappers) have no such reference. Those are covered by V1, by V3's
  module-root reading of their `#print axioms` roots, by the P-2 statement chain, and by V5's exact-name audit.
- "User-level" excludes generated auxiliaries (`_proof_N`, `match_N`, `_simp_N`, …), which may be renumbered between the builds;
  they enter the hashes of the constants that use them, by their statements.

## Files

`reports/`: `v2_report.txt`, `v3_report.txt` (long axiom lists abbreviated), `v4_report.txt`, `v4_report_mainvm.txt`,
`chain_report.txt`, `probe_report.txt`, `ckr.txt`, `v5_report.txt` and `v5_allow/` (axallow outputs), `FROZEN.txt`,
`closure_modules.txt`. Counts: `port_validation.json`.
