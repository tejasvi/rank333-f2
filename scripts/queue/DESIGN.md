# xq: the prof7 item queue (prof7L92 / prof7L93, 2026-10-06)

A busy prof7L92/L93 run hands subtrees to a queue on the main VM (`xq/xqd.py`); idle runs and helpers take them. A job handed to
the queue is complete only when every item of its tree has reported back; the server records that tree in a manifest that
`xq/xqaudit.py` checks. A spill control makes a run write out all its unfinished work and exit, so work can be moved or split
without losing progress.

Builds: `cpp/prof7L92.cc` = prof7L87 + the client; `cpp/prof7L93.cc` = prof7L90 (production poolI search since ~08:30 UTC, exact,
about -22% CPU) + the same client (three-way merge; the client code is byte-identical in both). Use prof7L93 where prof7L90 runs.

Files: `cpp/prof7L92.cc` (= prof7L87 + the client; header comment), `xq/xqd.py` (server), `xq/xqctl.py` (admin client, also used by
`ops/autosplit.py`), `xq/xqaudit.py` (audit), `ops/deployL92.sh` (build + smoke test per VM, status `ops/l92_status.txt`),
`xq/tests/` (validation; `bench.sh` drives the three-host bench).

## Model

A **unit** of a run is a list job (frontier index) or an imported item (slot after the frontier). Inside a run, units donate pieces
to the local queue exactly as in prof7L87 (`--agedonate`, `--donate_depth`/`--agedepth`).

An **item** at the server is one of
- **J** job root: pool job `ix` of a run's space (the journal fingerprint: search options + frontier). Its own part is the job's
  tree minus its children. Created at the first accepted hand-off (or spill) of that job.
- **P** piece: the subtree of a prefix (a node below its parent's region).
- **Q** range: node prefix S and label l: the children of S with label >= l in the search order, with their subtrees. S itself is
  not in the range (it was counted where it was visited). Ranges come only from spills.

States: Queued, Leased (one run), Reported (own part done: n l p by one run), Complete (reported, every child complete; total = own
+ children's totals), Failed (the run could not replay it). A job root's total is the job's state line.

**Exactness.** Each item's own part is counted by exactly one run, and a run never counts a piece it exported or a range it spilled.
Per piece, prof7's search is a function of the prefix alone (donated pieces replay their prefix and run the same code as in-process
donation since prof7L29; the node-level state of a range's node is recomputed at replay exactly as for a piece root; children are
independent of earlier siblings). So the sum over a job's tree equals the single-process count. The same holds for profiles: each
leaf lies in exactly one item's own region, and the run that reported the item wrote its profiles.

**Durability.** Reports are sent only after an fdatasync of the profile files they count (the prof7L84 committer). The server fsyncs
every change before answering. A job's state line is written after its manifest S record; at restart the server restores lines
missing from the state file. The server replays the manifest at start.

## Client (prof7L92)

- `--xq HOST:PORT` connects (TCP, one line per message, reconnects every 5 s). It sends HELLO alone and waits for WELCOME: the
  server's manifest id (creation time of its manifest, the same across restarts) must equal the one this run first saw, otherwise the
  server is another queue and nothing (pending hand-offs, reports, spills, held items) is sent to it. Queue unusable for `--xqdown` s
  (default 900): helpers and idle lingering runs leave; a run whose own work is done but whose hand-offs are unanswered spills to file.
  Heartbeats every 10 s, at once after WELCOME, and when the local queue fills from empty (at most 1/s), so short jobs hand off too. Identity: `--xqname` (default from `--state`), pool
  from `state_<pool>_<part>.txt` (`--xqpool`), state dir = dirname of `--state`, compat fingerprint = search options without the
  frontier options + table hash + kept-row counts. Pieces only move between runs with equal compat.
- **Export**: the server sends `GIVE k` when runs are idle elsewhere. The run takes up to k pieces from its local queue (not job
  roots; depth <= `--xqmaxd`; at least `--xqkeep` + idle threads left), shallowest first, and sends them. An accepted piece (`XA`) is
  the unit's child; a refused one (`XN`: autosplit claimed the job, another run owns its job root, or the item is no longer this
  run's) goes back to the local queue. A list job with an accepted piece is tracked: it writes no state line; when its own part is
  done the run reports it (`R`), and the server writes the line when the tree completes. "H ix" journal lines record jobs handed over.
- **Import**: once its job list is exhausted, a run with idle threads asks for items (`W k`). Imported profiles go to `--xqout`
  (default `<out>_xq.prof`, picked up by `profloopc.sh` as `F_*.prof`). Children exported from an item by an earlier holder are
  skipped with 0 counts. Imported items never read or write journals.
- **Spill** (`--spillfile F` present, SIGUSR1, the server's `SPILL`, or SIGTERM while connected): every thread stops at its next
  child-loop step at depth <= `--spilld` (default 19; deeper nodes finish) and records "node S, children from label l". Queued
  pieces stay pieces. Per unfinished unit: explored counts (everything it visited) + its open items -> one `SP` message, applied
  atomically by the server. Everything also goes to `--spillout` (default `<state>.spill`, fsynced first). Exit 75. A run that
  cannot reach the server keeps the spill file; `xq/xqctl.py submit FILE` sends it later (the server dedups by run name + cseq).
  Interrupted subtrees write no journal records (a spill ends a journal run like a donation does).
- **Other runs' jobs**: `T ix` from the server = job ix of this space is in the queue (another run's job root, or reported). Not
  started, and abandoned if running and not owned here. A tracked job owned here ignores `--abortdone` skips (the skip files list
  the queue's jobs as moved).
- Helpers: `--xqhelper` (no frontier; imports only; ends on `EXIT`, `--xqstop F`, or `--xqlinger S` idle seconds). A list run with
  `--xqlinger S` keeps importing for S idle seconds after its own work.
- Without `--xq` and without a spill trigger the run is prof7L87's (identical state lines, profiles and journal fingerprint;
  verified). SIGUSR1/`--spillfile` work without `--xq` too (spill file only).

## Server (xqd.py)

- Compat fingerprint: the search options without the frontier and run-specific options, as option groups sorted (order-independent),
  plus table hash and kept-row counts; computed also without `--xq` (spill files carry it).
- `xqd.py --base DIR --port P --lease S`. Files in DIR: `manifest.log`, `xqd.log`, `status.json` (every 10 s), `tracked_<pool>.txt`
  (job roots not complete), `moved_from_<pool>.txt` (every job the queue holds or held). Production base: `caseII/xq`, port 7919. The
  cover scripts (`coverI.py`, `coverJ.py`) and autosplit glob `caseII/*/moved_from_<pool>.txt`, so the pools' skip files list the
  queue's jobs as moved; the queue's state lines land in `caseII/<pool>/gather/xq/state_<pool>_xq.txt`, which the controllers'
  gather union reads.
- Leases: a run silent for `--lease` s is lost: its leased items (including its job roots) are re-queued (front). A job root
  re-queued is run by any compatible run as an imported J item (job minus its children).
- Re-leased items keep their children (pieces the earlier holder handed off); the new holder gets them as a skip list and never adds,
  donates or enters them (checked before add(), so a local donation cannot duplicate one). Two server rules keep the tree a
  partition: a new child at or inside an existing child is refused (`XN overlap`; the piece runs locally, where the skip applies), and
  children of earlier holders that lie inside a new child's region move under it (`M` record, "adopt"), so the new child's runner
  skips them. Found by the lost-host benches: without adoption a re-run's piece contained 20 earlier pieces (+39 nodes); without the
  pre-add check a re-run donated copies of earlier pieces (duplicates, e.g. +9,819 nodes). See VALIDATION.md. A run that comes back (same name) sends
  `HOLD`: items still queued under it are re-leased, items leased elsewhere are revoked (`REVOKE`; it abandons them). Only the
  current holder may report or add children.
- Scheduling: items leased round-robin to runs with `W k > 0`; unmet demand turns into `GIVE` to the runs with the longest local
  queues (each at most every 2 s).
- Admin (`xq/xqctl.py`): `status`, `claim POOL X..`, `unclaim`, `spill RUN|*`, `exit RUN|*`, `items [STATE]`, `submit FILE` (a run the
  server never saw is registered from the spill file header).
- A returning run's `HOLD` list: items still queued under it are re-leased; items leased elsewhere or finished by another run are
  revoked (it drops them; its late reports are refused).

## Manifest records (one line each)

```
V 1 t
H t name key=value...                                   run connected
J t id space compat pool statedir ix holder rord d v1..vd      job root created (leased to holder)
X t id parent kind ix rs creator key d v1..vd            child item (P, or Q with first label rs)
L t id run | Q t id reason | F t id reason              leased / re-queued / failed
R t id run key n l p nchildren outfile                   own part reported (outfile holds its profiles)
C t id n l p                                            complete: subtree totals
S t space pool statedir ix n l p sec                    job state line written
M t child newparent                                     re-parent (adopt): an earlier holder's child inside a new child
A t pool ix | U t pool ix                               autosplit claim / unclaim
N t key reason                                          a refused request (idempotent answer)
```

## Coordination with ops/autosplit.py

The server is the single arbiter. Before creating a generation, autosplit calls `CLAIM pool x..`. Atomically, the queue refuses the
jobs it already tracks (any job root) and records the others as autosplit's, refusing every later export or spill of them. So a job
is split by exactly one mechanism. If the queue is unreachable, autosplit does not split jobs in flight on prof7L92+ parts or listed
in `caseII/xq/tracked_<pool>.txt`. A generation that does not form unclaims its jobs. autosplit's candidates also skip tracked jobs.

## Audit (xqaudit.py MANIFEST [--prof FILES] [--ref STATEFILES])

Structure (children strictly inside parents, siblings disjoint, created while the parent was leased), accounting (one report per
complete item, total = own + children), job state lines present in the gather file, liveness (incomplete trees, failed items);
per-item profile attribution in the reporting run's file; comparison with reference state lines.

## Limits

- Profiles stay on the VM that found them (as with prof7L87). A VM whose disk is destroyed loses the profiles of items it had
  reported. Spot VMs stop with their disk, so this is the same exposure as a prof7L87 part.
- A run that keeps pieces exported but unanswered cannot finish while the server is down (it waits; spill writes them out as
  keyed children).
