// Batch 14 (2026-10-07, speed): the xp2 context rows are deduplicated through per-thread bitmaps and take their label masks from XPLAB
// (checked against RMASK for every row at startup, prefetched) instead of a per-bit relabeling; streams unchanged.  --xp2verify N: xp2's
// self-verification for every certificate (1, kill2's default), none (0), or the certificates of one node context in N (a hash of the
// prefix); certificates and streams are unchanged unless a self-check would fail (none so far: such a kill is expanded).  The v7
// leaf generator is native/leaf's gen7fast drop-in (g7/gen7.h 1b9fb801d5cd), bit-identical to hcls's gen7.h and 4-8x faster.
// Batch 13 (2026-10-07, native track): --leafv7: every profile leaf (LEAF 0) carries its v7 leaf certificate record R, as
// BC7s.leafS (leaf2/BranchCheck7s.lean) reads it: [6] n, n x [9] codes (increasing label order, the term order gen7 used), [1] dm = 0
// (domain ALLNZ), [1] lg = 1, then g7::enc_cert's bits (none when rkSum < 27: Lemma G). Written after the code byte as varint nbits
// and ceil(nbits/8) bytes, little-endian bits (header #leafv7 1). Generator: hcls/E1P's gen7.h, pinned in r3/g7/ (K 4, maxnodes
// 300000, deadk 6, lg on the full domain; the fit fallback after a field overflow; Big retried at 2e6, then 2e7).
// Batch 12 (2026-10-07, native track): --pcwit: every segment header carries, after the 64-byte dead mask D, the witness rows of D
// (varint n, n x varint row-id delta, ascending; header #pcwit 1): the VROWS rows cited at the donor node and its ancestors in the job,
// whose label masks' union is D (n = 0 for job roots, replay cuts and top segments).  A piece carries them like D (Job.win).
// Batch 11 (2026-10-07, native track): --xpvar writes the bulk-peel blobs (X choice 5, XPN, node-cut certificates) as LEB128
// varint item lists (header #xpvar 1, in the fingerprint); --xp2prune N / --xp2exprune N set xp2's minimization passes by flag.
// Batch 9 (2026-10-07): kill2's budget cut and step pruning by flag (--xp2cut N, --xp2psteps N; P2_CUT / P2_PSTEPS), generator
// sources re-pinned (r3/xp2; batch 5-8 copies in r3/xp2/b5); --pctop runs the top subtrees in full search mode (every cut of a job
// run, so the DUMP has no jobs a job run would kill at its root), JOBs at depth F, no donation.
// Batch 8 (2026-10-07, QUEUE.md §8): --pctop F PFILE writes top segments (kind 4: one per prefix, its subtree in collection mode
// down to depth F, `2D JOB varint delta, varint ix` at each depth-F node, ix = the line of the --dumpfrontier file).
// Batch 7 (2026-10-06): no aged donation while collecting the frontier (with --agedonate > 0 an in-process collection lost its
// children: empty frontier).  Runs that read --frontierfile are unchanged.
// Batch 6 (2026-10-06): --pcxp/--xp2 under any --rord: the peel's label table follows the run's order, and the --pcxp files are
// checked against the kept rows at startup (r3/rt321/ holds the --rord 321 files).
// Batch 5 (2026-10-06, the rerun source): kill2's joint bulk-peel generator xpeel2 (--xp2; DESIGN 27.13) merged as written by
// kill2/p5/mkx.py (generator sources pinned in r3/xp2/), plus --pcnorep in the xp2 path, --xp2agg N (0: 27.11 format, 2: hybrid)
// and the effective xp2 parameters in the search fingerprint.  Batch 4: --pcnorep (no replayed kill).  Recipe: lean/rerun/RECIPE.txt.
// With --xp2 an X record of choice 5 carries an empty exclusion list: F_u is derived from the node matrix (K2C.fuOK).
// prof7R3 = prof7R2 + the prof7L90 exact speedups (cpp/prof7L90.cc, lp/lpcore12v.h; merged by diff3 on prof7L87, two header/
// declaration conflicts resolved by hand) + a packed per-job certificate stream for the Lean checkers, --pcert FILE
// (r22/lean/rerun/R3.md).  Without --pcert the search, the text certificate (--cert) and the journal are prof7R2's (journal tag
// "prof7R3"); the --pcert stream never changes the search (validated: identical per-job nodes, leaves and profiles).
// --pcert FILE (one file per launch; the file must be new or empty).  Text header lines "#..." up to "#end", then blocks
//   [u32 0x31423352 'R3B1'][u32 len][u32 crc32c(payload)][payload = u64 segment id, u32 chunk, u8 flags (1 first, 2 last),
//   first chunk only: segment header (varint job, u8 kind 0 job root / 1 piece / 2 replay cut, u8 depth d0, d0 x u16 prefix labels,
//   64-byte inherited dead mask (bit = label)), then record bytes].  A segment's logical stream is its chunks' record bytes in
//   chunk order; journal records and skip references give logical offsets in it.  Points are label indices 0..510 (header "#lab").
//   Records (tag byte, then fields; varint = LEB128), in DFS pre-order; every visited node writes NODE and one outcome:
//     01 NODE u16 depth<<9|label   02 LEAF u8 code (0 profile, 1 k10, 2 split, 3 hyperplane, 4 rootcut, 5 kept row over, 6/7 W-list)
//     03 CUT u8 kind, args: 1 feasibleFuture u16 X (1..511) | 512+split | 1023 wlook; 2 prefix overfills kept row varint row;
//        3 flook u8 dead term position; 4 count varint |F|; 5 MIS varint bb; 6 deficit search varint bb; 7 rank-1 window; 8 type;
//        9 childless; 10 last-level overfill varint row; 11 replay cut u8 position + add-failure fields (as 27)
//     04 OPEN (the node has a child loop; its records follow, then 05 END)   06 ABORT (job abandoned: the segment is void)
//     node data (after OPEN): 10 VROWS varint n, n x varint row-id delta (ascending): kept rows full at the node that cover every
//        child in a full row not already in the inherited dead mask D (D = rows cited at the ancestors in this job; a piece root
//        inherits its donor's D, a job root starts empty);  11 XROWS varint ne nc1 nc2 nr2, then ne + nc1 + nc2 + nr2 varint row ids: the
//        node's row table for the one-node kills (ex = cap >= 3 rows of residual 1 through the killed child, c1 = residual-1 rows,
//        c2 = residual-2 rows through the child, r2 = residual-2 rows without it);
//        12 WB varint n, n x (varint label delta, u8 W index): W-blocked candidates (Lemma W) outside D;
//        13 BLK varint n, n x (varint label delta, u8 dim, dim x u16 basis vectors): candidates blocked by a saturated table
//        subspace that is not a full kept row (outside D and WB)
//     child records, in label order, with varint label delta from the previous child record of the node (or the node's label):
//        20 T u8 nX, nX x varint ex index (L1 type T: |F_u - N[u] - ex rows| < nu)
//        21 C u8 nX u8 nC, indices (L1 type C: ex rows, then cover rows; cover index < nc1 = c1 row, else c2 row nc1+i)
//        22 X u8 kind (1 count, 2 MIS, 3 deficit search, 4 deficit search with residual-2 cliques, 5 crow, 6 tl2) varint bb u8 choice
//           (0 replay; 2 expanded: the child's records follow; 1 Farkas certificate: varint nEx, nEx x varint ex index (every big
//           residual-1 row through u: f = F0 above u minus N[u], those rows and WB), varint nCon, per constraint u8 type (0 clique: varint
//           len, len x varint label delta from u; 1 c1 row, 2 c2 row, 3 r2 row: varint table index; 4 deficit: u16 X) and varint
//           multiplier, then zigzag varint slot multiplier w)
//        23 CANON u8 rejection type, u24 g = t<<18|P<<9|Q (g(T) is lex-smaller than T = prefix + child; L3 witness)
//        24 PREFF u16 X | 512+split   25 TYPE   26 DOOM (rank-1 window of the child)   28 DON (donated: the piece segment with
//        prefix + child holds the subtree)
//        27 ADDF u8 kind (1 existing subspace overflows, 2 new subspace overflows: u8 dim, dim x u16 basis vectors; 3 W count 12,
//           4 W dictionary at 11, 5 W k10 at 10: u8 W index)
//        29 SKR varint dlo, varint hi-lo, varint src, varint seg, varint begin, varint end: children lo..hi are the bytes
//           [begin,end) of segment seg in source file src (header "#src")   2A SKP u16 label, varint src, varint seg (absolute
//           label; the whole subtree of that child, or of a piece root, is segment seg of source src)
//     Children in D, after the suffix break (fewer available labels than needed) and labels never available have no record.
// Journal records carry the pcert references: "R ... lo hi seg begin end" and "P ... seg"; a record is committed only after
// its bytes are flushed and synced (as prof7R2 does for the text certificate).  r3cat (r3cat.cc) assembles a job's canonical
// stream (pieces and skip references inlined); prof7R3 makes it identical for any interruption and resume.
// prof7R2 = prof7R1 (the file below calls it prof7L90) + certificate/journal consistency for the Lean certificate rerun
// (r22/lean/rerun/RERUN.md, section 4).  Without --cert the search and the journal are prof7R1's (journal tag "prof7R2").
//  - A journal record (R run or P piece) is committed only after the certificate lines of its subtrees are on disk: the recording
//    thread flushes its certificate buffer before queueing the record, and the committer (and the SIGTERM path) fflush +
//    fdatasync the --cert file before writing records and state lines.
//  - The journal header carries cert=<path>.  With --cert, --skipjournal uses only journals that name a certificate file.
//  - A subtree skipped through --skipjournal writes "S job P v1..vd src k" (a piece) or "S job R v1..vd lo hi src k" (children
//    lo..hi of node v1..vd) to the certificate (k indexes the
//    "# src k <cert path>" lines written at start), so the certificate of a resumed job is this file plus the referenced
//    subtrees of earlier files (lean/rerun/certjob.py extracts it).
//  - --cert is a run-specific option for the fingerprint (the path changes per launch); certificate mode itself is mixed in.
//  - --jcompat FP1,FP2,.. (hex, or @file): also accept journals whose fingerprint is listed (binary upgrades whose subtrees
//    and certificates stay valid; counts that differ keep the smaller), the generalisation of --jcompat84.
//  - --vskiplast stays on with --cert (prof7L35..R1 switched it off there, which cost +19% nodes and x2.8 leaves on 3 poolH jobs):
//    a skipped child gets "V job P v1..vd v row r" with a full kept row r through v; a child with no full row through it (a
//    W-blocked point) is not skipped.  The node-level overfill exit at depth MISMAX+1 writes misCheck's node-level V line.
// prof7R1 = prof7L90 = prof7L87 (L84 done-subtree journal + L86 cuts --wblock/--flook) + the prof7L82 profile-type cut --typecut M
// (r22/conf/LEMMA_S.md; L78->L82 hunks applied by patch, header hunk by hand).  For the certificate-generation rerun (r22/lean/rerun/).
// prof7L90 = prof7L87 with exact speedups only: the same options, identical nodes, leaves and profiles per job, and the same journal
// fingerprint tag ("prof7L87"), so prof7L87 and prof7L90 journals are interchangeable.  One source for Zen 4 (c3d) and Zen 5 (c4d):
// build with -march=native on each VM.  The AVX-512 paths need AVX512F, AVX512BW and AVX512VPOPCNTDQ (no VP2INTERSECT); the scalar
// code is the fallback.  Measured in r22/s2/S2.md.
// (a) kept-row tracker (../lp/lpcore12v.h): trkAdd/trkDel sweep a per-point bitmap of its rows, 64 rows per AVX-512 step, instead
//     of the row list; the rows reaching residual <= 2 (trkAdd) or leaving residual <= 0 (trkDel) are handled in increasing row
//     order, as in the list loop, so res1, res2, full and over come out the same.
// (b) canonicity: canonCheck runs after the conflict-graph, V-skip and window cuts of the child loop (about 1 child in 200 gets
//     there) with images g(l) = t0[v&7] ^ t1[(v>>3)&7] ^ t2[v>>6] from per-element linear tables (one 64-byte line per element,
//     checked against GL at startup) instead of the label-major buffer.  canonCheck has no effect but filling cst[d+1] for the
//     child that is added next, so the cuts, nodes and profiles do not change; the ST counters of --mispre cuts and non-canonical
//     children do (a non-canonical child cut by the conflict graph now counts as a --mispre cut).  --cert keeps the old order.
// (c) residual-2 rows: r2scanAlive's candidates are kept as pointers to their source rows (r2build reads src & F' and src & Fs;
//     F' and Fs lie inside the scan's F, so this equals the old (src & F) & F'); the static cap-2 rows are scanned from a
//     contiguous copy, with prefetching; AVX-512 row kernels (>= 3 bits without a horizontal sum, >= 2 bits, the alive-hit test
//     before note()); parent rows prefetched 1 KB ahead.
// (d) memory placement: row masks and node buffers 64-byte aligned (a 64-byte row at a 16-byte offset spans two lines); the big
//     read-mostly tables (row masks, row bitmaps, the subspace table, kept rows, GL) on 2 MB pages.
// (e) drec, crecB, defFail and r2apply4C instantiated per word count (1, 2, 4, 8 words).
// prof7L87 = prof7L84 (done-subtree journal; its comment block is below the includes) + the prof7L86 cuts (r22/mid/L78toL86.patch;
// --wblock [--wbmin K], --flook D [--fdef], --rlook, described next).  Without the L86 flags the search is prof7L84's.  The journal
// fingerprint tag is "prof7L87".  --jcompat84 also accepts prof7L84 journals whose fingerprint is that of this run's options
// without the L86 flags: the cuts keep every accepted leaf, so a subtree recorded by prof7L84 holds exactly the profiles prof7L87
// would emit there (only its node and leaf counts are prof7L84's).  A piece or run recorded twice may then differ in nodes and
// leaves (a piece credited from a prof7L84 record is re-recorded with prof7L84's counts); with --jcompat84 and equal profile
// counts the record with fewer nodes is kept instead of stopping on the disagreement.
// prof7L86 = prof7L78 + --wblock: labels that Lemma W (r22/wtight/LEMMA.md (a)-(c), already used by --wcut --wk10 at add time) excludes
// from EVERY completion of the prefix are removed from the node's candidate set before the conflict-graph bounds and child screens.
// For a W-type subspace with point set S: |S| = 11: every further W point (count 12, (a)); |S| = 10: m with S+m failing (b);
// |S| = 9 (with --wk10): m with k10val(S+m) = 0 ((c) fails and no one-point extension passes (b)).  W sets only grow along a
// branch, so such m can never be added below the node: excluding it keeps the leaves and profiles of prof7L78 and only
// strengthens the bounds that prune other subtrees.  Proof: r22/mid/WBLOCK.md.  --wbmin K (default 9): block only at counts >= K;
// use 10 (count 9 costs more k10val solves than it saves).
// --flook D [--fdef] (needs --rootcut): Lemma-R look-ahead at depth >= D.  For each prefix term t and functional X through a_t the
// final hits are at most h(X) + min(need, |F n H_X|) (with --fdef also <= h(X) + need - max_Y (d_Y - |F n H_Y n H_X|) over the
// deficit hyperplanes Y); rootcut::termOK at the largest slack this allows (capped at 2) failing means every leaf below has a dead
// term (the conditions only weaken as hits grow), so the node is cut.  --rlook also tests each candidate as a future term and drops
// dead ones from F (sound, no measurable gain).  Proof: r22/mid/FLOOK.md.  Leaves passing all checks, hence profiles, are exactly
// prof7L78's.  Recommended: --wblock --wbmin 10 --flook 17 --fdef (bench B: nodes -15.5%, leaves -39%, CPU -8%).
// prof7L78 = prof7L77 with exact speedups (identical nodes, leaves and profiles):
// (a) leafCheck: of the 4.14M leaf W-lists (table subspaces of dim >= 5), the 2.42M that are kept rows with the same cap are read from
//     the kept-row tracker (a violated one is exactly a kept row in lp->over), and the 1.69M implied by such a row on a superspace
//     (U < U', cap(U') <= cap(U): count(U) > cap(U) puts U' in lp->over) are dropped; only the ~30k others are summed.  Falls back to
//     the full scan when the tracker is off.  --noleaffast restores the scan.
// (b) r2build reuses the candidate rows r2scanAlive found at the same node (rows with >= 3 points in F; F' <= F), filtering them on F'
//     instead of rescanning the parent's list and the new residual-2 rows.  --nor2cand restores the rescan.
// (c) canonCheck's image buffer is label-major over the node's candidate children (images of child c under the listed group
//     elements contiguous) instead of element-major (one 1 KB permutation per element, a cache miss per element per child).
//     Same images, same tests.  --nocbt restores the element-major buffer.
// prof7L77 = prof7L76 + --rootcut: the leaf check runs tsolve's root test (cpp/rootcut.h, proof r22/wtight/ROOT.md) before the
// leaf W-list scan and drops a leaf with a term that has no nonzero (b, c) meeting the tight / slack-1 conditions of the functionals
// through its first factor (about 90% of the L76 leaves).  The cheap leaf checks (k10, hyperplane hits, split) run first and the
// 4.1M-entry W-list scan (a third of L76's CPU on heavy pieces) runs only on the survivors.  Profiles = those of prof7L76 that
// pass the root test.
// prof7L76 = prof7L75 + --wk10 (with --wcut): part (c) of the W lemma (r22/wtight/LEMMA.md): a W-type subspace holding exactly 10
// points needs their W0 set to decompose T mod_C D for a rank-9 6-dim D >= C' (cpp/wcut_k10.h); add() fails when a W reaches 10 with a
// set failing that and having no one-point extension in the <2,3,2> dictionary, leafCheck rejects a leaf with a W at 10 failing it.
// prof7L75 = prof7L73 + --wcut: the W-type tight-quotient cut (cpp/wcut.h, proof r22/wtight/LEMMA.md).  For each of the 14
// W-type subspaces W of A (u^T a = 0 or a v = 0) at most 11 points may lie in W, and when exactly 11 do, their images in
// W0 = {row 2 = 0} must be the first factors of an 11-term decomposition of <2,3,2> (embedded tsolve, memoized).  add() fails
// otherwise, so the children it kills are never created and prefixes that break it are cut at replay; every other profile is
// emitted exactly as by prof7L73.
// prof7L73 = prof7L72 + software prefetch of the residual-2 row masks in r2apply4C (the row gather was the top stall); same output.
// prof7L72 = prof7L71 with the deficit test of every joint search as one AVX-512 pass (VPOPCNTQ over the deficient hyperplanes stored
// word-major, 8 per vector; scalar fallback without AVX-512): prune iff some deficit exceeds the picks left or its candidate count,
// exactly the decision of the two loops it replaces, so nodes and profiles stay identical.
// prof7L71 = prof7L70 with cheaper deficit bookkeeping in every joint search (same decisions, same nodes): per node, hv8[v][i] =
// <point v, hyperplane i> as bytes (no parity per pick), the deficits as an int8 array updated by one vector pass per pick, and the
// "some deficit exceeds the points still to pick" test as one vector max before the per-hyperplane candidate counts.
// prof7L70 = prof7L69 with the big rows as bitsets over rows: rowsof[v] = the big rows through point v; the search keeps the rows met
// once and the rows met twice (twice |= once & rowsof[v]; once |= rowsof[v]) and removes a row's points when it enters "twice".
// --crowbits selects it (captured rows with >= --crowkmin points).
// prof7L69 = prof7L68 capturing only the rows with at least --crowkmin points in F (the big residual-2 rows carry the cut: rows of
// >= 12 points alone give 2/3 fewer nodes on the benchmark), so the capture and the pair table stay small.
// prof7L68 = prof7L67 with a hybrid row store: a captured row with at most --crowk points in F goes to the pair table, a bigger one is
// counted (rows through each point listed; picking its second point removes the rest of the row), so the table build no longer pays
// k^2 for the big rows.
// prof7L67 = prof7L66 with the residual-2 rows enforced eagerly through a pair table: T[p][q] = union of the captured rows (node-local)
// holding both p and q, built once per node that needs it; the joint deficit search then removes T[p][v] (all p picked before v) from
// the candidates when it picks v, which is exactly "at most 2 new points per residual-2 row".  --crowpair selects it.
// prof7L66 = prof7L65 with a cheaper row test: (1) the node's residual-2 rows are captured while r2scanAlive scans them anyway (no
// second pass over the 239 MB mask table), point index built only when a child reaches the row test (flat counting sort); (2) lazy rows:
// the joint deficit search runs with a small set of active rows; a found set S is checked against every row through its points and a
// violated row is activated and the search restarted (at most --crowiter times); a set that passes is a real completion candidate.
// Exact like prof7L65 up to the limits (over a limit = no cut).
// prof7L65 = prof7L63 + --crow a b [lim]: at depths a..b, a child that survives both passes of the child screen gets one more exact
// search: an independent set of the target size in F_u (residual-2 cliques of u added) that meets every hyperplane deficit AND takes at
// most 2 points from each residual-2 kept row of the node (every completion does: such a row U has cap(U) - |P n U| = 2 and u is not in
// it, or it is a clique through u).  Lazy row list per node (rows with >= 3 points in F), per-point row index; node limit lim (over the
// limit = no cut).  Children it kills are never created, so the node counts drop; the profiles stay those of prof7L53.
// prof7L63 = prof7L62 + --dp1: pass 1 of the child screen runs the joint deficit search directly (instead of the plain independence
// search followed by it), node limit --mispre; --dp2: pass 2 (residual-2 cliques of u added) also runs the joint deficit search.
// prof7L62 = prof7L61 + --dmis2: the deficit tests of prof7L61 done jointly: one exact search for an independent set of the target
// size that meets every deficit delta_X >= 1 at once (prunes when some deficit can no longer be met by the remaining candidates, or by
// the colour bound), at the node (after its independence test) and for the children that pass their independence test.  Node limit
// --dmislim; over the limit = no cut.  Every emitted profile satisfies it, so the profiles are those of prof7L53.
// prof7L61 = prof7L53 + deficit-independence cuts.  A completion S of a node (the need new points) lies in F, is independent in the
// conflict graph and must give every hyperplane X its missing hits: |S n H_X| >= delta_X = hypNeed[X] - hits[X] (H_X = HIT[X]).
// So F n H_X must hold an independent set of size delta_X.  --dmis a b: at nodes of depth a..b, after the node's own independence
// test, a node failing this for some X with delta_X >= 2 is cut.  --dmisc: the same test in the child screen (pass 1) for a child u
// that passed its independence test: F_u n H_X needs an independent set of size delta_X - <u,X>.  Exact searches with node limit
// --dmislim (default 500; over the limit = no cut).  Every emitted profile satisfies both, so the profiles are those of prof7L53.
// prof7L53 = prof7L52 + the residual-2 rows are tested against each alive child's own set (ABOVE(u) minus its conflicts) when they are
// found, so a child's row list holds only the rows that give it a clique (same cliques, same tree).
// prof7L52 = prof7L51 + the residual-1 rows of misCheck read from the row masks (one cache line, prefetched) instead of their point lists.
// prof7L51 = prof7L50 + node-local coordinates for the MIS searches of misCheck: the points of the node's F renumbered 0..n-1 in vector
// order (pext), so the conflict rows, the child sets and the residual-2 row masks take ceil(n/64) words (1-2 at depths 16-17) instead
// of 8.  The colouring and branching orders are the same (vector order), so the node counts, cuts and the tree are the same.
// prof7L50 = prof7L49 + software prefetch of the kept-row masks and residuals in the residual-2 row loops (the new rows since the parent
// are random rows of the 239 MB mask table: about 320 cycles each without prefetch).  Same tree.
// prof7L49 = prof7L48 + survivor-restricted residual-2 lists: a node's row list (r2build, read by its children) keeps a row only if it has
// at least 3 points in F' = F minus the points at or below the first surviving child (every child's F lies in F'), and stores the
// row restricted to F' plus that first child (the children's "row through the new point" test reads that bit).  The children see the
// same rows and masks as before (same tree), the lists are shorter.
// prof7L48 = prof7L47 + --agedonate S: a job (or piece) running longer than S seconds donates child subtrees (depth < donate_depth)
// even when no thread is idle (queue capped at 2*threads), and a thread that finishes a job takes queued pieces before new list
// jobs.  Heavy jobs then spread over the threads as soon as they show up, not only once the job list runs out.  Same tree.
// --abortdone: a running job (and its pieces) that the skip file lists as done elsewhere is abandoned; it writes no state line
// (its coverage is the other run's).  --drainfile F: while F exists, no new list jobs start (running jobs and pieces finish).
// The skip file is re-read every --skipevery seconds by the monitor thread too.
// prof7L47 = prof7L46 building the node's residual-2 row list (6 MB of masks, used only by its children) only when some child
// survives the screen (17% of the nodes on a case (II) sub-job); the re-screen of the alive children takes the rows through them
// from a separate scan (masks of those rows only).  Same decisions.
// prof7L46 = prof7L45 with the plain screen run before the residual-2 row build, so that build also lists the rows through the
// children left alive (one pass over the rows instead of two); same decisions.
// prof7L45 = prof7L41 with a faster residual-2 child re-screen (same decisions).  prof7L44b timing on a case (II) pool sub-job: 70% of
// the CPU went to the residual-2 machinery (r2index 37%: a CSR of the ~10^5 residual-2 rows through every point of F, rebuilt at
// every node; r2build 20%; r2apply 14%), the MIS searches themselves under 1%.  Now the child screen runs in two passes: (1) the plain
// conflict-graph screen of every child; (2) only for the children it leaves alive (about one in ten), the rows through them are listed
// by one pass over the row masks (row & alive-set), and each is re-screened with the cliques of its rows as before.
// prof7L41 = prof7L39 + --skipfile F: a list of frontier job indices finished elsewhere (one per line; e.g. the union of every run's
// state file), re-read every --skipevery seconds (default 120).  A job in it is not started (and gets no state line here: its state
// line is in another run's file).  Jobs already started are not interrupted.  Search, cuts and profiles unchanged.
// prof7L39 = prof7L37 + (a) a frontier job whose prefix breaks a capacity of the current table (a stronger table than the one the
// frontier was cut with) is done with no profiles, not a fatal 'replay failed'; (b) per-job leaf/profile counts in the state lines
// (L37 wrote differences of global counters, inflated when jobs overlap).
// First-factor profile enumerator for <3,3,3> over F2 (full tensor), v3.
// prof7L = prof7g + an exact LP bound at nodes of depth --lp a b (lpcore.h, the lpc.cc LP).  A node whose bound is < r, or
// whose prefix breaks a kept21 cap, is cut; its certificate (N: duals and useful blockings, V: the broken row) goes to --cert.
// Search order and everything else are as in prof7g/prof7f; --reverse runs the frontier jobs in reverse order.
// Constraints: capacity m(E) <= r - lb(E) for every subspace E of A* (table), hyperplane hits, 64 split-flattening sums.
// Orderly generation under G = {c -> PcQ, Pc^TQ}: a sorted label multiset is kept iff it is lex-min in its G-orbit.
// v3: incremental exact canonicity test, blocked-label prefilter from saturated lattice nodes, work stealing.
// v3e (prof7e): high-dimensional lookahead.  For every subspace W of dim DMAX+1..8 (caps checked only at leaves in v3),
// a node is infeasible when m(W) > cap(W), or when the remaining need points cannot avoid overfilling W:
//   m(W) + max(0, need - (A - U(W))) > cap(W),  A = residual capacity of the unblocked labels >= pos, U(W) = its part in W.
// Both counts come from Walsh transforms of the chosen multiset C and of Q = C + residual capacity:
// v3f (prof7f): inherited lists.  Q only shrinks down the tree, so a W with |W cap Q| <= cap(W) can never fail below;
// each node keeps, per dim, the W (cap < its coverage limit) with |W cap Q| > cap(W) and its children scan only those plus
// the WLB range of caps newly reachable at their smaller slack.  A W with m(W) = cap(W) blocks its other labels below the
// node.  Children whose suffix of available units is below need are skipped (they cannot be completed).
//   |W cap Q| = (1/|W^perp|) sum_{X in W^perp} Qhat(X).  Scans of dim k run only when A - need < max_W(|W| - cap(W)).
// prof7L11: conflict-graph bound at nodes of depth --mis a b, before the LP (needs --lpinc).  F = labels above last(P), not in P and
// not in a kept row that P fills (the LP box).  Two points of F conflict when one kept row of residual capacity 1 (cap - |P n U| = 1)
// holds both, so the new points of any completion form an independent set of F; if F has none of size need, the node is cut and
// writes "M job P v1..vd free n bb nodes" (checked by ind/mischk, which recomputes F, the conflicts and the bound from scratch).
// prof7L15: --mispre L screens the children of a node that survives the conflict-graph bound with that node's own graph, before add().
// For a child u in F: the child's F is inside F_u = F n (labels > u) minus the points sharing a residual-1 row with u (those rows fill),
// and every edge of the node's graph inside F_u is still an edge for the child (a residual-1 row without u stays residual-1).  So when
// F_u has no independent set of size need-1 in the node's graph (exact search, node limit L), the child is cut with the ordinary line
// "M job P u free |F_u| bb nodes"; mischk recomputes the child's own F and graph, whose independence number is no larger.
// prof7L17: --under "p1;p2;..." (each p a comma-separated vec-value label prefix): frontier collection descends only into the
// listed prefixes, so --frontier D enumerates the depth-D nodes below them and their subtrees run as jobs on all threads (splits
// heavy frontier jobs).  Every other part of the search is unchanged; job indices refer to the restricted frontier.
// prof7L27: the LP uses the search label order, so --rord may be any rank order (certificates then need the same order in lpcheck/mischk).
// prof7L37: a child that the rank-1 window (--minr1/--maxr1) would cut as soon as it is visited is skipped before add(): its own
//   test uses the labels after it only (rank classes are contiguous in the label order), so r1, ra, rb of the child follow from the
//   node's available list.  ~9% of the visited nodes of fruitless case (II) jobs were such children.  Same cuts, fewer visits.
// prof7L35: --vskiplast (no --cert).  The V-skip also at the last two levels, where the child's own misCheck does not run: at
//   depth MISMAX the node's F cuts its children; at depth MISMAX+1 (the last label) F is the parent's F above the node's label
//   minus the points of the rows that label filled.  A child in a full kept row overfills it, so it has no completion.  In the
//   case (II) runs these levels were most of the work (s0: 56M adds at depth 20, 171M adds and 29M leaf checks at depth 21-22).
// prof7L30: --r2screen, incremental.  The --mispre child screen misses exactly the conflicts a child u gains from kept rows of
//   residual 2 through u (residual 1 once u is added); children cut by their own conflict-graph bound right after add() were
//   80-90% of the visited case (II) nodes.  Each screening node keeps its residual-2 rows with >= 3 points in F as masks (depth d is
//   derived from depth d-1: rows through the new point leave, masks shrink with F, rows that point brought from residual 3 to 2
//   join; the first screening node of a replay builds the list from lpcore12t's residual-2 stack and the untouched cap-2 rows).
//   A child that survives the plain screen is screened again with the cliques of those rows through it, which is its own graph.
//   M lines unchanged (mischk recomputes the child's own graph).  Search and profiles unchanged; fewer visited nodes.
// prof7L29: work stealing inside frontier jobs.  When the job list runs out, idle workers wait for donated subtrees; a busy job
//   donates a child subtree (depth < --donate_depth) whenever some worker is idle, so the heavy tail of a run spreads over all
//   threads.  A donated piece carries its job index (certificate lines name the job as before); the job's state line is written
//   when its root search and all of its pieces have finished (nodes summed over the pieces).  Search, cuts, profiles and
//   certificates are unchanged; only who runs which subtree changes.
// prof7L28v: --vskip cuts, before add(), a child whose point lies in a kept row the node already fills (not in the node's conflict-
//   graph set F).  Without it such a child is added, its kept-row counts updated, and its own misCheck cuts it at once with a V line
//   ("the prefix breaks a kept row"); those children were ~90% of all visited nodes in the case (II) runs.  The skip writes the same V
//   line (prefix P + v, a full row of P through v), only where the child's own misCheck would have run (depth in --mis), so the
//   search, the profiles and the certificate content are unchanged apart from the fewer visited nodes.
// prof7L28: --dumponly exits after --dumpfrontier is written (collection certificates flushed); --frontierfile F takes the job list
//   from such a dump instead of collecting (indices = dump line order), so collection can run in many processes and the jobs in one,
//   and the job list is fixed by the file on any machine.
// prof7L26: per-thread certificate buffers flushed at job end (see certPut).
// prof7L25: per-thread progress slots (doneT) for up to 1024 threads; prof7L24 had 128 and overran them with more threads.
// prof7L24: --doneprefixes FILE (comma-separated vec-value prefixes, one per line): frontier jobs equal to or below a listed
// prefix are skipped (their subtrees were finished, with certificates, by other runs).  Search unchanged.
// prof7L22: canonicity test reads the group images of the child label from a per-node entry-major copy of the GL rows
// (sequential instead of one random 1 KB row per entry per child); same decisions.
// prof7L21: incremental conflict graph: a node whose parent built its graph starts from it (see misCheck); identical graphs.
// prof7L20: --collectmis applies the conflict-graph bound (and its child screen) during frontier collection too, so --under
// splits produce only nodes that survive it; the cuts write their M lines as usual.  Search and jobs otherwise unchanged.
// prof7L19: lpcore12 keeps one residual byte per kept row (cap - count) and prefetches it; same search, cuts and certificates.
// prof7L18: the kept-row counts of the conflict-graph bound (lp->trkAdd/trkDel, ~2.6e5 rows per point) are updated only for
// nodes that are visited, not for every child tried by add(); the search, its cuts and its certificates are unchanged.
// prof7L17k: --kest K replaces each job's search by K Knuth dives with the full node checks and prints "kest" lines (estimates only).
// prof7L16: --preff applies a child's hyperplane and split tests (the first part of its feasibleFuture, or of leafCheck when it is the
// last point) before add(), from hits + the child's own hits; a child they fail is cut exactly as it would be after add(), so nothing
// else changes.  --nocntcanon counts the children for the progress weights without the canonicity test.  --hstat counts, without
// acting, how many nodes and children a hyperplane must-hit restriction of F would add to the conflict-graph cuts.  The periodic
// report gets per-depth counts "ST d:visited/adds/addfails/preff/ff/mis/pre".
#include "common.h"
#include "wcut2.h"
#include "rootcut.h"
#include "r3farkas.h"   // prof7R3: Farkas certificates for X kills
#include "g7/gen7.h"    // batch 13 (--leafv7): the v7 leaf-certificate generator, pinned copy; batch 14: native/leaf's gen7fast drop-in (md5 1b9fb801d5cd), the same certificates bit for bit as hcls's b4710df6633b (kept as g7/gen7_b13.h), 4-8x faster
#include "xpeel2.h"     // prof7R3x: kill2's bulk peel (xpeel.h) and its joint row-minimising generator (xpeel2.h)
#include <chrono>
#include <memory>
#include <thread>
#include <mutex>
#include <atomic>
#include <condition_variable>
#include <deque>
#include "../lp/lpcore12v.h"   // prof7L90: dense tracker
#include <array>
#include <sys/resource.h>
#include <unistd.h>
#include <x86intrin.h>
static std::atomic<unsigned long long> gIncl[32];
#include <immintrin.h>
#include <csignal>
#include <unordered_map>
#include <unordered_set>
#include <sys/mman.h>
// prof7L90: big read-mostly tables on 2 MB pages (random row loads miss the TLB on 4 KB pages) and 64-byte aligned row masks
// (a 64-byte row at a 16-byte offset spans two cache lines).  Memory placement only: results do not change.
static void hugeify(const void* p,size_t n){ const uintptr_t H=(uintptr_t)2<<20; uintptr_t a=((uintptr_t)p+H-1)&~(H-1), b=((uintptr_t)p+n)&~(H-1);
  if(b<=a) return; madvise((void*)a,b-a,MADV_HUGEPAGE); madvise((void*)a,b-a,25 /* MADV_COLLAPSE (Linux >= 6.1); fails harmlessly elsewhere */); }
template<class T> struct AAlloc { typedef T value_type; AAlloc() noexcept {} template<class U> AAlloc(const AAlloc<U>&) noexcept {}
  T* allocate(size_t n){ size_t b=n*sizeof(T); size_t al=b>=((size_t)4<<20)?((size_t)2<<20):64; void* p=nullptr; if(posix_memalign(&p,al,b?b:64)) throw std::bad_alloc();
    if(al>64) madvise(p,(b+al-1)&~(al-1),MADV_HUGEPAGE); return (T*)p; }
  void deallocate(T* p,size_t) noexcept { free(p); }
  template<class U> bool operator==(const AAlloc<U>&) const noexcept { return true; } template<class U> bool operator!=(const AAlloc<U>&) const noexcept { return false; } };
// prof7L84 = prof7L78 + a done-subtree journal, so a killed or preempted part loses only its unfinished subtrees (2026-10-05):
//   --journal F --jdepth D --jmin N [--jsync S]: at every node of depth >= D, consecutive children explored by this thread whose
//   subtrees finished without donating any piece (so this thread explored all of them) and whose job was not abandoned through
//   --abortdone are accumulated into a run; once the run holds N nodes it is recorded as "R ix n l p d v1..vd lo hi" (node prefix
//   v1..vd, children labels lo..hi; children cut before add() inside the run count 0); a donated child or one with donations ends
//   the run unrecorded.  A donated piece whose dfs returned without donating is recorded as "P ix n l p d v1..vd".  Records, and with --journal also the state lines, are
//   written by a committer every S s (default 10) only after an fdatasync of the profile file, so a record or state line on disk
//   never refers to a profile that is not on disk.  F starts with "# prof7L84 journal fp=<fingerprint> out=<profile file> ...".
//   --skipjournal F1,F2,... (or @LISTFILE, one path per line): records of earlier runs with the same fingerprint (binary, search options, frontier hash; files with
//   another fingerprint are ignored, --jforce uses them) are skipped (a P node on entry, the children of an R run in the child
//   loop) and their nodes, leaves and profiles added to the job's counters, so a resumed job's state line equals the
//   uninterrupted run's.  The skipped subtrees' profiles are in the earlier runs' profile files.
//   SIGTERM (the VM shutdown script): profile output stops at a line boundary, pending records and state lines are committed,
//   exit 143.  Without --journal the search is unchanged from prof7L78.
static int R=21, DMAX=4, THREADS=8, DONATE_DEPTH=14; static bool USE_SPLIT=true; static long long MAXPROF=LLONG_MAX; static bool SYM=true;
static LBTable TAB;
static int N; static int vecOf[511]; static int labOf[512]; static int rk[511]; static int classStart[511];
static bool LEAFV7=false;   // batch 13: --leafv7
static std::atomic<long long> gLv7N{0}, gLv7None{0}, gLv7Fit{0}, gLv7Big1{0}, gLv7Big2{0}, gLv7Fail{0}, gLv7Bits{0}, gLv7Us{0}, gLv7MaxUs{0};
static void pcVarS(std::string& B,unsigned long long x);
static void leafV7(const std::vector<int>& seqL,std::string& B){   // batch 13: R of BC7s.leafS for the accepted leaf seqL (labels, increasing)
  const auto t0=std::chrono::steady_clock::now();
  static const std::vector<int> DOM=[]{ std::vector<int> d; for(int X=1;X<512;X++) d.push_back(X); return d; }();
  const g7::Tables& Tb=g7::T();
  std::vector<int> terms; terms.reserve(seqL.size()); for(int l:seqL) terms.push_back(vecOf[l]);
  g7::BW w; const int n=(int)terms.size(); w.put((unsigned long long)n,6); for(int v:terms) w.put((unsigned long long)v,9); w.put(0,1); w.put(1,1);   // dm = 0: ALLNZ; lg = 1
  int rs=0; for(int v:terms) rs+=Tb.RKV[v];
  bool done=false;
  static const long long MX[3]={300000LL,2000000LL,20000000LL};
  for(int pass=0;pass<3 && !done;pass++){ bool big=false;
    for(int att=0;att<2 && !done && !big;att++){
      g7::Leaf L(terms,DOM,true); L.fit=(att==1);
      if(!L.lg){ if(rs>=27){ fprintf(stderr,"R3 FATAL: leafv7: gen7 says Delta < 0 at rank sum %d\n",rs); exit(9); } gLv7None++; done=true; break; }
      if(rs<27){ fprintf(stderr,"R3 FATAL: leafv7: rank sum %d < 27 but gen7 sets lg\n",rs); exit(9); }
      try{ g7::Cert* c=L.finalize(L.gen(4,MX[pass],6)); g7::BW cw; g7::enc_cert(cw,c);
        for(size_t i=0;i<cw.n;i+=64){ const int k=(int)std::min<size_t>(64,cw.n-i); w.put(cw.w[i/64]&(k==64?~0ULL:((1ULL<<k)-1)),k); }
        gLv7Fit+=att; done=true; }
      catch(g7::Big&){ big=true; if(pass==0) gLv7Big1++; else if(pass==1) gLv7Big2++; }
      catch(g7::Sat&){ std::string t; for(int v:terms) t+=" "+std::to_string(v); fprintf(stderr,"R3 FATAL: leafv7: gen7 found a decomposition (SAT) for the leaf with codes%s\n",t.c_str()); exit(9); }
      catch(std::runtime_error& e){ if(att==0 && std::strstr(e.what(),"overflow")) continue; std::string t; for(int v:terms) t+=" "+std::to_string(v); fprintf(stderr,"R3 FATAL: leafv7: %s (codes%s)\n",e.what(),t.c_str()); exit(9); } } }
  if(!done){ gLv7Fail++; std::string t; for(int v:terms) t+=" "+std::to_string(v); fprintf(stderr,"R3 leafv7: no certificate within 2e7 gen7 calls for the leaf with codes%s (written without one: the check fails)\n",t.c_str()); }
  gLv7N++; gLv7Bits+=(long long)w.n;
  pcVarS(B,(unsigned long long)w.n); const size_t nb=(w.n+7)/8; for(size_t i=0;i<nb;i++) B.push_back((char)((w.w[i/8]>>(8*(i%8)))&255));
  const long long us=std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::steady_clock::now()-t0).count(); gLv7Us+=us;
  long long m=gLv7MaxUs.load(); while(us>m && !gLv7MaxUs.compare_exchange_weak(m,us)){} }
static std::vector<std::array<u16,511>> GL; static int GID=-1;
// prof7L90: every group element is linear on the 9-bit vectors, so g(v) = t0[v&7] ^ t1[(v>>3)&7] ^ t2[v>>6]: one 64-byte line per element
// instead of a 1 KB row of GL.  imgL(g,l) == GL[g][l] is checked for every g and l at startup (LTOK); GL is used otherwise.
struct alignas(64) LinT { u16 t[3][8]; u16 pad[8]; };
static std::vector<LinT,AAlloc<LinT>> LT; static bool LTOK=false; static uint8_t vch[512][3];
static int classMin[511]; static std::vector<std::vector<int>> toMin;
struct SplitC { int need; std::array<u8,511> w; };
static std::vector<SplitC> SPL;
static int hypNeed[512];
static std::vector<std::array<u16,512>> sufHits;
static std::vector<std::vector<u8>> sufSplitMax;
static int pointCap[511]; static int allowMult[511];
struct WList { u16 n; u16 el[16]; int8_t cap; };
static std::vector<WList> WL;
static std::vector<std::array<u16,8>> WLrows; static std::vector<int8_t> WLk;   // prof7L78: basis rows of each leaf W-list's subspace U
static std::vector<uint8_t> KWL; static std::vector<WList> WLR; static bool LEAFFAST=true, LEAFON=false, R2CAND=true, CBTON=true;   // prof7L78 (a), (b)
static std::mutex outmu; static FILE* OUT=nullptr;
static const char* JOURNALF=nullptr; static int JDEPTH=17; static long long JMIN=1000; static double JSYNC=10.0; static bool JFORCE=false;   // prof7L84
static bool JCOMPAT84=false; static const char* CERTPATH=nullptr; static std::vector<std::string> gJcert; static std::set<unsigned long long> gJCompat;   // prof7R2
static unsigned long long gFP84=0; static std::atomic<long long> gJx{0}; static long long gJ84files=0;   // prof7L87 --jcompat84
static std::vector<std::string> SKIPJ; static unsigned long long gFrontHash=0, gFP=0; struct JE { long long n,l,p; int src=-1; long long seg=-1; };   // prof7R3: seg = pcert segment of the piece
static std::unordered_map<std::string,JE> gJmap; static unsigned long long gJdmask=0;
struct JR { int lo,hi; long long n,l,p; int src=-1; long long seg=-1, pb=-1, pe=-1; }; static std::unordered_map<std::string,std::vector<JR>> gJrng; static unsigned long long gJrmask=0;   // R runs by node (prof7R3: pcert segment and byte range)
static std::mutex gJmu; static std::vector<std::string> gJpend, gSpend; static FILE* gJF=nullptr; static FILE* gJSF=nullptr;
static std::atomic<long long> gJrec{0}, gJskip{0}, gJskipN{0}, gJsyncs{0}; static volatile std::sig_atomic_t gTermSig=0;
static void onTerm(int){ gTermSig=1; }
static inline std::string jkey(int ix,const int* v,int d){ std::string k; k.resize(4+2*(size_t)d); memcpy(&k[0],&ix,4); for(int i=0;i<d;i++){ uint16_t x=(uint16_t)v[i]; memcpy(&k[4+2*i],&x,2); } return k; }
static void jwrite(std::vector<std::string>& J,std::vector<std::string>& S,FILE* SFplain){   // caller has made the profiles durable
  if(gJF && !J.empty()){ for(auto& x:J) fputs(x.c_str(),gJF); fflush(gJF); fdatasync(fileno(gJF)); gJrec+=J.size(); }
  if(gJSF && !S.empty()){ for(auto& x:S) fputs(x.c_str(),gJSF); fflush(gJSF); fdatasync(fileno(gJSF)); }
  if(SFplain) fflush(SFplain); }
static void certSyncR2(); static void pcSync();
static void jcommit(){   // prof7L84: swap out the pending records, fdatasync the profiles they refer to, then write them
  std::vector<std::string> J,S; { std::lock_guard<std::mutex> lk(gJmu); J.swap(gJpend); S.swap(gSpend); }
  if(J.empty() && S.empty()) return;
  if(OUT){ { std::lock_guard<std::mutex> lk(outmu); fflush(OUT); } fdatasync(fileno(OUT)); }
  certSyncR2(); pcSync();   // prof7R2: the certificate lines of the records are on disk before the records (prof7R3: and the pcert bytes)
  jwrite(J,S,nullptr); gJsyncs++; } static std::atomic<long long> nprof{0}, nleaf{0}, totv{0}, donated{0};
static int DUMPD=-1; static FILE* DUMPNF=nullptr; static std::mutex dumpmu;
static int CRITER=24; static bool CRLAZY=false, CRPAIR=false; static int CRK=8, CRKMIN=3; static bool CRBITS=false; static std::atomic<long long> gCRbig{0}; static std::atomic<long long> gCRa{0};   // prof7L66: lazy row restarts, activated rows
static int R2PF=8;   // prof7L73: prefetch distance in r2apply4C (--r2pf)
static int CRMIN=99, CRMAX=-1; static long long CRLIM=2000; static std::atomic<long long> gCRt{0}, gCRk{0}, gCRl{0}, gCRb{0}, gCRbc{0}, gCRtc{0};   // prof7L65
static int DMIN=99, DMAX2=-1; static bool DMISC=false, DMIS2=false, DP1=false, DP2=false; static long long DLIM=500; static std::atomic<long long> gDn{0}, gDc{0}, gDk{0}, gDu{0};   // prof7L61
static size_t PFD=16;   // prof7L50: prefetch distance (rows)
static double AGEDON=0; static int AGEDEPTH=-1; static std::atomic<int> qsizeA{0};   // prof7L48
static bool ABORTDONE=false; static const char* DRAINF=nullptr; static std::atomic<char>* gSkipP=nullptr; static std::atomic<char>* gJab=nullptr;
static std::mutex qmu; static std::condition_variable qcv; struct Job { std::vector<int> seq; double w; int ix=-1; std::array<uint64_t,8> dinh{}; std::vector<int32_t> win; }; static std::deque<Job> Q; static double doneT[1024*8]; static std::atomic<int> idleN{0};   // prof7R3: Job.dinh = the donor's dead mask (vector bits)
static const u16 STAB=0xFFFF; static long long ESTIMATE=0; static long long KEST=0; static bool COLLECTMIS=false, INCMIS=true; static size_t CBMIN=32; static const char* DONEPF=nullptr;
static int MINR1=0, MAXR1=-1; static std::atomic<long long> gR1cut{0}; static bool DUMPONLY=false; static const char* FRONTF=nullptr; static const char* DUMPF=nullptr; static std::vector<std::vector<int>> JOBPRE; static std::vector<std::vector<int>> UNDER; static int FRONTIER_D=-1; static bool collecting=false; static std::vector<std::vector<int>> frontier; static const char* STATEPATH=nullptr; static const char* SKIPF=nullptr; static int SKIPEVERY=120;
static std::unordered_map<u128,int,KeyHash> BUMP; static bool MULT1=false, LINEBUMP=false; static int SAMPLE_D=-1; static double SAMPLE_P=1.0; static unsigned long long SAMPLE_SEED=1;
struct WB { u16 b[4]; int8_t cap; u8 m; };
static std::vector<WB> WLB[10]; static int WTHR[10]; static std::vector<int> CAPST[10]; static int RORD=321; static bool WLOOK=true, VERB=false; static std::vector<int> JOBS;
static std::atomic<long long> wScan[10], wKill[10], wNodes{0};
// prof7L: exact LP bound (lpcore.h) at nodes of depth LPMIN..LPMAX; a pruned node gets a certificate line in CERTF
static int LPMIN=-1, LPMAX=-1; static FILE* CERTF=nullptr; static std::mutex certmu; static std::vector<int32_t> LPINIT; static bool REVERSE=false;
// prof7L26: certificate lines gather in a per-thread buffer, written with one fwrite + fflush under certmu at the end of every job
// (before its state line), when 1 MB has gathered, and at thread exit; the per-line fflush under the lock stalled most of 280 threads.
struct CertBuf { std::string b; ~CertBuf(){ if(!b.empty() && CERTF){ std::lock_guard<std::mutex> lk(certmu); fwrite(b.data(),1,b.size(),CERTF); fflush(CERTF); } } };
static thread_local CertBuf tlCert;
static void certFlush(){ if(tlCert.b.empty() || !CERTF) return; std::lock_guard<std::mutex> lk(certmu); fwrite(tlCert.b.data(),1,tlCert.b.size(),CERTF); fflush(CERTF); tlCert.b.clear(); }
static inline void certPut(const std::string& x){ tlCert.b+=x; if(tlCert.b.size()>(1u<<20)) certFlush(); }
static void certSyncR2(){ if(!CERTF) return; { std::lock_guard<std::mutex> lk(certmu); fflush(CERTF); } fdatasync(fileno(CERTF)); }   // prof7R2
// ===== prof7R3: packed per-job certificate stream (--pcert FILE); format in the header comment =====
static FILE* PCF=nullptr; static const char* PCPATH=nullptr; static std::mutex pcmu; static std::atomic<unsigned long long> gPcSeg{1};
static std::vector<std::string> gJpc;   // per --skipjournal file (index = src k): the pcert file it names ("-" if none)
static std::atomic<long long> gPcBytes{0}, gPcBlocks{0}, gPcN[64], gPcErr{0}, gPcBlk{0}, gPcTC[4];   // bytes, blocks, records by tag, internal check failures, BLK labels, T/C/X counts
static inline uint32_t pcCrc(const void* p,size_t n){ uint64_t c=0xFFFFFFFFu; const uint8_t* b=(const uint8_t*)p; size_t i=0;
  for(;i+8<=n;i+=8){ uint64_t x; memcpy(&x,b+i,8); c=_mm_crc32_u64(c,x); } for(;i<n;i++) c=_mm_crc32_u8((uint32_t)c,b[i]); return (uint32_t)c^0xFFFFFFFFu; }
struct PcSeg { unsigned long long id=0; long long flushed=0; uint32_t chunk=0; bool open=false; std::string hdr, buf; };
static thread_local PcSeg tlPc;
static inline void pcU8(std::string& s,unsigned x){ s.push_back((char)(uint8_t)x); }
static inline void pcU16(std::string& s,unsigned x){ s.push_back((char)(uint8_t)x); s.push_back((char)(uint8_t)(x>>8)); }
static inline void pcVar(std::string& s,unsigned long long x){ while(x>=128){ s.push_back((char)(uint8_t)(x|128)); x>>=7; } s.push_back((char)(uint8_t)x); }
static void pcChunk(bool last){   // write the open segment's buffer as one block; last = the segment is complete
  PcSeg& S=tlPc; if(!PCF || !S.open) return; if(S.buf.empty() && !last && S.chunk>0) return;
  std::string p; p.reserve(16+S.hdr.size()+S.buf.size()); const uint8_t fl=(S.chunk==0?1:0)|(last?2:0);
  p.append((const char*)&S.id,8); p.append((const char*)&S.chunk,4); p.push_back((char)fl); if(S.chunk==0) p+=S.hdr; p+=S.buf;
  const uint32_t h[3]={0x31423352u,(uint32_t)p.size(),pcCrc(p.data(),p.size())};
  { std::lock_guard<std::mutex> lk(pcmu); fwrite(h,4,3,PCF); fwrite(p.data(),1,p.size(),PCF); fflush(PCF); }
  gPcBytes+=12+(long long)p.size(); gPcBlocks++; S.flushed+=(long long)S.buf.size(); S.buf.clear(); S.chunk++; if(last) S.open=false; }
static inline long long pcOff(){ return tlPc.flushed+(long long)tlPc.buf.size(); }
static inline void pcMaybe(){ if(tlPc.buf.size()>(1u<<20)) pcChunk(false); }
static void pcSync(){ if(!PCF) return; { std::lock_guard<std::mutex> lk(pcmu); fflush(PCF); } fdatasync(fileno(PCF)); }
static int labOfG[512];   // prof7R3: label of each vector (copy of labOf, for the static helpers below)
static bool PCWIT=false;   // --pcwit (batch 12, native track): witness rows of D in every segment header (header #pcwit 1)
static void pcOpen(int job,int kind,const std::vector<int>& seqLab,const uint64_t* dinhVec,const std::vector<int32_t>* win=nullptr){   // dinhVec: inherited dead mask indexed by vector
  PcSeg& S=tlPc; if(!PCF) return; if(S.open){ fprintf(stderr,"R3: segment still open\n"); exit(8); }
  S.id=gPcSeg++; S.flushed=0; S.chunk=0; S.open=true; S.buf.clear(); S.hdr.clear();
  pcVar(S.hdr,(unsigned long long)job); pcU8(S.hdr,(unsigned)kind); pcU8(S.hdr,(unsigned)seqLab.size()); for(int l:seqLab) pcU16(S.hdr,(unsigned)l);
  uint64_t lm[8]={0}; if(dinhVec) for(int v=1;v<512;v++) if((dinhVec[v>>6]>>(v&63))&1){ int l=labOfG[v]; if(l>=0) lm[l>>6]|=1ULL<<(l&63); }
  S.hdr.append((const char*)lm,64);
  if(PCWIT){ const size_t n=win?win->size():0; pcVar(S.hdr,(unsigned long long)n); int32_t pr=0; if(win) for(int32_t r:*win){ pcVar(S.hdr,(unsigned long long)(r-pr)); pr=r; } } }   // batch 12
static std::vector<std::array<uint64_t,8>> CONF2T;   // prof7R3: CONF2T[p*512+u] = union of the cap-2 kept rows through p and u, minus u (vector bits)
static std::vector<int32_t> CAP1ROWS;   // prof7R3: the cap-1 kept rows (residual 1 while untouched)
static std::vector<std::array<uint64_t,8>,AAlloc<std::array<uint64_t,8>>> CAP1M;   // their masks, contiguous
static std::atomic<long long> gPcAtt[17], gPcSuc[17], gPcTnc{0}, gXn[7][8], gXb[7][8];   // gXn/gXb: X kills and their search nodes by kind and bb bucket   // gPcTnc: T kills whose search kill was not a count kill   // cover attempts / successes by the killing search's node count
static long long PCXBB=2;   // prof7R3 --pcxbb B: the cover search (L1 type C) is tried for killed children whose search took <= B nodes
static std::atomic<long long> gFkR2{0}, gFkR2n{0}; static std::atomic<unsigned long long> gFkBuild{0}; static std::mutex fkmu; static fkx::Stats gFkSt;   // residual-2 rows per Farkas node; generator statistics
static long long PCFK=0, PCFKS=1, PCFKL=150, PCFKC=60; static bool PCFKLB=false; static std::atomic<long long> gFkA[6][8], gFkS[6][8], gFkC[6][8], gFkB[6][8], gFkN[6][8];   // prof7R3 --pcfk B [--pcfksamp K]: Farkas attempts for X kills with >= B search nodes (1 in K); stats by kind and bb bucket: attempts, certificates, cycles, bytes, constraints   // prof7R3 --pcfkl N: lazy rows per round, --pcfkc N: cliques per round, --pcfklb: deficits enter when violated
static long long PCFKLO[8]={0,0,0,0,0,0,0,0}, PCFKHI[8]={-1,-1,-1,-1,-1,-1,-1,-1}; static bool PCFKP=false; static bool PCFK6=false; static long long PCFK6SUP=31; static std::atomic<long long> gFkU[6][8], gFkDh[8];   // --pcfk6sup N: supply bound per point (0: none); gFkDh: integerization scale D of accepted certificates (1,2,3-4,5-8,9-16,17-64,65+)   // prof7R3 --pcfk6: Farkas certificates in check6 form (DESIGN 27: no cliques, minimal units, <= 31 supply per point; X choice 3); units by kind and bucket   // prof7R3 --pcfkpol k:lo:hi,...: Farkas for kind k with lo <= bb <= hi (overrides --pcfk)
static int TLMIN=99, TLMAX=-1; static long long TLLIM=16000; static std::atomic<long long> gTLt[24], gTLk[24], gTLl[24], gTLx[24], gTLr2[24], gTLr3[24], gTLn[24], gTLcb[24], gTLcs[24], gTLid[24], gTLc1[24], gTLc2[24];   // prof7L89 --tl2 D1 D2 [--tllim N] (in the fingerprint here: its cuts change the certificate)
static bool XPVAR=false;   // --xpvar (batch 11, native track): bulk-peel blobs as LEB128 varint item lists (header #xpvar 1)
// batch 11: kill2's certificate items are [u64 length][LE bytes] per natural number; with --xpvar a blob is written as the same items,
// each as an LEB128 varint (7 bits per byte, low first; 0 is one byte 0).  The blob keeps its varint length prefix in the record.
static void xpItemsVar(const uint8_t* p,size_t n,std::string& out){ size_t i=0;
  while(i<n){ if(i+8>n){ fprintf(stderr,"R3: truncated bulk-peel item\n"); exit(9); } uint64_t L; memcpy(&L,p+i,8); i+=8; if(L>n-i){ fprintf(stderr,"R3: bad bulk-peel item length\n"); exit(9); }
    const uint8_t* v=p+i; i+=(size_t)L; size_t m=(size_t)L; while(m>0 && v[m-1]==0) m--;
    if(m==0){ out.push_back(0); continue; }
    const size_t nb=m*8-(size_t)(__builtin_clz((unsigned)v[m-1])-24);
    for(size_t b=0;b<nb;b+=7){ unsigned x=0; for(int k=0;k<7 && b+k<nb;k++){ const size_t bit=b+k; x|=(unsigned)((v[bit>>3]>>(bit&7))&1)<<k; } if(b+7<nb) x|=128; out.push_back((char)x); } } }
static void pcVarS(std::string& B,unsigned long long x){ while(x>=128){ B.push_back((char)(0x80|(x&127))); x>>=7; } B.push_back((char)x); }
static void xpBlob(std::string& B,const uint8_t* p,size_t n){ if(!XPVAR){ pcVarS(B,n); B.append((const char*)p,n); return; } std::string t; xpItemsVar(p,n,t); pcVarS(B,t.size()); B+=t; }
static xpeel::Static* XPS=nullptr; static std::vector<uint8_t> XPLAB; static int XPKINDS=0x3C; static long long XPMINBB=2, XPLIM=4000;   // --pcxp C2T LAB [--xpkinds M (default kinds 2-5) --xpminbb B --xplim N]: kill2's bulk-peel certificates (X choice 5, node record 0x2B)
static bool XP2=false; static xp2::Params2 XP2P; static int XP2AGG=-1, XP2CUT=-1, XP2PSTEPS=-1, XP2PRUNE=-1, XP2EXPRUNE=-1; static long long XP2VERIFY=-1;   // batch 14: --xp2verify N (0 off, 1 every certificate, N > 1 the certificates of one node context in N, chosen by a hash of the node prefix)   // --xp2agg N (batch 5): xp2's certificate format by flag (0: 27.11, 2: hybrid); wins over the environment's P2_AGG   // --xp2: joint generation (xpeel2) of the node's bulk-peel kills
static std::atomic<long long> gX2A[6][8], gX2S[6][8], gX2P[6][8][7], gX2Ctx{0}, gX2CtxN{0}, gX2Rows1{0}, gX2Rows2{0}, gX2Ext{0}, gX2Dict{0}, gX2NodeR{0}, gX2B{0}, gX2Est[6][8], gX2Gath{0}, gX2CtxK5{0}, gX2CtxK4{0}, gX2GC[3], gX2GN[3], gX2GR[3];   // attempts, certificates, phase us x10 (gen setup tree cover excl prune emit), node contexts
static std::atomic<long long> gXpA[6][8], gXpS[6][8], gXpB[6][8], gXpC[6][8], gXpNodes{0}, gXpNodeB{0}, gXpNodeC{0}, gXpRows{0}, gXpCut[2], gXpCutC{0};   // gXpCut: node cuts 5/6 certified / not
static bool PCVCUT=false, PCLEAFX=false, PCNOREP=false; static bool PCTOP=false, PCTOPRUN=false; static int PCTOPF=0; static const char* PCTOPFILE=nullptr;   // --pctop F PFILE (batch 8, QUEUE.md §8): one kind-4 segment per prefix of PFILE, its subtree in collection mode down to depth F, a JOB record (0x2D) at each depth-F node   // --pcnorep (batch 4): no replayed kill: an X kill without a certificate is expanded (choice 2), a node cut 5 / 6 whose bulk-peel certificate fails is not taken (the node is searched)
static std::atomic<long long> gNrX[8], gNrCut[2], gNrCutN{0};   // --pcnorep: X kills expanded for lack of a certificate (by kind); node cuts 5 / 6 not taken; nodes searched instead   // --pcleafx: leaf codes 5 / 6 / 7 carry the overfull kept row / the violated W-list (header #leafx 1)   // --pcvcut: VROWS before the CUT record of node cuts 3-7 and 9 (kinds stream, REQUESTS.md 5)
static long long PCEXP=0, PCEXP5=0;   // --pcexp5 B: expand every crow kill (kind 5) with > B search nodes (kill2's rule: B = 79)
 static std::atomic<long long> gExpK{0}, gExpN{0}, gExpBad{0};   // prof7R3 --pcexp B: an X kill with > B search nodes and no Farkas certificate is expanded (the child explored, outside the search's counts); expanded kills, their nodes, accepted leaves inside them (must stay 0)
static bool PCCHK=false; static std::atomic<unsigned long long> gPcCyc[8];   // prof7R3: cycles in pcEnter, classify (row scans), classify (kills), pcOpenNode   // prof7R3 --pcchk: recompute F0 from scratch at every node and compare (debug)
static std::vector<int> GL3V;   // the invertible 3x3 matrices in build_group's order
static const char* LPKEPT="/dev/shm/indl/kept21.txt"; static const char* KEPT21_BUMPS="1,10:19;1,84:19;1,160:19;1,20:19;1,20,160:18;1,20,224:18;1,20,264:18;1,2,8,20,68,160:15;10,19:20;10,20:20;10,68:20;10,84:20;10,258:20;10,275:20;84,163:20";
static std::atomic<long long> gLPc[64], gLPp[64], gLPv[64], gLPus{0};
static std::atomic<long long> gRBn{0}, gRBns{0}, gBLDns{0};   // pool rebuilds: count, thread CPU ns; first builds: thread CPU ns
// --lpscreen: a child of a node the LP kept is first bounded with the node's own duals (box_bound of the child's box); pruned children get
// ordinary N/V certificates (the parent's lam, mu; the parent's blockings above the child's label), so lpcheck needs no change
// --lpsib: the duals of the latest LP-pruned sibling screen the later siblings the same way (with the parent's blockings)
// --lpsfx: at a node the LP kept, binary search over its unscreened children for the first label t whose suffix LP (P fixed, every
// label below t zeroed) bounds below 21; the children at labels >= t then get N certificates from those duals, as in screening
static bool SCREEN=false, SIB=false, SFX=false; static int SFXMIN=0; static double OBJBD=1e-6; static std::atomic<long long> gSCt[64], gSCp[64], gSCv[64], gSCs[64];
static std::atomic<long long> gSFc{0}, gSFp{0}, gSFk{0}, gSFn{0};   // suffix LPs solved, of them pruning; children pruned by them; kept nodes searched
typedef std::array<uint64_t,8> BS;
#if defined(__AVX512F__) && defined(__AVX512VPOPCNTDQ__)
#define L90V 1   // prof7L90: AVX-512 row kernels (Zen 4 and Zen 5; no VP2INTERSECT)
static inline int pc512(__m512i x){ return (int)_mm512_reduce_add_epi64(_mm512_popcnt_epi64(x)); }
static inline bool ge3v(__m512i x){ const __m512i p=_mm512_popcnt_epi64(x);   // >= 3 bits set, without the horizontal sum: a word with >= 3, or (words >= 1) + (words >= 2) >= 3
  if(_mm512_cmpge_epu64_mask(p,_mm512_set1_epi64(3))) return true; return __builtin_popcount(_mm512_test_epi64_mask(p,p))+__builtin_popcount(_mm512_cmpge_epu64_mask(p,_mm512_set1_epi64(2)))>=3; }
static inline bool ge2v(__m512i x){ __mmask8 nz=_mm512_test_epi64_mask(x,x); __m512i y=_mm512_and_si512(x,_mm512_add_epi64(x,_mm512_set1_epi64(-1))); return _mm512_test_epi64_mask(y,y) || (nz&(nz-1)); }   // >= 2 bits set
#endif
static bool PREFF=false, CNTCANON=true, HSTAT=false; static BS HIT[512];   // HIT[X]: the points v with <v,X> = 1
static std::atomic<long long> gHn{0}, gHc{0}, gHu{0}, gHk{0};   // --hstat: nodes with a must-hit hyperplane, of them cut by the restricted F; children screened, cut
static std::atomic<long long> gDoom{0};   // prof7L37
static int TYPECUT=0; static std::atomic<long long> gTypeCut{0};   // prof7L79
static bool typeOK(int n1,int n2,int n3){ int D=n1+2*n2+3*n3-27; if(n1+n2+n3!=22) return true;
  if(TYPECUT&1){ if(D<0) return false; if(D==0 && n3>=1) return false; }
  if(TYPECUT&2){ if(n3>=3 && D<=1) return false; }
  if(TYPECUT&4){ if(D<1) return false; }
  if(TYPECUT&8){ if(n3>=2 && n2>=2 && D<=1) return false; }
  if(TYPECUT&16){ if(n3>=1 && n2>=4 && D<=1) return false; }
  if(TYPECUT&32){ if(D<2) return false; }                                   // prof7R3 (from prof7L82t): Delta >= 2 (r22/thm4/THM_TYPES.md)
  if(TYPECUT&64){ if((n2==3 && n3==2) || (n2==1 && n3==3)) return false; }   // (17,3,2), (18,1,3) (r = 22)
  if(TYPECUT&128){ if(n2==5 && n3==1) return false; }                         // (16,5,1)
  if(TYPECUT&256){ if(n2==2 && n3==3) return false; }                         // (17,2,3)
  if(TYPECUT&512){ if(n2==4 && n3==2) return false; }                         // (16,4,2): NOT proven (2026-10-06); never use bit 512
  if(TYPECUT&1024){ if(n2==0 && n3==4) return false; }                        // (18,0,4)
  return true; }
static bool typeReach(int r1,int r2,int r3,int nd,int m){ for(int y=0;y<=nd;y++) for(int x=0;x+y<=nd;x++){ int z=nd-y-x;
    if(m>=2 && y>0) continue; if(m>=3 && x>0) continue; if(typeOK(r1+y,r2+x,r3+z)) return true; } return false; }
static bool VSKIPLAST=false; static std::atomic<long long> gVskL{0}, gOverL{0}, gVskLNoRow{0};   // prof7L35; prof7R2: last-level skips without a full row (certificate mode)
static bool R2SCR=false; static std::vector<int32_t> ST2ROW; static std::vector<BS,AAlloc<BS>> RMASK; static std::vector<BS,AAlloc<BS>> ST2M;   // prof7L90: ST2M[i] = RMASK[ST2ROW[i]], contiguous   // RMASK[r]: the points of kept row r (512-bit)
static int R2DUMMY=0; static std::atomic<long long> gR2full{0}, gR2inc{0}, gR2rows{0}, gR2try{0}, gR2cut{0};   // prof7L30
static std::atomic<int>* gOutst=nullptr;   // prof7L29: outstanding donated pieces per frontier job (frontier mode)
static bool VSKIP=false; static std::atomic<long long> gVsk{0}, gVskNoRow{0};   // prof7L28v
static bool WBLOCK=false; static int WBMIN=9; static std::atomic<long long> gWbN{0}, gWbL{0}, gWbC{0};   // prof7L86
static int FLOOK=99; static bool RLOOK=false, FDEF=false; static std::atomic<long long> gFlN[24], gFlC[24], gRlX[24];   // prof7L86 --flook D: Lemma-R look-ahead from depth D with the candidate set
static int MISMIN=99, MISMAX=-1; static long long MISLIM=20000, MISPRE=0; static std::atomic<long long> gPc{0}, gPp{0}, gPl{0}; static std::vector<BS> CONF0; static BS ABOVE[512];   // CONF0[u]: points sharing a cap-1 row with u; ABOVE[l]: labels >= l
static std::atomic<long long> gMc[64], gMp[64], gMl[64], gMv[64], gMus{0};   // conflict-graph bound: calls, cuts, node-limit stops, broken-row cuts, wall time
static inline bool bnz(const BS& b){ for(auto w:b) if(w) return true; return false; }
static inline int bcnt(const BS& b){ int c=0; for(auto w:b) c+=__builtin_popcountll(w); return c; }
static void lpStats(FILE* o){ if(LPMIN<0) return; long long c=0; for(int d=LPMIN;d<=LPMAX&&d<64;d++){ c+=gLPc[d]; fprintf(o," | LP%d %lld/%lld/%lld",d,(long long)gLPp[d],(long long)gLPv[d],(long long)gLPc[d]); }
  if(SCREEN){ long long t=0,p=0,v=0,q=0; for(int d=0;d<64;d++){ t+=gSCt[d]; p+=gSCp[d]; v+=gSCv[d]; q+=gSCs[d]; } fprintf(o," | SCR %lld/%lld/%lld sib %lld",p,v,t,q);
    for(int d=0;d<64;d++) if(gSCt[d]) fprintf(o," s%d %lld/%lld/%lld/%lld",d,(long long)gSCp[d],(long long)gSCs[d],(long long)gSCv[d],(long long)gSCt[d]); }
  if(SFX) fprintf(o," | SFX nodes %lld lp %lld/%lld kids %lld",(long long)gSFn,(long long)gSFp,(long long)gSFc,(long long)gSFk);
  if(MISMIN<=MISMAX){ long long mc=0,mp=0,ml=0,mv=0; for(int d=0;d<64;d++){ mc+=gMc[d]; mp+=gMp[d]; ml+=gMl[d]; mv+=gMv[d]; } fprintf(o," | MIS %lld/%lld/%lld V %lld ms %.2f",mp,ml,mc,mv,mc?gMus/1000.0/mc:0.0);
    for(int d=0;d<64;d++) if(gMc[d]) fprintf(o," m%d %lld/%lld",d,(long long)gMp[d],(long long)gMc[d]);
    if(MISPRE>0) fprintf(o," | PRE cut %lld screened %lld limit %lld",(long long)gPp,(long long)gPc,(long long)gPl);
    if(VSKIP) fprintf(o," | VSKIP %lld norow %lld",(long long)gVsk,(long long)gVskNoRow);
    if(DMAX2>=0) fprintf(o," | DMIS nodes %lld cut %lld kids %lld cut %lld",(long long)gDn,(long long)gDc,(long long)gDu,(long long)gDk);
    if(CRMAX>=0) fprintf(o," | CROW tests %lld cut %lld limit %lld builds %lld rows activated %lld Mcyc build %.0f test %.0f",(long long)gCRt,(long long)gCRk,(long long)gCRl,(long long)gCRb,(long long)gCRa,gCRbc/1e6,gCRtc/1e6); if(CRPAIR) fprintf(o," big rows %lld",(long long)gCRbig);
    if(R2SCR) fprintf(o," | R2 full %lld inc %lld rows/build %.0f try %lld cut %lld",(long long)gR2full,(long long)gR2inc,(gR2full+gR2inc)?(double)gR2rows/(gR2full+gR2inc):0.0,(long long)gR2try,(long long)gR2cut);
    if(VSKIPLAST) fprintf(o," | VSKIPLAST %lld over %lld norow %lld",(long long)gVskL,(long long)gOverL,(long long)gVskLNoRow);
    if(MINR1>0||MAXR1>=0) fprintf(o," | DOOM %lld",(long long)gDoom);
    if(TYPECUT) fprintf(o," | TYPECUT %lld",(long long)gTypeCut); }
  struct rusage ru; getrusage(RUSAGE_SELF,&ru); fprintf(o," | LP ms %.1f | cpu %.0fs",c?gLPus/1000.0/c:0.0,ru.ru_utime.tv_sec+ru.ru_stime.tv_sec+1e-6*(ru.ru_utime.tv_usec+ru.ru_stime.tv_usec)); }
static std::mutex statmu, snapmu; static long long gDepth[64], gAddFail[64], gFF[64], gChildless[64], gLeafFail[8]; static std::vector<long long> gSub;
static long long STc[128][8][32];   // per thread, per depth d of the node: 0 visited, 1 add() calls, 2 add() fails, 3 --preff cuts, 4 feasibleFuture fails, 5 conflict-graph cuts, 6 --mispre cuts, 7 non-canonical children
static void stStats(FILE* o){ fprintf(o," | ST"); for(int d=0;d<32;d++){ long long s[8]={0}; for(int t=0;t<128;t++) for(int k=0;k<8;k++) s[k]+=STc[t][k][d]; if(!s[0]&&!s[1]) continue;
    fprintf(o," %d:%lld/%lld/%lld/%lld/%lld/%lld/%lld/%lld",d,s[0],s[1],s[2],s[3],s[4],s[5],s[6],s[7]); }
  if(HSTAT) fprintf(o," | HSTAT nodes %lld cut %lld kids %lld cut %lld",(long long)gHn,(long long)gHc,(long long)gHu,(long long)gHk); }

struct Node { u128 key; u8 dim, cap, m; u16 rows[9]; };
static inline bool inSpan(const Node& n,int v){ for(int i=0;i<n.dim;i++){ int r=n.rows[i]; int b=31-__builtin_clz(r); if((v>>b)&1) v^=r; } return v==0; }
struct CEnt { u32 g; u16 a; };
static inline int imgL(int g,int l){ const LinT& T=LT[g]; const uint8_t* c=vch[l]; return labOf[T.t[0][c[0]]^T.t[1][c[1]]^T.t[2][c[2]]]; }
// open-addressing map with LIFO deletion (erase must be called in reverse insertion order)
struct LifoMap { std::vector<u128> keys; std::vector<int> vals; size_t mask;
  LifoMap(){ size_t sz=1<<16; keys.assign(sz,(u128)0); vals.assign(sz,-1); mask=sz-1; }
  inline int find(u128 k) const { size_t h=KeyHash()(k)&mask; while(vals[h]!=-1){ if(keys[h]==k) return vals[h]; h=(h+1)&mask; } return -1; }
  inline void insert(u128 k,int v){ size_t h=KeyHash()(k)&mask; while(vals[h]!=-1) h=(h+1)&mask; keys[h]=k; vals[h]=v; }
  inline void erase(u128 k){ size_t h=KeyHash()(k)&mask; while(true){ if(vals[h]!=-1&&keys[h]==k){ vals[h]=-1; return; } h=(h+1)&mask; } } };

struct Search {
  std::vector<Node> nodes; LifoMap idx; struct BItem { u128 key; u8 dim, m; u16 rows[9]; }; std::vector<BItem> batch;
  int multV[512]; std::vector<u128> ckey; std::vector<int8_t> cval;
  inline int lbget(u128 k){ size_t h=(KeyHash()(k)>>20)&65535; if(cval[h]!=-128 && ckey[h]==k) return cval[h]; int lb=TAB.get(k); ckey[h]=k; cval[h]=(int8_t)lb; return lb; }
  std::vector<int> seq; int mult[511]; int hits[512]; int splitSum[64]; int blocked[511];
  int wcnt[14]; uint8_t wlw[14][24];   // prof7L75: points per W-type subspace and their W0 coordinates (insertion order)
  BS wbm[24];   // prof7L86: W-blocked vectors at depth d
  std::vector<std::vector<CEnt>> cst;
  // prof7L22: per-depth copy of the GL rows of cst[d] (entry-major), made before a node scans its children
  std::vector<u16> cbuf[24]; bool cbufOK[24]={0};
  int16_t cbCi[24][512]; int16_t ccLab[24][512]; int cbNC[24]={0}; size_t cbNE[24]={0}; bool cbT[24]={0};   // prof7L78 (c): child label -> column, columns, elements, layout
  long long visited=0; int tid=0; double* doneP=nullptr; std::chrono::steady_clock::time_point jstart; long long agechk=0;   // prof7L48
  lpx::LP* lp=nullptr; lpx::Cert cert; int curJob=-1; bool lastHasB=false; int lpPrD=-1;   // lpPrD: depth of the last lpCheck if it pruned with duals in cert
  struct Scr { __int128 base; __int128 Rj[512]; __int128 Sfx[512]; int32_t brow[512]; std::vector<std::pair<int,int32_t>> pb; std::vector<int> pbl; std::string lamS, muS; };
  std::vector<Scr> scr=std::vector<Scr>(24), sib=std::vector<Scr>(24), sfx=std::vector<Scr>(24); bool sibOK[24]={0}; int sfxT[24];
  std::vector<u32> wl[24][9], wtmp; int wcov[24][9]; std::vector<int> wblk[24]; int lastA=0, lastSlack=0; double jobBase=0;
  void resetLists(){ for(int d=0;d<24;d++) for(int k=0;k<9;k++) wcov[d][k]=0; }
  void unblockAt(int d){ for(int l:wblk[d]) blocked[l]--; wblk[d].clear(); }
  long long cDepth[64]={0}, cAddFail[64]={0}, cFF[64]={0}, cChildless[64]={0}; std::vector<long long> subSizes;
  bool selected(){ unsigned long long h=SAMPLE_SEED*0x9E3779B97F4A7C15ULL; for(int l:seq){ h^=(unsigned long long)(l+1); h*=0xBF58476D1CE4E5B9ULL; h^=h>>31; h*=0x94D049BB133111EBULL; h^=h>>29; }
    return (double)(h>>11)*(1.0/9007199254740992.0) < SAMPLE_P; }
  void flush(){ std::lock_guard<std::mutex> lk(statmu); for(int i=0;i<64;i++){ gDepth[i]+=cDepth[i]; gAddFail[i]+=cAddFail[i]; gFF[i]+=cFF[i]; gChildless[i]+=cChildless[i]; cDepth[i]=cAddFail[i]=cFF[i]=cChildless[i]=0; } gSub.insert(gSub.end(),subSizes.begin(),subSizes.end()); subSizes.clear(); }
  Search(){ resetLists(); memset(wcnt,0,sizeof wcnt); memset(wlw,0,sizeof wlw); memset(mult,0,sizeof mult); memset(hits,0,sizeof hits); memset(splitSum,0,sizeof splitSum); memset(blocked,0,sizeof blocked); memset(multV,0,sizeof multV);
    nodes.reserve(1<<15); batch.reserve(1<<14); cst.resize(64); ckey.assign(65536,(u128)0); cval.assign(65536,-128); }
  struct Undo { size_t firstNew; std::vector<int> inc; };
  void mark(const Node& nd,int d){ // blocked[x]+=d for every nonzero x in span(nd)
    int n=nd.dim; int x=0; for(int s=1;s<(1<<n);s++){ x^=nd.rows[__builtin_ctz(s)]; blocked[labOf[x]]+=d; } }
  bool create(u128 key,int dim,int m,const u16* rows){
    Node nd; nd.key=key; nd.dim=dim; int lb=lbget(key); if(lb<-50){ fprintf(stderr,"missing key dim %d\n",dim); exit(2);}
    if(!BUMP.empty()){ auto it=BUMP.find(key); if(it!=BUMP.end()) lb=std::max(lb,it->second); }
    if(LINEBUMP && dim==2 && lb==19){ int r1=0; int a=rows[0],b=rows[1]; if(rank3(a)==1||rank3(b)==1||rank3(a^b)==1) r1=1; if(!r1) lb=20; }
    int cap=R-lb; nd.cap=(u8)std::max(0,cap);
    for(int i=0;i<dim;i++) nd.rows[i]=rows[i];
    nd.m=(u8)m; idx.insert(key,(int)nodes.size()); nodes.push_back(nd);
    if(nd.m>=nd.cap) mark(nd,+1);
    return nd.m<=nd.cap; }
  bool add(int l,Undo& U){
    int v=vecOf[l]; U.firstNew=nodes.size(); U.inc.clear(); bool ok=true;
    mult[l]++; multV[v]++; seq.push_back(l);
    for(int X=1;X<512;X++) if(ip(v,X)) hits[X]++;
    for(size_t c=0;c<SPL.size();c++) splitSum[c]+=SPL[c].w[l];
    if(wcut::ON){ uint16_t wm=wcut::WM[v]; for(uint16_t mm=wm; mm; mm&=mm-1){ int w=__builtin_ctz(mm); wlw[w][wcnt[w]++]=wcut::W0C[w][v]; }   // prof7L75
      for(uint16_t mm=wm; mm; mm&=mm-1){ int w=__builtin_ctz(mm); if(wcnt[w]>=12){ wcut::gCap++; addWhy=3; addW=w; return false; } if(wcnt[w]==11 && !wcut::dictOK(wlw[w])){ addWhy=4; addW=w; return false; } if(wcut::K10 && wcnt[w]==10 && wcut::k10val(wlw[w])==0){ wcut::gK10cut++; addWhy=5; addW=w; return false; } } }   // prof7R3: addWhy
    size_t n0=nodes.size();
    for(size_t i=0;i<n0;i++){ Node& nd=nodes[i]; if(inSpan(nd,v)){ nd.m++; U.inc.push_back(i); if(nd.m==nd.cap) mark(nd,+1); if(nd.m>nd.cap){ if(ok){ addWhy=1; addDim=nd.dim; for(int j=0;j<nd.dim;j++) addRows[j]=nd.rows[j]; } ok=false; } } }
    if(!ok) return false;
    { u16 g[1]={(u16)v}; u128 k=(u128)v; if(idx.find(k)<0) if(!create(k,1,multV[v],g)){ addWhy=2; addDim=1; addRows[0]=(u16)v; return false; } }
    batch.clear();
    for(size_t i=0;i<n0;i++){ const Node& nd=nodes[i]; if(nd.dim>=DMAX) continue;
      // reduce v by rows of nd (RREF, pivot = highest bit)
      int w=v; for(int j=0;j<nd.dim;j++){ int r=nd.rows[j]; if((w>>(31-__builtin_clz(r)))&1) w^=r; }
      if(w==0) continue;
      int p=31-__builtin_clz(w); BItem it; it.dim=nd.dim+1; int pos=0;
      for(int j=0;j<nd.dim;j++){ int r=nd.rows[j]; if((r>>p)&1) r^=w; if((31-__builtin_clz(r))>p) pos=j+1; it.rows[j]=(u16)r; }
      for(int j=nd.dim;j>pos;j--) it.rows[j]=it.rows[j-1]; it.rows[pos]=(u16)w;
      u128 k=0; for(int j=0;j<it.dim;j++) k|=((u128)it.rows[j])<<(9*j); it.key=k;
      if(idx.find(k)>=0) continue;
      // m(F+v) = m(F) + sum over coset v+F of multV
      int m=nd.m; int x=v; m+=multV[x]; for(int s=1;s<(1<<nd.dim);s++){ x^=nd.rows[__builtin_ctz(s)]; m+=multV[x]; }
      it.m=(u8)m; batch.push_back(it); }
    std::stable_sort(batch.begin(),batch.end(),[](const BItem& a,const BItem& b){ return a.dim<b.dim; });
    for(auto& it:batch){ if(idx.find(it.key)>=0) continue; if(!create(it.key,it.dim,it.m,it.rows)){ addWhy=2; addDim=it.dim; for(int j=0;j<it.dim;j++) addRows[j]=it.rows[j]; return false; } }
    return true; }
  void undo(int l,const Undo& U){
    int v=vecOf[l];
    for(size_t i=nodes.size();i-->U.firstNew;){ if(nodes[i].m>=nodes[i].cap) mark(nodes[i],-1); idx.erase(nodes[i].key); }
    nodes.resize(U.firstNew);
    for(int i:U.inc){ Node& nd=nodes[i]; if(nd.m==nd.cap) mark(nd,-1); nd.m--; }
    if(wcut::ON){ for(uint16_t mm=wcut::WM[v]; mm; mm&=mm-1) wcnt[__builtin_ctz(mm)]--; }   // prof7L75
    mult[l]--; multV[v]--; seq.pop_back();
    for(int X=1;X<512;X++) if(ip(v,X)) hits[X]--;
    for(size_t c=0;c<SPL.size();c++) splitSum[c]-=SPL[c].w[l];
  }
  // prof7L18: add/undo leave the kept-row counts alone; addT/undoT and the visited children of dfs2 keep them (trkAdd/trkDel)
  inline void trkA(int l){ if(lp && lp->trk) lp->trkAdd(vecOf[l]); }
  inline void trkD(int l){ if(lp && lp->trk) lp->trkDel(vecOf[l]); }
  bool addT(int l,Undo& U){ bool ok=add(l,U); trkA(l); return ok; }
  void undoT(int l,const Undo& U){ trkD(l); undo(l,U); }
  // compare sorted g(seq+[l]) with seq+[l]: -1 if smaller, STAB if equal, else the image value at the first difference
  int fullCheck(int g,int l){
    int k=seq.size(); int img[64];
    if(LTOK){ for(int j=0;j<k;j++) img[j]=imgL(g,seq[j]); img[k]=imgL(g,l); }   // prof7L90
    else { const auto& P=GL[g]; for(int j=0;j<k;j++) img[j]=P[seq[j]]; img[k]=P[l]; }
    std::sort(img,img+k+1);
    for(int j=0;j<=k;j++){ int s=(j<k?seq[j]:l); if(img[j]<s) return -1; if(img[j]>s) return img[j]; }
    return STAB; }
  // exact lex-min test of seq+[l] given seq is canonical; fills cst[d+1]
  bool canonCheck(int l){
    if(!SYM) return true;
    int d=seq.size(); auto& out=cst[d+1]; out.clear(); int cs=classStart[l];
    if(d==0){ if(l!=classMin[l]){ rejG=toMin[l].empty()?-1:(int)toMin[l][0]; rejT=0; return false; } for(int g:toMin[l]) if(g!=GID) out.push_back({(u32)g,STAB}); return true; }   // prof7R3: rejG/rejT as prof7L87cw
    bool cb=(d<24 && cbufOK[d]); const u16* CB=cb?cbuf[d].data():nullptr; size_t ei=0; size_t cstep=512;
    if(cb && cbT[d]){ int c=cbCi[d][l]; if(c<0) cb=false; else { CB+=(size_t)c*cbNE[d]; cstep=0; } }   // prof7L78 (c): this child's column
    const CEnt* E0=cst[d].data(); const size_t nE=cst[d].size(); const bool lpf=!cb && LTOK;   // prof7L90: prefetch the linear tables 16 entries ahead
    for(const CEnt& e:cst[d]){ if(lpf && ei+16<nE) __builtin_prefetch(&LT[E0[ei+16].g]); int y=cb?(cstep?CB[ei*512+l]:CB[ei]):(LTOK?imgL(e.g,l):GL[e.g][l]); ei++;
      if(e.a==STAB){ if(y<l){ rejG=e.g; rejT=1; return false; } if(y==l) out.push_back(e); else out.push_back({e.g,(u16)y}); }
      else if(y>=e.a){ if(e.a>cs) out.push_back(e); }
      else { int r=fullCheck(e.g,l); if(r<0){ rejG=e.g; rejT=2; return false; } if(r==STAB||r>cs) out.push_back({e.g,(u16)r}); } }
    if(rk[l]==rk[seq[0]] && l!=seq.back()){
      const std::vector<int>& TM=toMin[l]; const size_t nT=TM.size();
      for(size_t ti=0;ti<nT;ti++){ int g=TM[ti]; if(LTOK && ti+8<nT) __builtin_prefetch(&LT[TM[ti+8]]); int r=fullCheck(g,l); if(r<0){ rejG=g; rejT=3; return false; } if(r==STAB||r>cs) out.push_back({(u32)g,(u16)r}); } }
    return true; }
  bool feasibleFuture(int pos,int need,int d=-1,bool doBlock=false){
    const int fm=MULT1?1:2;
    for(int X=1;X<512;X++){ int h=hits[X]; int req=hypNeed[X]; if(h>=req) continue; int av=std::min(need,fm*(int)sufHits[pos][X]); if(h+av<req){ ffWhy=X; return false; } }   // prof7R3: ffWhy
    if(USE_SPLIT) for(size_t c=0;c<SPL.size();c++){ int s=splitSum[c]; if(s>=SPL[c].need) continue; if(s+need*(int)sufSplitMax[pos][c]<SPL[c].need){ ffWhy=512+(int)c; return false; } }
    if(WLOOK && !(d>=0 ? wlook2(pos,need,d,doBlock) : wlook(pos,need))){ ffWhy=1023; return false; }
    return true; }
  bool wlook(int pos,int need){
    int A=0; int Qh[512], Ch[512]; for(int x=0;x<512;x++){ Qh[x]=0; Ch[x]=0; }
    for(int l:seq) Ch[vecOf[l]]++;
    for(int l=pos;l<N;l++){ if(blocked[l]) continue; int u=std::min(std::min(2,pointCap[l]),allowMult[l])-mult[l]; if(u>0){ A+=u; Qh[vecOf[l]]+=u; } }
    int slack=A-need; if(slack<0) return false;
    bool any=false; for(int k=DMAX+1;k<=8;k++) if(slack<WTHR[k]) any=true;
    if(!any) return true;
    wNodes++;
    for(int x=0;x<512;x++) Qh[x]+=Ch[x];
    for(int h=1;h<512;h<<=1) for(int i=0;i<512;i+=2*h) for(int j=i;j<i+h;j++){ int a=Qh[j],b=Qh[j+h]; Qh[j]=a+b; Qh[j+h]=a-b; a=Ch[j]; b=Ch[j+h]; Ch[j]=a+b; Ch[j+h]=a-b; }
    for(int k=8;k>DMAX;k--){ if(slack>=WTHR[k]) continue; wScan[k]++; int m=9-k, n=1<<m; int capLim=((1<<k)-1)-slack; // W with cap >= capLim cannot fail
      for(const WB& w:WLB[k]){ if(w.cap>=capLim) break; int x=0, sq=Qh[0], sc=Ch[0];
        for(int i=1;i<n;i++){ x^=w.b[__builtin_ctz(i)]; sq+=Qh[x]; sc+=Ch[x]; }
        if(sc>n*(int)w.cap || sq>n*((int)w.cap+slack)){ wKill[k]++; return false; } } }
    return true; }
  // inherited-list lookahead at a DFS node of depth d (lists in wl[d]); blocks labels of saturated W when doBlock
  bool wlook2(int pos,int need,int d,bool doBlock){
    int Qh[512], Ch[512]; std::vector<std::pair<int,u32>> sat;
    for(int pass=0;pass<4;pass++){
      int A=0; for(int x=0;x<512;x++){ Qh[x]=0; Ch[x]=0; }
      for(int l:seq) Ch[vecOf[l]]++;
      for(int l=pos;l<N;l++){ if(blocked[l]) continue; int u=std::min(std::min(2,pointCap[l]),allowMult[l])-mult[l]; if(u>0){ A+=u; Qh[vecOf[l]]+=u; } }
      int slack=A-need; lastA=A; lastSlack=slack; if(slack<0) return false;
      bool any=false; for(int k=DMAX+1;k<=8;k++) if(slack<WTHR[k]) any=true;
      if(!any){ for(int k=DMAX+1;k<=8;k++) wcov[d][k]=0; return true; }
      if(pass==0) wNodes++;
      for(int x=0;x<512;x++) Qh[x]+=Ch[x];
      for(int h=1;h<512;h<<=1) for(int i=0;i<512;i+=2*h) for(int j=i;j<i+h;j++){ int a=Qh[j],b=Qh[j+h]; Qh[j]=a+b; Qh[j+h]=a-b; a=Ch[j]; b=Ch[j+h]; Ch[j]=a+b; Ch[j+h]=a-b; }
      sat.clear();
      for(int k=8;k>DMAX;k--){
        if(slack>=WTHR[k]){ wcov[d][k]=0; continue; }
        if(pass==0) wScan[k]++;
        int m=9-k, n=1<<m; int capLim=((1<<k)-1)-slack; if(capLim>127) capLim=127;
        const std::vector<WB>& WB_=WLB[k]; const std::vector<int>& cs=CAPST[k];
        auto capIdx=[&](int c)->size_t{ if(c<0) return 0; if(c>=(int)cs.size()) return WB_.size(); return (size_t)cs[c]; };
        const std::vector<u32>* src=nullptr; int cov0=0;
        if(pass>0 && wcov[d][k]>0){ wtmp.swap(wl[d][k]); src=&wtmp; cov0=wcov[d][k]; }
        else if(d>0 && wcov[d-1][k]>0){ src=&wl[d-1][k]; cov0=wcov[d-1][k]; }
        std::vector<u32>& out=wl[d][k]; out.clear();
        auto ev=[&](u32 idx)->bool{ const WB& w=WB_[idx]; int x=0, sq=Qh[0], sc=Ch[0];
          for(int i=1;i<n;i++){ x^=w.b[__builtin_ctz(i)]; sq+=Qh[x]; sc+=Ch[x]; }
          int cp=(int)w.cap;
          if(sc>n*cp || sq>n*(cp+slack)) return false;
          if(sq>n*cp){ out.push_back(idx); if(doBlock && sc==n*cp) sat.push_back({k,idx}); }
          return true; };
        if(src){ for(u32 idx:*src) if(!ev(idx)){ wKill[k]++; wcov[d][k]=0; return false; } }
        size_t a0=capIdx(cov0), a1=capIdx(capLim);
        for(size_t idx=a0; idx<a1; idx++) if(!ev((u32)idx)){ wKill[k]++; wcov[d][k]=0; return false; }
        wcov[d][k]=std::max(capLim,cov0);
      }
      if(!doBlock || sat.empty()) return true;
      // block the available labels of saturated W (m(W) = cap(W)) for the whole subtree
      int nb=0;
      for(int l=pos;l<N;l++){ if(blocked[l]) continue; int u=std::min(std::min(2,pointCap[l]),allowMult[l])-mult[l]; if(u<=0) continue; int v=vecOf[l];
        for(auto& s:sat){ const WB& w=WLB[s.first][s.second]; int m=9-s.first; bool in=true; for(int i=0;i<m;i++) if(ip(v,w.b[i])){ in=false; break; }
          if(in){ blocked[l]++; wblk[d].push_back(l); nb++; break; } } }
      if(nb==0) return true;
    }
    return true; }
  bool leafCheck(){
    if(wcut::ON && wcut::K10) for(int w=0;w<14;w++) if(wcnt[w]==10 && !(wcut::k10val(wlw[w])&1)){ wcut::gK10leaf++; leafWhy=1; return false; }   // prof7L76
    if(rootcut::ON){   // prof7L77: cheap checks first, then tsolve's root test, then the W-list scan on the survivors
      if(USE_SPLIT) for(size_t c=0;c<SPL.size();c++) if(splitSum[c]<SPL[c].need){ leafWhy=2; return false; }
      for(int X=1;X<512;X++) if(hits[X]<hypNeed[X]){ leafWhy=3; return false; }
      int vals[64]; int n=0; for(int l:seq) vals[n++]=vecOf[l];
      if(!rootcut::leafOK(vals,n,hits)){ leafWhy=4; return false; } }
    if(LEAFON && lp && lp->trk){   // prof7L78 (a): a violated kept-tracked W-list is a kept row in lp->over; dominated ones imply one
      for(int32_t r:lp->over) if(KWL[r]){ leafWhy=5; leafArgR=r; return false; }
      if(!WLR.empty()){ int F[512]; for(int x=0;x<512;x++) F[x]=0; for(int l:seq) F[vecOf[l]]++;
        for(int h=1;h<512;h<<=1) for(int i=0;i<512;i+=2*h) for(int j=i;j<i+h;j++){ int a=F[j],b=F[j+h]; F[j]=a+b; F[j+h]=a-b; }
        for(const auto& w:WLR){ int s=0; for(int i=0;i<w.n;i++) s+=F[w.el[i]]; int m=s/w.n; if(m>w.cap){ leafWhy=6; leafArgW=&w; return false; } } } }
    else { int F[512]; for(int x=0;x<512;x++) F[x]=0; for(int l:seq) F[vecOf[l]]++;
    for(int h=1;h<512;h<<=1) for(int i=0;i<512;i+=2*h) for(int j=i;j<i+h;j++){ int a=F[j],b=F[j+h]; F[j]=a+b; F[j+h]=a-b; }
    for(const auto& w:WL){ int s=0; for(int i=0;i<w.n;i++) s+=F[w.el[i]]; int m=s/w.n; if(m>w.cap){ leafWhy=7; leafArgW=&w; return false; } } }
    if(USE_SPLIT) for(size_t c=0;c<SPL.size();c++) if(splitSum[c]<SPL[c].need){ leafWhy=2; return false; }
    for(int X=1;X<512;X++) if(hits[X]<hypNeed[X]){ leafWhy=3; return false; }
    leafWhy=0; return true; }
  long long myLeaf=0, myProf=0;   // prof7L39: this thread's leaves and profiles
  long long donN=0;   // prof7L84: pieces this thread has donated (a subtree whose dfs donated none is complete when it returns)
  // ---- prof7R3 pcert state (masks indexed by vector, as everywhere in this file; records carry labels) ----
  int pcD0=0; BS pcDin{};   // depth of the open segment's root node; dead mask inherited by it
  std::vector<int32_t> pcVr[25], pcWin;   // batch 12 (--pcwit): VROWS rows of the open node at each depth; witness rows inherited by the segment root
  BS pcD[25], pcF0[25]; size_t pcFullN[25]; int pcLast[25]; int pcNval=-1;   // dead mask, F0 (labels above the last one outside every full row), lp->full length at entry, child delta base, valid depth of pcNt
  std::vector<BS> pcNt=std::vector<BS>(25*512);   // pcNt[k*512+v] = CONF0[v] | CONF2T[p][v] over the first k prefix points p (L1's static exclusion table N)
  std::string pcKb[25]; int32_t pcKo[25][512]; bool pcKon[25]={0}; std::string pcNd[25];   // per node depth: kill record bodies of the screen-killed children (by vector), node row table record
  uint8_t pkind[25][512]; int32_t pbbs[25][512];   // kill kind (1 count, 2 MIS, 3 deficit search, 4 + residual-2 cliques, 5 crow, 6 tl2) and the killing search's node count
  int ffWhy=0, leafWhy=0, cutWhy=0; long long cutArg=0; int32_t leafArgR=-1; const WList* leafArgW=nullptr;   // reasons of the last feasibleFuture / leafCheck / misCheck failure
  int addWhy=0, addDim=0, addW=0; u16 addRows[9];   // reason of the last add() failure (1 existing subspace, 2 new subspace, 3/4/5 W count 12 / dictionary / k10)
  int rejG=-1, rejT=-1; uint8_t pcWbW[512];   // canonicity rejection witness (group element, type); W index of each W-blocked vector at the current node
  std::vector<int32_t> r1R; std::vector<BS> r1M; std::vector<uint8_t> r1B; std::vector<int> bigOf[512];   // pcClassify scratch
  int shadow=0; BS pcExpM[25];   // prof7R3 --pcexp: inside an expanded child (certificate-only subtree); the children to expand at each depth
  struct JAcc { int lo=-1, hi=-1; long long n=0, l=0, p=0; long long pb=-1; }; JAcc jacc[64];   // prof7R3: pb = pcert offset where the run's first child starts   // prof7L84: the current run of finished children at each depth
  void jrecRange(int d,const JAcc& A){ certFlush(); char b[96]; std::string t; t.reserve(64+4*(size_t)d); snprintf(b,sizeof b,"R %d %lld %lld %lld %d",curJob,A.n,A.l,A.p,d); t+=b;   // prof7R2: certFlush, the run's certificate lines leave this thread first
    for(int i=0;i<d;i++){ snprintf(b,sizeof b," %d",vecOf[seq[i]]); t+=b; } snprintf(b,sizeof b," %d %d",vecOf[A.lo],vecOf[A.hi]); t+=b;
    if(PCF){ pcChunk(false); snprintf(b,sizeof b," %llu %lld %lld",tlPc.id,A.pb,pcOff()); t+=b; }   // prof7R3: the run's pcert bytes [pb, now) of this segment, flushed first
    t+='\n'; std::lock_guard<std::mutex> lk(gJmu); gJpend.push_back(std::move(t)); }
  void emit(){ std::lock_guard<std::mutex> lk(outmu); ++nprof; ++myProf; if(OUT){ for(size_t i=0;i<seq.size();i++) fprintf(OUT,"%d%c",vecOf[seq[i]],i+1==seq.size()?'\n':' '); fflush(OUT);} }
  // exact LP bound at this node; true = the node has no completion (certificate written to CERTF)
  void ensureLP(){
    if(!lp){ long long c=lpx::tcpu(); lp=new lpx::LP(); lp->init=LPINIT; lp->cnt.assign(lpx::NR,0); lp->build(); gBLDns+=lpx::tcpu()-c;
      if(lpx::INC){ std::vector<int> P0; for(int l:seq) P0.push_back(vecOf[l]); lp->trkInit(P0); } } }   // from here on add/undo keep the counts
  // conflict-graph bound (see the header): true = F has no independent set of size need (certificate written to CERTF)
  BS mconf[512]; long long mNodes=0, mLim=0; int mBest=0, mStop=0;
  BS pdead[24]; int16_t pfree[24][512]; int32_t pbb[24][512];
  int32_t vrowD[24][512];   // prof7L28v: a full kept row through each skipped child point, per node depth (certificate lines)
  // prof7L21: the conflict graph of the latest node at each depth, for its children (incremental misCheck)
  BS misF[24]; std::vector<BS> misG[24]; size_t misFull[24]={0}; bool misValid[24]={0};   // --mispre: children of the depth-d node cut by its graph, with |F_u| and search nodes
  void mexp(BS P,int size){   // colouring branch and bound (Tomita); a colour class is a set of pairwise conflicting points
    mNodes++; if(mBest>=mStop || mNodes>mLim) return;
    int order[512], col[512], no=0, c=0; BS U=P;
    while(bnz(U)){ c++; BS Q=U;
      while(bnz(Q)){ int w=0; while(!Q[w]) w++; int v=w*64+__builtin_ctzll(Q[w]); Q[w]&=Q[w]-1; U[w]&=~(1ULL<<(v&63)); order[no]=v; col[no]=c; no++;
        for(int k=0;k<8;k++) Q[k]&=mconf[v][k]; } }
    for(int i=no-1;i>=0;i--){ if(size+col[i]<=mBest || mBest>=mStop || mNodes>mLim) return;
      int v=order[i]; BS NP; for(int k=0;k<8;k++) NP[k]=P[k]&~mconf[v][k]; NP[v>>6]&=~(1ULL<<(v&63));
      if(!bnz(NP)){ if(size+1>mBest) mBest=size+1; } else mexp(NP,size+1);
      P[v>>6]&=~(1ULL<<(v&63)); } }
  // prof7L30: per depth, the node's residual-2 rows (>= 3 points in its F) as F-masks
  std::vector<int32_t> r2row[24]; std::vector<BS,AAlloc<BS>> r2msk[24]; bool r2ok[24]={0};
  std::vector<int32_t> cR; std::vector<const BS*> cM; /* prof7L90: cM[i] = the source row (parent row or RMASK row), not its F-mask */ unsigned long long misSeq=0, cSeq=~0ULL;   // prof7L78 (b): r2scanAlive's candidate rows (>= 3 points in F) and their F-masks
  std::vector<int> r2list; int r2start[513]; int r2idxD=-1;
  BS svConf[512]; int svIdx[512]; uint8_t svMark[512]={0}; int nsv=0;
  std::vector<int> alv[512];   // prof7L46: per alive child, the indices (in r2msk[d]) of the rows through it
  std::vector<BS> AMk;   // prof7L47: masks (restricted to F) of the rows through the alive children; alv[u] indexes AMk
  alignas(64) uint64_t FucA[512][8];   // prof7L53: per alive child u, its set ABOVE(u) minus its conflicts, node-local
  void r2scanAlive(int d,const BS& F,const BS& A){ AMkC.clear(); AMkR.clear(); cap6R.clear(); cR.clear(); cM.clear(); cSeq=misSeq; const int8_t* RP=lp->resP.data(); cap6.clear(); capN=0; capOn=(d>=CRMIN && d<=CRMAX && (CRLAZY||CRPAIR||CRBITS));
    for(int w=0;w<8;w++){ uint64_t x=A[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; alv[u].clear();
        comp(ABOVE[lpx::lab[u]+1],FucA[u]); const uint64_t* mu=mcx+cidx(u)*WC; for(int k=0;k<WC;k++) FucA[u][k]&=~mu[k]; } }
    auto note=[&](const BS& m,int32_t rid){ uint64_t hA[8]; uint64_t any=0; for(int w=0;w<8;w++){ hA[w]=m[w]&A[w]; any|=hA[w]; }
      bool cap1=capOn && bcnt(m)>=CRKMIN; if(!any && !cap1) return;   // prof7L69: capture only big rows
      uint64_t t[8]; comp(m,t); if(cap1){ cap6.insert(cap6.end(),t,t+WC); cap6R.push_back(rid); capN++; } if(!any) return; int idx=-1;   // prof7L66: capture every row   // prof7L51: node-local mask (WC words); prof7L53: kept for u only if it gives u a clique (>= 2 points in u's set)
#ifdef L90V
      const __m512i TZ=_mm512_loadu_si512(t);   // comp() zeroes the words past WC, and so does FucA[u]
      for(int w=0;w<8;w++){ uint64_t h=hA[w]; while(h){ int u=w*64+__builtin_ctzll(h); h&=h-1; if(!ge2v(_mm512_and_si512(TZ,_mm512_loadu_si512(FucA[u])))) continue;
#else
      for(int w=0;w<8;w++){ uint64_t h=hA[w]; while(h){ int u=w*64+__builtin_ctzll(h); h&=h-1; const uint64_t* fu=FucA[u]; int c=0; for(int k=0;k<WC;k++) c+=__builtin_popcountll(t[k]&fu[k]); if(c<2) continue;
#endif
          if(idx<0){ idx=(int)(AMkC.size()/WC); AMkC.insert(AMkC.end(),t,t+WC); AMkR.push_back(rid); } alv[u].push_back(idx); } } };
#ifdef L90V
    const __m512i FZ=_mm512_loadu_si512(F.data());
    const __m512i AZ=_mm512_loadu_si512(A.data());
    auto hit=[&](const __m512i M,int32_t rid){ if(_mm512_test_epi64_mask(M,AZ) || (capOn && pc512(M)>=CRKMIN)){ BS m; _mm512_storeu_si512(m.data(),M); note(m,rid); } };   // prof7L90: note() does nothing else
    auto takeM=[&](int32_t r,const BS& src){ __m512i M=_mm512_and_si512(_mm512_loadu_si512(src.data()),FZ); if(ge3v(M)){ if(R2CAND){ cR.push_back(r); cM.push_back(&src); } hit(M,r); } };
    auto fitsM=[&](const BS& src)->bool{ return ge3v(_mm512_and_si512(_mm512_loadu_si512(src.data()),FZ)); };
#else
    auto takeM=[&](int32_t r,const BS& rm){ BS m; int c=0; for(int w=0;w<8;w++){ m[w]=rm[w]&F[w]; c+=__builtin_popcountll(m[w]); } if(c>=3){ if(R2CAND){ cR.push_back(r); cM.push_back(&rm); } note(m,r); } };
    auto fitsM=[&](const BS& rm)->bool{ int c=0; for(int w=0;w<8;w++) c+=__builtin_popcountll(rm[w]&F[w]); return c>=3; };
#endif
    const bool inc = d>=1 && r2ok[d-1] && !seq.empty() && !lp->r2mark.empty();
    if(inc){ int x=vecOf[seq.back()]; const std::vector<int32_t>& PR=r2row[d-1]; const auto& PM=r2msk[d-1];
      const bool xin=(misF[d-1][x>>6]>>(x&63))&1 && misValid[d-1];
      const size_t nP=PR.size();
      for(size_t i=0;i<nP;i++){ const BS& pm=PM[i]; if(i+PFD<nP) __builtin_prefetch(RP+PR[i+PFD]); if(i+16<nP) __builtin_prefetch(&PM[i+16]);   // prof7L90: parent rows 1 KB ahead
        if(xin){ if((pm[x>>6]>>(x&63))&1) continue; } else if(RP[PR[i]]!=2) continue;
#ifdef L90V
        __m512i M=_mm512_and_si512(_mm512_loadu_si512(pm.data()),FZ); if(ge3v(M)){ if(R2CAND){ cR.push_back(PR[i]); cM.push_back(&pm); } hit(M,PR[i]); } }
#else
        BS m; int c=0; for(int w=0;w<8;w++){ m[w]=pm[w]&F[w]; c+=__builtin_popcountll(m[w]); } if(c>=3){ if(R2CAND){ cR.push_back(PR[i]); cM.push_back(&pm); } note(m,PR[i]); } }
#endif
      { const int32_t* RL=lp->res2.data(); const size_t i0=lp->r2mark.back(), i1=lp->res2.size();   // prof7L50: prefetch PFD rows ahead
        for(size_t i=i0;i<std::min(i1,i0+PFD);i++){ __builtin_prefetch(&RMASK[RL[i]]); __builtin_prefetch(RP+RL[i]); }
        for(size_t i=i0;i<i1;i++){ if(i+PFD<i1){ __builtin_prefetch(&RMASK[RL[i+PFD]]); __builtin_prefetch(RP+RL[i+PFD]); } int32_t r=RL[i]; if(RP[r]==2 && fitsM(RMASK[r])) takeM(r,RMASK[r]); } } }
    else {   // prof7L90: residual test first, prefetched, and the static cap-2 rows from their contiguous copy
      const int32_t* RL=lp->res2.data(); const size_t n2=lp->res2.size();
      for(size_t i=0;i<n2;i++){ if(i+PFD<n2){ __builtin_prefetch(&RMASK[RL[i+PFD]]); __builtin_prefetch(RP+RL[i+PFD]); } int32_t r=RL[i]; if(RP[r]==2 && fitsM(RMASK[r])) takeM(r,RMASK[r]); }
      const int32_t* SL=ST2ROW.data(); const size_t ns=ST2ROW.size();
      for(size_t i=0;i<ns;i++){ if(i+PFD<ns) __builtin_prefetch(RP+SL[i+PFD]); int32_t r=SL[i]; if(RP[r]==2 && fitsM(ST2M[i])) takeM(r,ST2M[i]); } } }
  void r2build(int d,const BS& F,const BS& A,const BS& Fs){   // prof7L49: Fs = F' plus the first surviving child (store mask); count on F' = Fs minus that child
    std::vector<int32_t>& RR=r2row[d]; auto& MM=r2msk[d]; RR.clear(); MM.clear(); const int8_t* RP=lp->resP.data();
    if(R2CAND && cSeq==misSeq && !bnz(A)){   // prof7L78 (b): same node as r2scanAlive, F' <= its F: the rows are its candidates with >= 3 points in F'
      const bool inc0 = d>=1 && r2ok[d-1] && !seq.empty() && !lp->r2mark.empty(); if(inc0) gR2inc++; else gR2full++;
#ifdef L90V
      const __m512i FZ=_mm512_loadu_si512(F.data()), FSZ=_mm512_loadu_si512(Fs.data());
      const size_t nc=cR.size();
      for(size_t i=0;i<nc;i++){ if(i+16<nc) __builtin_prefetch(cM[i+16]); const __m512i CM=_mm512_loadu_si512(cM[i]->data());   // F' and Fs lie inside the scan's F
        if(ge3v(_mm512_and_si512(CM,FZ))){ BS m; _mm512_storeu_si512(m.data(),_mm512_and_si512(CM,FSZ)); RR.push_back(cR[i]); MM.push_back(m); } }
#else
      for(size_t i=0;i<cR.size();i++){ const BS& cm=*cM[i]; int c=0; for(int w=0;w<8;w++) c+=__builtin_popcountll(cm[w]&F[w]);
        if(c>=3){ BS m; for(int w=0;w<8;w++) m[w]=cm[w]&Fs[w]; RR.push_back(cR[i]); MM.push_back(m); } }
#endif
      r2ok[d]=true; gR2rows+=RR.size(); r2idxD=-1; return; }
    for(int w=0;w<8;w++){ uint64_t x=A[w]; while(x){ alv[w*64+__builtin_ctzll(x)].clear(); x&=x-1; } }
    auto note=[&](const BS& m){ int idx=(int)MM.size()-1; for(int w=0;w<8;w++){ uint64_t h=m[w]&A[w]; while(h){ alv[w*64+__builtin_ctzll(h)].push_back(idx); h&=h-1; } } };
    auto take=[&](int32_t r){ const BS& rm=RMASK[r]; int c=0; for(int w=0;w<8;w++) c+=__builtin_popcountll(rm[w]&F[w]); if(c>=3){ BS m; for(int w=0;w<8;w++) m[w]=rm[w]&Fs[w]; RR.push_back(r); MM.push_back(m); note(m); } };
    auto fits=[&](int32_t r)->bool{ const BS& rm=RMASK[r]; int c=0; for(int w=0;w<8;w++) c+=__builtin_popcountll(rm[w]&F[w]); return c>=3; };
    auto takeS=[&](int32_t r,size_t i){ const BS& rm=ST2M[i]; int c=0; for(int w=0;w<8;w++) c+=__builtin_popcountll(rm[w]&F[w]); if(c>=3){ BS m; for(int w=0;w<8;w++) m[w]=rm[w]&Fs[w]; RR.push_back(r); MM.push_back(m); note(m); } };
    auto fitsS=[&](size_t i)->bool{ const BS& rm=ST2M[i]; int c=0; for(int w=0;w<8;w++) c+=__builtin_popcountll(rm[w]&F[w]); return c>=3; };
    const bool inc = d>=1 && r2ok[d-1] && !seq.empty() && !lp->r2mark.empty();
    if(inc){ gR2inc++; int x=vecOf[seq.back()]; const std::vector<int32_t>& PR=r2row[d-1]; const auto& PM=r2msk[d-1];
      const bool xin=(misF[d-1][x>>6]>>(x&63))&1 && misValid[d-1];
      for(size_t i=0;i<PR.size();i++){ const BS& pm=PM[i]; if(i+PFD<PR.size()) __builtin_prefetch(RP+PR[i+PFD]);
        if(xin){ if((pm[x>>6]>>(x&63))&1) continue; } else if(RP[PR[i]]!=2) continue;   // a row through x has residual 1 now
        BS m; int c=0; for(int w=0;w<8;w++){ m[w]=pm[w]&F[w]; c+=__builtin_popcountll(m[w]); } if(c>=3){ for(int w=0;w<8;w++) m[w]=pm[w]&Fs[w]; RR.push_back(PR[i]); MM.push_back(m); note(m); } }
      { const int32_t* RL=lp->res2.data(); const size_t i0=lp->r2mark.back(), i1=lp->res2.size();   // prof7L50: prefetch PFD rows ahead
        for(size_t i=i0;i<std::min(i1,i0+PFD);i++){ __builtin_prefetch(&RMASK[RL[i]]); __builtin_prefetch(RP+RL[i]); }
        for(size_t i=i0;i<i1;i++){ if(i+PFD<i1){ __builtin_prefetch(&RMASK[RL[i+PFD]]); __builtin_prefetch(RP+RL[i+PFD]); } int32_t r=RL[i]; if(RP[r]==2 && fits(r)) take(r); } } }
    else { gR2full++;   // prof7L90: as in r2scanAlive
      const int32_t* RL=lp->res2.data(); const size_t n2=lp->res2.size();
      for(size_t i=0;i<n2;i++){ if(i+PFD<n2){ __builtin_prefetch(&RMASK[RL[i+PFD]]); __builtin_prefetch(RP+RL[i+PFD]); } int32_t r=RL[i]; if(RP[r]==2 && fits(r)) take(r); }
      const int32_t* SL=ST2ROW.data(); const size_t ns=ST2ROW.size();
      for(size_t i=0;i<ns;i++){ if(i+PFD<ns) __builtin_prefetch(RP+SL[i+PFD]); int32_t r=SL[i]; if(RP[r]==2 && fitsS(i)) takeS(r,i); } }
    r2ok[d]=true; gR2rows+=RR.size(); r2idxD=-1; }
  void r2index(int d){   // rows through each point (CSR), built on first use at this node
    const auto& MM=r2msk[d]; int cnt[513]={0};
    for(const BS& m:MM) for(int w=0;w<8;w++){ uint64_t x=m[w]; while(x){ cnt[w*64+__builtin_ctzll(x)]++; x&=x-1; } }
    r2start[0]=0; for(int u=0;u<512;u++) r2start[u+1]=r2start[u]+cnt[u]; r2list.resize(r2start[512]); int pos[512]; for(int u=0;u<512;u++) pos[u]=r2start[u];
    for(size_t i=0;i<MM.size();i++){ const BS& m=MM[i]; for(int w=0;w<8;w++){ uint64_t x=m[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; r2list[pos[u]++]=(int)i; } } }
    r2idxD=d; }
  bool r2apply(int d,int u,const BS& Fu){ bool any=false; const auto& MM=r2msk[d];
    for(int k=r2start[u];k<r2start[u+1];k++){ const BS& m=MM[r2list[k]]; BS mr; int c=0; for(int w=0;w<8;w++){ mr[w]=m[w]&Fu[w]; c+=__builtin_popcountll(mr[w]); } if(c<2) continue; any=true;
      for(int w=0;w<8;w++){ uint64_t x=mr[w]; while(x){ int v=w*64+__builtin_ctzll(x); x&=x-1;
        if(!svMark[v]){ svMark[v]=1; svIdx[nsv++]=v; svConf[v]=mconf[v]; } for(int q=0;q<8;q++) mconf[v][q]|=mr[q]; mconf[v][v>>6]&=~(1ULL<<(v&63)); } } }
    return any; }
  // prof7L45: rows through each point of the alive set A only (CSR in r2start2/r2list2), one pass over the row masks
  std::vector<int> r2list2; int r2start2[513];
  void r2indexAlive(int d,const BS& A){ const auto& MM=r2msk[d]; int cnt[513]={0};
    for(const BS& m:MM){ for(int w=0;w<8;w++){ uint64_t x=m[w]&A[w]; while(x){ cnt[w*64+__builtin_ctzll(x)]++; x&=x-1; } } }
    r2start2[0]=0; for(int u=0;u<512;u++) r2start2[u+1]=r2start2[u]+cnt[u]; r2list2.resize(r2start2[512]); int pos[512]; for(int u=0;u<512;u++) pos[u]=r2start2[u];
    for(size_t i=0;i<MM.size();i++){ const BS& m=MM[i]; for(int w=0;w<8;w++){ uint64_t x=m[w]&A[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; r2list2[pos[u]++]=(int)i; } } } }
  bool r2apply2(int d,int u,const BS& Fu){ bool any=false; const auto& MM=r2msk[d];
    for(int k=r2start2[u];k<r2start2[u+1];k++){ const BS& m=MM[r2list2[k]]; BS mr; int c=0; for(int w=0;w<8;w++){ mr[w]=m[w]&Fu[w]; c+=__builtin_popcountll(mr[w]); } if(c<2) continue; any=true;
      for(int w=0;w<8;w++){ uint64_t x=mr[w]; while(x){ int v=w*64+__builtin_ctzll(x); x&=x-1;
        if(!svMark[v]){ svMark[v]=1; svIdx[nsv++]=v; svConf[v]=mconf[v]; } for(int q=0;q<8;q++) mconf[v][q]|=mr[q]; mconf[v][v>>6]&=~(1ULL<<(v&63)); } } }
    return any; }
  bool r2apply3(int d,int u,const BS& Fu){ bool any=false; const auto& MM=r2msk[d];   // prof7L46: rows from alv[u]
    for(int idx:alv[u]){ const BS& m=MM[idx]; BS mr; int c=0; for(int w=0;w<8;w++){ mr[w]=m[w]&Fu[w]; c+=__builtin_popcountll(mr[w]); } if(c<2) continue; any=true;
      for(int w=0;w<8;w++){ uint64_t x=mr[w]; while(x){ int v=w*64+__builtin_ctzll(x); x&=x-1;
        if(!svMark[v]){ svMark[v]=1; svIdx[nsv++]=v; svConf[v]=mconf[v]; } for(int q=0;q<8;q++) mconf[v][q]|=mr[q]; mconf[v][v>>6]&=~(1ULL<<(v&63)); } } }
    return any; }
  // prof7L51: node-local coordinates (set by misCheck for its F): bit i = the i-th point of F in vector order
  alignas(64) uint64_t mcx[512*8]; uint64_t Fsel[8]; int Foff[9]; int nC=0, WC=1;   // mcx: row v at mcx+v*WC (stride WC words)
  alignas(64) uint64_t svC[512][8]; int svIdxC[512]; uint8_t svMarkC[512]={0}; int nsvC=0;
  std::vector<uint64_t,AAlloc<uint64_t>> AMkC;   // prof7L90: 64-byte aligned; row masks in node-local coordinates, WC words each
  std::vector<int32_t> AMkR;   // prof7R3: the kept row of each AMkC entry (cover rows of the pass-2 kills)
  std::vector<int32_t> cap6R;   // prof7R3: the kept row of each captured big residual-2 row (crow's rows)
  std::unique_ptr<xpeel::NodeCtx> xpN; xpeel::BS xpF{};   // prof7R3k: the node's bulk-peel context (built at the first eligible child), F0 in labels
  fkx::Gen fk; std::vector<int> fkLoc; std::vector<int32_t> r2R; long long fkSeenM=0; std::vector<double> fkS1, fkS2; std::unordered_set<int32_t> fkUsed1, fkUsed2;   // prof7R3: Farkas generator, vector -> local index, the node's residual-2 rows cited by certificates
  void cset(const BS& F){ int o=0; for(int w=0;w<8;w++){ Fsel[w]=F[w]; Foff[w]=o; o+=__builtin_popcountll(F[w]); } Foff[8]=o; nC=o; WC=o<=64?1:o<=128?2:o<=256?4:8; }
  inline void comp(const BS& X,uint64_t* out) const { for(int k=0;k<8;k++) out[k]=0;
    for(int w=0;w<8;w++){ if(!Fsel[w]) continue; uint64_t b=_pext_u64(X[w],Fsel[w]); int o=Foff[w], q=o>>6, r=o&63; out[q]|=b<<r; if(r && q<7) out[q+1]|=b>>(64-r); } }
  inline int cidx(int u) const { return Foff[u>>6]+__builtin_popcountll(Fsel[u>>6]&((1ULL<<(u&63))-1)); }
  template<int W> void mexpC(std::array<uint64_t,W> P,int size){   // mexp in node-local coordinates (same orders, same counts)
    mNodes++; if(mBest>=mStop || mNodes>mLim) return;
    auto nz=[](const std::array<uint64_t,W>& X){ for(int k=0;k<W;k++) if(X[k]) return true; return false; };
    int order[512], col[512], no=0, c=0; std::array<uint64_t,W> U=P;
    while(nz(U)){ c++; std::array<uint64_t,W> Q=U;
      while(nz(Q)){ int w=0; while(!Q[w]) w++; int v=w*64+__builtin_ctzll(Q[w]); Q[w]&=Q[w]-1; U[w]&=~(1ULL<<(v&63)); order[no]=v; col[no]=c; no++;
        const uint64_t* mv=mcx+v*W; for(int k=0;k<W;k++) Q[k]&=mv[k]; } }
    for(int i=no-1;i>=0;i--){ if(size+col[i]<=mBest || mBest>=mStop || mNodes>mLim) return;
      int v=order[i]; std::array<uint64_t,W> NP; const uint64_t* mv=mcx+v*W; for(int k=0;k<W;k++) NP[k]=P[k]&~mv[k]; NP[v>>6]&=~(1ULL<<(v&63));
      if(!nz(NP)){ if(size+1>mBest) mBest=size+1; } else mexpC<W>(NP,size+1);
      P[v>>6]&=~(1ULL<<(v&63)); } }
  void mexpCX(const uint64_t* P){ switch(WC){
      case 1: { std::array<uint64_t,1> a{P[0]}; mexpC<1>(a,0); break; }
      case 2: { std::array<uint64_t,2> a{P[0],P[1]}; mexpC<2>(a,0); break; }
      case 4: { std::array<uint64_t,4> a{P[0],P[1],P[2],P[3]}; mexpC<4>(a,0); break; }
      default: { std::array<uint64_t,8> a; for(int k=0;k<8;k++) a[k]=P[k]; mexpC<8>(a,0); } } }
  template<int W> bool r2apply4CT(int u,const uint64_t* Fuc){ bool any=false;   // prof7L90: fixed word count, plain loads and stores (masked stores defeat store forwarding)
    const uint64_t* AK=AMkC.data();
    const std::vector<int>& AL=alv[u]; const size_t nA=AL.size();
    for(size_t ai=0;ai<nA;ai++){ if(ai+R2PF<nA) __builtin_prefetch(AK+(size_t)AL[ai+R2PF]*W); const uint64_t* m=AK+(size_t)AL[ai]*W; uint64_t mr[W]; int c=0; for(int w=0;w<W;w++){ mr[w]=m[w]&Fuc[w]; c+=__builtin_popcountll(mr[w]); } if(c<2) continue; any=true;
      for(int w=0;w<W;w++){ uint64_t x=mr[w]; while(x){ int v=w*64+__builtin_ctzll(x); x&=x-1; uint64_t* mv=mcx+v*W;
        if(!svMarkC[v]){ svMarkC[v]=1; svIdxC[nsvC++]=v; for(int q=0;q<W;q++) svC[v][q]=mv[q]; } for(int q=0;q<W;q++) mv[q]|=mr[q]; mv[v>>6]&=~(1ULL<<(v&63)); } } }
    return any; }
  bool r2apply4C(int u,const uint64_t* Fuc){   // prof7L51: r2apply4 in node-local coordinates (on mcx)
    switch(WC){ case 1: return r2apply4CT<1>(u,Fuc); case 2: return r2apply4CT<2>(u,Fuc); case 4: return r2apply4CT<4>(u,Fuc); default: return r2apply4CT<8>(u,Fuc); } }
  int ptsN[512]; int nDef=0; int defXn[512], defDn[512]; uint64_t defHc[512][8];   // prof7L61: the node's deficient hyperplanes (delta >= 2), node-local H_X
  // prof7L62: joint deficit search.  dsearch(P,t,u): is there an independent S in P, |S| = t, with |S n H_X| >= delta_X - <u,X> for every
  // listed X (u = -1 at the node)?  1 = yes (or over the node limit), 0 = no.
  int8_t dcur[576]; int nDefP=0; std::vector<uint8_t,AAlloc<uint8_t>> hv8; std::vector<uint64_t,AAlloc<uint64_t>> defHs; long long dNodes=0; bool dFound=false, dAbort=false; int dT=0;   // prof7L71: int8 deficits, padded to nDefP
  long long dLim=500;
  bool defFail(const uint64_t* P,int rem) const {   // prof7L72: true iff some dcur[i] > rem, or some dcur[i] > |P & H_i| (padding: dcur -100, H 0)
#if defined(__AVX512F__) && defined(__AVX512VPOPCNTDQ__)
    const __m512i R=_mm512_set1_epi64(rem); const uint64_t* H=defHs.data();
    for(int i0=0;i0<nDefP;i0+=8){
      __m512i d=_mm512_cvtepi8_epi64(_mm_loadl_epi64((const __m128i*)&dcur[i0])), acc=_mm512_setzero_si512();
      for(int k=0;k<WC;k++) acc=_mm512_add_epi64(acc,_mm512_popcnt_epi64(_mm512_and_si512(_mm512_set1_epi64((long long)P[k]),_mm512_loadu_si512((const void*)(H+(size_t)k*nDefP+i0)))));
      if(_mm512_cmpgt_epi64_mask(d,R) | _mm512_cmplt_epi64_mask(acc,d)) return true; }
    return false;
#else
    { int8_t mx8=-128; for(int i=0;i<nDefP;i++) mx8=std::max(mx8,dcur[i]); if(mx8>rem) return true; }
    for(int i=0;i<nDef;i++){ int dl=dcur[i]; if(dl<=0) continue; int c=0; for(int k=0;k<WC;k++) c+=__builtin_popcountll(P[k]&defHc[i][k]); if(c<dl) return true; }
    return false;
#endif
  }
  template<int W> bool defFailT(const uint64_t* P,int rem) const {   // prof7L90: fixed word count (one copy per WC)   // prof7L72: true iff some dcur[i] > rem, or some dcur[i] > |P & H_i| (padding: dcur -100, H 0)
#if defined(__AVX512F__) && defined(__AVX512VPOPCNTDQ__)
    const __m512i R=_mm512_set1_epi64(rem); const uint64_t* H=defHs.data();
    for(int i0=0;i0<nDefP;i0+=8){
      __m512i d=_mm512_cvtepi8_epi64(_mm_loadl_epi64((const __m128i*)&dcur[i0])), acc=_mm512_setzero_si512();
      for(int k=0;k<W;k++) acc=_mm512_add_epi64(acc,_mm512_popcnt_epi64(_mm512_and_si512(_mm512_set1_epi64((long long)P[k]),_mm512_loadu_si512((const void*)(H+(size_t)k*nDefP+i0)))));
      if(_mm512_cmpgt_epi64_mask(d,R) | _mm512_cmplt_epi64_mask(acc,d)) return true; }
    return false;
#else
    { int8_t mx8=-128; for(int i=0;i<nDefP;i++) mx8=std::max(mx8,dcur[i]); if(mx8>rem) return true; }
    for(int i=0;i<nDef;i++){ int dl=dcur[i]; if(dl<=0) continue; int c=0; for(int k=0;k<W;k++) c+=__builtin_popcountll(P[k]&defHc[i][k]); if(c<dl) return true; }
    return false;
#endif
  }
  int dsearch(const uint64_t* P,int t,int u,long long lim=-1){ int mx=0; dLim=lim<0?DLIM:lim;   // 0 = no such set, 1 = found, 2 = over the limit (prof7L63)
    for(int i=0;i<nDef;i++){ dcur[i]=defDn[i]-(u>=0?ip(u,defXn[i]):0); if(dcur[i]>mx) mx=dcur[i]; } for(int i=nDef;i<nDefP;i++) dcur[i]=-100;
    if(mx>t) return 0; dNodes=0; dFound=false; dAbort=false; dT=t;
    uint64_t Pc[8]; for(int k=0;k<8;k++) Pc[k]=(k<WC)?P[k]:0;
    switch(WC){ case 1: drecT<1>(Pc,0); break; case 2: drecT<2>(Pc,0); break; case 4: drecT<4>(Pc,0); break; default: drecT<8>(Pc,0); }   // prof7L90
    return dFound?1:(dAbort?2:0); }
  void drec(const uint64_t* P,int size){
    if(dFound||dAbort) return; if(++dNodes>dLim){ dAbort=true; return; }
    int rem=dT-size, sumNeed=0;
    if(defFail(P,rem)) return;
    if(rem==0){ dFound=true; return; }
    uint64_t U[8], Pl[8]; for(int k=0;k<WC;k++){ U[k]=P[k]; Pl[k]=P[k]; }
    int order[512], col[512], no=0, c=0;
    auto nz=[&](const uint64_t* X){ for(int k=0;k<WC;k++) if(X[k]) return true; return false; };
    while(nz(U)){ c++; uint64_t Q[8]; for(int k=0;k<WC;k++) Q[k]=U[k];
      while(nz(Q)){ int w=0; while(!Q[w]) w++; int v=w*64+__builtin_ctzll(Q[w]); Q[w]&=Q[w]-1; U[w]&=~(1ULL<<(v&63)); order[no]=v; col[no]=c; no++;
        const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) Q[k]&=mv[k]; } }
    for(int i=no-1;i>=0;i--){ if(size+col[i]<dT || dFound || dAbort) return;
      int v=order[i]; int pv=ptsN[v]; uint64_t NP[8]; const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) NP[k]=Pl[k]&~mv[k]; NP[v>>6]&=~(1ULL<<(v&63));
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]-=hh[j]; }
      drec(NP,size+1);
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]+=hh[j]; }
      Pl[v>>6]&=~(1ULL<<(v&63)); } }
  template<int W> void drecT(const uint64_t* P,int size){   // prof7L90: drec with a fixed word count
    if(dFound||dAbort) return; if(++dNodes>dLim){ dAbort=true; return; }
    int rem=dT-size, sumNeed=0;
    if(defFailT<W>(P,rem)) return;
    if(rem==0){ dFound=true; return; }
    uint64_t U[8], Pl[8]; for(int k=0;k<W;k++){ U[k]=P[k]; Pl[k]=P[k]; }
    int order[512], col[512], no=0, c=0;
    auto nz=[&](const uint64_t* X){ for(int k=0;k<W;k++) if(X[k]) return true; return false; };
    while(nz(U)){ c++; uint64_t Q[8]; for(int k=0;k<W;k++) Q[k]=U[k];
      while(nz(Q)){ int w=0; while(!Q[w]) w++; int v=w*64+__builtin_ctzll(Q[w]); Q[w]&=Q[w]-1; U[w]&=~(1ULL<<(v&63)); order[no]=v; col[no]=c; no++;
        const uint64_t* mv=mcx+v*W; for(int k=0;k<W;k++) Q[k]&=mv[k]; } }
    for(int i=no-1;i>=0;i--){ if(size+col[i]<dT || dFound || dAbort) return;
      int v=order[i]; int pv=ptsN[v]; uint64_t NP[8]; const uint64_t* mv=mcx+v*W; for(int k=0;k<W;k++) NP[k]=Pl[k]&~mv[k]; NP[v>>6]&=~(1ULL<<(v&63));
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]-=hh[j]; }
      drecT<W>(NP,size+1);
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]+=hh[j]; }
      Pl[v>>6]&=~(1ULL<<(v&63)); } }
  // prof7L65: residual-2 rows of the node (>= 3 points in F), node-local masks crow (WC words each) and rows through each point cvr
  std::vector<uint64_t> crow; std::vector<int> cvr[512]; std::vector<uint8_t> ccnt; int crN=0;
  // prof7L66: captured rows (node-local, WC words), flat point index cS0/cL0, lazy active rows
  std::vector<uint64_t,AAlloc<uint64_t>> cap6; int capN=0; bool capOn=false; std::vector<int32_t> cS0, cL0; std::vector<uint32_t> cStamp; std::vector<uint8_t> cCnt2; uint32_t cCur=0;
  std::vector<uint64_t> tmat; int tN=0, tW=1;   // prof7L67: pair table, tN points x tN points x tW words
  std::vector<int> bigR; std::vector<int> bigV[512]; std::vector<uint8_t> bigC;   // prof7L68: big rows (index into cap6), per point
  void tBuild(){ tN=nC; tW=WC; tmat.assign((size_t)tN*tN*tW,0); int pts[512]; bigR.clear(); for(int j=0;j<nC;j++) bigV[j].clear();
    for(int i=0;i<capN;i++){ const uint64_t* rr=&cap6[(size_t)i*WC]; int k=0; for(int w=0;w<WC;w++){ uint64_t x=rr[w]; while(x){ pts[k++]=w*64+__builtin_ctzll(x); x&=x-1; } }
      if(k<CRKMIN) continue;   // prof7L68: --crowkmin: rows with fewer points in F left out (measurement)
      if(k>CRK){ int b=(int)bigR.size(); bigR.push_back(i); for(int a=0;a<k;a++) bigV[pts[a]].push_back(b); continue; }
      for(int a=0;a<k;a++){ uint64_t* ta=&tmat[(size_t)pts[a]*tN*tW]; for(int b=0;b<k;b++){ if(a==b) continue; uint64_t* tb=ta+(size_t)pts[b]*tW; for(int w=0;w<tW;w++) tb[w]|=rr[w]; } } }
    bigC.assign(bigR.size(),0); gCRbig+=bigR.size(); }
  void crecT(const uint64_t* P,int size){   // drec + the pair table (residual-2 rows, <= 2 new points each)
    if(dFound||dAbort) return; if(++dNodes>dLim){ dAbort=true; return; }
    int rem=dT-size;
    if(defFail(P,rem)) return;
    if(rem==0){ dFound=true; return; }
    uint64_t U[8], Pl[8]; for(int k=0;k<WC;k++){ U[k]=P[k]; Pl[k]=P[k]; }
    int order[512], col[512], no=0, c=0;
    auto nz=[&](const uint64_t* X){ for(int k=0;k<WC;k++) if(X[k]) return true; return false; };
    while(nz(U)){ c++; uint64_t Q[8]; for(int k=0;k<WC;k++) Q[k]=U[k];
      while(nz(Q)){ int w=0; while(!Q[w]) w++; int v=w*64+__builtin_ctzll(Q[w]); Q[w]&=Q[w]-1; U[w]&=~(1ULL<<(v&63)); order[no]=v; col[no]=c; no++;
        const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) Q[k]&=mv[k]; } }
    for(int i=no-1;i>=0;i--){ if(size+col[i]<dT || dFound || dAbort) return;
      int v=order[i]; int pv=ptsN[v]; uint64_t NP[8]; const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) NP[k]=Pl[k]&~mv[k]; NP[v>>6]&=~(1ULL<<(v&63));
      for(int a=0;a<size;a++){ const uint64_t* tp=&tmat[((size_t)pick[a]*tN+v)*tW]; for(int k=0;k<WC;k++) NP[k]&=~tp[k]; }
      for(int b:bigV[v]) if(++bigC[b]==2){ const uint64_t* rr=&cap6[(size_t)bigR[b]*WC]; for(int k=0;k<WC;k++) NP[k]&=~rr[k]; }
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]-=hh[j]; }
      pick[size]=v; crecT(NP,size+1);
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]+=hh[j]; }
      for(int b:bigV[v]) bigC[b]--;
      Pl[v>>6]&=~(1ULL<<(v&63)); } }
  // prof7L70
  int bNb=0, bW=1; std::vector<uint64_t,AAlloc<uint64_t>> rowsof, bOnce, bTwice; std::vector<int> bRow;
  void bBuild(){ bRow.clear(); for(int i=0;i<capN;i++){ const uint64_t* rr=&cap6[(size_t)i*WC]; int c=0; for(int w=0;w<WC;w++) c+=__builtin_popcountll(rr[w]); if(c>=CRKMIN) bRow.push_back(i); }
    bNb=(int)bRow.size(); bW=std::max(1,(bNb+63)>>6); rowsof.assign((size_t)nC*bW,0);
    for(int b=0;b<bNb;b++){ const uint64_t* rr=&cap6[(size_t)bRow[b]*WC]; for(int w=0;w<WC;w++){ uint64_t x=rr[w]; while(x){ int v=w*64+__builtin_ctzll(x); x&=x-1; rowsof[(size_t)v*bW+(b>>6)]|=1ULL<<(b&63); } } }
    bOnce.assign((size_t)33*bW,0); bTwice.assign((size_t)33*bW,0); gCRbig+=bNb; }
  void crecB(const uint64_t* P,int size){   // drec + big rows as row bitsets (<= 2 new points each)
    if(dFound||dAbort) return; if(++dNodes>dLim){ dAbort=true; return; }
    int rem=dT-size;
    if(defFail(P,rem)) return;
    if(rem==0){ dFound=true; return; }
    uint64_t U[8], Pl[8]; for(int k=0;k<WC;k++){ U[k]=P[k]; Pl[k]=P[k]; }
    int order[512], col[512], no=0, c=0;
    auto nz=[&](const uint64_t* X){ for(int k=0;k<WC;k++) if(X[k]) return true; return false; };
    while(nz(U)){ c++; uint64_t Q[8]; for(int k=0;k<WC;k++) Q[k]=U[k];
      while(nz(Q)){ int w=0; while(!Q[w]) w++; int v=w*64+__builtin_ctzll(Q[w]); Q[w]&=Q[w]-1; U[w]&=~(1ULL<<(v&63)); order[no]=v; col[no]=c; no++;
        const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) Q[k]&=mv[k]; } }
    const uint64_t* o0=&bOnce[(size_t)size*bW]; const uint64_t* t0=&bTwice[(size_t)size*bW]; uint64_t* o1=&bOnce[(size_t)(size+1)*bW]; uint64_t* t1=&bTwice[(size_t)(size+1)*bW];
    for(int i=no-1;i>=0;i--){ if(size+col[i]<dT || dFound || dAbort) return;
      int v=order[i]; int pv=ptsN[v]; uint64_t NP[8]; const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) NP[k]=Pl[k]&~mv[k]; NP[v>>6]&=~(1ULL<<(v&63));
      const uint64_t* rv=&rowsof[(size_t)v*bW];
      for(int w=0;w<bW;w++){ uint64_t nw=o0[w]&rv[w]&~t0[w]; t1[w]=t0[w]|nw; o1[w]=o0[w]|rv[w];
        while(nw){ int b=w*64+__builtin_ctzll(nw); nw&=nw-1; const uint64_t* rr=&cap6[(size_t)bRow[b]*WC]; for(int k=0;k<WC;k++) NP[k]&=~rr[k]; } }
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]-=hh[j]; }
      crecB(NP,size+1);
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]+=hh[j]; }
      Pl[v>>6]&=~(1ULL<<(v&63)); } }
  template<int W> void crecBT(const uint64_t* P,int size){   // prof7L90: crecB with a fixed word count   // drec + big rows as row bitsets (<= 2 new points each)
    if(dFound||dAbort) return; if(++dNodes>dLim){ dAbort=true; return; }
    int rem=dT-size;
    if(defFailT<W>(P,rem)) return;
    if(rem==0){ dFound=true; return; }
    uint64_t U[8], Pl[8]; for(int k=0;k<W;k++){ U[k]=P[k]; Pl[k]=P[k]; }
    int order[512], col[512], no=0, c=0;
    auto nz=[&](const uint64_t* X){ for(int k=0;k<W;k++) if(X[k]) return true; return false; };
    while(nz(U)){ c++; uint64_t Q[8]; for(int k=0;k<W;k++) Q[k]=U[k];
      while(nz(Q)){ int w=0; while(!Q[w]) w++; int v=w*64+__builtin_ctzll(Q[w]); Q[w]&=Q[w]-1; U[w]&=~(1ULL<<(v&63)); order[no]=v; col[no]=c; no++;
        const uint64_t* mv=mcx+v*W; for(int k=0;k<W;k++) Q[k]&=mv[k]; } }
    const uint64_t* o0=&bOnce[(size_t)size*bW]; const uint64_t* t0=&bTwice[(size_t)size*bW]; uint64_t* o1=&bOnce[(size_t)(size+1)*bW]; uint64_t* t1=&bTwice[(size_t)(size+1)*bW];
    for(int i=no-1;i>=0;i--){ if(size+col[i]<dT || dFound || dAbort) return;
      int v=order[i]; int pv=ptsN[v]; uint64_t NP[8]; const uint64_t* mv=mcx+v*W; for(int k=0;k<W;k++) NP[k]=Pl[k]&~mv[k]; NP[v>>6]&=~(1ULL<<(v&63));
      const uint64_t* rv=&rowsof[(size_t)v*bW];
      for(int w=0;w<bW;w++){ uint64_t nw=o0[w]&rv[w]&~t0[w]; t1[w]=t0[w]|nw; o1[w]=o0[w]|rv[w];
        while(nw){ int b=w*64+__builtin_ctzll(nw); nw&=nw-1; const uint64_t* rr=&cap6[(size_t)bRow[b]*W]; for(int k=0;k<W;k++) NP[k]&=~rr[k]; } }
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]-=hh[j]; }
      crecBT<W>(NP,size+1);
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]+=hh[j]; }
      Pl[v>>6]&=~(1ULL<<(v&63)); } }
  int crowTestB(const uint64_t* Fuc,int t,int u){
    int mx=0; for(int i=0;i<nDef;i++){ dcur[i]=defDn[i]-ip(u,defXn[i]); if(dcur[i]>mx) mx=dcur[i]; } for(int i=nDef;i<nDefP;i++) dcur[i]=-100; if(mx>t) return 0;
    for(int w=0;w<bW;w++){ bOnce[w]=0; bTwice[w]=0; }
    dNodes=0; dFound=false; dAbort=false; dT=t; dLim=CRLIM; uint64_t Pc[8]; for(int k=0;k<8;k++) Pc[k]=(k<WC)?Fuc[k]:0;
    switch(WC){ case 1: crecBT<1>(Pc,0); break; case 2: crecBT<2>(Pc,0); break; case 4: crecBT<4>(Pc,0); break; default: crecBT<8>(Pc,0); }   // prof7L90
    return dFound?1:(dAbort?2:0); }
  int crowTestT(const uint64_t* Fuc,int t,int u){   // 0 = no completion, 1 = found, 2 = over the limit
    int mx=0; for(int i=0;i<nDef;i++){ dcur[i]=defDn[i]-ip(u,defXn[i]); if(dcur[i]>mx) mx=dcur[i]; } for(int i=nDef;i<nDefP;i++) dcur[i]=-100; if(mx>t) return 0;
    dNodes=0; dFound=false; dAbort=false; dT=t; dLim=CRLIM; uint64_t Pc[8]; for(int k=0;k<8;k++) Pc[k]=(k<WC)?Fuc[k]:0;
    crecT(Pc,0); return dFound?1:(dAbort?2:0); }
  int actN=0; uint64_t actM[64][8]; uint8_t actC[64]; int pick[32]; int restartRow=-1;
  void capIndex(){ cS0.assign(nC+1,0); for(int i=0;i<capN;i++){ const uint64_t* rr=&cap6[(size_t)i*WC]; for(int k=0;k<WC;k++){ uint64_t x=rr[k]; while(x){ cS0[k*64+__builtin_ctzll(x)+1]++; x&=x-1; } } }
    for(int j=0;j<nC;j++) cS0[j+1]+=cS0[j]; cL0.resize(cS0[nC]); std::vector<int32_t> pos(cS0.begin(),cS0.end()-1);
    for(int i=0;i<capN;i++){ const uint64_t* rr=&cap6[(size_t)i*WC]; for(int k=0;k<WC;k++){ uint64_t x=rr[k]; while(x){ cL0[pos[k*64+__builtin_ctzll(x)]++]=i; x&=x-1; } } }
    if((int)cStamp.size()<capN){ cStamp.assign(capN,0); cCnt2.assign(capN,0); cCur=0; } }
  int checkS(int t){   // a captured row holding >= 3 points of the picked set, or -1
    if(++cCur==0){ std::fill(cStamp.begin(),cStamp.end(),0); cCur=1; }
    for(int a=0;a<t;a++){ int v=pick[a]; for(int k=cS0[v];k<cS0[v+1];k++){ int r=cL0[k]; if(cStamp[r]!=cCur){ cStamp[r]=cCur; cCnt2[r]=0; } if(++cCnt2[r]>=3) return r; } }
    return -1; }
  void crecL(const uint64_t* P,int size){   // drec + the active rows (<= 2 new points each); a full set is checked against all captured rows
    if(dFound||dAbort||restartRow>=0) return; if(++dNodes>dLim){ dAbort=true; return; }
    int rem=dT-size;
    if(defFail(P,rem)) return;
    if(rem==0){ int r=checkS(size); if(r<0) dFound=true; else restartRow=r; return; }
    uint64_t U[8], Pl[8]; for(int k=0;k<WC;k++){ U[k]=P[k]; Pl[k]=P[k]; }
    int order[512], col[512], no=0, c=0;
    auto nz=[&](const uint64_t* X){ for(int k=0;k<WC;k++) if(X[k]) return true; return false; };
    while(nz(U)){ c++; uint64_t Q[8]; for(int k=0;k<WC;k++) Q[k]=U[k];
      while(nz(Q)){ int w=0; while(!Q[w]) w++; int v=w*64+__builtin_ctzll(Q[w]); Q[w]&=Q[w]-1; U[w]&=~(1ULL<<(v&63)); order[no]=v; col[no]=c; no++;
        const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) Q[k]&=mv[k]; } }
    for(int i=no-1;i>=0;i--){ if(size+col[i]<dT || dFound || dAbort || restartRow>=0) return;
      int v=order[i]; int pv=ptsN[v]; uint64_t NP[8]; const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) NP[k]=Pl[k]&~mv[k]; NP[v>>6]&=~(1ULL<<(v&63));
      for(int a=0;a<actN;a++) if((actM[a][v>>6]>>(v&63))&1){ if(++actC[a]==2) for(int k=0;k<WC;k++) NP[k]&=~actM[a][k]; }
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]-=hh[j]; }
      pick[size]=v; crecL(NP,size+1);
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]+=hh[j]; }
      for(int a=0;a<actN;a++) if((actM[a][v>>6]>>(v&63))&1) actC[a]--;
      Pl[v>>6]&=~(1ULL<<(v&63)); } }
  int crowTestL(const uint64_t* Fuc,int t,int u){   // 0 = no completion, 1 = found, 2 = over a limit
    actN=0; long long used=0;
    for(int it=0;it<=CRITER;it++){
      int mx=0; for(int i=0;i<nDef;i++){ dcur[i]=defDn[i]-ip(u,defXn[i]); if(dcur[i]>mx) mx=dcur[i]; } for(int i=nDef;i<nDefP;i++) dcur[i]=-100; if(mx>t) return 0;
      for(int a=0;a<actN;a++) actC[a]=0;
      dNodes=0; dFound=false; dAbort=false; restartRow=-1; dT=t; dLim=CRLIM-used; if(dLim<=0) return 2; uint64_t Pc[8]; for(int k=0;k<8;k++) Pc[k]=(k<WC)?Fuc[k]:0;
      crecL(Pc,0); used+=dNodes;
      if(dFound) return 1; if(dAbort) return 2;
      if(restartRow<0) return 0;   // searched to the end: no completion
      if(actN>=64) return 2;
      const uint64_t* rr=&cap6[(size_t)restartRow*WC]; for(int k=0;k<8;k++) actM[actN][k]=(k<WC)?rr[k]:0; actN++; gCRa++; }
    return 2; }
  void crowBuild(const BS& F){ crow.clear(); crN=0; const int8_t* RP=lp->resP.data();
    auto addrow=[&](int32_t r){ if(RP[r]!=2) return; const BS& rm=RMASK[r]; BS m; int c=0; for(int w=0;w<8;w++){ m[w]=rm[w]&F[w]; c+=__builtin_popcountll(m[w]); } if(c<3) return;
      uint64_t t[8]; comp(m,t); crow.insert(crow.end(),t,t+WC); crN++; };
    { const int32_t* RL=lp->res2.data(); const size_t n1=lp->res2.size();
      for(size_t i=0;i<n1;i++){ if(i+PFD<n1){ __builtin_prefetch(&RMASK[RL[i+PFD]]); __builtin_prefetch(RP+RL[i+PFD]); } addrow(RL[i]); } }
    for(int32_t r:ST2ROW) addrow(r);
    for(int j=0;j<nC;j++) cvr[j].clear();
    for(int i=0;i<crN;i++){ const uint64_t* rr=&crow[(size_t)i*WC]; for(int k=0;k<WC;k++){ uint64_t x=rr[k]; while(x){ cvr[k*64+__builtin_ctzll(x)].push_back(i); x&=x-1; } } }
    ccnt.assign(crN,0); }
  void crec2(const uint64_t* P,int size){   // drec + the residual-2 rows (<= 2 new points each)
    if(dFound||dAbort) return; if(++dNodes>dLim){ dAbort=true; return; }
    int rem=dT-size;
    if(defFail(P,rem)) return;
    if(rem==0){ dFound=true; return; }
    uint64_t U[8], Pl[8]; for(int k=0;k<WC;k++){ U[k]=P[k]; Pl[k]=P[k]; }
    int order[512], col[512], no=0, c=0;
    auto nz=[&](const uint64_t* X){ for(int k=0;k<WC;k++) if(X[k]) return true; return false; };
    while(nz(U)){ c++; uint64_t Q[8]; for(int k=0;k<WC;k++) Q[k]=U[k];
      while(nz(Q)){ int w=0; while(!Q[w]) w++; int v=w*64+__builtin_ctzll(Q[w]); Q[w]&=Q[w]-1; U[w]&=~(1ULL<<(v&63)); order[no]=v; col[no]=c; no++;
        const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) Q[k]&=mv[k]; } }
    for(int i=no-1;i>=0;i--){ if(size+col[i]<dT || dFound || dAbort) return;
      int v=order[i]; int pv=ptsN[v]; uint64_t NP[8]; const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) NP[k]=Pl[k]&~mv[k]; NP[v>>6]&=~(1ULL<<(v&63));
      for(int r:cvr[v]) if(++ccnt[r]==2){ const uint64_t* rr=&crow[(size_t)r*WC]; for(int k=0;k<WC;k++) NP[k]&=~rr[k]; }
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]-=hh[j]; }
      crec2(NP,size+1);
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]+=hh[j]; }
      for(int r:cvr[v]) ccnt[r]--;
      Pl[v>>6]&=~(1ULL<<(v&63)); } }
  int crowTest(const uint64_t* Fuc,int t,int u){   // 0 = no completion, 1 = found, 2 = over the limit
    int mx=0; for(int i=0;i<nDef;i++){ dcur[i]=defDn[i]-ip(u,defXn[i]); if(dcur[i]>mx) mx=dcur[i]; } for(int i=nDef;i<nDefP;i++) dcur[i]=-100; if(mx>t) return 0;
    dNodes=0; dFound=false; dAbort=false; dT=t; dLim=CRLIM; uint64_t Pc[8]; for(int k=0;k<8;k++) Pc[k]=(k<WC)?Fuc[k]:0;
    crec2(Pc,0); return dFound?1:(dAbort?2:0); }
  void r2restoreC(){ for(int i=0;i<nsvC;i++){ int v=svIdxC[i]; uint64_t* mv=mcx+v*WC; for(int q=0;q<WC;q++) mv[q]=svC[v][q]; svMarkC[v]=0; } nsvC=0; }
  bool r2apply4(int u,const BS& Fu){ bool any=false;   // prof7L47: rows from alv[u] over AMk
    for(int idx:alv[u]){ const BS& m=AMk[idx]; BS mr; int c=0; for(int w=0;w<8;w++){ mr[w]=m[w]&Fu[w]; c+=__builtin_popcountll(mr[w]); } if(c<2) continue; any=true;
      for(int w=0;w<8;w++){ uint64_t x=mr[w]; while(x){ int v=w*64+__builtin_ctzll(x); x&=x-1;
        if(!svMark[v]){ svMark[v]=1; svIdx[nsv++]=v; svConf[v]=mconf[v]; } for(int q=0;q<8;q++) mconf[v][q]|=mr[q]; mconf[v][v>>6]&=~(1ULL<<(v&63)); } } }
    return any; }
  void r2restore(){ for(int i=0;i<nsv;i++){ int v=svIdx[i]; mconf[v]=svConf[v]; svMark[v]=0; } nsv=0; }
  // prof7L89 --tl2 (ported to prof7R3; in certificate mode its cuts are X kills of kind 6): the two-level screen of child u.  mcx holds u's residual-2 cliques (r2apply4C) while it runs.
  std::vector<uint64_t> xRowM, xRowsof, xOnce, xTwice; std::vector<int32_t> xIds; size_t nIds=0; int xN=0, xW=1;
  inline void xPush(const uint64_t* t){ xRowM.insert(xRowM.end(),t,t+WC); xN++; }
  void crecX(const uint64_t* P,int size){   // drec + the rows of xRowM (<= 2 new points each), as crecB
    if(dFound||dAbort) return; if(++dNodes>dLim){ dAbort=true; return; }
    int rem=dT-size;
    if(defFail(P,rem)) return;
    if(rem==0){ dFound=true; return; }
    uint64_t U[8], Pl[8]; for(int k=0;k<WC;k++){ U[k]=P[k]; Pl[k]=P[k]; }
    int order[512], col[512], no=0, c=0;
    auto nz=[&](const uint64_t* X){ for(int k=0;k<WC;k++) if(X[k]) return true; return false; };
    while(nz(U)){ c++; uint64_t Q[8]; for(int k=0;k<WC;k++) Q[k]=U[k];
      while(nz(Q)){ int w=0; while(!Q[w]) w++; int v=w*64+__builtin_ctzll(Q[w]); Q[w]&=Q[w]-1; U[w]&=~(1ULL<<(v&63)); order[no]=v; col[no]=c; no++;
        const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) Q[k]&=mv[k]; } }
    const uint64_t* o0=&xOnce[(size_t)size*xW]; const uint64_t* t0=&xTwice[(size_t)size*xW]; uint64_t* o1=&xOnce[(size_t)(size+1)*xW]; uint64_t* t1=&xTwice[(size_t)(size+1)*xW];
    for(int i=no-1;i>=0;i--){ if(size+col[i]<dT || dFound || dAbort) return;
      int v=order[i]; uint64_t NP[8]; const uint64_t* mv=mcx+v*WC; for(int k=0;k<WC;k++) NP[k]=Pl[k]&~mv[k]; NP[v>>6]&=~(1ULL<<(v&63));
      const uint64_t* rv=&xRowsof[(size_t)v*xW];
      for(int w=0;w<xW;w++){ uint64_t nw=o0[w]&rv[w]&~t0[w]; t1[w]=t0[w]|nw; o1[w]=o0[w]|rv[w];
        while(nw){ int b=w*64+__builtin_ctzll(nw); nw&=nw-1; const uint64_t* rr=&xRowM[(size_t)b*WC]; for(int k=0;k<WC;k++) NP[k]&=~rr[k]; } }
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]-=hh[j]; }
      crecX(NP,size+1);
      { const uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int j=0;j<nDefP;j++) dcur[j]+=hh[j]; }
      Pl[v>>6]&=~(1ULL<<(v&63)); } }
  int tlTest(const uint64_t* Fuc,int nu,int u,const BS& F,int d){   // 0 = the child has no completion, 1 = found or nothing to add, 2 = over the limit
    const unsigned long long c0=__rdtsc(); xRowM.clear(); xN=0; const int iu=cidx(u);
    if(capOn) for(int i=0;i<capN;i++){ const uint64_t* rr=&cap6[(size_t)i*WC]; if((rr[iu>>6]>>(iu&63))&1) continue;   // through u: a clique in mcx already
      uint64_t t[8]; int c=0; for(int q=0;q<WC;q++){ t[q]=rr[q]&Fuc[q]; c+=__builtin_popcountll(t[q]); } if(c<3) continue; xPush(t); }
    const int n2=xN;
    { BS Fu; const BS& Ab=ABOVE[lpx::lab[u]+1]; for(int k=0;k<8;k++) Fu[k]=F[k]&Ab[k]&~mconf[u][k];   // Fuc in 512-bit coordinates
      const int8_t* RP=lp->resP.data(); const int32_t* CRp=lpx::CR.data(); const int64_t k0=lpx::CS[u], k1=lpx::CS[u+1];
      const unsigned long long ca=__rdtsc(); if(xIds.size()<(size_t)(k1-k0)+16) xIds.resize((size_t)(k1-k0)+16); int32_t* out=xIds.data(); size_t no=0; int64_t e=k0;   // the rows through u with residual 3
      for(;e<k1;e++){ if(e+64<k1) __builtin_prefetch(RP+CRp[e+64]); const int32_t r=CRp[e]; if(RP[r]==3) out[no++]=r; }   // (an AVX-512 gather version was 30% slower)
      nIds=no; const unsigned long long cb2=__rdtsc(); gTLc1[d]+=cb2-ca;
      const size_t n=nIds; const BS* RM=RMASK.data(); const size_t PF=64;
      for(size_t i=0;i<n && i<PF;i++) __builtin_prefetch(&RM[xIds[i]]);
      for(size_t i=0;i<n;i++){ if(i+PF<n) __builtin_prefetch(&RM[xIds[i+PF]]); const BS& rm=RM[xIds[i]]; BS m; int c=0; for(int w=0;w<8;w++){ m[w]=rm[w]&Fu[w]; c+=__builtin_popcountll(m[w]); } if(c<3) continue;
        uint64_t t[8]; comp(m,t); xPush(t); } gTLc2[d]+=__rdtsc()-cb2; }
    gTLt[d]++; gTLr2[d]+=n2; gTLr3[d]+=xN-n2; gTLid[d]+=nIds;
    if(xN==0){ gTLx[d]++; gTLcb[d]+=__rdtsc()-c0; return 1; }   // only the constraints the residual-2 pass and crow already searched
    xW=(xN+63)>>6; xRowsof.resize((size_t)nC*xW);   // rows through each point, one 64-row column at a time (every word written once)
    for(int j=0;j<xW;j++){ uint64_t col[512]; for(int p=0;p<nC;p++) col[p]=0; const int b0=j*64, b1=std::min(xN,b0+64);
      for(int b=b0;b<b1;b++){ const uint64_t* rr=&xRowM[(size_t)b*WC]; const uint64_t bit=1ULL<<(b-b0); for(int q=0;q<WC;q++){ uint64_t x=rr[q]; while(x){ col[q*64+__builtin_ctzll(x)]|=bit; x&=x-1; } } }
      for(int p=0;p<nC;p++) xRowsof[(size_t)p*xW+j]=col[p]; }
    const int dep=std::min(nu,32)+2; xOnce.assign((size_t)dep*xW,0); xTwice.assign((size_t)dep*xW,0);
    int mx=0; for(int i=0;i<nDef;i++){ dcur[i]=defDn[i]-ip(u,defXn[i]); if(dcur[i]>mx) mx=dcur[i]; } for(int i=nDef;i<nDefP;i++) dcur[i]=-100; if(mx>nu) return 0;
    const unsigned long long c1=__rdtsc(); gTLcb[d]+=c1-c0;
    dNodes=0; dFound=false; dAbort=false; dT=nu; dLim=TLLIM; uint64_t Pc[8]; for(int k=0;k<8;k++) Pc[k]=(k<WC)?Fuc[k]:0;
    crecX(Pc,0); gTLn[d]+=dNodes; gTLcs[d]+=__rdtsc()-c1; return dFound?1:(dAbort?2:0); }

  // ===== prof7R3 pcert emission (see the header).  Labels in records; masks indexed by vector. =====
  inline bool pcInD(int d,int v) const { return (pcD[d][v>>6]>>(v&63))&1; }
  inline void pcChild(int d,int l,unsigned tag){ std::string& B=tlPc.buf; pcU8(B,tag); pcVar(B,(unsigned long long)(l-pcLast[d])); pcLast[d]=l; gPcN[tag&63]++; }
  void pcEnter(int d){   // NODE record at dfs2 entry; F0 and the full-list mark of this node
    const unsigned long long c0=__rdtsc();
    const int lab=seq.empty()?0:seq.back(); std::string& B=tlPc.buf; pcU8(B,0x01); pcU16(B,(unsigned)((d<<9)|lab)); gPcN[1]++;
    if(d>pcD0 && d>=1) pcLast[d-1]=lab;
    pcKon[d]=false; pcNd[d].clear(); if(pcNval>=d) pcNval=d-1;
    ensureLP(); BS F=ABOVE[lab+1];
    if(d>pcD0){ for(int k=0;k<8;k++) F[k]&=pcF0[d-1][k]; for(size_t i=pcFullN[d-1];i<lp->full.size();i++){ const BS& m=RMASK[lp->full[i]]; for(int k=0;k<8;k++) F[k]&=~m[k]; } }
    else for(int32_t r:lp->full){ const BS& m=RMASK[r]; for(int k=0;k<8;k++) F[k]&=~m[k]; }
    if(PCCHK && d>pcD0){ BS G=ABOVE[lab+1]; for(int32_t r:lp->full){ const BS& m=RMASK[r]; for(int k=0;k<8;k++) G[k]&=~m[k]; } if(G!=F){ gPcErr++; if(gPcErr<5) fprintf(stderr,"R3 check: incremental F0 differs at depth %d\n",d); F=G; } }
    pcF0[d]=F; pcFullN[d]=lp->full.size(); gPcCyc[0]+=__rdtsc()-c0; }
  void pcEnsureN(int d){   // pcNt[k*512+v] for k <= d along the current path
    if(pcNval<0){ for(int v=0;v<512;v++) pcNt[v]=CONF0[v]; pcNval=0; }
    for(int k=pcNval+1;k<=d;k++){ const int p=vecOf[seq[k-1]]; const BS* A=&pcNt[(size_t)(k-1)*512]; BS* T=&pcNt[(size_t)k*512]; const std::array<uint64_t,8>* C2=&CONF2T[(size_t)p*512];
      for(int v=0;v<512;v++) for(int w=0;w<8;w++) T[v][w]=A[v][w]|C2[v][w]; }
    if(d>pcNval) pcNval=d; }
  // L1 types of the screen kills of the node at depth d (r22/lean/DESIGN.md 22.2, as l1cert with L1FULLSTATIC=1): F_u = F0 above u;
  // U0 = F_u minus N[u] (cap-1 rows through u, cap-2 rows through u and a prefix point); EX = U0 minus the big rows (cap >= 3,
  // residual 1) through u.  T: |EX| < nu (greedy big rows until |U0| <= nu-1).  C: residual-1 rows without u and (pass-2 kills) the
  // residual-2 rows through u cover EX greedily with #covers + |uncovered| < nu.  Otherwise X (the search's kind and node count).
  // Every greedy step takes the largest gain, ties to the smallest row id, so the choice does not depend on scan order.
  std::vector<int> csrS, csrL, kc; std::vector<uint32_t> kst; std::vector<uint8_t> kcn; uint32_t kstc=0;
  std::vector<std::pair<BS,int32_t>> cand; std::vector<char> cat, used; std::vector<int> ex, cov, ch;
  void pcClassify(int d,int need){
    pcKon[d]=true; pcKb[d].clear(); pcNd[d].clear(); for(int v=0;v<512;v++) pcKo[d][v]=-1; pcExpM[d]=BS{};
    const BS dead=pdead[d]; if(!bnz(dead)) return;
    const unsigned long long c0=__rdtsc();
    const int nu=need-1; const BS F0=pcF0[d]; pcEnsureN(d); const BS* Nt=&pcNt[(size_t)d*512];
    if(XPS){ xpN.reset(); xpeel::bzero(xpF); for(int w=0;w<8;w++){ uint64_t x=F0[w]; while(x){ const int v=w*64+__builtin_ctzll(x); x&=x-1; xpeel::set1(xpF,lpx::lab[v]); } } }
    r1R.clear(); r1M.clear(); r1B.clear();   // residual-1 rows with >= 2 points in F0 (a full row has none: no residual test needed)
#ifdef L90V
    const __m512i FZ=_mm512_loadu_si512(F0.data());
    auto consider=[&](int32_t r,const BS& rm){ const __m512i M=_mm512_and_si512(_mm512_loadu_si512(rm.data()),FZ); if(ge2v(M)){ BS m; _mm512_storeu_si512(m.data(),M); r1R.push_back(r); r1M.push_back(m); r1B.push_back(lpx::RCAP[r]>=3); } };
#else
    auto consider=[&](int32_t r,const BS& rm){ BS m; int c=0; for(int w=0;w<8;w++){ m[w]=rm[w]&F0[w]; c+=__builtin_popcountll(m[w]); } if(c>=2){ r1R.push_back(r); r1M.push_back(m); r1B.push_back(lpx::RCAP[r]>=3); } };
#endif
    { const int32_t* RL=lp->res1.data(); const size_t n1=lp->res1.size();
      for(size_t i=0;i<n1;i++){ if(i+PFD<n1) __builtin_prefetch(&RMASK[RL[i+PFD]]); consider(RL[i],RMASK[RL[i]]); } }
    for(size_t i=0;i<CAP1ROWS.size();i++) consider(CAP1ROWS[i],CAP1M[i]);
    const int nr=(int)r1R.size();
    csrS.assign(513,0); for(int i=0;i<nr;i++) for(int w=0;w<8;w++){ uint64_t x=r1M[i][w]; while(x){ csrS[w*64+__builtin_ctzll(x)+1]++; x&=x-1; } }
    for(int q=0;q<512;q++) csrS[q+1]+=csrS[q]; csrL.resize(csrS[512]); { std::vector<int> pos(csrS.begin(),csrS.end()-1);
      for(int i=0;i<nr;i++) for(int w=0;w<8;w++){ uint64_t x=r1M[i][w]; while(x){ csrL[pos[w*64+__builtin_ctzll(x)]++]=i; x&=x-1; } } }
    if((int)kst.size()<nr){ kst.assign(nr,0); kcn.assign(nr,0); kstc=0; }
    const unsigned long long c1=__rdtsc(); gPcCyc[1]+=c1-c0;
    std::vector<int32_t> exR, c1R, c2R, r2L; std::unordered_map<int32_t,int> exI, c1I, c2I, r2I;
    auto idxOf=[](std::vector<int32_t>& V,std::unordered_map<int32_t,int>& M,int32_t r)->int{ auto it=M.find(r); if(it!=M.end()) return it->second; int i=(int)V.size(); V.push_back(r); M.emplace(r,i); return i; };
    auto pickExcl=[&](int u,BS U,int target)->bool{   // big rows through u (csr list of u), largest gain first, ties to the smallest row id
      const int s0=csrS[u], s1=csrS[u+1]; used.assign(s1-s0,0);
      while(bcnt(U)>target){ int bj=-1, bc=0; int32_t br=0;
        for(int j=s0;j<s1;j++){ const int i=csrL[j]; if(!r1B[i] || used[j-s0]) continue; int c=0; for(int w=0;w<8;w++) c+=__builtin_popcountll(r1M[i][w]&U[w]); if(c>bc || (c==bc && c>0 && r1R[i]<br)){ bc=c; bj=j; br=r1R[i]; } }
        if(bj<0) return false; used[bj-s0]=1; const int i=csrL[bj]; for(int w=0;w<8;w++) U[w]&=~r1M[i][w]; ex.push_back(r1R[i]); }
      return true; };
    // X record; with --pcfk, a Farkas certificate (choice 1) when the LP relaxation over the search's own free set refutes the child
    const bool fkNode = PCFK>0 && (PCFKS<=1 || (fkSeenM++ % PCFKS)==0);   // --pcfksamp K: every K-th node with screen kills attempts all its eligible kills
    bool r2Built=false; std::vector<int32_t> q2R; std::vector<BS> q2M; std::vector<int> q2S, q2L; std::vector<uint32_t> q2st; std::vector<uint8_t> q2c; uint32_t q2cur=0;
    auto buildR2=[&](){ r2Built=true; const BS& F=misF[d]; const int8_t* RP=lp->resP.data();   // residual-2 rows with >= 3 points in F: r2scanAlive's candidates, or a scan of res2 and the static cap-2 rows
      auto take=[&](int32_t r,const BS& rm){ BS m; int c=0; for(int w=0;w<8;w++){ m[w]=rm[w]&F[w]; c+=__builtin_popcountll(m[w]); } if(c>=3){ q2R.push_back(r); q2M.push_back(m); } };
      if(cSeq==misSeq) for(size_t i=0;i<cR.size();i++) take(cR[i],*cM[i]);
      else { const int32_t* RL=lp->res2.data(); const size_t n2=lp->res2.size(); for(size_t i=0;i<n2;i++){ if(i+PFD<n2){ __builtin_prefetch(&RMASK[RL[i+PFD]]); __builtin_prefetch(RP+RL[i+PFD]); } if(RP[RL[i]]==2) take(RL[i],RMASK[RL[i]]); }
        for(size_t i=0;i<ST2ROW.size();i++){ if(i+PFD<ST2ROW.size()) __builtin_prefetch(RP+ST2ROW[i+PFD]); if(RP[ST2ROW[i]]==2) take(ST2ROW[i],ST2M[i]); } }
      const int nq=(int)q2R.size(); q2S.assign(513,0); for(int i=0;i<nq;i++) for(int w=0;w<8;w++){ uint64_t x=q2M[i][w]; while(x){ q2S[w*64+__builtin_ctzll(x)+1]++; x&=x-1; } }
      for(int v=0;v<512;v++) q2S[v+1]+=q2S[v]; q2L.resize(q2S[512]); { std::vector<int> pos(q2S.begin(),q2S.end()-1); for(int i=0;i<nq;i++) for(int w=0;w<8;w++){ uint64_t x=q2M[i][w]; while(x){ q2L[pos[w*64+__builtin_ctzll(x)]++]=i; x&=x-1; } } }
      q2st.assign(nq,0); q2c.assign(nq,0); q2cur=0; gFkR2+=nq; gFkR2n++; };
    auto encX=[&](int u,std::string& K){
      const int kind=pkind[d][u]; const long long bb=std::max(0,pbbs[d][u]);
      { const int bq=bb<=1?0:bb<=8?1:bb<=15?2:bb<=63?3:bb<=255?4:bb<=1000?5:6; gXn[std::min(kind,6)][bq]++; gXb[std::min(kind,6)][bq]+=bb; }
      auto plain=[&](){ K.clear(); pcU8(K,0x22); pcU8(K,(unsigned)kind); pcVar(K,(unsigned long long)bb);
        const bool rule=(PCEXP>0 && bb>PCEXP && kind>=2) || (PCEXP5>0 && kind==5 && bb>PCEXP5);
        if(rule || PCNOREP){ pcU8(K,2); pcExpM[d][u>>6]|=1ULL<<(u&63); if(!rule) gNrX[std::min(kind,7)]++; } else pcU8(K,0); };   // choice 2: the child is expanded (its records follow); --pcnorep: every kill without a certificate
      if(XPS && kind>=2 && kind<=5 && ((XPKINDS>>kind)&1) && bb>=XPMINBB && !(PCEXP5>0 && kind==5 && bb>PCEXP5)){   // prof7R3k: kill2's bulk peel
        const unsigned long long x0=__rdtsc(); const int bq=bb<=1?0:bb<=8?1:bb<=15?2:bb<=63?3:bb<=255?4:bb<=1000?5:6;
        if(!xpN){ xpeel::NodeIn in; for(int l:seq) in.Q.push_back(l); in.F=xpF;
          const int8_t* RP=lp->resP.data();
          auto take=[&](int32_t r,int res){ if(RP[r]!=res || lpx::RCAP[r]<3) return; const uint8_t* b=&XPLAB[(size_t)r*65]; xpeel::RowIn R; R.id=r; R.res=res; std::memcpy(R.m.w,b,64); R.m.w[7]&=~(1ULL<<63);
            int c=0; for(int k=0;k<8;k++){ R.m.w[k]&=xpF.w[k]; c+=__builtin_popcountll(R.m.w[k]); } if(c>=2) in.rows.push_back(R); };
          for(int32_t r:lp->res1) take(r,1); for(int32_t r:lp->res2) take(r,2);
          std::sort(in.rows.begin(),in.rows.end(),[](const xpeel::RowIn& a,const xpeel::RowIn& b){ return a.id<b.id; });
          in.rows.erase(std::unique(in.rows.begin(),in.rows.end(),[](const xpeel::RowIn& a,const xpeel::RowIn& b){ return a.id==b.id; }),in.rows.end());
          gXpRows+=(long long)in.rows.size(); xpeel::Params P; P.lim=XPLIM; xpN.reset(new xpeel::NodeCtx(*XPS,in,P)); gXpNodes++; gXpNodeC+=__rdtsc()-x0; }
        // F_u: F0 above u, outside N[u] and the W-blocked set, minus every big residual-1 row through u (cited, as for Farkas)
        std::vector<int> exl; BS Fu; { const BS& Ab=ABOVE[lpx::lab[u]+1]; for(int w=0;w<8;w++) Fu[w]=pcF0[d][w]&Ab[w]&~pcNt[(size_t)d*512+u][w]&~wbm[d][w];
          for(int j=csrS[u];j<csrS[u+1];j++){ const int i=csrL[j]; if(!r1B[i]) continue; uint64_t a3=0; for(int w=0;w<8;w++) a3|=r1M[i][w]&Fu[w]; if(a3){ exl.push_back(idxOf(exR,exI,r1R[i])); } }
          for(int j=csrS[u];j<csrS[u+1];j++){ const int i=csrL[j]; if(!r1B[i]) continue; for(int w=0;w<8;w++) Fu[w]&=~r1M[i][w]; } }
        xpeel::ChildIn ci; ci.u=lpx::lab[u]; ci.kind=kind; ci.bb=bb; xpeel::bzero(ci.Fu); for(int w=0;w<8;w++){ uint64_t x=Fu[w]; while(x){ const int v=w*64+__builtin_ctzll(x); x&=x-1; xpeel::set1(ci.Fu,lpx::lab[v]); } }
        std::vector<uint8_t> cb; const bool ok=xpN->gen(ci,cb,nullptr); gXpA[kind][bq]++; gXpC[kind][bq]+=__rdtsc()-x0;
        if(ok){ K.clear(); pcU8(K,0x22); pcU8(K,(unsigned)kind); pcVar(K,(unsigned long long)bb); pcU8(K,5);
          pcVar(K,exl.size()); for(int e:exl) pcVar(K,(unsigned)e); xpBlob(K,cb.data(),cb.size());
          gXpS[kind][bq]++; gXpB[kind][bq]+=(long long)K.size(); return; } }
      if(!fkNode || kind<1 || kind>5 || (PCFKP ? (bb<PCFKLO[kind] || bb>PCFKHI[kind]) : bb<PCFK)){ plain(); return; }
      const int bk=bb<=1?0:bb<=8?1:bb<=15?2:bb<=63?3:bb<=255?4:bb<=1000?5:6; const unsigned long long t0=__rdtsc();
      BS Fv; { const BS& Ab=ABOVE[lpx::lab[u]+1]; for(int w=0;w<8;w++) Fv[w]=misF[d][w]&Ab[w]&~mconf[u][w]; }
      if((int)fkLoc.size()<512) fkLoc.assign(512,-1);
      std::vector<int> pt; for(int w=0;w<8;w++){ uint64_t x=Fv[w]; while(x){ const int v=w*64+__builtin_ctzll(x); x&=x-1; fkLoc[v]=(int)pt.size(); pt.push_back(v); } }
      const int n=(int)pt.size(); fkx::Inst I; I.n=n; I.t=nu; I.adj.assign(n,fkx::B512{});
      auto loc=[&](const BS& m,std::vector<int>& out){ out.clear(); for(int w=0;w<8;w++){ uint64_t x=m[w]&Fv[w]; while(x){ out.push_back(fkLoc[w*64+__builtin_ctzll(x)]); x&=x-1; } } };
      for(int i=0;i<n;i++){ const BS& g=mconf[pt[i]]; for(int w=0;w<8;w++){ uint64_t x=g[w]&Fv[w]; while(x){ const int j=fkLoc[w*64+__builtin_ctzll(x)]; x&=x-1; I.adj[i][j>>6]|=1ULL<<(j&63); } } }
      std::vector<int> lp;
      if(!r2Built) buildR2();
      // residual-2 rows through u are cliques of the child: they enter the conflict graph (pairwise) up front
      for(int j=q2S[u];j<q2S[u+1];j++){ const int i=q2L[j]; loc(q2M[i],lp); if(lp.size()<2) continue; for(int a2:lp) for(int b2:lp) if(a2!=b2) I.adj[a2][b2>>6]|=1ULL<<(b2&63); }
      // lazy rows found from the LP support: residual-1 rows (<= 1), residual-2 rows through u (<= 1), other residual-2 rows (<= 2)
      std::vector<double> xs(512,0.0);
      I.sep=[&,u](const std::vector<double>& x,std::vector<fkx::Con>& V)->int{ for(int i=0;i<n;i++) xs[pt[i]]=x[i];
        if(++kstc==0){ std::fill(kst.begin(),kst.end(),0); kstc=1; } if(++q2cur==0){ std::fill(q2st.begin(),q2st.end(),0); q2cur=1; }
        std::vector<double>& s1=fkS1; std::vector<double>& s2=fkS2; if(s1.size()<kst.size()) s1.resize(kst.size()); if(s2.size()<q2st.size()) s2.resize(q2st.size());
        std::vector<std::pair<double,int>> cand1, cand2;
        for(int i=0;i<n;i++){ if(x[i]<=1e-7) continue; const int v=pt[i];
          for(int j=csrS[v];j<csrS[v+1];j++){ const int q=csrL[j]; if(kst[q]!=kstc){ kst[q]=kstc; s1[q]=0; } s1[q]+=x[i]; if(s1[q]>1+1e-6 && s1[q]-x[i]<=1+1e-6) cand1.push_back({0.0,q}); }
          for(int j=q2S[v];j<q2S[v+1];j++){ const int q=q2L[j]; if(q2st[q]!=q2cur){ q2st[q]=q2cur; s2[q]=0; } const double old=s2[q]; s2[q]+=x[i]; const double lim=((q2M[q][u>>6]>>(u&63))&1)?1.0:2.0; if(s2[q]>lim+1e-6 && old<=lim+1e-6) cand2.push_back({0.0,q}); } }
        for(auto& c:cand1) c.first=s1[c.second]-1; for(auto& c:cand2){ const double lim=((q2M[c.second][u>>6]>>(u&63))&1)?1.0:2.0; c.first=s2[c.second]-lim; }
        // canonical order: largest violation first, ties by kept-row id (list positions depend on the incremental path)
        std::sort(cand1.begin(),cand1.end(),[&](const std::pair<double,int>& a2,const std::pair<double,int>& b2){ return a2.first>b2.first || (a2.first==b2.first && r1R[a2.second]<r1R[b2.second]); });
        std::sort(cand2.begin(),cand2.end(),[&](const std::pair<double,int>& a2,const std::pair<double,int>& b2){ return a2.first>b2.first || (a2.first==b2.first && q2R[a2.second]<q2R[b2.second]); });
        int nadd=0;
        for(auto& c:cand1){ if(nadd>=PCFKL) break; const int q=c.second; if(fkUsed1.count(r1R[q])) continue; fkUsed1.insert(r1R[q]); fkx::Con cc; loc(r1M[q],cc.pts); cc.rhs=1; cc.sense=1; cc.type=1; cc.ref=r1R[q]; V.push_back(cc); nadd++; }
        for(auto& c:cand2){ if(nadd>=2*PCFKL) break; const int q=c.second; if(fkUsed2.count(q2R[q])) continue; fkUsed2.insert(q2R[q]); const bool th=(q2M[q][u>>6]>>(u&63))&1; fkx::Con cc; loc(q2M[q],cc.pts); cc.rhs=th?1:2; cc.sense=1; cc.type=th?2:3; cc.ref=q2R[q]; V.push_back(cc); nadd++; }
        for(int i=0;i<n;i++) xs[pt[i]]=0.0;
        return nadd; };
      fkUsed1.clear(); fkUsed2.clear();
      { std::map<std::vector<int>,int> seen;   // deficits (identical point sets: the largest need)
        for(int X=1;X<512;X++){ const int dl=hypNeed[X]-hits[X]-ip(u,X); if(dl<1) continue; loc(HIT[X],lp); auto it=seen.find(lp);
          if(it!=seen.end()){ fkx::Con& e=I.base[it->second]; if(dl>e.rhs){ e.rhs=dl; e.ref=X; } continue; }
          seen.emplace(lp,(int)I.base.size()); fkx::Con c; c.pts=lp; c.rhs=dl; c.sense=-1; c.type=4; c.ref=X; I.base.push_back(c); } }
      gFkBuild+=__rdtsc()-t0;
      fk.maxCliquesPerRound=(int)PCFKC; fk.maxLazyPerRound=(int)PCFKL; fk.lazyBase=PCFKLB; fk.noCliques=PCFK6; fk.pCost=PCFK6?1.0:1e-4; fk.maxSup=PCFK6?(int)PCFK6SUP:0;
      fkx::Cert C; const int res=fk.solve(I,C); gFkA[kind][bk]++; gFkC[kind][bk]+=__rdtsc()-t0;
      if(res!=1){ plain(); return; }
      K.clear(); pcU8(K,0x22); pcU8(K,(unsigned)kind); pcVar(K,(unsigned long long)bb); pcU8(K,PCFK6?3:1);
      { std::vector<int> ex; const BS& Ab=ABOVE[lpx::lab[u]+1];   // every big residual-1 row through u that excludes a point of F0 above u outside N[u] and the W-blocked set
        for(int j=csrS[u];j<csrS[u+1];j++){ const int i=csrL[j]; if(!r1B[i]) continue; uint64_t a3=0; for(int w=0;w<8;w++) a3|=r1M[i][w]&Ab[w]&~Nt[u][w]&~wbm[d][w]; if(a3) ex.push_back(idxOf(exR,exI,r1R[i])); }
        pcVar(K,ex.size()); for(int e:ex) pcVar(K,(unsigned)e); }   // varint count (more than 255 exclusion rows occur)
      pcVar(K,C.con.size());
      for(size_t i=0;i<C.con.size();i++){ const fkx::Con& c=C.con[i]; pcU8(K,(unsigned)c.type);
        if(c.type==0){ pcVar(K,c.pts.size()); int pl=lpx::lab[u]; for(int q:c.pts){ const int l=lpx::lab[pt[q]]; pcVar(K,(unsigned)(l-pl)); pl=l; } }
        else if(c.type==1) pcVar(K,(unsigned)idxOf(c1R,c1I,c.ref)); else if(c.type==2) pcVar(K,(unsigned)idxOf(c2R,c2I,c.ref)); else if(c.type==3) pcVar(K,(unsigned)idxOf(r2L,r2I,c.ref)); else pcU16(K,(unsigned)c.ref);
        pcVar(K,(unsigned long long)C.mult[i]); }
      { const long long w=C.w; pcVar(K,(unsigned long long)((w<<1)^(w>>63))); }   // zigzag
      gFkS[kind][bk]++; gFkB[kind][bk]+=(long long)K.size(); gFkN[kind][bk]+=(long long)C.con.size(); gFkU[kind][bk]+=C.units; gFkDh[C.D<=1?0:C.D<=2?1:C.D<=4?2:C.D<=8?3:C.D<=16?4:C.D<=64?5:6]++; };
    std::vector<int> xpDef;   // prof7R3x --xp2: bulk-peel kills deferred to the end of the loop
    auto xp2Elig=[&](int u)->bool{ const int kind=pkind[d][u]; const long long bb=std::max(0,pbbs[d][u]);
      return XP2 && XPS && kind>=2 && kind<=5 && ((XPKINDS>>kind)&1) && bb>=XPMINBB && !(PCEXP5>0 && kind==5 && bb>PCEXP5); };
    for(int w0=0;w0<8;w0++){ uint64_t xx=dead[w0]; while(xx){ const int u=w0*64+__builtin_ctzll(xx); xx&=xx-1;
        if(pkind[d][u]!=1 && pbbs[d][u]>PCXBB && xp2Elig(u)){ xpDef.push_back(u); gPcTC[2]++; continue; }
        if(pkind[d][u]!=1 && pbbs[d][u]>PCXBB){ std::string K; encX(u,K);   // only X is possible: T needs a count kill, C a small search
          pcKo[d][u]=(int32_t)pcKb[d].size(); pcVar(pcKb[d],K.size()); pcKb[d]+=K; gPcTC[2]++; continue; }
        const BS& Ab=ABOVE[lpx::lab[u]+1]; BS U0, EX; for(int w=0;w<8;w++){ U0[w]=F0[w]&Ab[w]&~Nt[u][w]; EX[w]=U0[w]; }
        for(int j=csrS[u];j<csrS[u+1];j++){ const int i=csrL[j]; if(r1B[i]) for(int w=0;w<8;w++) EX[w]&=~r1M[i][w]; }
        int type=2; ex.clear(); cov.clear(); const int nex=bcnt(EX);
        if(nex<nu){ if(pickExcl(u,U0,nu-1)) type=0; else { gPcErr++; if(gPcErr<5) fprintf(stderr,"R3 check: T exclusion pick failed\n"); } if(pkind[d][u]!=1) gPcTnc++; }
        else if(pbbs[d][u]<=PCXBB){ const int bk=std::min(pbbs[d][u],16); gPcAtt[bk]++;
          cand.clear(); cat.clear();
          if(++kstc==0){ std::fill(kst.begin(),kst.end(),0); kstc=1; }
          for(int w=0;w<8;w++){ uint64_t x=EX[w]; while(x){ const int q=w*64+__builtin_ctzll(x); x&=x-1;   // rows with >= 2 points of EX and without u
              for(int j=csrS[q];j<csrS[q+1];j++){ const int i=csrL[j]; if(kst[i]!=kstc){ kst[i]=kstc; kcn[i]=0; } if(++kcn[i]==2 && !((r1M[i][u>>6]>>(u&63))&1)){ BS y; for(int k=0;k<8;k++) y[k]=r1M[i][k]&EX[k]; cand.push_back({y,r1R[i]}); cat.push_back(1); } } } }
          if(pkind[d][u]==4 || pkind[d][u]==5 || pkind[d][u]==6) for(int ix:alv[u]){ const int32_t r=AMkR[ix]; const BS& rm=RMASK[r]; BS y; int c=0; for(int k=0;k<8;k++){ y[k]=rm[k]&EX[k]; c+=__builtin_popcountll(y[k]); } if(c>=2){ cand.push_back({y,r}); cat.push_back(2); } }
          BS U=EX, cu{}; used.assign(cand.size(),0); ch.clear();
          while(true){ int bj=-1, bc=1; int32_t br=0; for(size_t j=0;j<cand.size();j++){ if(used[j]) continue; int c=0; for(int k=0;k<8;k++) c+=__builtin_popcountll(cand[j].first[k]&U[k]); if(c>bc || (c==bc && bj>=0 && cand[j].second<br)){ bc=c; bj=(int)j; br=cand[j].second; } }
            if(bj<0) break; used[bj]=1; for(int k=0;k<8;k++){ U[k]&=~cand[bj].first[k]; cu[k]|=RMASK[cand[bj].second][k]; } ch.push_back(bj); }
          if((int)ch.size()+bcnt(U)<nu){ BS U1; for(int k=0;k<8;k++) U1[k]=U0[k]&~cu[k];
            if(pickExcl(u,U1,nu-1-(int)ch.size())){ type=1; gPcSuc[bk]++; for(int j:ch) cov.push_back(cat[j]==1 ? 2*idxOf(c1R,c1I,cand[j].second) : 2*idxOf(c2R,c2I,cand[j].second)+1); }
            else { gPcErr++; if(gPcErr<5) fprintf(stderr,"R3 check: C exclusion pick failed\n"); } } }
        if(type<2 && (ex.size()>31 || cov.size()>31)) type=2;
        std::string K;   // body: tag, fields (the label delta is written at emission); stored as [varint length][body]
        if(type==0){ pcU8(K,0x20); pcU8(K,(unsigned)ex.size()); for(int32_t r:ex) pcVar(K,(unsigned)idxOf(exR,exI,r)); }
        else if(type==1){ pcU8(K,0x21); pcU8(K,(unsigned)ex.size()); pcU8(K,(unsigned)cov.size()); for(int32_t r:ex) pcVar(K,(unsigned)idxOf(exR,exI,r)); for(int c:cov) pcVar(K,(unsigned)c); }
        else { if(xp2Elig(u)){ xpDef.push_back(u); gPcTC[2]++; continue; } encX(u,K); }
        pcKo[d][u]=(int32_t)pcKb[d].size(); pcVar(pcKb[d],K.size()); pcKb[d]+=K;
        gPcTC[type]++; } }
    std::string xpNodeRec;
    if(!xpDef.empty()){   // prof7R3x --xp2: the node's bulk-peel kills, generated jointly
      const auto tc0=std::chrono::steady_clock::now();
      xp2::NodeIn2 in; for(int l:seq) in.Q.push_back(l); in.Fn=xpF;
      for(int32_t r:exR) in.l1R1.push_back(r); for(int32_t r:c1R) in.l1R1.push_back(r); for(int32_t r:c2R) in.l1R2.push_back(r);
      bool k5=false, k4=false; xpeel::BS K45; xpeel::bzero(K45);
      for(int u:xpDef){ if(pkind[d][u]==5) k5=true; if(pkind[d][u]>=4){ k4=true; xpeel::set1(K45,lpx::lab[u]); } }
      const int8_t* RP=lp->resP.data(); long n1=0, n2=0; const BS& F0v=pcF0[d];
      // rows from the node's own structures: residual-1 big rows (r1R, masks already within F0), residual-2 big rows with >= 3
      // points of F0: r2scanAlive's candidates cR when the node has a crow kill, else the rows through its kind-4 kills (alv)
      std::vector<std::pair<int32_t,int>> ids;   // (row id, residual)
      for(size_t i=0;i<r1R.size();i++) if(r1B[i]) ids.push_back({r1R[i],1});
      if(k5 && cSeq==misSeq){ const size_t nc=cR.size(); for(size_t i=0;i<nc;i++){ if(i+16<nc){ __builtin_prefetch(RP+cR[i+16]); __builtin_prefetch(&lpx::RCAP[cR[i+16]]); } const int32_t r=cR[i]; if(RP[r]!=2 || lpx::RCAP[r]<3) continue; ids.push_back({r,2}); } }   // batch 14: prefetch
      else if(k5){ for(int32_t r:lp->res2) if(RP[r]==2 && lpx::RCAP[r]>=3) ids.push_back({r,2}); }
      else if(k4){ for(int u:xpDef) if(pkind[d][u]>=4) for(int ix:alv[u]) ids.push_back({AMkR[ix],2}); }
      if(ids.size()<4096){ std::sort(ids.begin(),ids.end()); ids.erase(std::unique(ids.begin(),ids.end()),ids.end()); }
      else {   // batch 14: the same sorted unique (id, residual) list through per-thread bitmaps (a sort of 72k pairs cost ~3 ms per crow context)
        static thread_local std::vector<uint64_t> B1, B2; const size_t NW=((size_t)lpx::NR+63)/64; if(B1.size()!=NW){ B1.assign(NW,0); B2.assign(NW,0); }
        for(auto& pr:ids){ std::vector<uint64_t>& B=(pr.second==1)?B1:B2; B[(size_t)pr.first>>6]|=1ULL<<(pr.first&63); }
        ids.clear(); for(size_t w=0;w<NW;w++){ uint64_t a=B1[w], b=B2[w]; if(!(a|b)) continue; B1[w]=0; B2[w]=0; uint64_t x=a|b;
          while(x){ const int k=__builtin_ctzll(x); x&=x-1; const int32_t r=(int32_t)(w*64+k); if((a>>k)&1) ids.push_back({r,1}); if((b>>k)&1) ids.push_back({r,2}); } } }
      in.rows.reserve(ids.size());
      for(size_t ii=0;ii<ids.size();ii++){ const auto& pr=ids[ii]; if(ii+8<ids.size()){ const uint8_t* pf=&XPLAB[(size_t)ids[ii+8].first*65]; __builtin_prefetch(pf); __builtin_prefetch(pf+64); }
        const int32_t r=pr.first; xpeel::RowIn R; R.id=r; R.res=pr.second; int c=0;   // batch 14: label mask from XPLAB (= RMASK in labels, every row checked at startup), prefetched
        const uint64_t* lb=(const uint64_t*)&XPLAB[(size_t)r*65]; for(int w=0;w<8;w++){ uint64_t m; std::memcpy(&m,lb+w,8); m&=xpF.w[w]; R.m.w[w]=m; c+=__builtin_popcountll(m); }
        if(c<(pr.second==1?2:3)) continue; in.rows.push_back(R); if(pr.second==1) n1++; else n2++; }
      const auto tc1=std::chrono::steady_clock::now(); { const long long g=(long long)(std::chrono::duration<double,std::micro>(tc1-tc0).count()*10); gX2Gath+=g; const int cat=k5?2:k4?1:0; gX2GC[cat]+=g; gX2GN[cat]++; gX2GR[cat]+=n2; } if(k5) gX2CtxK5++; else if(k4) gX2CtxK4++;
      in.fetch2=[&](int ul,std::vector<xpeel::RowIn>& out){   // residual-2 big rows through label ul with >= 3 points of F0 (last fallback)
        const int uv=ul>=0? vecOf[ul] : -1;
        for(int32_t r:lp->res2){ if(RP[r]!=2 || lpx::RCAP[r]<3) continue; const BS& rm=RMASK[r]; if(uv>=0 && !((rm[uv>>6]>>(uv&63))&1)) continue;
          xpeel::RowIn R; R.id=r; R.res=2; int c=0; const uint64_t* lb=(const uint64_t*)&XPLAB[(size_t)r*65];   // batch 14: XPLAB
          for(int w=0;w<8;w++){ uint64_t m; std::memcpy(&m,lb+w,8); m&=xpF.w[w]; R.m.w[w]=m; c+=__builtin_popcountll(m); }
          if(c>=3) out.push_back(R); } };
      xp2::Params2 P2=XP2P; if(XP2VERIFY>1){ unsigned long long h=1469598103934665603ULL; for(int l:seq){ h^=(unsigned long long)(l+1); h*=1099511628211ULL; } P2.verify=(h%(unsigned long long)XP2VERIFY)==0 ? (XP2P.verify?XP2P.verify:1) : 0; }   // batch 14: sampled self-verification
      xp2::Node2 X(*XPS,in,P2);
      gX2Ctx+=(long long)(std::chrono::duration<double,std::micro>(std::chrono::steady_clock::now()-tc0).count()*10); gX2CtxN++; gX2Rows1+=n1; gX2Rows2+=n2;
      std::vector<xp2::ChildIn2> ks; for(int u:xpDef) ks.push_back({lpx::lab[u],(int)pkind[d][u],(long)std::max(0,pbbs[d][u])});
      std::vector<std::vector<uint8_t>> cs; std::vector<char> okv; std::vector<xp2::Stats2> st; X.genAll(ks,cs,okv,&st);
      for(size_t j=0;j<xpDef.size();j++){ const int u=xpDef[j]; const int kind=pkind[d][u]; const long long bb=std::max(0,pbbs[d][u]);
        const int bq=bb<=1?0:bb<=8?1:bb<=15?2:bb<=63?3:bb<=255?4:bb<=1000?5:6; gXn[std::min(kind,6)][bq]++; gXb[std::min(kind,6)][bq]+=bb;
        gX2A[kind][bq]++; const xp2::Stats2& s=st[j]; const double ph[7]={s.usGen,s.usSetup,s.usTree,s.usCover,s.usExcl,s.usPrune,s.usEmit}; for(int q=0;q<7;q++) gX2P[kind][bq][q]+=(long long)(ph[q]*10);
        std::string K; pcU8(K,0x22); pcU8(K,(unsigned)kind); pcVar(K,(unsigned long long)bb);
        if(okv[j]){ pcU8(K,5); pcVar(K,0); xpBlob(K,cs[j].data(),cs[j].size()); gX2S[kind][bq]++; gX2B+=(long long)K.size(); }
        else { const bool rule=(PCEXP>0 && bb>PCEXP && kind>=2) || (PCEXP5>0 && kind==5 && bb>PCEXP5);   // batch 5: --pcnorep expands every failed kill
          if(rule || PCNOREP){ pcU8(K,2); pcExpM[d][u>>6]|=1ULL<<(u&63); if(!rule) gNrX[std::min(kind,7)]++; } else pcU8(K,0); }
        pcKo[d][u]=(int32_t)pcKb[d].size(); pcVar(pcKb[d],K.size()); pcKb[d]+=K; }
      std::vector<uint8_t> nb; X.nodeRecord(nb); pcU8(xpNodeRec,0x2B); xpBlob(xpNodeRec,nb.data(),nb.size());
      gX2Dict+=X.dictSize(); gX2Ext+=X.extraRows(); gX2NodeR+=X.nodeRows(); }
    if(!exR.empty() || !c1R.empty() || !c2R.empty() || !r2L.empty()){ std::string& R=pcNd[d]; pcU8(R,0x11); pcVar(R,exR.size()); pcVar(R,c1R.size()); pcVar(R,c2R.size()); pcVar(R,r2L.size());
      for(int32_t r:exR) pcVar(R,(unsigned)r); for(int32_t r:c1R) pcVar(R,(unsigned)r); for(int32_t r:c2R) pcVar(R,(unsigned)r); for(int32_t r:r2L) pcVar(R,(unsigned)r); }
    if(xpN){ std::vector<uint8_t> nb; xpN->nodeRecord(nb); std::string& R=pcNd[d]; pcU8(R,0x2B); xpBlob(R,nb.data(),nb.size()); gXpNodeB+=(long long)nb.size()+2; xpN.reset(); }
    if(!xpNodeRec.empty()){ pcNd[d]+=xpNodeRec; gXpNodeB+=(long long)xpNodeRec.size(); }
    gPcCyc[2]+=__rdtsc()-c1; gPcCyc[5]+=nr; gPcCyc[6]++; }
  // OPEN and the node data: V rows (cover of the children in a full row outside the inherited D), row table, W-blocked and
  // subspace-blocked candidates outside D
  void pcOpenNode(int d,int pos){
    const unsigned long long c0=__rdtsc(); struct T_{ unsigned long long c; ~T_(){ gPcCyc[3]+=__rdtsc()-c; } } t_{c0};
    std::string& B=tlPc.buf; pcU8(B,0x04); gPcN[4]++; const int lab=seq.back(); pcLast[d]=lab;
    const BS& Dp=(d>pcD0)?pcD[d-1]:pcDin; const BS& Ab=ABOVE[lab+1];
    BS need; for(int k=0;k<8;k++) need[k]=Ab[k]&~pcF0[d][k]&~Dp[k];
    BS D=Dp; std::vector<int32_t> rows;
    if(bnz(need)){ const size_t i0=(d>pcD0)?pcFullN[d-1]:0, i1=lp->full.size(); std::vector<int32_t> cands;
      for(size_t i=i0;i<i1;i++){ const int32_t r=lp->full[i]; const BS& m=RMASK[r]; uint64_t a=0; for(int k=0;k<8;k++) a|=m[k]&need[k]; if(a) cands.push_back(r); }
      std::sort(cands.begin(),cands.end());   // canonical: ties go to the smallest row id
      while(bnz(need)){ int bi=-1, bc=0; for(size_t j=0;j<cands.size();j++){ const BS& m=RMASK[cands[j]]; int c=0; for(int k=0;k<8;k++) c+=__builtin_popcountll(m[k]&need[k]); if(c>bc){ bc=c; bi=(int)j; } }
        if(bi<0){ gPcErr++; if(gPcErr<5) fprintf(stderr,"R3 check: a child in a full row has no candidate row at depth %d\n",d); break; }
        const BS& m=RMASK[cands[bi]]; for(int k=0;k<8;k++){ need[k]&=~m[k]; D[k]|=m[k]; } rows.push_back(cands[bi]); cands.erase(cands.begin()+bi); } }
    pcD[d]=D;
    if(PCWIT){ pcVr[d]=rows; std::sort(pcVr[d].begin(),pcVr[d].end()); }   // batch 12
    if(!rows.empty()){ std::sort(rows.begin(),rows.end()); pcU8(B,0x10); pcVar(B,rows.size()); int32_t pr=0; for(int32_t r:rows){ pcVar(B,(unsigned)(r-pr)); pr=r; } gPcN[0x10]++; }
    if(pcKon[d] && !pcNd[d].empty()){ B+=pcNd[d]; gPcN[0x11]++; }
    if(WBLOCK && d<24 && bnz(wbm[d])){ std::string W; int n=0, pl=lab;
      for(int l=lab+1;l<N;l++){ const int v=vecOf[l]; if(!((wbm[d][v>>6]>>(v&63))&1) || pcInD(d,v)) continue; pcVar(W,(unsigned)(l-pl)); pcU8(W,pcWbW[v]); pl=l; n++; }
      if(n){ pcU8(B,0x12); pcVar(B,(unsigned)n); B+=W; gPcN[0x12]++; } }
    { std::string K; int n=0, pl=lab;   // blocked labels outside D and the W-blocked set: a saturated table subspace through them
      for(int l=pos;l<N;l++){ if(l<=lab || !blocked[l]) continue; const int v=vecOf[l]; if(pcInD(d,v) || (WBLOCK && d<24 && ((wbm[d][v>>6]>>(v&63))&1))) continue;
        const Node* sat=nullptr; for(const Node& nd:nodes) if(nd.m>=nd.cap && inSpan(nd,v)){ sat=&nd; break; }
        if(!sat){ gPcErr++; if(gPcErr<5) fprintf(stderr,"R3 check: blocked label %d without a saturated subspace\n",l); continue; }
        pcVar(K,(unsigned)(l-pl)); pcU8(K,sat->dim); for(int j=0;j<sat->dim;j++) pcU16(K,sat->rows[j]); pl=l; n++; }
      if(n){ pcU8(B,0x13); pcVar(B,(unsigned)n); B+=K; gPcN[0x13]++; gPcBlk+=n; } } }
  inline void pcCut(int kind){ std::string& B=tlPc.buf; pcU8(B,0x03); pcU8(B,(unsigned)kind); gPcN[3]++; }
  // prof7R3k: node cuts 5 / 6 under --pcxp: a bulk-peel certificate for the cut node as its parent's killed child (kinds stream
  // REQUESTS.md 5).  Appended to the CUT record: u8 ok; if ok: varint n, n x varint kept-row id (the big rows through u of residual 1
  // at the parent, which leave F_u), varint len + the parent-context node record, varint len + the child certificate.  Header #cutx 1.
  void pcCutXp(int d,int kind,long long bb){ pcCutXpGen(d,kind,bb,tlPc.buf); }
  bool pcCutXpGen(int d,int kind,long long bb,std::string& B){   // appends the cut's extra bytes to B; true iff certified
    if(d<1 || seq.empty()){ pcU8(B,0); gXpCut[1]++; return false; }
    const unsigned long long x0=__rdtsc();
    const int u=seq.back(); const int vu=vecOf[u]; pcEnsureN(d-1);
    // the parent's F0 from the prefix alone (not pcF0[d-1], which a segment root lacks): labels above the parent's label outside every
    // row full at the parent prefix Q = the rows full now that do not hold u (a row through u that is full now had residual 1 at Q)
    BS Fp=ABOVE[(d>=2 ? seq[d-2] : -1)+1];
    for(int32_t r:lp->full){ const BS& m=RMASK[r]; if((m[vu>>6]>>(vu&63))&1) continue; for(int w=0;w<8;w++) Fp[w]&=~m[w]; }
    const BS& Nu=pcNt[(size_t)(d-1)*512+vu];
    BS Wp{}; if(WBLOCK && d-1>=pcD0 && d-1<24) Wp=wbm[d-1];
    xpeel::BS Fl; xpeel::bzero(Fl); for(int w=0;w<8;w++){ uint64_t x=Fp[w]; while(x){ const int v=w*64+__builtin_ctzll(x); x&=x-1; xpeel::set1(Fl,lpx::lab[v]); } }
    xpeel::NodeIn in; for(size_t i=0;i+1<seq.size();i++) in.Q.push_back(seq[i]); in.F=Fl;
    const int8_t* RP=lp->resP.data();
    std::vector<int32_t> exr;   // big rows through u with residual 1 at the parent (full now)
    auto take=[&](int32_t r){ if(lpx::RCAP[r]<3) return; const bool thu=(RMASK[r][vu>>6]>>(vu&63))&1; const int res=RP[r]+(thu?1:0); if(res<1 || res>2) return;
      const uint8_t* b=&XPLAB[(size_t)r*65]; xpeel::RowIn R; R.id=r; R.res=res; std::memcpy(R.m.w,b,64); R.m.w[7]&=~(1ULL<<63);
      int c=0; for(int k=0;k<8;k++){ R.m.w[k]&=Fl.w[k]; c+=__builtin_popcountll(R.m.w[k]); } if(c>=2) in.rows.push_back(R);
      if(thu && res==1) exr.push_back(r); };
    for(int32_t r:lp->res1) take(r); for(int32_t r:lp->res2) take(r); for(int32_t r:lp->full) take(r);
    std::sort(in.rows.begin(),in.rows.end(),[](const xpeel::RowIn& a,const xpeel::RowIn& b){ return a.id<b.id; });
    in.rows.erase(std::unique(in.rows.begin(),in.rows.end(),[](const xpeel::RowIn& a,const xpeel::RowIn& b){ return a.id==b.id; }),in.rows.end());
    std::sort(exr.begin(),exr.end()); exr.erase(std::unique(exr.begin(),exr.end()),exr.end());
    BS Fu; { const BS& Ab=ABOVE[u+1]; for(int w=0;w<8;w++) Fu[w]=Fp[w]&Ab[w]&~Nu[w]&~Wp[w]; for(int32_t r:exr) for(int w=0;w<8;w++) Fu[w]&=~RMASK[r][w]; }
    xpeel::ChildIn ci; ci.u=u; ci.kind=kind; ci.bb=bb; xpeel::bzero(ci.Fu); for(int w=0;w<8;w++){ uint64_t x=Fu[w]; while(x){ const int v=w*64+__builtin_ctzll(x); x&=x-1; xpeel::set1(ci.Fu,lpx::lab[v]); } }
    xpeel::Params P; P.lim=XPLIM; xpeel::NodeCtx N(*XPS,in,P); std::vector<uint8_t> cb; const bool ok=N.gen(ci,cb,nullptr);
    if(!ok){ pcU8(B,0); gXpCut[1]++; gXpCutC+=__rdtsc()-x0; return false; }
    std::vector<uint8_t> nb; N.nodeRecord(nb);
    pcU8(B,1); pcVar(B,exr.size()); for(int32_t r:exr) pcVar(B,(unsigned)r); xpBlob(B,nb.data(),nb.size()); xpBlob(B,cb.data(),cb.size());
    gXpCut[0]++; gXpCutC+=__rdtsc()-x0; return true; }
  // --pcnorep: misCheck, but a node cut 5 / 6 whose bulk-peel certificate fails is not taken: misCheck runs again without that cut
  // kind (the node is then searched; its children are screened and classified as usual).  On a cut, nrCutOK says that nrCutBuf holds
  // the certified cut's extra bytes.
  int noCut=0; bool nrCutOK=false; std::string nrCutBuf;
  bool misCheckNR(int d,int need,bool pc){
    nrCutOK=false;
    if(!(pc && PCNOREP && XPS)) return misCheck(d,need);
    bool fell=false, r=false;
    while(true){
      if(!misCheck(d,need)){ r=false; break; }
      if(cutWhy!=5 && cutWhy!=6){ r=true; break; }
      nrCutBuf.clear(); if(pcCutXpGen(d,cutWhy,cutArg,nrCutBuf)){ nrCutOK=true; r=true; break; }
      gNrCut[cutWhy-5]++; fell=true; noCut|=1<<cutWhy; }
    if(fell && !r) gNrCutN++;
    noCut=0; return r; }
  // prof7R3k (kinds stream request 5): the VROWS record of a cut node (the greedy cover pcOpenNode writes), before its CUT record
  void pcVrowsCut(int d){
    const int lab=seq.back(); const BS& Dp=(d>pcD0)?pcD[d-1]:pcDin; const BS& Ab=ABOVE[lab+1];
    BS need; for(int k=0;k<8;k++) need[k]=Ab[k]&~pcF0[d][k]&~Dp[k];
    std::vector<int32_t> rows;
    if(bnz(need)){ const size_t i0=(d>pcD0)?pcFullN[d-1]:0, i1=lp->full.size(); std::vector<int32_t> cands;
      for(size_t i=i0;i<i1;i++){ const int32_t r=lp->full[i]; const BS& m=RMASK[r]; uint64_t a=0; for(int k=0;k<8;k++) a|=m[k]&need[k]; if(a) cands.push_back(r); }
      std::sort(cands.begin(),cands.end());
      while(bnz(need)){ int bi=-1, bc=0; for(size_t j=0;j<cands.size();j++){ const BS& m=RMASK[cands[j]]; int c=0; for(int k=0;k<8;k++) c+=__builtin_popcountll(m[k]&need[k]); if(c>bc){ bc=c; bi=(int)j; } }
        if(bi<0){ gPcErr++; break; }
        const BS& m=RMASK[cands[bi]]; for(int k=0;k<8;k++) need[k]&=~m[k]; rows.push_back(cands[bi]); cands.erase(cands.begin()+bi); } }
    if(!rows.empty()){ std::string& B=tlPc.buf; std::sort(rows.begin(),rows.end()); pcU8(B,0x10); pcVar(B,rows.size()); int32_t pr=0; for(int32_t r:rows){ pcVar(B,(unsigned)(r-pr)); pr=r; } gPcN[0x10]++; } }
  void pcCanon(int d,int l){   // CANON record from rejG/rejT (g = t*168*168 + iP*168 + iQ, as build_group)
    pcChild(d,l,0x23); std::string& B=tlPc.buf; pcU8(B,(unsigned)std::max(0,rejT)); unsigned g=0;
    if(rejG>=0){ const int t=rejG/(168*168), iP=(rejG/168)%168, iQ=rejG%168; g=((unsigned)t<<18)|((unsigned)GL3V[iP]<<9)|(unsigned)GL3V[iQ]; } else gPcErr++;
    pcU8(B,g&255); pcU8(B,(g>>8)&255); pcU8(B,(g>>16)&255); }
  void pcKill(int d,int l,int v){   // the screen kill record of child l (body from pcClassify)
    if(!pcKon[d] || pcKo[d][v]<0){ gPcErr++; if(gPcErr<5) fprintf(stderr,"R3 check: screen-killed child %d without a record\n",l); pcChild(d,l,0x22); pcU8(tlPc.buf,pkind[d][v]); pcVar(tlPc.buf,0); pcU8(tlPc.buf,0); return; }
    const uint8_t* K=(const uint8_t*)pcKb[d].data()+pcKo[d][v]; size_t len=0; int sh=0, q=0; while(true){ const uint8_t c=K[q++]; len|=(size_t)(c&127)<<sh; if(!(c&128)) break; sh+=7; }   // [varint length][tag][fields]
    pcChild(d,l,K[q]); tlPc.buf.append((const char*)K+q+1,len-1); }
  void pcBegin(int job,int kind,const std::vector<int>& sq,const std::array<uint64_t,8>& dinh,const std::vector<int32_t>* win=nullptr){ if(!PCF) return; pcOpen(job,kind,sq,dinh.data(),win); if(PCWIT){ if(win) pcWin=*win; else pcWin.clear(); } pcD0=(int)sq.size(); for(int k=0;k<8;k++) pcDin[k]=dinh[k]; pcNval=-1; }
  void pcAddF(int d,int l){ pcChild(d,l,0x27); std::string& B=tlPc.buf; pcU8(B,(unsigned)addWhy);
    if(addWhy==1 || addWhy==2){ pcU8(B,(unsigned)addDim); for(int j=0;j<addDim;j++) pcU16(B,addRows[j]); } else pcU8(B,(unsigned)addW); }
  bool misCheck(int d,int need){
    misSeq++;   // prof7L78 (b)
    if(d<24) pdead[d]=BS{};
    ensureLP(); if(!lp->trk) return false;
    if(!lp->over.empty()){ gMv[d]++;   // the prefix itself breaks a kept row: V line, checked by lpcheck
      if(CERTF){ char b[64]; std::string t; snprintf(b,sizeof b,"V %d P",curJob); t+=b; for(int l:seq){ snprintf(b,sizeof b," %d",vecOf[l]); t+=b; }
        t+=" row "+std::to_string(lp->over[0])+"\n"; certPut(t); }
      cutWhy=2; cutArg=lp->over[0]; return true; }   // prof7R3
    if(d<24) r2ok[d]=false;
    auto t0=std::chrono::steady_clock::now(); gMc[d]++;
    // prof7L21: when the parent (depth d-1) built its graph, this node's F and graph follow from it and from the rows this node's
    // last point changed: F = F_parent n above(last) minus the points of the rows that became full; edges = the parent's edges inside F
    // plus the rows that became residual 1 (a parent residual-1 row through the last point is full now, so its points left F).
    const bool inc = INCMIS && d>=1 && d<24 && misValid[d-1] && !lp->r1mark.empty();
    BS F=ABOVE[lpx::lab[vecOf[seq.back()]]+1];
    if(inc){ for(int k=0;k<8;k++) F[k]&=misF[d-1][k];
      for(size_t i=misFull[d-1];i<lp->full.size();i++){ int32_t r=lp->full[i]; for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; F[u>>6]&=~(1ULL<<(u&63)); } } }
    else for(int32_t r:lp->full) for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; F[u>>6]&=~(1ULL<<(u&63)); }
    if(WBLOCK && d<24) for(int k=0;k<8;k++) F[k]&=~wbm[d][k];   // prof7L86
    if(rootcut::ON && d>=FLOOK && d<24 && need>0){   // prof7L86 --flook: Lemma R with the largest possible final slack
      // Every later point lies in F, so u_final(X) <= hits[X] + min(need, |F n H_X|).  (a) A prefix term whose conditions are infeasible even
      // with these largest slacks is dead in every leaf: the node is cut.  (b) A candidate p in F becomes a term with
      // u_final(X) <= hits[X] + 1 + min(need-1, |F n H_X| - 1) for X through p; if that term is dead, p is in no completion and leaves F
      // (the bound only decreases along the branch, so the exclusion is inherited).  Proof: r22/mid/FLOOK.md.
      gFlN[d]++; int cF[512]; for(int X=1;X<512;X++){ int c2=0; for(int k=0;k<8;k++) c2+=__builtin_popcountll(F[k]&HIT[X][k]); cF[X]=c2; }
      int hw[512]; bool cut=false;
      int nDY=0; int dY[512], dD[512];   // --fdef: the deficit hyperplanes Y (hits < need) force points outside H_X
      if(FDEF) for(int Y=1;Y<512;Y++){ int dl=hypNeed[Y]-hits[Y]; if(dl>0){ dY[nDY]=Y; dD[nDY]=dl; nDY++; } }
      for(int pass=0; pass<(RLOOK?2:1) && !cut; pass++){
        int tpos=-1; for(int l:seq){ int a=vecOf[l]; tpos++;
          for(int X:rootcut::XS[a]){ int add=std::min(need,cF[X]); int s0=hits[X]-hypNeed[X];
            if(FDEF && s0+add<2 && nDY){ int m=0; for(int i=0;i<nDY;i++){ const BS& HY=HIT[dY[i]]; int c3=0; for(int k=0;k<8;k++) c3+=__builtin_popcountll(F[k]&HY[k]&HIT[X][k]); int mi=dD[i]-c3; if(mi>m) m=mi; }
              add=std::min(add,need-m); if(add<0) add=0; }
            int sh=s0+add; hw[X]=hypNeed[X]+(sh<2?sh:2); }
          if(!rootcut::termOK(a,hw)){ cut=true; cutArg=tpos; break; } }   // prof7R3: cutArg = the dead term's position
        if(cut || !RLOOK) break;
        int nx=0;
        for(int k=0;k<8;k++){ uint64_t x=F[k]; while(x){ int p=k*64+__builtin_ctzll(x); x&=x-1;
            bool neg=false; for(int X:rootcut::XS[p]){ int sh=hits[X]+1+std::min(need-1,cF[X]-1)-hypNeed[X]; if(sh<0){ neg=true; break; } hw[X]=hypNeed[X]+(sh<2?sh:2); }
            if(neg || !rootcut::termOK(p,hw)){ F[k]&=~(1ULL<<(p&63)); nx++;
              for(int X:rootcut::XS[p]) cF[X]--; } } }   // p hits exactly the X of XS[p]
        gRlX[d]+=nx; if(nx==0) break; }
      if(cut){ gFlC[d]++; cutWhy=3; return true; } }
    int n=bcnt(F); bool pr=false; mNodes=0;
    if(d<24) misValid[d]=false;
    if(n<need){ pr=true; cutWhy=4; cutArg=n; }   // prof7R3
    else {
      if(inc){ const std::vector<BS>& G=misG[d-1];
        for(int w=0;w<8;w++){ uint64_t x=F[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; for(int k=0;k<8;k++) mconf[u][k]=G[u][k]&F[k]; } }
        const int32_t* RL1=lp->res1.data(); const size_t i0=lp->r1mark.back(), i1=lp->res1.size(); const bool rmk=!RMASK.empty(); const int8_t* RPp=lp->resP.data();
        for(size_t i=i0;i<i1;i++){ if(rmk && i+PFD<i1){ __builtin_prefetch(&RMASK[RL1[i+PFD]]); __builtin_prefetch(RPp+RL1[i+PFD]); }   // prof7L52
          int32_t r=RL1[i]; if(RPp[r]!=1) continue; BS m{}; int c=0;
          if(rmk){ const BS& q=RMASK[r]; for(int w=0;w<8;w++){ m[w]=q[w]&F[w]; c+=__builtin_popcountll(m[w]); } }   // prof7L52: the row mask instead of its point list
          else for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; if((F[u>>6]>>(u&63))&1){ m[u>>6]|=1ULL<<(u&63); c++; } }
          if(c<2) continue;
          for(int w=0;w<8;w++){ uint64_t x=m[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; for(int k=0;k<8;k++) mconf[u][k]|=m[k]; } } } }
      else {
      for(int w=0;w<8;w++){ uint64_t x=F[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; for(int k=0;k<8;k++) mconf[u][k]=CONF0[u][k]&F[k]; } }
      for(int32_t r:lp->res1){ if(lp->resP[r]!=1) continue; BS m{}; int c=0;
        for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; if((F[u>>6]>>(u&63))&1){ m[u>>6]|=1ULL<<(u&63); c++; } }
        if(c<2) continue;
        for(int w=0;w<8;w++){ uint64_t x=m[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; for(int k=0;k<8;k++) mconf[u][k]|=m[k]; } } } }
      if(d<24){ misF[d]=F; if(misG[d].size()!=512) misG[d].resize(512); for(int w=0;w<8;w++){ uint64_t x=F[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; misG[d][u]=mconf[u]; } }
        misFull[d]=lp->full.size(); misValid[d]=true; }   // stored before the self loops are removed: children intersect with their F anyway
      for(int w=0;w<8;w++){ uint64_t x=F[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; mconf[u][u>>6]&=~(1ULL<<(u&63)); } }
      cset(F); { int i=0; for(int w=0;w<8;w++){ uint64_t x=F[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; uint64_t t[8]; comp(mconf[u],t); for(int k=0;k<WC;k++) mcx[i*WC+k]=t[k]; ptsN[i]=u; i++; } } }   // prof7L51 (prof7L62: ptsN)
      uint64_t Fall[8]; comp(F,Fall);
      mBest=need-1; mStop=need; mLim=MISLIM; mexpCX(Fall);   // decision version: only branches that can still reach need are searched
      if(mNodes>MISLIM) gMl[d]++; else if(mBest<need && !((noCut>>5)&1)){ pr=true; cutWhy=5; cutArg=mNodes; }
      nDef=0; const bool dmisOn = d>=DMIN && d<=DMAX2;
      if(dmisOn && (!pr || DMISC)) for(int X=1;X<512;X++){ int dl=hypNeed[X]-hits[X]; if(dl<(DMIS2?1:2)) continue; if(nDef<512){ defXn[nDef]=X; defDn[nDef]=dl; comp(HIT[X],defHc[nDef]); nDef++; } }
      if(nDef>0){ nDefP=(nDef+63)&~63; hv8.assign((size_t)nC*nDefP,0); for(int v=0;v<nC;v++){ int pv=ptsN[v]; uint8_t* hh=&hv8[(size_t)v*nDefP]; for(int i=0;i<nDef;i++) hh[i]=(uint8_t)ip(pv,defXn[i]); }
        defHs.assign((size_t)WC*nDefP,0); for(int i=0;i<nDef;i++) for(int k=0;k<WC;k++) defHs[(size_t)k*nDefP+i]=defHc[i][k]; } else nDefP=0;   // prof7L71, prof7L72 (defHs)
      if(dmisOn && !pr){ long long keep=mNodes; gDn++;   // prof7L61: node-level deficit-independence test
        if(DMIS2){ int r=dsearch(Fall,need,-1); if(r==0 && !((noCut>>6)&1)){ pr=true; cutWhy=6; cutArg=dNodes; } }   // prof7L62: joint search
        else for(int i=0;i<nDef && !pr;i++){ const uint64_t* H=defHc[i]; int c=0; for(int k=0;k<WC;k++) c+=__builtin_popcountll(H[k]);
          if(c<defDn[i]){ if(!((noCut>>6)&1)){ pr=true; cutWhy=6; cutArg=0; } } else { mNodes=0; mBest=defDn[i]-1; mStop=defDn[i]; mLim=DLIM; mexpCX(H); if(mNodes<=DLIM && mBest<defDn[i] && !((noCut>>6)&1)){ pr=true; cutWhy=6; cutArg=mNodes; } } }
        if(pr) gDc++; mNodes=keep; }
      if(HSTAT && !pr && mNodes<=MISLIM){ long long keep=mNodes; BS M; for(int k=0;k<8;k++) M[k]=~0ULL; bool any=false;   // every new point must hit X when X lacks need hits
        for(int X=1;X<512;X++) if(hypNeed[X]-hits[X]==need){ any=true; for(int k=0;k<8;k++) M[k]&=HIT[X][k]; }
        if(any){ gHn++; BS F2; for(int k=0;k<8;k++) F2[k]=F[k]&M[k];
          if(bcnt(F2)<need) gHc++; else { mNodes=0; mBest=need-1; mStop=need; mLim=MISLIM; mexp(F2,0); if(mNodes<=MISLIM && mBest<need) gHc++; } }
        mNodes=keep; }
      if(!pr && MISPRE>0 && need>=2 && d<23){ long long keep=mNodes; BS& dead=pdead[d]; int nu=need-1;   // screen the children with this graph
        const bool r2 = R2SCR && nu>=2 && d<24;
        BS alive{}; int nAlive=0;   // prof7L45 pass 1: plain screen; alive children (within the node limit) wait for the residual-2 pass
        int ci=0;   // prof7L51: node-local index of u
        for(int w=0;w<8;w++){ uint64_t x=F[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; const BS& Ab=ABOVE[lpx::lab[u]+1]; uint64_t Fuc[8]; comp(Ab,Fuc); int nf=0; for(int k=0;k<WC;k++){ Fuc[k]&=~mcx[ci*WC+k]; nf+=__builtin_popcountll(Fuc[k]); } ci++;
            bool dd=false; gPc++; int kk=0; long long kbs=0;   // prof7R3: kill kind and the killing search's node count (as prof7L87d)
            if(nf<nu){ dd=true; mNodes=0; kk=1; }
            else if(DP1 && DMIS2 && dmisOn){ int r=dsearch(Fuc,nu,u,MISPRE); mNodes=dNodes; gDu++;   // prof7L63: joint deficit search as the pass-1 test
              if(r==0){ dd=true; gDk++; kk=3; kbs=dNodes; } else if(r2){ alive[u>>6]|=1ULL<<(u&63); nAlive++; } }   // over the limit: still gets pass 2
            else { mNodes=0; mBest=nu-1; mStop=nu; mLim=MISPRE; mexpCX(Fuc); if(mNodes>MISPRE) gPl++; else if(mBest<nu){ dd=true; kk=2; kbs=mNodes; }
              else { if(DMISC && dmisOn){ long long keep=mNodes; gDu++;   // prof7L61: child-level deficit-independence test
                  if(DMIS2){ if(dsearch(Fuc,nu,u)==0){ dd=true; kk=3; kbs=dNodes; } } else
                  for(int i=0;i<nDef && !dd;i++){ int dl=defDn[i]-ip(u,defXn[i]); if(dl<2) continue; uint64_t H[8]; int c=0; for(int k=0;k<WC;k++){ H[k]=defHc[i][k]&Fuc[k]; c+=__builtin_popcountll(H[k]); }
                    if(c<dl){ dd=true; kk=3; kbs=0; } else { mNodes=0; mBest=dl-1; mStop=dl; mLim=DLIM; mexpCX(H); if(mNodes<=DLIM && mBest<dl){ dd=true; kk=3; kbs=mNodes; } } }
                  if(dd) gDk++; mNodes=keep; }
                if(!dd && r2){ alive[u>>6]|=1ULL<<(u&63); nAlive++; } } }
            if(dd){ dead[u>>6]|=1ULL<<(u&63); pfree[d][u]=(int16_t)nf; pbb[d][u]=(int32_t)mNodes; pkind[d][u]=(uint8_t)kk; pbbs[d][u]=(int32_t)kbs; } } }
        if(r2 && nAlive>0) r2scanAlive(d,F,alive);   // prof7L47: rows through the alive children only
        bool crowOK=false;   // prof7L65: row list built on first use at this node
        if(nAlive>0){   // prof7L45 pass 2: the child's own graph adds the cliques of residual-2 rows through u
          for(int w=0;w<8;w++){ uint64_t x=alive[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; const BS& Ab=ABOVE[lpx::lab[u]+1]; uint64_t Fuc[8]; comp(Ab,Fuc); const int iu=cidx(u); int nf=0; for(int k=0;k<WC;k++){ Fuc[k]&=~mcx[iu*WC+k]; nf+=__builtin_popcountll(Fuc[k]); }
              gR2try++; const bool r2a=r2apply4C(u,Fuc);
              if(r2a){
                if(DP2 && DMIS2 && dmisOn){ int r=dsearch(Fuc,nu,u,MISPRE); if(r==0){ gR2cut++; dead[u>>6]|=1ULL<<(u&63); pfree[d][u]=(int16_t)nf; pbb[d][u]=(int32_t)dNodes; pkind[d][u]=4; pbbs[d][u]=(int32_t)dNodes; } }   // prof7L63
                else { mNodes=0; mBest=nu-1; mStop=nu; mLim=MISPRE; mexpCX(Fuc); if(mNodes<=MISPRE && mBest<nu){ gR2cut++; dead[u>>6]|=1ULL<<(u&63); pfree[d][u]=(int16_t)nf; pbb[d][u]=(int32_t)mNodes; pkind[d][u]=4; pbbs[d][u]=(int32_t)mNodes; } } }
              if(d>=CRMIN && d<=CRMAX && nDef>=0 && !((dead[u>>6]>>(u&63))&1)){   // prof7L65: + the node's residual-2 rows
                if(!crowOK){ unsigned long long c0=__rdtsc(); if(CRBITS) bBuild(); else if(CRPAIR) tBuild(); else if(CRLAZY) capIndex(); else crowBuild(F); crowOK=true; gCRb++; gCRbc+=__rdtsc()-c0; }
                unsigned long long c1=__rdtsc(); int r=CRBITS?crowTestB(Fuc,nu,u):(CRPAIR?crowTestT(Fuc,nu,u):(CRLAZY?crowTestL(Fuc,nu,u):crowTest(Fuc,nu,u))); gCRtc+=__rdtsc()-c1; gCRt++;
                if(r==0){ gCRk++; dead[u>>6]|=1ULL<<(u&63); pfree[d][u]=(int16_t)nf; pbb[d][u]=(int32_t)dNodes; pkind[d][u]=5; pbbs[d][u]=(int32_t)dNodes; } else if(r==2) gCRl++; }
              if(TLMAX>=0 && d>=TLMIN && d<=TLMAX && nu>=2 && !CERTF && !((dead[u>>6]>>(u&63))&1)){   // prof7L89 --tl2: the child's own residual-2 rows (kind 6)
                const int r=tlTest(Fuc,nu,u,F,d); if(r==0){ gTLk[d]++; dead[u>>6]|=1ULL<<(u&63); pfree[d][u]=(int16_t)nf; pbb[d][u]=(int32_t)dNodes; pkind[d][u]=6; pbbs[d][u]=(int32_t)dNodes; } else if(r==2) gTLl[d]++; }
              if(nsvC) r2restoreC(); } } }
        if(PCF && d<24) pcClassify(d,need);   // prof7R3: L1 types of the screen kills (T, C, X), node row table
        if(r2){ BS sv; for(int k=0;k<8;k++) sv[k]=F[k]&~dead[k];   // prof7L47: the children's incremental build needs this node's rows only if a child survives
          if(bnz(sv)){ int ml=1<<30, mu=-1; for(int w=0;w<8;w++){ uint64_t x=sv[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; int lb=lpx::lab[u]; if(lb<ml){ ml=lb; mu=u; } } }
            const BS& Ab=ABOVE[ml+1]; BS Fp, Fs; for(int k=0;k<8;k++){ Fp[k]=F[k]&Ab[k]; Fs[k]=Fp[k]; } Fs[mu>>6]|=1ULL<<(mu&63);   // prof7L49: F' and F' + first child
            BS none{}; r2build(d,Fp,none,Fs); } else r2ok[d]=false; }
        if(HSTAT) for(int w=0;w<8;w++){ uint64_t x=F[w]&~dead[w]; while(x){ int u=w*64+__builtin_ctzll(x); x&=x-1; const BS& Ab=ABOVE[lpx::lab[u]+1]; BS Fu; for(int k=0;k<8;k++) Fu[k]=F[k]&Ab[k]&~mconf[u][k];
            { BS M; bool any=false, inf=false; for(int k=0;k<8;k++) M[k]=~0ULL;
              for(int X=1;X<512;X++){ int dc=hypNeed[X]-hits[X]-ip(u,X); if(dc<nu) continue; if(dc>nu){ inf=true; break; } any=true; for(int k=0;k<8;k++) M[k]&=HIT[X][k]; }
              if(!inf && any){ gHu++; BS F2; for(int k=0;k<8;k++) F2[k]=Fu[k]&M[k];
                if(bcnt(F2)<nu) gHk++; else { mNodes=0; mBest=nu-1; mStop=nu; mLim=MISPRE; mexp(F2,0); if(mNodes<=MISPRE && mBest<nu) gHk++; } } } } }
        mNodes=keep; } }
    gMus+=(long long)std::chrono::duration<double,std::micro>(std::chrono::steady_clock::now()-t0).count();
    if(pr){ gMp[d]++;
      if(CERTF){ char b[64]; std::string t; snprintf(b,sizeof b,"M %d P",curJob); t+=b; for(int l:seq){ snprintf(b,sizeof b," %d",vecOf[l]); t+=b; }
        snprintf(b,sizeof b," free %d bb %lld\n",n,mNodes); t+=b; certPut(t); } }
    return pr; }
  bool lpCheck(int d){
    ensureLP();
    std::vector<int> P(seq.size()); for(size_t i=0;i<seq.size();i++) P[i]=vecOf[seq[i]];
    auto t0=std::chrono::steady_clock::now();
    lpx::NodeRes r=lpx::eval_node(*lp,P,&cert);
    gLPus+=(long long)std::chrono::duration<double,std::micro>(std::chrono::steady_clock::now()-t0).count(); gLPc[d]++;
    bool pr=false; char b[64]; lastHasB=false; lpPrD=-1;
    if(r.st==-2){ gLPv[d]++; pr=true;   // the prefix itself breaks a kept21 cap
      if(CERTF){ std::string t; snprintf(b,sizeof b,"V %d P",curJob); t+=b; for(int v:P){ snprintf(b,sizeof b," %d",v); t+=b; } t+=" row "+std::to_string(cert.viol)+"\n";
        certPut(t); } }
    else if(r.st==lpx::OPT && r.prune){ gLPp[d]++; pr=true;
      if(CERTF){ std::string t; snprintf(b,sizeof b,"N %d P",curJob); t+=b; for(int v:P){ snprintf(b,sizeof b," %d",v); t+=b; }
        t+=" B "+lpx::i128s(cert.B); std::string bs; int nb=0;   // only blockings that matter: reduced cost > 0
        for(auto& q:cert.blk) if(cert.Rj[q.first]>0){ snprintf(b,sizeof b," %d:%d",q.first,q.second); bs+=b; nb++; }
        t+=" blk "+std::to_string(nb)+bs+" lam "+std::to_string(cert.lam.size());
        for(auto& q:cert.lam){ snprintf(b,sizeof b," %d:%lld",q.first,(long long)q.second); t+=b; }
        t+=" mu "+std::to_string(cert.mu.size()); for(auto& q:cert.mu){ snprintf(b,sizeof b," %d:%lld",q.first,(long long)q.second); t+=b; }
        t+="\n"; certPut(t); } }
    if(lp->rowOf.size()>lpx::POOLMAX){ long long c=lpx::tcpu(); lp->rebuild(); gRBn++; gRBns+=lpx::tcpu()-c; }
    lastHasB=!pr && r.hasB; if(pr && r.st==lpx::OPT && r.hasB) lpPrD=d;
    return pr; }
  // the kept node's duals, for screening its children: base = B0 + sum_P R, Sfx[t] = sum of max(R,0) over unblocked labels above t
  void scrFill(int d){ scrFillTo(scr[d]); }
  void scrFillTo(Scr& S){
    memcpy(S.Rj,cert.Rj,sizeof S.Rj); S.base=cert.B0; for(int l:seq) S.base+=cert.Rj[vecOf[l]];
    for(int v=0;v<512;v++) S.brow[v]=-1; for(auto& q:cert.blk) if(S.brow[q.first]<0) S.brow[q.first]=q.second;
    int last=lpx::lab[vecOf[seq.back()]]; S.Sfx[510]=0;
    for(int t=509;t>=last;t--){ int v=lpx::pv[t+1]; S.Sfx[t]=S.Sfx[t+1]+((S.brow[v]<0 && S.Rj[v]>0)?S.Rj[v]:(__int128)0); }
    S.pb.clear(); for(auto& q:cert.blk) if(cert.Rj[q.first]>0) S.pb.push_back(q);
    std::sort(S.pb.begin(),S.pb.end(),[](const std::pair<int,int32_t>& a,const std::pair<int,int32_t>& b){ return lpx::lab[a.first]<lpx::lab[b.first]; });
    S.pbl.clear(); for(auto& q:S.pb) S.pbl.push_back(lpx::lab[q.first]);
    char b[64]; S.lamS=" lam "+std::to_string(cert.lam.size()); for(auto& q:cert.lam){ snprintf(b,sizeof b," %d:%lld",q.first,(long long)q.second); S.lamS+=b; }
    S.muS=" mu "+std::to_string(cert.mu.size()); for(auto& q:cert.mu){ snprintf(b,sizeof b," %d:%lld",q.first,(long long)q.second); S.muS+=b; } }
  // duals of the sibling just pruned by its own LP (cert), over the parent's box and the parent's blockings (scr[d].brow); seq = the parent
  void sibFill(int d){
    Scr& S=sib[d]; const Scr& Pa=scr[d]; memcpy(S.Rj,cert.Rj,sizeof S.Rj); S.base=cert.B0; for(int l:seq) S.base+=cert.Rj[vecOf[l]];
    memcpy(S.brow,Pa.brow,sizeof S.brow);
    int last=lpx::lab[vecOf[seq.back()]]; S.Sfx[510]=0;
    for(int t=509;t>=last;t--){ int v=lpx::pv[t+1]; S.Sfx[t]=S.Sfx[t+1]+((S.brow[v]<0 && S.Rj[v]>0)?S.Rj[v]:(__int128)0); }
    S.pb.clear(); for(int t=last+1;t<511;t++){ int v=lpx::pv[t]; if(S.brow[v]>=0 && S.Rj[v]>0) S.pb.push_back({v,S.brow[v]}); }
    S.pbl.clear(); for(auto& q:S.pb) S.pbl.push_back(lpx::lab[q.first]);
    char b[64]; S.lamS=" lam "+std::to_string(cert.lam.size()); for(auto& q:cert.lam){ snprintf(b,sizeof b," %d:%lld",q.first,(long long)q.second); S.lamS+=b; }
    S.muS=" mu "+std::to_string(cert.mu.size()); for(auto& q:cert.mu){ snprintf(b,sizeof b," %d:%lld",q.first,(long long)q.second); S.muS+=b; } }
  // suffix LP of this node: x = 1 on P, 0 on every label below t; true = its exact bound is below LPR (duals in cert)
  bool sfxLP(int t){
    std::vector<int> P(seq.size()); for(size_t i=0;i<seq.size();i++) P[i]=vecOf[seq[i]];
    auto t0=std::chrono::steady_clock::now(); lpx::NodeRes r=lpx::eval_node(*lp,P,&cert,t);
    gLPus+=(long long)std::chrono::duration<double,std::micro>(std::chrono::steady_clock::now()-t0).count(); gSFc++;
    if(lp->rowOf.size()>lpx::POOLMAX){ long long c=lpx::tcpu(); lp->rebuild(); gRBn++; gRBns+=lpx::tcpu()-c; }
    if(r.st==lpx::OPT && r.prune && r.hasB){ gSFp++; return true; } return false; }
  // N certificate for the child (seq + v at label t) from the duals in S, if their bound is below LPR
  bool scrTry(const Scr& S,int v,int t){
    __int128 Bc=S.base+S.Rj[v]+S.Sfx[t];
    if(Bc>=(__int128)lpx::LPR*lpx::SC) return false;
    if(CERTF){ char b[64]; std::string s; snprintf(b,sizeof b,"N %d P",curJob); s+=b; for(int x:seq){ snprintf(b,sizeof b," %d",vecOf[x]); s+=b; } snprintf(b,sizeof b," %d",v); s+=b;
      s+=" B "+lpx::i128s(Bc); size_t k0=std::upper_bound(S.pbl.begin(),S.pbl.end(),t)-S.pbl.begin();
      s+=" blk "+std::to_string(S.pb.size()-k0); for(size_t k=k0;k<S.pb.size();k++){ snprintf(b,sizeof b," %d:%d",S.pb[k].first,S.pb[k].second); s+=b; }
      s+=S.lamS; s+=S.muS; s+="\n"; certPut(s); }
    return true; }
  // true = child label l of the kept node at depth d has no completion by the node's duals or the latest pruned sibling's (certificate written)
  bool screenChild(int d,int l){
    Scr& S=scr[d]; int v=vecOf[l]; int t=lpx::lab[v]; gSCt[d+1]++; char b[64];
    if(S.brow[v]>=0){ gSCv[d+1]++;   // v lies in a kept21 row the node already fills: the child overfills it
      if(CERTF){ std::string s; snprintf(b,sizeof b,"V %d P",curJob); s+=b; for(int x:seq){ snprintf(b,sizeof b," %d",vecOf[x]); s+=b; }
        snprintf(b,sizeof b," %d row %d\n",v,S.brow[v]); s+=b; certPut(s); }
      return true; }
    if(scrTry(S,v,t)){ gSCp[d+1]++; return true; }
    if(t>=sfxT[d] && scrTry(sfx[d],v,t)){ gSFk++; return true; }
    if(sibOK[d] && scrTry(sib[d],v,t)){ gSCs[d+1]++; return true; }
    return false; }
  // --under: true when seq + l is a prefix of, or lies below, one of the UNDER prefixes (vec values)
  bool underOK(int d,int l) const { for(const auto& p:UNDER){ bool ok=true; int m=std::min((int)p.size(),d+1);
      for(int j=0;j<m&&ok;j++){ int v=(j<d)?vecOf[seq[j]]:vecOf[l]; if(v!=p[j]) ok=false; } if(ok) return true; } return false; }
  void dfs(int pos,int need,double w){
    if((++visited&1023)==0){ totv+=1024; if(VERB && (visited&((1<<12)-1))==0){ std::lock_guard<std::mutex> lk(snapmu); std::string t="snap tid "+std::to_string(tid)+" visited "+std::to_string(visited)+":"; for(int l:seq){ t+=" "+std::to_string(vecOf[l])+"r"+std::to_string(rk[l]); } int dd=(int)seq.size()-1; t+=" | A "+std::to_string(lastA)+" slack "+std::to_string(lastSlack); { char fb[48]; snprintf(fb,sizeof fb," frac %.3e",*doneP-jobBase); t+=fb; } if(dd>=0) for(int k=DMAX+1;k<=8;k++) t+=" L"+std::to_string(k)+"="+(wcov[dd][k]>0?std::to_string(wl[dd][k].size()):std::string("-")); fprintf(stderr,"%s\n",t.c_str()); } }
    if(gSkipP && curJob>=0 && gSkipP[curJob].load(std::memory_order_relaxed)){ gJab[curJob].store(1); if(PCF && !collecting){ pcU8(tlPc.buf,0x06); gPcN[6]++; } *doneP+=w; return; }   // prof7L48 --abortdone (prof7R3: ABORT record)
    int d=seq.size(); cDepth[d]++;
    if(gJdmask && d<64 && ((gJdmask>>d)&1) && curJob>=0 && !shadow){   // prof7L84 --skipjournal: a piece finished by an earlier run
      int vv[64]; for(int i=0;i<d;i++) vv[i]=vecOf[seq[i]]; auto it=gJmap.find(jkey(curJob,vv,d));
      if(it!=gJmap.end()){ const JE& e=it->second; if(CERTF){ char b[64]; std::string t; snprintf(b,sizeof b,"S %d P",curJob); t+=b; for(int i=0;i<d;i++){ snprintf(b,sizeof b," %d",vv[i]); t+=b; } snprintf(b,sizeof b," src %d\n",e.src); t+=b; certPut(t); }   // prof7R2
        if(PCF && !collecting){ std::string& B=tlPc.buf; pcU8(B,0x2A); pcU16(B,(unsigned)seq.back()); pcVar(B,(unsigned)std::max(0,e.src)); pcVar(B,(unsigned long long)std::max(0LL,e.seg)); gPcN[0x2A]++; if(d>pcD0 && d>=1) pcLast[d-1]=seq.back(); if(e.seg<0) gPcErr++; }   // prof7R3: SKP
        visited+=e.n-1; myLeaf+=e.l; myProf+=e.p; nleaf+=e.l; nprof+=e.p; gJskip++; gJskipN+=e.n; *doneP+=w; return; } }
    long long v0=-1;
    if(d==SAMPLE_D){ if(!selected()){ *doneP+=w; return; } v0=visited; }
    if(d==FRONTIER_D && (collecting || (PCTOPRUN && !shadow))){ if(PCTOPRUN && PCF){ pcChild(d-1,seq.back(),0x2D); pcVar(tlPc.buf,(unsigned long long)frontier.size()); } frontier.push_back(seq); return; }   // batch 8/9: JOB delta ix in a top segment (batch 9: full search mode)
    long long vd=(d==DUMPD && !collecting)?visited:-1;
    { timespec a0,a1; clock_gettime(CLOCK_THREAD_CPUTIME_ID,&a0); dfs2(pos,need,w,d); clock_gettime(CLOCK_THREAD_CPUTIME_ID,&a1); gIncl[d<32?d:31]+=(unsigned long long)((a1.tv_sec-a0.tv_sec)*1000000000LL+(a1.tv_nsec-a0.tv_nsec)); }
    if(v0>=0) subSizes.push_back(visited-v0+1);
    if(vd>=0){ std::lock_guard<std::mutex> lk(dumpmu); fprintf(DUMPNF,"%lld",visited-vd+1); for(int l:seq) fprintf(DUMPNF," %d",vecOf[l]); fprintf(DUMPNF,"\n"); fflush(DUMPNF); }
  }
  void dfs2(int pos,int need,double w,int d){
    long long (*st)[32]=STc[tid&127]; if(d<32) st[0][d]++;
    const bool pc=PCF && !collecting; if(pc) pcEnter(d);   // prof7R3: NODE record (top segments run in full search mode, batch 9)
    if(need==0){ if(!shadow) nleaf++; myLeaf++; const bool lok=leafCheck(); if(lok){ if(shadow){ gExpBad++; fprintf(stderr,"R3 ERROR: an accepted leaf inside an expanded child\n"); } else emit(); } if(pc){ pcU8(tlPc.buf,0x02); pcU8(tlPc.buf,lok?0:(unsigned)leafWhy); if(LEAFV7 && lok) leafV7(seq,tlPc.buf); if(PCLEAFX && !lok){ if(leafWhy==5) pcVar(tlPc.buf,(unsigned)std::max(0,leafArgR)); else if((leafWhy==6||leafWhy==7) && leafArgW){ pcU8(tlPc.buf,(unsigned)leafArgW->n); for(int i=0;i<leafArgW->n;i++) pcU16(tlPc.buf,(unsigned)leafArgW->el[i]); pcU8(tlPc.buf,(unsigned)(leafArgW->cap+1)); } } gPcN[2]++; pcMaybe(); } *doneP+=w; return; }
    if(nprof>=MAXPROF){ *doneP+=w; return; }
    if(!feasibleFuture(pos,need,d,true)){ unblockAt(d); cFF[d]++; if(d<32) st[4][d]++; if(pc){ pcCut(1); pcU16(tlPc.buf,(unsigned)ffWhy); } *doneP+=w; return; }
    bool scrOK=false; if(d<24) pdead[d]=BS{};
    if(d<24) wbm[d]=BS{};
    if(WBLOCK && wcut::ON && !collecting && d<24 && !seq.empty()){   // prof7L86: W-blocked candidates
      BS& wb=wbm[d]; const BS& Ab=ABOVE[lpx::lab[vecOf[seq.back()]]+1]; int nb=0; const int cmin=std::max(WBMIN,wcut::K10?9:10);
      for(int w=0;w<14;w++){ const int c=wcnt[w]; if(c<cmin || c>11) continue; gWbC++;
        for(int k=0;k<8;k++){ uint64_t x=Ab[k]&~wb[k]; while(x){ int v=k*64+__builtin_ctzll(x); x&=x-1; if(!((wcut::WM[v]>>w)&1) || multV[v]) continue;
            bool blk;
            if(c==11) blk=true;
            else if(c==10){ uint8_t t[11]; memcpy(t,wlw[w],10); t[10]=wcut::W0C[w][v]; blk=!wcut::dictOK(t); }
            else { uint8_t t[10]; memcpy(t,wlw[w],9); t[9]=wcut::W0C[w][v]; blk=(wcut::k10val(t)==0); }
            if(blk){ wb[v>>6]|=1ULL<<(v&63); nb++; pcWbW[v]=(uint8_t)w; } } } }
      if(nb){ gWbN++; gWbL+=nb; for(int l=pos;l<N;l++){ int v=vecOf[l]; if((wb[v>>6]>>(v&63))&1){ blocked[l]++; wblk[d].push_back(l); } } } }
    if(d>=MISMIN && d<=MISMAX && (!collecting || COLLECTMIS) && misCheckNR(d,need,pc)){ unblockAt(d); if(d<32) st[5][d]++;
      if(pc){ if(PCVCUT) pcVrowsCut(d); pcCut(cutWhy); if(cutWhy==3) pcU8(tlPc.buf,(unsigned)cutArg); else pcVar(tlPc.buf,(unsigned long long)std::max(0LL,cutArg)); if(XPS && (cutWhy==5 || cutWhy==6)){ if(nrCutOK) tlPc.buf+=nrCutBuf; else pcCutXp(d,cutWhy,cutArg); } }   // prof7R3
      *doneP+=w; return; }
    if(d>=LPMIN && d<=LPMAX && !collecting){ if(lpCheck(d)){ unblockAt(d); *doneP+=w; return; } scrOK=SCREEN && lastHasB; if(scrOK) scrFill(d); }
    int avl[512], suf[513], na=0;
    for(int l=pos;l<N;l++){ int u=std::min(std::min(2,pointCap[l]),allowMult[l])-mult[l]; if(u<=0||blocked[l]) continue; avl[na]=l; suf[na]=u; na++; }
    suf[na]=0; for(int i=na-1;i>=0;i--) suf[i]+=suf[i+1];
    int sufA[513], sufB[513], r1node=0;   // prof7L37: rank-1 / other available units at and after avl position i
    if(MINR1>0||MAXR1>=0){ for(int l:seq) if(rk[l]==1) r1node++; sufA[na]=0; sufB[na]=0; for(int i=na-1;i>=0;i--){ int u=suf[i]-suf[i+1]; sufA[i]=sufA[i+1]+(rk[avl[i]]==1?u:0); sufB[i]=sufB[i+1]+(rk[avl[i]]==1?0:u); } }
    if(MINR1>0||MAXR1>=0){ int r1=0; for(int l:seq) if(rk[l]==1) r1++; int ra=0, rb=0; for(int i=0;i<na;i++){ int u=suf[i]-suf[i+1]; if(rk[avl[i]]==1) ra+=u; else rb+=u; }   // EXPERIMENT: rank-1 count window
      if(MINR1>0 && r1+ra<MINR1){ gR1cut++; unblockAt(d); if(pc){ if(PCVCUT) pcVrowsCut(d); pcCut(7); } *doneP+=w; return; }
      if(MAXR1>=0 && (r1>MAXR1 || need>rb+std::min(ra,MAXR1-r1))){ gR1cut++; unblockAt(d); if(pc){ if(PCVCUT) pcVrowsCut(d); pcCut(7); } *doneP+=w; return; } }
    int tc1=0,tc2=0,tc3=0,tcm=0; if(TYPECUT && !collecting){ for(int l:seq){ int r=rk[l]; if(r==1) tc1++; else if(r==2) tc2++; else tc3++; if(r>tcm) tcm=r; }   // prof7L79
      if(!typeReach(tc1,tc2,tc3,need,tcm)){ gTypeCut++; unblockAt(d); if(pc) pcCut(8); *doneP+=w; return; } }
    int c=0;
    if(CNTCANON){ for(int i=0;i<na;i++){ if(suf[i]<need) break; if(!canonCheck(avl[i])) continue; c++; } }
    else for(int i=0;i<na;i++){ if(suf[i]<need) break; c++; }
    if(c==0){ unblockAt(d); cChildless[d]++; if(pc){ if(PCVCUT) pcVrowsCut(d); pcCut(9); } *doneP+=w; return; }
    int ndef=0; int16_t defX[512]; int8_t defD[512]; const int fm=MULT1?1:2;   // --preff: the hyperplanes this node has not yet hit often enough
    const bool pff=PREFF && !collecting;   // never while collecting the frontier: the job list must not change
    if(pff) for(int X=1;X<512;X++){ int dl=hypNeed[X]-hits[X]; if(dl>0){ defX[ndef]=(int16_t)X; defD[ndef]=(int8_t)dl; ndef++; } }
    double wc=w/c; int good=0; sibOK[d]=false; sfxT[d]=1<<30;
    const std::vector<JR>* jrv=nullptr; size_t jri=0; bool jrc=false;   // prof7L84: runs of this node's children finished by earlier runs
    if(gJrmask && d<64 && ((gJrmask>>d)&1) && curJob>=0 && !shadow){ int vv[64]; for(int i2=0;i2<d;i2++) vv[i2]=vecOf[seq[i2]]; auto it=gJrng.find(jkey(curJob,vv,d)); if(it!=gJrng.end()) jrv=&it->second; }
    const bool jon=gJF && curJob>=0 && !collecting && d>=JDEPTH && d<64 && !shadow; if(jon) jacc[d]=JAcc();
    if(SFX && scrOK && d>=SFXMIN){ std::vector<int> cl; const Scr& S=scr[d]; gSFn++;   // labels of the children the node's own duals do not screen
      for(int i=0;i<na;i++){ if(suf[i]<need) break; int l=avl[i]; if(!canonCheck(l)) continue; int v=vecOf[l];
        if(S.brow[v]>=0 || S.base+S.Rj[v]+S.Sfx[l]<(__int128)lpx::LPR*lpx::SC) continue; cl.push_back(l); }
      int lo=0, hi=(int)cl.size();
      while(hi-lo>1){ int mid=(lo+hi)/2; if(sfxLP(cl[mid])){ hi=mid; scrFillTo(sfx[d]); sfxT[d]=cl[mid]; } else lo=mid; } }
    // prof7L90: canonCheck runs after the conflict-graph, V-skip and window cuts (about 1 child in 200 gets there), with images from the
    // linear tables instead of the label-major buffer.  Certificates (--cert) keep the old order; the cuts and counts are the same.
    const bool lateC = SYM && LTOK && !CERTF && !CNTCANON && !scrOK;
    if(SYM && d<24){ const auto& E=cst[d]; cbufOK[d]=false; if(E.size()>=CBMIN && !lateC){
        if(CBTON){   // prof7L78 (c): label-major images of the candidate children (the labels the child loop below may test)
          if(cbT[d]) for(int c=0;c<cbNC[d];c++) cbCi[d][ccLab[d][c]]=-1; else for(int x=0;x<512;x++) cbCi[d][x]=-1;
          int nc=0; for(int i=0;i<na;i++){ if(suf[i]<need) break; ccLab[d][nc]=(int16_t)avl[i]; cbCi[d][avl[i]]=(int16_t)nc; nc++; }
          const size_t NE=E.size(); cbuf[d].resize(NE*(size_t)(nc>0?nc:1)); u16* B=cbuf[d].data();
          if(LTOK){ uint8_t c0[512], c1[512], c2[512]; for(int c=0;c<nc;c++){ const uint8_t* q=vch[ccLab[d][c]]; c0[c]=q[0]; c1[c]=q[1]; c2[c]=q[2]; }   // prof7L90: images from the linear tables
            for(size_t i2=0;i2<NE;i2++){ const LinT& T=LT[E[i2].g]; u16* Bc=B+i2; for(int c=0;c<nc;c++) Bc[(size_t)c*NE]=(u16)labOf[T.t[0][c0[c]]^T.t[1][c1[c]]^T.t[2][c2[c]]]; } }
          else for(size_t i2=0;i2<NE;i2++){ const u16* P=GL[E[i2].g].data(); for(int c=0;c<nc;c++) B[(size_t)c*NE+i2]=P[ccLab[d][c]]; }
          cbNC[d]=nc; cbNE[d]=NE; cbT[d]=true; cbufOK[d]=true; }
        else { cbuf[d].resize(E.size()*512); u16* B=cbuf[d].data();
        for(size_t i2=0;i2<E.size();i2++) memcpy(B+i2*512,GL[E[i2].g].data(),511*sizeof(u16)); cbT[d]=false; cbufOK[d]=true; } } }
    const bool vsk = VSKIP && !collecting && MISPRE>0 && d<24 && d>=MISMIN && d+1<=MISMAX && misValid[d] && lp && lp->trk && !seq.empty(); bool vrowBuilt=false;
    BS lastF; bool vskL=false;   // prof7L35: V-skip at depths MISMAX and MISMAX+1
    int16_t vlRow[512]; int32_t vlRowR[512]; bool vlBuilt=false;   // prof7R2: a full kept row through each point (certificate witnesses of the last-level skips)
    if(VSKIPLAST && !collecting && lp && lp->trk && d<24 && !seq.empty()){   // prof7R2: also with --cert (witness rows below)
      if(d>=MISMIN && d<=MISMAX && d+1>MISMAX && misValid[d]){ lastF=misF[d]; vskL=true; }
      else if(d==MISMAX+1 && d>=1 && misValid[d-1]){
        if(!lp->over.empty()){ gOverL++;   // the prefix overfills a kept row
          if(CERTF){ char b[64]; std::string t; snprintf(b,sizeof b,"V %d P",curJob); t+=b; for(int x:seq){ snprintf(b,sizeof b," %d",vecOf[x]); t+=b; }
            t+=" row "+std::to_string(lp->over[0])+"\n"; certPut(t); }   // prof7R2: same line as misCheck's node-level V
          if(pc){ pcCut(10); pcVar(tlPc.buf,(unsigned)lp->over[0]); }
          unblockAt(d); *doneP+=w; return; }
        const BS& Ab=ABOVE[lpx::lab[vecOf[seq.back()]]+1]; for(int k=0;k<8;k++) lastF[k]=misF[d-1][k]&Ab[k];
        for(size_t i=misFull[d-1];i<lp->full.size();i++){ int32_t r=lp->full[i]; for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; lastF[u>>6]&=~(1ULL<<(u&63)); } }
        vskL=true; } }
    if(pc) pcOpenNode(d,pos);   // prof7R3: OPEN, V rows, row table, W-blocked / subspace-blocked candidates
    for(int i=0;i<na;i++){ if(suf[i]<need) break; int l=avl[i];
      if(gSkipP && curJob>=0 && gSkipP[curJob].load(std::memory_order_relaxed)){ gJab[curJob].store(1); if(pc){ pcU8(tlPc.buf,0x06); gPcN[6]++; } break; }   // prof7L48 --abortdone
      if(jrv){ while(jri<jrv->size() && l>(*jrv)[jri].hi){ jri++; jrc=false; }   // prof7L84 --skipjournal: a run finished earlier
        if(jri<jrv->size() && l>=(*jrv)[jri].lo){ if(!jrc){ const JR& r=(*jrv)[jri];
            if(CERTF){ char b[64]; std::string t; snprintf(b,sizeof b,"S %d R",curJob); t+=b; for(int x:seq){ snprintf(b,sizeof b," %d",vecOf[x]); t+=b; } snprintf(b,sizeof b," %d %d src %d\n",vecOf[r.lo],vecOf[r.hi],r.src); t+=b; certPut(t); }   // prof7R2
            if(pc){ pcChild(d,r.lo,0x29); std::string& B=tlPc.buf; pcVar(B,(unsigned)(r.hi-r.lo)); pcVar(B,(unsigned)std::max(0,r.src)); pcVar(B,(unsigned long long)std::max(0LL,r.seg)); pcVar(B,(unsigned long long)std::max(0LL,r.pb)); pcVar(B,(unsigned long long)std::max(0LL,r.pe)); pcLast[d]=r.hi; if(r.seg<0) gPcErr++; }   // prof7R3: SKR
            visited+=r.n; myLeaf+=r.l; myProf+=r.p; nleaf+=r.l; nprof+=r.p; gJskip++; gJskipN+=r.n; jrc=true; }
          if(jon) jacc[d]=JAcc();   // a new run never spans a recorded one (its children are not in the new run's counts)
          *doneP+=wc; continue; } }
      if(collecting && !UNDER.empty() && !underOK(d,l)) continue;   // --under: skip subtrees outside the listed prefixes
      if(pff){ int v=vecOf[l], nn=need-1; const auto& SH=sufHits[l]; bool cut=false; int pcode=0;   // the child's own hyperplane and split tests (feasibleFuture(l,nn) or leafCheck)
        for(int k=0;k<ndef;k++){ int X=defX[k]; int dl=defD[k]-ip(v,X); if(dl>0 && std::min(nn,fm*(int)SH[X])<dl){ cut=true; pcode=X; break; } }
        if(!cut && USE_SPLIT) for(size_t cc=0;cc<SPL.size();cc++){ int s=splitSum[cc]+SPL[cc].w[l]; if(s>=SPL[cc].need) continue; if(s+nn*(int)sufSplitMax[l][cc]<SPL[cc].need){ cut=true; pcode=512+(int)cc; break; } }
        if(cut){ if(d<32) st[3][d]++; if(pc && !pcInD(d,v)){ pcChild(d,l,0x24); pcU16(tlPc.buf,(unsigned)pcode); } *doneP+=wc; continue; } }
      if(!lateC && !canonCheck(l)){ if(d<32) st[7][d]++; if(pc && !pcInD(d,vecOf[l])) pcCanon(d,l); if(!CNTCANON) *doneP+=wc; continue; }
      if(scrOK && screenChild(d,l)){ *doneP+=wc; continue; }
      bool expandChild=false;   // prof7R3 --pcexp
      if(MISPRE>0 && d<24){ int v=vecOf[l]; if((pdead[d][v>>6]>>(v&63))&1){ if(pc && (PCEXP>0 || PCEXP5>0 || PCNOREP) && ((pcExpM[d][v>>6]>>(v&63))&1)) expandChild=true; else { gPp++; if(d<32) st[6][d]++;   // cut by the node's conflict graph (see the header)
          if(CERTF){ char b[64]; std::string t; snprintf(b,sizeof b,"M %d P",curJob); t+=b; for(int x:seq){ snprintf(b,sizeof b," %d",vecOf[x]); t+=b; }
            snprintf(b,sizeof b," %d free %d bb %d\n",v,(int)pfree[d][v],(int)pbb[d][v]); t+=b; certPut(t); }
          if(pc) pcKill(d,l,v);   // prof7R3
          *doneP+=wc; continue; } } }
      if(vsk){ int v=vecOf[l]; if(!((misF[d][v>>6]>>(v&63))&1)){   // prof7L28v: v lies in a kept row the node fills
          bool okRow=true;
          if(CERTF){ if(!vrowBuilt){ vrowBuilt=true; BS needm{}; int needc=0;   // the available points outside F, each needs a full row through it
              for(int i2=0;i2<na;i2++){ int v2=vecOf[avl[i2]]; vrowD[d][v2]=-1; if(!((misF[d][v2>>6]>>(v2&63))&1)){ needm[v2>>6]|=1ULL<<(v2&63); needc++; } }
              for(int32_t r:lp->full){ if(needc==0) break; for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; if((needm[u>>6]>>(u&63))&1){ needm[u>>6]&=~(1ULL<<(u&63)); vrowD[d][u]=r; needc--; } } } }
            if(vrowD[d][v]<0){ okRow=false; gVskNoRow++; }
            else { char b[64]; std::string t; snprintf(b,sizeof b,"V %d P",curJob); t+=b; for(int x:seq){ snprintf(b,sizeof b," %d",vecOf[x]); t+=b; }
              snprintf(b,sizeof b," %d row %d\n",v,vrowD[d][v]); t+=b; certPut(t); } }
          if(okRow){ gVsk++; if(pc && !pcInD(d,v)){ gPcErr++; if(gPcErr<5) fprintf(stderr,"R3 check: V-skipped child outside D\n"); } *doneP+=wc; continue; } } }
      if(vskL){ int v=vecOf[l]; if(!((lastF[v>>6]>>(v&63))&1)){   // prof7L35
          if(!CERTF){ gVskL++; if(pc && !pcInD(d,v)){ gPcErr++; if(gPcErr<5) fprintf(stderr,"R3 check: last-level V-skipped child outside D\n"); } *doneP+=wc; continue; }
          if(!vlBuilt){ vlBuilt=true; for(int u=0;u<512;u++) vlRow[u]=-1;   // prof7R2: witness = a full kept row through v
            for(int32_t r:lp->full) for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; if(vlRow[u]<0){ vlRow[u]=1; vlRowR[u]=r; } } }
          if(vlRow[v]==1){ char b[64]; std::string t; snprintf(b,sizeof b,"V %d P",curJob); t+=b; for(int x:seq){ snprintf(b,sizeof b," %d",vecOf[x]); t+=b; }
            snprintf(b,sizeof b," %d row %d\n",v,vlRowR[v]); t+=b; certPut(t); gVskL++; *doneP+=wc; continue; }
          gVskLNoRow++; } }   // no full row (a W-blocked point): the child is treated as without the last-level skip
      if(TYPECUT && !collecting){ int r=rk[l]; int n1c=tc1+(r==1), n2c=tc2+(r==2), n3c=tc3+(r==3); if(!typeReach(n1c,n2c,n3c,need-1,std::max(tcm,r))){ gTypeCut++; if(pc && !pcInD(d,vecOf[l])) pcChild(d,l,0x25); *doneP+=wc; continue; } }   // prof7L79
      if((MINR1>0||MAXR1>=0) && !collecting){   // prof7L37: the child's own window test (labels after l only; with mult1 l itself is used up)
        int r12=r1node+(rk[l]==1?1:0), nd2=need-1; int u0=suf[i]-suf[i+1]-1; int ra2=sufA[i+1]+(rk[l]==1?u0:0), rb2=sufB[i+1]+(rk[l]==1?0:u0); bool doom=false;
        if(nd2>0){ if(MINR1>0 && r12+std::min(ra2,nd2)<MINR1) doom=true; if(MAXR1>=0 && (r12>MAXR1 || nd2>rb2+std::min(ra2,MAXR1-r12))) doom=true; }
        if(doom){ gDoom++; if(pc && !pcInD(d,vecOf[l])) pcChild(d,l,0x26); *doneP+=wc; continue; } }
      if(lateC && !canonCheck(l)){ if(d<32) st[7][d]++; if(pc && !pcInD(d,vecOf[l])) pcCanon(d,l); *doneP+=wc; continue; }   // prof7L90: after the bit-test cuts above (pure; canonCheck only fills cst[d+1])
      Undo U; lpPrD=-1; if(d<32) st[1][d]++; bool ok=add(l,U);
      if(ok){ good++; trkA(l);
        bool aged=false;   // prof7L48: a long-running job donates without idle threads (queue capped)
        if(AGEDON>0 && !collecting && !PCTOPRUN && need>1 && (int)seq.size()<AGEDEPTH && qsizeA.load(std::memory_order_relaxed)<2*THREADS){   // batch 7: never while collecting (the collection has no workers: a donated child was lost and the frontier came out empty)
          aged=std::chrono::duration<double>(std::chrono::steady_clock::now()-jstart).count()>AGEDON; }
        if(expandChild){ pcKill(d,l,vecOf[l]);   // prof7R3: X record with choice 2, then the child's records, outside the search's counters
          const long long sv=visited, sl=myLeaf, sp=myProf; const bool cs=collecting; collecting=false; shadow++; dfs(l,need-1,0.0); shadow--; collecting=cs; gExpN+=visited-sv; visited=sv; myLeaf=sl; myProf=sp; gExpK++; }   // batch 8: searched in full mode, also inside a top segment
        else if(need>1 && !shadow && !collecting && !PCTOPRUN && (int)seq.size()<DONATE_DEPTH && (SAMPLE_D<0 || (int)seq.size()<=SAMPLE_D) && (idleN.load(std::memory_order_relaxed)>0 || aged)){
          if(gOutst && curJob>=0) gOutst[curJob]++;   // prof7L29: one more outstanding piece of this frontier job
          Job jb{seq,wc,curJob}; if(pc){ for(int k=0;k<8;k++) jb.dinh[k]=pcD[d][k];
            if(PCWIT){ jb.win=pcWin; for(int k=pcD0;k<=d;k++) jb.win.insert(jb.win.end(),pcVr[k].begin(),pcVr[k].end()); std::sort(jb.win.begin(),jb.win.end()); jb.win.erase(std::unique(jb.win.begin(),jb.win.end()),jb.win.end()); }   // batch 12: the rows behind jb.dinh
            pcChild(d,l,0x28); }   // prof7R3: DON; the piece inherits this node's dead mask
          { std::lock_guard<std::mutex> lk(qmu); Q.push_back(std::move(jb)); qsizeA++; } donated++; donN++; qcv.notify_one();
          if(jon) jacc[d]=JAcc(); }   // prof7L84: a donated child ends the run
        else if(!jon) dfs(l,need-1,wc);
        else { const long long cv0=visited, cl0=myLeaf, cp0=myProf, cd0=donN; const long long po0=pc?pcOff():-1; dfs(l,need-1,wc);   // prof7L84: extend the run (prof7R3: po0 = where the child's bytes start)
          JAcc& A=jacc[d];
          if(donN!=cd0 || (gJab && gJab[curJob].load(std::memory_order_relaxed)) || nprof>=MAXPROF) A=JAcc();
          else { if(A.lo<0){ A.lo=l; A.pb=po0; } A.hi=l; A.n+=visited-cv0; A.l+=myLeaf-cl0; A.p+=myProf-cp0; if(A.n>=JMIN){ jrecRange(d,A); A=JAcc(); } } }
        trkD(l);
      } else { cAddFail[d]++; if(d<32) st[2][d]++; if(pc && !pcInD(d,vecOf[l])) pcAddF(d,l); *doneP+=wc; }
      undo(l,U);
      if(SIB && scrOK && lpPrD==d+1){ sibFill(d); sibOK[d]=true; }
    }
    if(d<24) cbufOK[d]=false;
    if(pc){ pcU8(tlPc.buf,0x05); gPcN[5]++; pcMaybe(); }   // prof7R3: END
    unblockAt(d);
    if(good==0) cChildless[d]++;
  }
  // --kest K: Knuth estimate of a job subtree with the node checks of dfs2 (feasibleFuture, conflict-graph bound, child
  // screen, canonicity, add); one random dive from the replayed job node, returns the estimated subtree node count.
  double kdive(int pos,int need,std::mt19937_64& rng){
    double w=1, est=1; const int d0=seq.size(); std::vector<std::pair<int,Undo>> path;
    while(true){
      const int d=seq.size();
      if(need==0) break;
      if(!feasibleFuture(pos,need,d,true)) break;
      if(d<24) pdead[d]=BS{};
      if(d>=MISMIN && d<=MISMAX && misCheck(d,need)) break;
      int avl[512], suf[513], na=0;
      for(int l=pos;l<N;l++){ int u=std::min(std::min(2,pointCap[l]),allowMult[l])-mult[l]; if(u<=0||blocked[l]) continue; avl[na]=l; suf[na]=u; na++; }
      suf[na]=0; for(int i=na-1;i>=0;i--) suf[i]+=suf[i+1];
      std::vector<int> kids;
      for(int i=0;i<na;i++){ if(suf[i]<need) break; int l=avl[i];
        if(!canonCheck(l)) continue;
        if(MISPRE>0 && d<24){ int v=vecOf[l]; if((pdead[d][v>>6]>>(v&63))&1) continue; }
        Undo U; bool ok=add(l,U); undo(l,U); if(ok) kids.push_back(l); }
      if(kids.empty()) break;
      w*=kids.size(); est+=w;
      int l=kids[rng()%kids.size()]; canonCheck(l); Undo U; addT(l,U); path.push_back({l,U}); pos=l; need--; }
    for(int d=d0;d<24;d++) unblockAt(d);
    for(int i=(int)path.size()-1;i>=0;i--) undoT(path[i].first,path[i].second);
    return est; }
  // Knuth estimator: one random dive; returns estimated subtree node count, leaves count
  void dive(std::mt19937_64& rng,double& estNodes,double& estLeaves,int& depthReached){
    double w=1; estNodes=1; estLeaves=0; int pos=0; int need=R; depthReached=0;
    std::vector<std::pair<int,Undo>> path; resetLists();
    while(true){
      if(need==0){ estLeaves=w; break; }
      if(!feasibleFuture(pos,need,(int)seq.size(),true)) break;
      std::vector<int> kids;
      int avl[512], suf[513], na=0;
      for(int l=pos;l<N;l++){ int u=std::min(std::min(2,pointCap[l]),allowMult[l])-mult[l]; if(u<=0||blocked[l]) continue; avl[na]=l; suf[na]=u; na++; }
      suf[na]=0; for(int i=na-1;i>=0;i--) suf[i]+=suf[i+1];
      for(int i=0;i<na;i++){ if(suf[i]<need) break; int l=avl[i];
        if(!canonCheck(l)) continue;
        Undo U; bool ok=add(l,U); undo(l,U); if(ok) kids.push_back(l); }
      if(kids.empty()) break;
      w*=kids.size(); estNodes+=w;
      int l=kids[rng()%kids.size()]; canonCheck(l); Undo U; addT(l,U); path.push_back({l,U}); pos=l; need--; depthReached++;
    }
    for(int d=0;d<24;d++) unblockAt(d);
    for(int i=(int)path.size()-1;i>=0;i--) undoT(path[i].first,path[i].second);
  }
  std::vector<Undo> rp;
  int replayWhy=0;   // prof7L39: 1 = a prefix label failed canonicity, 2 = it broke a capacity
  bool replay(const std::vector<int>& job){ for(int k=0;k<24;k++){ misValid[k]=false; cbufOK[k]=false; r2ok[k]=false; } rp.clear(); replayWhy=0; for(int l:job){ if(!canonCheck(l)){ replayWhy=1; return false; } rp.emplace_back(); if(!addT(l,rp.back())){ replayWhy=2; return false; } } return true; }
  void unreplay(const std::vector<int>& job){ for(int i=(int)rp.size()-1;i>=0;i--) undoT(job[i],rp[i]); rp.clear(); }
};

int main(int argc,char** argv){
  const char* outpath="profiles.txt"; const char* checklist=nullptr; const char* restrictlist=nullptr; const char* tabpath="/dev/shm/mm3_table.bin"; const char* bumpspec=nullptr;
  for(int i=1;i<argc;i++){ std::string a=argv[i]; auto val=[&](){return std::string(argv[++i]);};
    if(a=="--tl2"){ TLMIN=std::stoi(argv[++i]); TLMAX=std::stoi(argv[++i]); } else if(a=="--tllim") TLLIM=std::stoll(argv[++i]);
    else if(a=="--pcert"){ PCPATH=argv[++i]; PCF=fopen(PCPATH,"a"); if(!PCF){ fprintf(stderr,"cannot open pcert file\n"); return 1; } if(ftell(PCF)!=0){ fprintf(stderr,"--pcert %s: the file is not empty (one file per launch)\n",PCPATH); return 1; } }
    else if(a=="--pcxbb") PCXBB=std::stoll(argv[++i]); else if(a=="--pcchk") PCCHK=true; else if(a=="--pcfkpol"){ PCFKP=true; std::stringstream ss(argv[++i]); std::string t; while(std::getline(ss,t,',')){ int k; long long lo, hi; if(sscanf(t.c_str(),"%d:%lld:%lld",&k,&lo,&hi)==3 && k>=1 && k<8){ PCFKLO[k]=lo; PCFKHI[k]=hi; } } if(PCFK<=0) PCFK=1; }
    else if(a=="--pcexp") PCEXP=std::stoll(argv[++i]); else if(a=="--pcexp5") PCEXP5=std::stoll(argv[++i]); else if(a=="--pcvcut") PCVCUT=true; else if(a=="--pcnorep") PCNOREP=true; else if(a=="--xpvar") XPVAR=true; else if(a=="--xp2verify") XP2VERIFY=std::stoll(argv[++i]); else if(a=="--pcwit") PCWIT=true; else if(a=="--leafv7") LEAFV7=true; else if(a=="--pctop"){ PCTOP=true; PCTOPF=std::stoi(argv[++i]); PCTOPFILE=argv[++i]; } else if(a=="--pcleafx") PCLEAFX=true; else if(a=="--xp2agg") XP2AGG=std::stoi(argv[++i]); else if(a=="--xp2cut") XP2CUT=std::stoi(argv[++i]); else if(a=="--xp2psteps") XP2PSTEPS=std::stoi(argv[++i]); else if(a=="--xp2prune") XP2PRUNE=std::stoi(argv[++i]); else if(a=="--xp2exprune") XP2EXPRUNE=std::stoi(argv[++i]); else if(a=="--xp2"){ XP2=true; auto E=[](const char* n,double dflt){ const char* v=getenv(n); return v?atof(v):dflt; }; xp2::Params2& P=XP2P;
      P.lim=(long)E("XP_LIM",P.lim); P.peelK=(int)E("P2_PEELK",P.peelK); P.prune=(int)E("P2_PRUNE",P.prune); P.exclPrune=(int)E("P2_EXPRUNE",P.exclPrune); P.brK4=(int)E("P2_BRK4",P.brK4);
      P.nodeCand=(int)E("P2_NODECAND",P.nodeCand); P.fullBB3=(int)E("P2_FULLBB3",P.fullBB3); P.fullBB2=(int)E("P2_FULLBB2",P.fullBB2); P.verify=(int)E("P2_VERIFY",P.verify); P.l1Node=(int)E("P2_L1NODE",P.l1Node);
      P.cDict=E("P2_CDICT",P.cDict); P.cNode=E("P2_CNODE",P.cNode); P.cUse=E("P2_CUSE",P.cUse); P.cC2=E("P2_CC2",P.cC2); P.agg=(int)E("P2_AGG",P.agg); P.pruneSteps=(int)E("P2_PSTEPS",P.pruneSteps); P.brMin=(int)E("P2_BRMIN",P.brMin); P.semi23=(int)E("P2_SEMI",P.semi23); P.tryFull=(int)E("P2_TRYFULL",P.tryFull); P.cCR=E("P2_CCR",P.cCR); P.cut=(int)E("P2_CUT",P.cut);
      fprintf(stderr,"xp2: lim %ld peelK %d prune %d exclPrune %d brK4 %d nodeCand %d agg %d pruneSteps %d verify %d\n",P.lim,P.peelK,P.prune,P.exclPrune,P.brK4,P.nodeCand,P.agg,P.pruneSteps,P.verify); }
    else if(a=="--pcxp" || a=="--xpeel"){ XPS=new xpeel::Static(); const char* c2=argv[++i]; const char* lb=argv[++i]; if(!XPS->load(c2)){ fprintf(stderr,"xpeel: cannot load %s\n",c2); return 1; } FILE* lf=fopen(lb,"rb"); if(!lf){ fprintf(stderr,"xpeel: cannot open %s\n",lb); return 1; } fseek(lf,0,SEEK_END); long nn=ftell(lf); fseek(lf,0,SEEK_SET); XPLAB.resize(nn); if(fread(XPLAB.data(),1,nn,lf)!=(size_t)nn){ fprintf(stderr,"xpeel: short read\n"); return 1; } fclose(lf); }
    else if(a=="--xpkinds") XPKINDS=std::stoi(argv[++i]); else if(a=="--xpminbb") XPMINBB=std::stoll(argv[++i]); else if(a=="--xplim") XPLIM=std::stoll(argv[++i]); else if(a=="--pcfk") PCFK=std::stoll(argv[++i]); else if(a=="--pcfksamp") PCFKS=std::stoll(argv[++i]); else if(a=="--pcfkl") PCFKL=std::stoll(argv[++i]); else if(a=="--pcfkc") PCFKC=std::stoll(argv[++i]); else if(a=="--pcfklb") PCFKLB=true; else if(a=="--pcfk6") PCFK6=true; else if(a=="--pcfk6sup") PCFK6SUP=std::stoll(argv[++i]);
    else if(a=="--nocbt") CBTON=false; else if(a=="--noleaffast") LEAFFAST=false; else if(a=="--nor2cand") R2CAND=false; else if(a=="--wblock") WBLOCK=true; else if(a=="--wbmin") WBMIN=std::stoi(argv[++i]); else if(a=="--flook") FLOOK=std::stoi(argv[++i]); else if(a=="--rlook") RLOOK=true; else if(a=="--fdef") FDEF=true; else if(a=="--rootcut") rootcut::ON=true; else if(a=="--wcut") wcut::ON=true; else if(a=="--wk10") wcut::K10=true; else if(a=="--r") R=std::stoi(val()); else if(a=="--dmax") DMAX=std::stoi(val()); else if(a=="--donate_depth") DONATE_DEPTH=std::stoi(val());
    else if(a=="--threads"){ THREADS=std::stoi(val()); if(THREADS<1||THREADS>1024){ fprintf(stderr,"--threads must be 1..1024\n"); return 2; } } else if(a=="--nosplit") USE_SPLIT=false; else if(a=="--max") MAXPROF=std::stoll(val());
    else if(a=="--check") checklist=argv[++i]; else if(a=="--out") outpath=argv[++i]; else if(a=="--nosym") SYM=false; else if(a=="--restrict") restrictlist=argv[++i];
    else if(a=="--table") tabpath=argv[++i]; else if(a=="--estimate") ESTIMATE=std::stoll(val()); else if(a=="--mult1") MULT1=true; else if(a=="--linebump") LINEBUMP=true; else if(a=="--bump") bumpspec=argv[++i]; else if(a=="--frontier") FRONTIER_D=std::stoi(val()); else if(a=="--nowlook") WLOOK=false; else if(a=="--rord") RORD=std::stoi(val()); else if(a=="--dumpfrontier") DUMPF=argv[++i]; else if(a=="--dumpnodes"){ DUMPD=std::stoi(val()); DUMPNF=fopen(argv[++i],"w"); } else if(a=="--jobprefix"){ std::stringstream js(val()); std::string g; while(std::getline(js,g,';')){ std::stringstream s2(g); std::string t; std::vector<int> p; while(std::getline(s2,t,',')) p.push_back(std::stoi(t)); JOBPRE.push_back(p); } } else if(a=="--verbose") VERB=true; else if(a=="--jobs"){ std::stringstream js(val()); std::string t; while(std::getline(js,t,',')) JOBS.push_back(std::stoi(t)); } else if(a=="--lp"){ LPMIN=std::stoi(val()); LPMAX=std::stoi(val()); } else if(a=="--cert"){ CERTPATH=argv[i+1]; CERTF=fopen(argv[++i],"a"); if(!CERTF){ fprintf(stderr,"cannot open cert file\n"); return 1; } }
    else if(a=="--lpkept") LPKEPT=argv[++i]; else if(a=="--lpnofull") lpx::FULLSEP=false; else if(a=="--lpmaxit") lpx::MAXIT=std::stoi(val()); else if(a=="--lppool") lpx::POOLMAX=std::stol(val());
    else if(a=="--lpedge") lpx::EDGE=std::stoi(val()); else if(a=="--lpscale") lpx::SCALE=std::stoi(val()); else if(a=="--lpinitdim") lpx::INITDIM=std::stoi(val()); else if(a=="--lpcheapdim") lpx::CHEAPDIM=std::stoi(val());
    else if(a=="--lpkeepstop") lpx::KEEPSTOP=std::stod(val()); else if(a=="--lpsfxkeepstop") lpx::SFXKEEPSTOP=std::stod(val()); else if(a=="--lpsfxnofull") lpx::SFXNOFULL=true;
    else if(a=="--lpprof") lpx::PROF=true; else if(a=="--lpalive"){ lpx::PROF=true; lpx::ALIVEM=true; } else if(a=="--lpfullmaxd") lpx::FULLMAXD=std::stoi(val()); else if(a=="--lpfullmode") lpx::FULLMODE=std::stoi(val());
    else if(a=="--reverse") REVERSE=true; else if(a=="--lpscreen") SCREEN=true; else if(a=="--lpsib"){ SCREEN=true; SIB=true; } else if(a=="--lpsfx"){ SCREEN=true; SFX=true; } else if(a=="--lpinc") lpx::INC=true; else if(a=="--mis"){ MISMIN=std::stoi(val()); MISMAX=std::stoi(val()); } else if(a=="--mislim") MISLIM=std::stoll(val()); else if(a=="--mispre") MISPRE=std::stoll(val()); else if(a=="--lpsfxmin") SFXMIN=std::stoi(val()); else if(a=="--lpboxchk") lpx::BOXCHK=std::stoll(val()); else if(a=="--lpobjb"){ lpx::OBJB=true; lpx::MINF=true; } else if(a=="--lpobjbdelta") OBJBD=std::stod(val());
    else if(a=="--jobsfile"){ FILE* jf=fopen(argv[++i],"r"); if(!jf){ fprintf(stderr,"no jobs file\n"); return 1; } int x; while(fscanf(jf,"%d",&x)==1){ JOBS.push_back(x); int c=fgetc(jf); if(c!=','&&c!='\n'&&c!=' '&&c!=EOF) ungetc(c,jf); } fclose(jf); }
    else if(a=="--preff") PREFF=true; else if(a=="--nocntcanon") CNTCANON=false; else if(a=="--hstat") HSTAT=true;
    else if(a=="--kest") KEST=std::stoll(val()); else if(a=="--collectmis") COLLECTMIS=true; else if(a=="--noincmis") INCMIS=false; else if(a=="--cbmin") CBMIN=std::stoul(val()); else if(a=="--doneprefixes") DONEPF=argv[++i]; else if(a=="--dumponly") DUMPONLY=true; else if(a=="--typecut") TYPECUT=std::stoi(argv[++i]); else if(a=="--minr1") MINR1=std::stoi(argv[++i]); else if(a=="--maxr1") MAXR1=std::stoi(argv[++i]); else if(a=="--frontierfile") FRONTF=argv[++i]; else if(a=="--vskip") VSKIP=true; else if(a=="--r2screen") R2SCR=true; else if(a=="--vskiplast") VSKIPLAST=true;
    else if(a=="--under"){ std::stringstream js(val()); std::string g; while(std::getline(js,g,';')){ std::stringstream s2(g); std::string t; std::vector<int> p; while(std::getline(s2,t,',')) p.push_back(std::stoi(t)); UNDER.push_back(p); } }
    else if(a=="--journal") JOURNALF=argv[++i]; else if(a=="--jdepth") JDEPTH=std::stoi(argv[++i]); else if(a=="--jmin") JMIN=std::stoll(argv[++i]); else if(a=="--jsync") JSYNC=std::stod(argv[++i]); else if(a=="--jforce") JFORCE=true; else if(a=="--jcompat84") JCOMPAT84=true; else if(a=="--jcompat"){ std::string v=argv[++i]; std::vector<std::string> toks;   // prof7R2
      if(!v.empty() && v[0]=='@'){ std::ifstream f(v.substr(1)); std::string t; while(f>>t) toks.push_back(t); } else { std::stringstream ss(v); std::string t; while(std::getline(ss,t,',')) if(!t.empty()) toks.push_back(t); }
      for(auto& t:toks) gJCompat.insert(std::stoull(t,nullptr,16)); } else if(a=="--skipjournal"){ std::string v=argv[++i]; if(!v.empty() && v[0]=='@'){ std::ifstream lf(v.substr(1)); if(!lf){ fprintf(stderr,"no journal list %s\n",v.c_str()+1); return 2; } std::string t; while(std::getline(lf,t)) if(!t.empty()) SKIPJ.push_back(t); }   // @FILE: one journal per line
      else { std::stringstream js(v); std::string t; while(std::getline(js,t,',')) if(!t.empty()) SKIPJ.push_back(t); } }
    else if(a=="--state") STATEPATH=argv[++i]; else if(a=="--skipfile") SKIPF=argv[++i]; else if(a=="--agedonate") AGEDON=std::stod(argv[++i]); else if(a=="--pfd") PFD=std::stoul(argv[++i]); else if(a=="--crowlazy") CRLAZY=true; else if(a=="--crowpair") CRPAIR=true; else if(a=="--crowbits") CRBITS=true; else if(a=="--r2pf") R2PF=std::stoi(argv[++i]); else if(a=="--crowk") CRK=std::stoi(argv[++i]); else if(a=="--crowkmin") CRKMIN=std::stoi(argv[++i]); else if(a=="--crowiter") CRITER=std::stoi(argv[++i]); else if(a=="--crow"){ CRMIN=std::stoi(argv[++i]); CRMAX=std::stoi(argv[++i]); if(i+1<argc && argv[i+1][0]!='-') CRLIM=std::stoll(argv[++i]); } else if(a=="--dmis"){ DMIN=std::stoi(argv[++i]); DMAX2=std::stoi(argv[++i]); } else if(a=="--dmisc") DMISC=true; else if(a=="--dmis2") DMIS2=true; else if(a=="--dp1") DP1=true; else if(a=="--dp2") DP2=true; else if(a=="--dmislim") DLIM=std::stoll(argv[++i]); else if(a=="--agedepth") AGEDEPTH=std::stoi(argv[++i]); else if(a=="--abortdone") ABORTDONE=true; else if(a=="--drainfile") DRAINF=argv[++i]; else if(a=="--skipevery") SKIPEVERY=std::stoi(argv[++i]); else if(a=="--sample"){ SAMPLE_D=std::stoi(val()); SAMPLE_P=std::stod(val()); SAMPLE_SEED=std::stoull(val()); } else { fprintf(stderr,"bad arg %s\n",a.c_str()); return 1; } }
  if(wcut::K10 && !wcut::ON){ fprintf(stderr,"--wk10 needs --wcut\n"); return 2; }
  if(WBLOCK && !wcut::ON){ fprintf(stderr,"--wblock needs --wcut\n"); return 2; }
  if(wcut::ON){ if(R!=22){ fprintf(stderr,"--wcut is the r = 22 lemma\n"); return 2; } wcut::init(); fprintf(stderr,"L75: wcut on, wk10 %d\n",(int)wcut::K10); }
  { // prof7L84: fingerprint of the search semantics (all options but the run-specific ones below), checked against --skipjournal files
    static const char* RUN1[]={"--threads","--jobsfile","--state","--out","--journal","--jdepth","--jmin","--jsync","--skipjournal","--skipfile","--skipevery","--drainfile","--agedonate","--agedepth","--pfd","--donate_depth","--cert","--jcompat","--pcert","--pcxbb","--pcfk","--pcfksamp","--pcfkl","--pcfkc","--pcexp","--pcfkpol","--pcfk6sup","--pcexp5","--xpkinds","--xpminbb","--xplim",nullptr};
    static const char* RUN0[]={"--abortdone","--verbose","--jforce","--jcompat84","--pcchk","--pcfklb","--pcfk6","--pcvcut","--pcleafx",nullptr};
    static const char* L86V[]={"--wbmin","--flook",nullptr}; static const char* L86F[]={"--wblock","--fdef","--rlook",nullptr};   // prof7L87: left out of gFP84
    unsigned long long h=1469598103934665603ULL; auto mix=[&](const char* t){ for(;*t;t++){ h^=(unsigned char)*t; h*=1099511628211ULL; } h^=0xff; h*=1099511628211ULL; };
    unsigned long long h84=1469598103934665603ULL; auto mix84=[&](const char* t){ for(;*t;t++){ h84^=(unsigned char)*t; h84*=1099511628211ULL; } h84^=0xff; h84*=1099511628211ULL; };
    mix("prof7R2"); if(CERTF) mix("certmode"); if(PCF) mix("pcertmode");   // prof7R3: journals of runs without the pcert stream cannot be referenced by it mix84("prof7L84");   // prof7L87: gFP84 = the fingerprint prof7L84 computes for these options without the L86 flags
    for(int i=1;i<argc;i++){ bool skip1=false, skip0=false, v86=false, f86=false; for(int k=0;RUN1[k];k++) if(!strcmp(argv[i],RUN1[k])) skip1=true; for(int k=0;RUN0[k];k++) if(!strcmp(argv[i],RUN0[k])) skip0=true;
      for(int k=0;L86V[k];k++) if(!strcmp(argv[i],L86V[k])) v86=true; for(int k=0;L86F[k];k++) if(!strcmp(argv[i],L86F[k])) f86=true;
      if(!strcmp(argv[i],"--pctop")){ i+=2; continue; }   // batch 8: a run mode, not search semantics
      if(skip1){ i++; continue; } if(skip0) continue; mix(argv[i]); if(f86) continue; if(v86){ if(i+1<argc){ i++; mix(argv[i]); } continue; } mix84(argv[i]); }
    if(PCNOREP){ char b[48]; snprintf(b,sizeof b,"pcnorep-xplim=%lld",XPLIM); mix(b); }
    if(LEAFV7) mix("leafv7:gen7.h b4710df6633b K4 maxnodes 300000/2000000/20000000 deadk6 lg1 fit-after-overflow");   // batch 14 keeps this string: gen7fast (1b9fb801d5cd) gives the same certificates bit for bit   // batch 13
    if(XP2AGG>=0) XP2P.agg=XP2AGG; if(XP2CUT>=0) XP2P.cut=XP2CUT; if(XP2PSTEPS>=0) XP2P.pruneSteps=XP2PSTEPS; if(XP2PRUNE>=0) XP2P.prune=XP2PRUNE; if(XP2EXPRUNE>=0) XP2P.exclPrune=XP2EXPRUNE; if(XP2VERIFY==0) XP2P.verify=0;   // batch 9: kill2's budget cut and step pruning by flag
    if(XP2){ const xp2::Params2& P=XP2P; char b[640];   // batch 5: certificates depend on every xp2 parameter, and P2_* come from the environment
      snprintf(b,sizeof b,"xp2:%ld,%d,%ld,%d,%g,%g,%g,%g,%g,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%g,%g,%g,%g,%g,%g,%g,cut%d,%g,c2u%d,c2v%d",
        P.lim,P.branchRule,P.limRetry,P.peelK,P.cDict,P.cNode,P.cUse,P.cC2,P.cCR,P.childRowsK23,P.branchRowsK23,P.brMin,P.nodeCand,P.brK5,P.brK4,P.fullBB3,P.fullBB2,P.tryFree,P.semi23,P.tryFull,
        P.exclPrune,P.l1Node,P.prune,P.pruneC2,P.fullOnly,P.allExcl,P.verify,P.agg,P.pruneSteps,P.pruneStepsKind,P.cChild,P.cStep,P.cBr,P.amort1,P.cPair,P.cBrH,P.cLab,P.cut,P.cCut,P.noC2u,P.noC2v); mix(b); }
    if(XP2) fprintf(stderr,"xp2 effective: agg %d cut %d lim %ld limRetry %ld prune %d exclPrune %d pruneSteps %d verify %d xpvar %d\n",XP2P.agg,XP2P.cut,XP2P.lim,XP2P.limRetry,XP2P.prune,XP2P.exclPrune,XP2P.pruneSteps,XP2P.verify,(int)XPVAR);   // --pcnorep: the node limit decides which node cuts 5 / 6 are taken
    gFP=h; gFP84=h84;
    if((JOURNALF || !SKIPJ.empty()) && LPMIN<=R && LPMAX>=JDEPTH){ fprintf(stderr,"--journal needs no LP at depths >= jdepth (sibling screens depend on child LPs)\n"); return 2; } }
  TAB.load(tabpath); if(AGEDEPTH<0) AGEDEPTH=DONATE_DEPTH;
  fprintf(stderr,"L16: preff %d cntcanon %d hstat %d\n",(int)PREFF,(int)CNTCANON,(int)HSTAT);
  fprintf(stderr,"L48: agedonate %.0f agedepth %d abortdone %d drainfile %s\n",AGEDON,AGEDEPTH,(int)ABORTDONE,DRAINF?DRAINF:"-");
  if(TYPECUT && RORD!=123){ fprintf(stderr,"--typecut needs --rord 123 (rank-1 labels first)\n"); return 2; }
  if(TLMAX>=0 && (!R2SCR || MISPRE<=0)){ fprintf(stderr,"--tl2 needs --r2screen and --mispre\n"); return 2; }
  if(TYPECUT&512) fprintf(stderr,"WARNING: --typecut bit 512 ((16,4,2)) is not a proven type kill\n");   // prof7R3
  if(PCNOREP && (!XPS || !PCF)){ fprintf(stderr,"--pcnorep needs --pcxp and --pcert\n"); return 2; }
  std::vector<int> pv; { int ro[3]={RORD/100,(RORD/10)%10,RORD%10}; for(int t=0;t<3;t++) for(int v=1;v<512;v++) if(rank3(v)==ro[t]) pv.push_back(v); }
  if((int)pv.size()!=511){ fprintf(stderr,"bad --rord\n"); return 1; }
  N=pv.size(); for(int i=0;i<512;i++) labOf[i]=-1; for(int i=0;i<N;i++){ vecOf[i]=pv[i]; labOf[pv[i]]=i; rk[i]=rank3(pv[i]); }
  for(int i=0;i<512;i++) labOfG[i]=labOf[i];   // prof7R3
  auto G=build_group(); GL3V=gl3list();   // prof7R3
  if(bumpspec){ std::stringstream ss(bumpspec); std::string ent; while(std::getline(ss,ent,';')){ auto c=ent.find(':'); int L=std::stoi(ent.substr(c+1)); std::vector<int> vs; std::stringstream s2(ent.substr(0,c)); std::string t; while(std::getline(s2,t,',')) vs.push_back(std::stoi(t));
      size_t before=BUMP.size(); for(auto& g:G){ u16 im[9]; for(size_t j=0;j<vs.size();j++) im[j]=g[vs[j]]; int d; u128 k=rref_key(im,vs.size(),&d); auto it=BUMP.find(k); if(it==BUMP.end()) BUMP[k]=L; else it->second=std::max(it->second,L); }
      fprintf(stderr,"bump %s: orbit size %zu\n",ent.c_str(),BUMP.size()-before); } } GL.resize(G.size()); for(size_t g=0;g<G.size();g++) for(int l=0;l<N;l++) GL[g][l]=(u16)labOf[G[g][vecOf[l]]];
  for(size_t g=0;g<GL.size()&&GID<0;g++){ bool id=true; for(int l=0;l<N;l++) if(GL[g][l]!=l){id=false;break;} if(id) GID=g; }
  fprintf(stderr,"group %zu identity %d\n",GL.size(),GID);
  { LT.resize(G.size()); bool ok=true;   // prof7L90: linear tables, checked against GL
    for(int l=0;l<N;l++){ int v=vecOf[l]; vch[l][0]=(uint8_t)(v&7); vch[l][1]=(uint8_t)((v>>3)&7); vch[l][2]=(uint8_t)(v>>6); }
    for(size_t g=0;g<G.size();g++){ LinT& T=LT[g]; memset(&T,0,sizeof T); for(int a=0;a<8;a++){ T.t[0][a]=G[g][a]; T.t[1][a]=G[g][a<<3]; T.t[2][a]=G[g][a<<6]; } }
    for(size_t g=0;g<G.size() && ok;g++) for(int l=0;l<N;l++) if(imgL((int)g,l)!=GL[g][l]){ ok=false; break; }
    LTOK=ok; fprintf(stderr,"L90: linear image tables %s\n",ok?"on":"OFF (GL fallback)"); }
  hugeify(GL.data(),GL.size()*sizeof(GL[0])); hugeify(TAB.keys.data(),TAB.keys.size()*sizeof(TAB.keys[0])); hugeify(TAB.vals.data(),TAB.vals.size());
  for(int l=0;l<N;l++){ int m=l; while(m>0&&rk[m-1]==rk[l]) m--; classMin[l]=m; classStart[l]=m; }
  toMin.assign(N,{}); for(size_t g=0;g<GL.size();g++) for(int l=0;l<N;l++) if(GL[g][l]==classMin[l]) toMin[l].push_back(g);
  for(int l=0;l<N;l++){ u16 g[1]={(u16)vecOf[l]}; int d; int lb=TAB.get(rref_key(g,1,&d)); pointCap[l]=R-lb; }
  for(int l=0;l<N;l++) allowMult[l]=MULT1?1:2;
  if(restrictlist){ for(int l=0;l<N;l++) allowMult[l]=0; std::stringstream ss(restrictlist); std::string tok; while(std::getline(ss,tok,',')) allowMult[labOf[std::stoi(tok)]]++; }
  for(int X=1;X<512;X++) hypNeed[X]=3*rank3(X);
  if(rootcut::ON){ if(R!=22){ fprintf(stderr,"--rootcut is set up for <3,3,3> at r = 22\n"); return 2; } rootcut::init(); for(int X=1;X<512;X++) if(rootcut::NEED[X]!=hypNeed[X]){ fprintf(stderr,"rootcut: rank mismatch at %d\n",X); return 2; } fprintf(stderr,"L77: rootcut on\n"); }
  for(int X=1;X<512;X++){ HIT[X]=BS{}; for(int v=1;v<512;v++) if(ip(v,X)) HIT[X][v>>6]|=1ULL<<(v&63); }
  sufHits.assign(N+1,{}); for(int X=0;X<512;X++) sufHits[N][X]=0;
  for(int p=N-1;p>=0;p--) for(int X=0;X<512;X++) sufHits[p][X]=sufHits[p+1][X]+(X?ip(vecOf[p],X):0);
  { std::vector<std::vector<int>> subs[4];
    for(int d=2;d<=3;d++){ std::set<int> seen; for(int a=1;a<8;a++) for(int b=a+1;b<8;b++) for(int c=(d==3?b+1:8);c<(d==3?8:9);c++){ if(d==2&&c!=8) continue; std::vector<int> bs={a,b}; if(d==3) bs.push_back(c);
          int span=0; for(int s=1;s<(1<<d);s++){ int v=0; for(int t=0;t<d;t++) if((s>>t)&1) v^=bs[t]; span|=1<<v; }
          if(__builtin_popcount(span)!=(1<<d)-1) continue; if(seen.count(span)) continue; seen.insert(span); subs[d].push_back(bs);} }
    for(int a=2;a<=3;a++) for(int b=2;b<=3;b++) for(auto& J:subs[a]) for(auto& K:subs[b]){ SplitC c; c.need=3*a*b;
      for(int l=0;l<N;l++){ int A=vecOf[l];
        int rows[3]={0,0,0}; for(size_t s=0;s<J.size();s++){ int rw=0; for(size_t t=0;t<K.size();t++){ int x=J[s],y=K[t]; int val=0; for(int i=0;i<3;i++) for(int j=0;j<3;j++) val^=((x>>i)&1)&((A>>(3*i+j))&1)&((y>>j)&1); rw|=val<<t;} rows[s]=rw; }
        int rr=0; int rws[3]={rows[0],rows[1],rows[2]}; for(int bb=2;bb>=0;bb--){ int p=-1; for(int i=rr;i<(int)J.size();i++) if((rws[i]>>bb)&1){p=i;break;} if(p<0) continue; std::swap(rws[rr],rws[p]); for(int i=0;i<(int)J.size();i++) if(i!=rr&&((rws[i]>>bb)&1)) rws[i]^=rws[rr]; rr++; }
        c.w[l]=(u8)rr; }
      SPL.push_back(c); }
    fprintf(stderr,"split constraints %zu\n",SPL.size()); }
  sufSplitMax.assign(N+1,std::vector<u8>(SPL.size(),0));
  for(int p=N-1;p>=0;p--) for(size_t c=0;c<SPL.size();c++) sufSplitMax[p][c]=std::max(sufSplitMax[p+1][c],SPL[c].w[p]);
  { FILE* f=fopen(tabpath,"rb"); fseek(f,0,SEEK_END); long sz=ftell(f); fseek(f,0,SEEK_SET); size_t n=sz/24; std::vector<char> buf(sz); if(fread(buf.data(),1,sz,f)!=(size_t)sz) return 3; fclose(f);
    for(size_t i=0;i<n;i++){ u64 hi,lo; int8_t lb,k; memcpy(&hi,&buf[24*i],8); memcpy(&lo,&buf[24*i+8],8); memcpy(&lb,&buf[24*i+16],1); memcpy(&k,&buf[24*i+17],1);
      if(k<=DMAX) continue; u128 key=((u128)hi<<64)|lo; int rows[9]; for(int j=0;j<k;j++) rows[j]=(key>>(9*j))&511;
      std::vector<int> W; for(int x=0;x<512;x++){ bool ok=true; for(int j=0;j<k;j++) if(ip(rows[j],x)){ok=false;break;} if(ok) W.push_back(x);}
      WList w; w.n=W.size(); if(w.n>16){ fprintf(stderr,"W too big k=%d\n",k); return 4;} for(int j=0;j<w.n;j++) w.el[j]=W[j]; w.cap=(int8_t)std::max(-1,R-lb); WL.push_back(w);
      { std::array<u16,8> rr{}; for(int j=0;j<k && j<8;j++) rr[j]=(u16)rows[j]; WLrows.push_back(rr); WLk.push_back((int8_t)k); }   // prof7L78
      { WB wb; wb.cap=w.cap; wb.m=0; int piv[9]; for(int x:W){ int y=x; for(int j=0;j<wb.m;j++) if((y>>piv[j])&1) y^=wb.b[j]; if(!y) continue; piv[wb.m]=31-__builtin_clz(y); wb.b[wb.m++]=(u16)y; }
        if((1<<wb.m)!=(int)W.size()||wb.m!=9-k){ fprintf(stderr,"bad W-perp basis k=%d\n",k); return 4; }
        WLB[k].push_back(wb); WTHR[k]=std::max(WTHR[k],((1<<k)-1)-(int)wb.cap); } }
    fprintf(stderr,"leaf W-lists %zu\n",WL.size()); for(int k=DMAX+1;k<=8;k++){ std::stable_sort(WLB[k].begin(),WLB[k].end(),[](const WB& a,const WB& b){ return a.cap<b.cap; });
      fprintf(stderr," lookahead dim %d: %zu subspaces, scan when A-need < %d\n",k,WLB[k].size(),WTHR[k]);
      CAPST[k].assign(129,(int)WLB[k].size()); for(int c=128;c>=0;c--){ size_t lo=0, hi=WLB[k].size(); while(lo<hi){ size_t md=(lo+hi)/2; if(WLB[k][md].cap<c) lo=md+1; else hi=md; } CAPST[k][c]=(int)lo; } } }
  if(LPMIN>=0){ auto tl=std::chrono::steady_clock::now();
    if(!MULT1){ fprintf(stderr,"--lp needs --mult1 (the LP box is x <= 1)\n"); return 1; }
    if(!strcmp(LPKEPT,"/dev/shm/indl/kept21.txt") && (R!=21 || !bumpspec || strcmp(bumpspec,KEPT21_BUMPS))){ fprintf(stderr,"kept21.txt was built for r = 21 and the bumps %s\n",KEPT21_BUMPS); return 1; }
    lpx::LPR=R; if(lpx::OBJB) lpx::OBJBV=-((double)R-OBJBD); lpx::calib(); lpx::load_kept(LPKEPT); lpx::build_extra();
    hugeify(lpx::RE.data(),lpx::RE.size()*sizeof(lpx::RE[0])); hugeify(lpx::RS.data(),lpx::RS.size()*sizeof(lpx::RS[0])); hugeify(lpx::CR.data(),lpx::CR.size()*sizeof(lpx::CR[0]));   // prof7L90
    // prof7L27: the LP takes the search's label order (any --rord), not a fixed rank-1-first order
    { if(N!=511){ fprintf(stderr,"--lp needs all 511 labels\n"); return 1; } for(int l=0;l<511;l++) lpx::pv[l]=vecOf[l]; for(int v=0;v<512;v++) lpx::lab[v]=-1; for(int l=0;l<511;l++) lpx::lab[lpx::pv[l]]=l; }
    for(int64_t r=0;r<lpx::NR;r++){ if(lpx::RDIM[r]>=lpx::INITDIM) LPINIT.push_back((int32_t)r); if(lpx::RDIM[r]>=lpx::CHEAPDIM) lpx::CHEAP.push_back((int32_t)r); }
    fprintf(stderr,"LP: screen %d sib %d sfx %d (from depth %d) inc %d (boxchk %lld), objective bound %s %.9g\n",(int)SCREEN,(int)SIB,(int)SFX,SFXMIN,(int)lpx::INC,lpx::BOXCHK,lpx::OBJB?"on":"off",lpx::OBJBV);
    fprintf(stderr,"LP knobs: edge %d scale %d initdim %d cheapdim %d keepstop %g sfxkeepstop %g sfxnofull %d\n",lpx::EDGE,lpx::SCALE,lpx::INITDIM,lpx::CHEAPDIM,lpx::KEEPSTOP,lpx::SFXKEEPSTOP,(int)lpx::SFXNOFULL);
    fprintf(stderr,"LP: depths %d..%d, kept rows %lld nnz %zu, init %zu, cheap %zu, full separation %s (to depth %d, mode %d), maxit %d, pool %zu, load %.1fs\n",LPMIN,LPMAX,(long long)lpx::NR,lpx::RE.size(),
            LPINIT.size(),lpx::CHEAP.size(),lpx::FULLSEP?"on":"off",lpx::FULLMAXD,lpx::FULLMODE,lpx::MAXIT,lpx::POOLMAX,std::chrono::duration<double>(std::chrono::steady_clock::now()-tl).count()); }
  if(MISMIN<=MISMAX){ if(LPMIN<0 || !lpx::INC){ fprintf(stderr,"--mis needs --lp and --lpinc\n"); return 1; }
    CONF0.assign(512,BS{}); long nr1=0;
    for(int64_t r=0;r<lpx::NR;r++){ if(lpx::RCAP[r]!=1) continue; nr1++; BS m{}; for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; m[u>>6]|=1ULL<<(u&63); }
      for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; for(int k=0;k<8;k++) CONF0[u][k]|=m[k]; } }
    for(int u=0;u<512;u++) CONF0[u][u>>6]&=~(1ULL<<(u&63));
    if(R2SCR){ for(int64_t r=0;r<lpx::NR;r++) if(lpx::RCAP[r]==2) ST2ROW.push_back((int32_t)r);
      RMASK.assign(lpx::NR,BS{}); for(int64_t r=0;r<lpx::NR;r++) for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; RMASK[r][u>>6]|=1ULL<<(u&63); }
      ST2M.resize(ST2ROW.size()); for(size_t i=0;i<ST2ROW.size();i++) ST2M[i]=RMASK[ST2ROW[i]];
      fprintf(stderr,"r2screen: %zu static cap-2 rows, row masks %.0f MB\n",ST2ROW.size(),lpx::NR*64.0/1e6); }
    for(int l=0;l<512;l++){ BS a{}; for(int t=l;t<511;t++){ int v=lpx::pv[t]; a[v>>6]|=1ULL<<(v&63); } ABOVE[l]=a; }
    fprintf(stderr,"MIS: depths %d..%d, node limit %lld, cap-1 rows %ld, child screen %s (node limit %lld)\n",MISMIN,MISMAX,MISLIM,nr1,MISPRE>0?"on":"off",MISPRE); }
  if(PCF){ if(MISMIN>MISMAX || !R2SCR || !lpx::INC || MISPRE<=0){ fprintf(stderr,"--pcert needs --mis, --mispre, --r2screen and --lpinc\n"); return 2; }   // prof7R3: static tables of the L1 classification
    if(N!=511 || !MULT1){ fprintf(stderr,"--pcert needs all 511 labels and --mult1\n"); return 2; }
    CONF2T.assign((size_t)512*512,std::array<uint64_t,8>{}); size_t n2=0;
    for(int64_t r=0;r<lpx::NR;r++){ if(lpx::RCAP[r]==1) CAP1ROWS.push_back((int32_t)r); if(lpx::RCAP[r]!=2) continue; n2++; const BS& m=RMASK[r];
      for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ const int q=lpx::RE[e]; for(int64_t f=lpx::RS[r];f<lpx::RS[r+1];f++){ const int u=lpx::RE[f]; if(u==q) continue; auto& T=CONF2T[(size_t)q*512+u]; for(int k=0;k<8;k++) T[k]|=m[k]; } } }
    for(int q=0;q<512;q++) for(int u=0;u<512;u++) CONF2T[(size_t)q*512+u][u>>6]&=~(1ULL<<(u&63));
    CAP1M.resize(CAP1ROWS.size()); for(size_t i=0;i<CAP1ROWS.size();i++) for(int k=0;k<8;k++) CAP1M[i][k]=RMASK[CAP1ROWS[i]][k];
    int ncap0=0; for(int l=0;l<N;l++) if(pointCap[l]<=0) ncap0++;
    if(ncap0){ fprintf(stderr,"R3: %d labels have point cap <= 0; the pcert format has no record for them\n",ncap0); return 2; }
    fprintf(stderr,"R3: pcert %s, cap-2 rows %zu, cap-1 rows %zu, cover search up to %lld search nodes%s\n",PCPATH,n2,CAP1ROWS.size(),PCXBB,PCCHK?", F0 check on":"");
    if(XPS){   // batch 6: the bulk peel's tables in the run's label order (any --rord; xpeel::Static::load assumes rank 1, 2, 3), then the
      // static files checked against the kept rows: c2t / CONF1 slots against CONF2T / CONF0 (all pairs), row label masks against RMASK
      for(int l=0;l<511;l++){ XPS->LABV[l]=vecOf[l]; XPS->VLAB[vecOf[l]]=l; } XPS->VLAB[0]=-1;
      for(int X=0;X<512;X++){ xpeel::bzero(XPS->HITL[X]); for(int l=0;l<511;l++) if(__builtin_popcount(vecOf[l]&X)&1) xpeel::set1(XPS->HITL[X],l); }
      auto toVec=[&](const xpeel::BS& m)->BS{ BS b{}; for(int l=0;l<511;l++) if(xpeel::tst(m,l)){ const int v=vecOf[l]; b[v>>6]|=1ULL<<(v&63); } return b; };
      long bad=0; for(int p=0;p<511 && bad<5;p++) for(int u=0;u<511;u++){ const BS b=toVec(XPS->c2t[(size_t)p*511+u]); const auto& T=CONF2T[(size_t)vecOf[p]*512+vecOf[u]]; for(int k=0;k<8;k++) if(b[k]!=T[k]){ bad++; break; } }
      for(int u=0;u<511;u++){ const BS b=toVec(XPS->conf1[u]); if(b!=CONF0[vecOf[u]]) bad++; }
      long badr=0, nchk=0; for(int64_t r=0;r<lpx::NR;r++){ uint64_t lm[8]={0}; const BS& rm=RMASK[r];   // batch 14: every row (the xp2 contexts take their label masks from XPLAB)
        for(int w=0;w<8;w++){ uint64_t x=rm[w]; while(x){ const int v=w*64+__builtin_ctzll(x); x&=x-1; const int l=labOfG[v]; if(l>=0) lm[l>>6]|=1ULL<<(l&63); else lm[7]|=1ULL<<63; } }
        uint64_t m[8]; std::memcpy(m,&XPLAB[(size_t)r*65],64); m[7]&=~(1ULL<<63); nchk++; if(std::memcmp(m,lm,64)!=0) badr++; }
      if(bad || badr){ fprintf(stderr,"R3: --pcxp files do not match the label order --rord %d and the kept rows (%ld table slots, %ld of %ld sampled row masks differ)\n",RORD,bad,badr,nchk); return 2; }
      fprintf(stderr,"R3: --pcxp tables match --rord %d (all c2t/CONF1 slots, %ld row masks)\n",RORD,nchk); } }
  // prof7L78 (a): which leaf W-lists the kept-row tracker already decides.  A W-list U is "kept" when a kept row has the same point
  // set and the same cap: count(U) > cap(U) iff that row is in lp->over.  It is "dominated" when a superspace U' = U + x is kept
  // (in that sense) with cap(U') <= cap(U): then count(U') >= count(U) > cap(U) >= cap(U') puts U' in lp->over, which leafCheck
  // rejects anyway.  Only the remaining W-lists (WLR) are summed at the leaves.  Needs distinct points (--mult1) and the tracker.
  if(LEAFFAST && LPMIN>=0 && lpx::INC && MULT1 && !WL.empty() && WLrows.size()==WL.size()){ auto t0=std::chrono::steady_clock::now();
    struct BH{ size_t operator()(const BS& b) const { uint64_t h=1469598103934665603ULL; for(int i=0;i<8;i++){ h^=b[i]; h*=1099511628211ULL; h^=h>>29; } return h; } };
    std::unordered_map<BS,int32_t,BH> KM; KM.reserve((size_t)(lpx::NR*1.3)); bool dup=false;
    for(int64_t r=0;r<lpx::NR;r++){ if(lpx::RDIM[r]<=DMAX) continue; BS b{}; for(int64_t e=lpx::RS[r];e<lpx::RS[r+1];e++){ int u=lpx::RE[e]; b[u>>6]|=1ULL<<(u&63); }
      if(!KM.emplace(b,(int32_t)r).second) dup=true; }
    if(dup) fprintf(stderr,"leaf W-lists: a kept subspace occurs twice; fast leaf check off\n");
    else {
      const size_t NW=WL.size(); std::vector<int32_t> mrow(NW,-1); std::vector<uint8_t> keep(NW,1);
      auto Uset=[&](size_t i){ BS b{}; int k=WLk[i]; const auto& rr=WLrows[i]; for(int t=1;t<(1<<k);t++){ int v=0; for(int j=0;j<k;j++) if((t>>j)&1) v^=rr[j]; b[v>>6]|=1ULL<<(v&63); } return b; };
      int nt=std::max(1,std::min(THREADS,64));
      auto par=[&](auto fn){ std::vector<std::thread> th; for(int t=0;t<nt;t++) th.emplace_back([&,t](){ for(size_t i=t;i<NW;i+=nt) fn(i); }); for(auto& x:th) x.join(); };
      par([&](size_t i){ auto it=KM.find(Uset(i)); if(it!=KM.end() && lpx::RCAP[it->second]==WL[i].cap) mrow[i]=it->second; });
      KWL.assign(lpx::NR,0); for(size_t i=0;i<NW;i++) if(mrow[i]>=0){ KWL[mrow[i]]=1; keep[i]=0; }
      std::atomic<long long> ndom{0};
      par([&](size_t i){ if(mrow[i]>=0) return; const BS U=Uset(i); BS done=U; done[0]|=1ULL;   // done: points of U and of the cosets tried
        for(int x=1;x<512;x++){ if((done[x>>6]>>(x&63))&1) continue; BS S=U; S[x>>6]|=1ULL<<(x&63);
          for(int w=0;w<8;w++){ uint64_t y=U[w]; while(y){ int v=w*64+__builtin_ctzll(y); y&=y-1; int z=v^x; S[z>>6]|=1ULL<<(z&63); } }
          for(int w=0;w<8;w++) done[w]|=S[w];
          auto it=KM.find(S); if(it!=KM.end() && KWL[it->second] && lpx::RCAP[it->second]<=WL[i].cap){ keep[i]=0; ndom++; return; } } });
      for(size_t i=0;i<NW;i++) if(keep[i]) WLR.push_back(WL[i]);
      long long nk=0; for(size_t i=0;i<NW;i++) if(mrow[i]>=0) nk++;
      LEAFON=true;
      fprintf(stderr,"leaf W-lists: %lld kept-tracked, %lld dominated by kept-tracked superspaces, %zu summed at leaves (%.1fs)\n",nk,(long long)ndom,WLR.size(),std::chrono::duration<double>(std::chrono::steady_clock::now()-t0).count()); } }
  if(checklist){ Search s; std::stringstream ss(checklist); std::string tok; std::vector<int> L; while(std::getline(ss,tok,',')) L.push_back(labOf[std::stoi(tok)]);
    std::sort(L.begin(),L.end()); bool ok=true; bool canon=true;
    for(int l:L){ if(SYM && !s.canonCheck(l)){ canon=false; SYM=false; } Search::Undo U; if(!s.addT(l,U)){ ok=false; fprintf(stderr,"lattice violation adding %d\n",vecOf[l]); break; } }
    if(ok){ ok=s.leafCheck(); fprintf(stderr,"leafCheck %s\n",ok?"PASS":"FAIL"); }
    printf("check_list: %s canonical=%d\n",ok?"PASS":"FAIL",(int)canon); return 0; }
  if(ESTIMATE){ std::atomic<long long> done{0}; std::mutex em; double sN=0,sN2=0,sL=0; long long dh[64]={0};
    auto wk=[&](int tid){ std::mt19937_64 rng(1234567+tid); Search s; while(true){ long long i=done++; if(i>=ESTIMATE) break; double n,lf; int dr; s.dive(rng,n,lf,dr);
        std::lock_guard<std::mutex> lk(em); sN+=n; sN2+=n*n; sL+=lf; dh[dr]++; } };
    std::vector<std::thread> th; for(int i=0;i<THREADS;i++) th.emplace_back(wk,i); for(auto& t:th) t.join();
    double K=ESTIMATE; double mean=sN/K; double sd=sqrt(std::max(0.0,sN2/K-mean*mean)/K);
    printf("estimate nodes %.4g +- %.2g (stderr) leaves %.4g\n",mean,sd,sL/K); printf("depth hist:"); for(int d=0;d<=R;d++) printf(" %lld",dh[d]); printf("\n"); return 0; }
  if(PCTOP){   // batch 8 (QUEUE.md §8): top segments, then exit
    if(!PCF || !DUMPF){ fprintf(stderr,"--pctop needs --pcert and --dumpfrontier\n"); return 2; }
    std::vector<std::vector<int>> tops; { std::ifstream tf(PCTOPFILE); if(!tf){ fprintf(stderr,"--pctop: cannot open %s\n",PCTOPFILE); return 2; } std::string line; size_t nl=0;
      while(std::getline(tf,line)){ if(line.empty()) continue; std::stringstream ss(line); long long ix; ss>>ix; if(ix!=(long long)nl){ fprintf(stderr,"--pctop file: line %zu has index %lld\n",nl,ix); return 2; }
        std::vector<int> p; int v; while(ss>>v){ if(v<1||v>511||labOf[v]<0){ fprintf(stderr,"--pctop file: bad code %d\n",v); return 2; } p.push_back(labOf[v]); }
        if(p.empty() || (int)p.size()>=PCTOPF){ fprintf(stderr,"--pctop file: line %zu: the prefix must be nonempty and above depth %d\n",nl,PCTOPF); return 2; }
        for(size_t k=1;k<p.size();k++) if(p[k]<=p[k-1]){ fprintf(stderr,"--pctop file: line %zu: labels not increasing\n",nl); return 2; }
        tops.push_back(p); nl++; } }
    fprintf(PCF,"#R3PC 1 fp=%016llx\n#lab %d",gFP,N); for(int l=0;l<N;l++) fprintf(PCF," %d",vecOf[l]); fprintf(PCF,"\n#table %s\n#kept %s\n#typecut %d\n",tabpath,LPKEPT,TYPECUT); if(PCLEAFX) fprintf(PCF,"#leafx 1\n"); if(XPS) fprintf(PCF,"#cutx 1\n"); if(XPVAR) fprintf(PCF,"#xpvar 1\n"); if(PCWIT) fprintf(PCF,"#pcwit 1\n"); if(LEAFV7) fprintf(PCF,"#leafv7 1\n");
    fprintf(PCF,"#top %d %zu\n#end\n",PCTOPF,tops.size()); fflush(PCF);
    FRONTIER_D=PCTOPF; auto t0=std::chrono::steady_clock::now(); long long nrc=0;
    { Search s; s.doneP=&doneT[0]; s.curJob=-1;
      PCTOPRUN=true;   // batch 9: the subtree in full search mode (every cut of a job run), JOBs at depth F, no donation
      for(size_t i=0;i<tops.size();i++){ const std::vector<int>& P=tops[i];
        if(!s.replay(P)){ s.unreplay(P); fprintf(stderr,"--pctop: prefix %zu does not replay (why %d): no segment\n",i,s.replayWhy); nrc++; continue; }
        s.pcBegin((int)i,4,P,std::array<uint64_t,8>{});
        s.resetLists(); s.dfs(P.back(),R-(int)P.size(),1.0); s.unreplay(P); certFlush(); pcChunk(true); }
      PCTOPRUN=false;
      s.flush(); }
    { FILE* df=fopen(DUMPF,"w"); if(!df){ fprintf(stderr,"cannot write %s\n",DUMPF); return 2; } for(size_t i=0;i<frontier.size();i++){ fprintf(df,"%zu",i); for(int l:frontier[i]) fprintf(df," %d",vecOf[l]); fprintf(df,"\n"); } fclose(df); }
    fprintf(stderr,"R3 top: %zu prefixes (%lld do not replay), %zu frontier jobs at depth %d in %.1fs; segments of kind 4 in %s, jobs in %s\n",tops.size(),nrc,frontier.size(),PCTOPF,std::chrono::duration<double>(std::chrono::steady_clock::now()-t0).count(),PCPATH,DUMPF);
    if(PCNOREP||PCEXP5>0) fprintf(stderr,"R3 expansion: %lld kills expanded, %lld nodes inside them, %lld accepted leaves inside them (must be 0)\n",(long long)gExpK,(long long)gExpN,(long long)gExpBad);
    if(LEAFV7) fprintf(stderr,"R3 leafv7: %lld leaf certificate records (%lld need none: rank sum < 27), %lld via the fit fallback, %lld / %lld retried at 2e6 / 2e7 calls, %lld without a certificate (must be 0); %.1f bits each, %.2f ms each, max %.1f ms\n",(long long)gLv7N,(long long)gLv7None,(long long)gLv7Fit,(long long)gLv7Big1,(long long)gLv7Big2,(long long)gLv7Fail,gLv7N?(double)gLv7Bits/gLv7N:0.0,gLv7N?gLv7Us/1e3/gLv7N:0.0,gLv7MaxUs/1e3);   // batch 13
    { std::lock_guard<std::mutex> lp2(pcmu); fflush(PCF); fdatasync(fileno(PCF)); fclose(PCF); PCF=nullptr; }
    return 0; }
  if(FRONTIER_D>=0){
    auto t0=std::chrono::steady_clock::now();
    if(FRONTF){ std::ifstream ff(FRONTF); if(!ff){ fprintf(stderr,"no frontier file\n"); return 2; } std::string line; size_t nl=0;
      while(std::getline(ff,line)){ if(line.empty()) continue; std::stringstream ss(line); long long ix; ss>>ix; if(ix!=(long long)nl){ fprintf(stderr,"frontier file: line %zu has index %lld\n",nl,ix); return 2; }
        std::vector<int> job; int v; while(ss>>v){ if(v<1||v>511||labOf[v]<0){ fprintf(stderr,"frontier file: bad label %d\n",v); return 2; } job.push_back(labOf[v]); }
        if(job.empty()){ fprintf(stderr,"frontier file: empty job\n"); return 2; } frontier.push_back(job); nl++; }
      unsigned long long h=1469598103934665603ULL; for(auto& j:frontier){ for(int l:j){ h^=(unsigned long long)(vecOf[l]+1); h*=1099511628211ULL; } h^=0xFFFFULL; h*=1099511628211ULL; }
      gFrontHash=h; fprintf(stderr,"frontier loaded from %s: %zu jobs, hash %016llx\n",FRONTF,frontier.size(),h); }
    else { Search s; s.doneP=&doneT[0]; collecting=true; s.resetLists(); s.dfs(0,R,1.0); collecting=false; s.flush(); certFlush(); }
    double ph1=std::chrono::duration<double>(std::chrono::steady_clock::now()-t0).count();
    long long above=0; if(!FRONTF) for(int d=0;d<FRONTIER_D;d++) above+=gDepth[d];
    fprintf(stderr,"frontier depth %d: %zu nodes (nodes above %lld, leaves above %lld) in %.1fs\n",FRONTIER_D,frontier.size(),above,(long long)nleaf,ph1);
    for(int d=0;d<=FRONTIER_D;d++) fprintf(stderr," d%d:%lld",d,gDepth[d]); fprintf(stderr,"\n");
    if(DUMPF){ FILE* df=fopen(DUMPF,"w"); for(size_t i=0;i<frontier.size();i++){ fprintf(df,"%zu",i); for(int l:frontier[i]) fprintf(df," %d",vecOf[l]); fprintf(df,"\n"); } fclose(df); }
    if(DUMPONLY){ if(!DUMPF){ fprintf(stderr,"--dumponly needs --dumpfrontier\n"); return 2; } certFlush(); if(CERTF){ fflush(CERTF); fclose(CERTF); CERTF=nullptr; } fprintf(stderr,"dumponly: exit after the frontier dump\n"); return 0; }
    for(int d=0;d<64;d++) gDepth[d]=gAddFail[d]=gFF[d]=gChildless[d]=0;
    std::vector<int> order(frontier.size()); for(size_t i=0;i<order.size();i++) order[i]=i;
    std::mt19937_64 rng(SAMPLE_SEED); std::shuffle(order.begin(),order.end(),rng);
    if(!JOBS.empty()) order=JOBS;
    if(REVERSE) std::reverse(order.begin(),order.end());
    if(!JOBPRE.empty()){ order.clear(); for(auto& p:JOBPRE){ int found=-1; for(size_t i=0;i<frontier.size();i++){ if(frontier[i].size()!=p.size()) continue; bool eq=true; for(size_t j=0;j<p.size();j++) if(vecOf[frontier[i][j]]!=p[j]){ eq=false; break; } if(eq){ found=i; break; } }
        fprintf(stderr,"jobprefix -> index %d\n",found); if(found>=0) order.push_back(found); } }
    std::vector<char> doneIdx(frontier.size(),0); double prevNodes=0; long long prevDone=0; std::vector<double> prevSizes;
    if(STATEPATH){ FILE* f=fopen(STATEPATH,"r"); if(f){ long long ix,nn,lf,pf; double sec; while(fscanf(f,"%lld %lld %lld %lld %lf",&ix,&nn,&lf,&pf,&sec)==5){ if(!doneIdx[ix]){ doneIdx[ix]=1; prevDone++; prevNodes+=nn; prevSizes.push_back(nn);} } fclose(f); }
      fprintf(stderr,"resumed: %lld frontier nodes already done (%.4g nodes)\n",prevDone,prevNodes); }
    if(DONEPF){ std::ifstream df(DONEPF); if(!df){ fprintf(stderr,"no doneprefixes file\n"); return 2; }   // subtrees finished (with certificates) by other runs
      std::set<std::vector<int>> dset; std::string line; size_t maxl=0;
      while(std::getline(df,line)){ if(line.empty()) continue; std::vector<int> pv; std::stringstream ss(line); std::string t; while(std::getline(ss,t,',')) pv.push_back(labOf[std::stoi(t)]); maxl=std::max(maxl,pv.size()); dset.insert(pv); }
      long long nsk=0;
      for(size_t i=0;i<frontier.size();i++){ if(doneIdx[i]) continue; const auto& J=frontier[i];
        for(size_t k=1;k<=J.size() && k<=maxl;k++){ std::vector<int> pre(J.begin(),J.begin()+k); if(dset.count(pre)){ doneIdx[i]=3; nsk++; break; } } }
      fprintf(stderr,"skipping %lld jobs inside subtrees done elsewhere (%zu prefixes in %s)\n",nsk,dset.size(),DONEPF); }
    FILE* SF=STATEPATH?fopen(STATEPATH,"a"):nullptr; OUT=fopen(outpath,"a");
    gFP^=gFrontHash; gFP*=1099511628211ULL;   // prof7L84: fingerprint = semantic options + frontier
    gFP84^=gFrontHash; gFP84*=1099511628211ULL;
    if(!SKIPJ.empty()){ long long nrec=0, nbad=0; for(const auto& fn:SKIPJ){ std::ifstream jf(fn); if(!jf){ fprintf(stderr,"no journal %s\n",fn.c_str()); return 2; }
        std::string line; bool hdr=false, mism=false; std::string outp="-"; long long nr0=nrec; const int fi=(int)gJcert.size(); gJcert.push_back("-"); gJpc.push_back("-");   // prof7R2 (prof7R3: gJpc)
        while(std::getline(jf,line)){ if(line.empty()) continue;
          if(line[0]=='#'){ unsigned long long fp=0; auto q=line.find("fp="); if(q!=std::string::npos) fp=std::stoull(line.substr(q+3,16),nullptr,16);
            auto o=line.find(" out="); if(o!=std::string::npos){ auto e=line.find(' ',o+5); outp=line.substr(o+5,e==std::string::npos?std::string::npos:e-o-5); }
            { auto c=line.find(" cert="); if(c!=std::string::npos){ auto e=line.find(' ',c+6); gJcert[fi]=line.substr(c+6,e==std::string::npos?std::string::npos:e-c-6); } }   // prof7R2
            { auto c=line.find(" pcert="); if(c!=std::string::npos){ auto e=line.find(' ',c+7); gJpc[fi]=line.substr(c+7,e==std::string::npos?std::string::npos:e-c-7); } }   // prof7R3
            if(CERTF && gJcert[fi]=="-" && !JFORCE){ fprintf(stderr,"R2: journal %s skipped: it names no certificate file (this run writes one)\n",fn.c_str()); mism=true; break; }
            if(PCF && gJpc[fi]=="-" && !JFORCE){ fprintf(stderr,"R3: journal %s skipped: it names no pcert file (this run writes one)\n",fn.c_str()); mism=true; break; }
            const bool cx=(fp!=gFP && gJCompat.count(fp)); if(cx){ gJ84files++; fprintf(stderr,"R2: journal %s has fingerprint %016llx, accepted through --jcompat\n",fn.c_str(),fp); }
            const bool c84=(JCOMPAT84 && fp==gFP84) || cx; if(c84){ gJ84files++; fprintf(stderr,"L87: journal %s is a prof7L84 journal of this search without the L86 flags; used (--jcompat84)\n",fn.c_str()); }
            if(fp!=gFP && !c84 && !JFORCE){ fprintf(stderr,"L84: journal %s skipped: fingerprint %016llx != this run's %016llx (binary/options/frontier differ; --jforce to use it)\n",fn.c_str(),fp,gFP); mism=true; break; } hdr=true; continue; }
          if(!hdr){ fprintf(stderr,"journal %s: no header\n",fn.c_str()); return 2; }
          std::stringstream ss(line); std::string tag; long long ix,n,l,pf; int d; if(!(ss>>tag>>ix>>n>>l>>pf>>d) || (tag!="P" && tag!="R") || d<1 || d>63){ nbad++; continue; }
          int vv[64]; bool ok=true; for(int i=0;i<d;i++){ if(!(ss>>vv[i]) || vv[i]<1 || vv[i]>511){ ok=false; break; } }
          int lo=0, hi=0; if(ok && tag=="R" && (!(ss>>lo>>hi) || lo<1 || lo>511 || hi<1 || hi>511 || labOf[lo]<0 || labOf[hi]<0 || labOf[lo]>labOf[hi])) ok=false;
          long long sg=-1, pb=-1, pe=-1; if(ok){ if(tag=="P"){ if(!(ss>>sg)) sg=-1; } else { if(!(ss>>sg>>pb>>pe)) sg=-1; } if(PCF && (sg<0 || (tag=="R" && (pb<0 || pe<pb)))) ok=false; }   // prof7R3: pcert references
          if(!ok || ix<0 || (size_t)ix>=frontier.size()){ nbad++; continue; }   // a torn last line
          auto key=jkey((int)ix,vv,d);
          if(tag=="P"){ auto it=gJmap.find(key);
            if(it!=gJmap.end()){ if(it->second.n!=n || it->second.l!=l || it->second.p!=pf){
                if((JCOMPAT84 || !gJCompat.empty()) && it->second.p==pf){ if(n<it->second.n) it->second=JE{n,l,pf}; gJx++; continue; }   // prof7L87: counts of the two binaries; keep the smaller
                fprintf(stderr,"journal %s: piece record for job %lld depth %d disagrees with an earlier one\n",fn.c_str(),ix,d); return 2; } continue; }
            gJmap.emplace(std::move(key),JE{n,l,pf,fi,sg}); gJdmask|=1ULL<<d; nrec++; }
          else { gJrng[key].push_back(JR{labOf[lo],labOf[hi],n,l,pf,fi,sg,pb,pe}); gJrmask|=1ULL<<d; nrec++; } }
        if(!mism) fprintf(stderr,"L84: skipjournal file %s out=%s records %lld\n",fn.c_str(),outp.c_str(),nrec-nr0); }
      long long novl=0; for(auto& kv:gJrng){ auto& v=kv.second; std::sort(v.begin(),v.end(),[](const JR& a,const JR& b){ return a.lo<b.lo || (a.lo==b.lo && a.hi<b.hi); });
        std::vector<JR> u; for(const JR& r:v){ if(!u.empty() && r.lo==u.back().lo && r.hi==u.back().hi && r.p==u.back().p && ((r.n==u.back().n && r.l==u.back().l) || JCOMPAT84 || !gJCompat.empty())){ if(r.n!=u.back().n || r.l!=u.back().l){ gJx++; if(r.n<u.back().n) u.back()=r; } continue; } u.push_back(r); }   // the same run in several journals (prof7L87 --jcompat84: also with the other binary's counts)
        std::vector<JR> w; for(size_t a=0;a<u.size();){ size_t b=a+1; int hi=u[a].hi; while(b<u.size() && u[b].lo<=hi){ hi=std::max(hi,u[b].hi); b++; }   // a group of overlapping runs
          if(b==a+1) w.push_back(u[a]); else novl+=b-a; a=b; }   // runs that overlap others (inconsistent journals) are all dropped: those children are explored again
        v.swap(w); }
      if(JCOMPAT84) fprintf(stderr,"L87: --jcompat84: %lld prof7L84 journal headers used, %lld records seen twice with different node/leaf counts (smaller kept)\n",gJ84files,(long long)gJx);
      fprintf(stderr,"L84: skipjournal %zu files, %lld records (%lld unreadable lines skipped, %lld overlapping runs dropped), piece depths %llx, run depths %llx\n",SKIPJ.size(),nrec,nbad,novl,gJdmask,gJrmask); }
    if(CERTF){ fprintf(CERTF,"# prof7R2 cert fp=%016llx\n# lab %d",gFP,N); for(int l=0;l<N;l++) fprintf(CERTF," %d",vecOf[l]); fprintf(CERTF,"\n");   // prof7R2: label order, sources
      for(size_t k=0;k<gJcert.size();k++) fprintf(CERTF,"# src %zu %s\n",k,gJcert[k].c_str()); fflush(CERTF); }
    if(PCF){ fprintf(PCF,"#R3PC 1 fp=%016llx\n#lab %d",gFP,N); for(int l=0;l<N;l++) fprintf(PCF," %d",vecOf[l]); fprintf(PCF,"\n#table %s\n#kept %s\n#typecut %d\n",tabpath,LPKEPT,TYPECUT); if(PCLEAFX) fprintf(PCF,"#leafx 1\n"); if(XPS) fprintf(PCF,"#cutx 1\n"); if(XPVAR) fprintf(PCF,"#xpvar 1\n"); if(PCWIT) fprintf(PCF,"#pcwit 1\n"); if(LEAFV7) fprintf(PCF,"#leafv7 1\n");   // prof7R3: header (the type-cut mask the TYPE and CUT 8 records rely on)
      for(size_t k=0;k<gJpc.size();k++) fprintf(PCF,"#src %zu %s\n",k,gJpc[k].c_str()); fprintf(PCF,"#end\n"); fflush(PCF); }
    if(JOURNALF){ gJF=fopen(JOURNALF,"a"); if(!gJF){ fprintf(stderr,"cannot open journal %s\n",JOURNALF); return 2; } gJSF=SF;
      char hb[2048]; snprintf(hb,sizeof hb,"# prof7R3 journal fp=%016llx out=%s state=%s cert=%s pcert=%s jdepth=%d jmin=%lld pid=%d\n",gFP,outpath,STATEPATH?STATEPATH:"-",CERTPATH?CERTPATH:"-",PCPATH?PCPATH:"-",JDEPTH,JMIN,(int)getpid()); fputs(hb,gJF); fflush(gJF);
      fprintf(stderr,"L84: journal %s jdepth %d jmin %lld jsync %.0f fingerprint %016llx\n",JOURNALF,JDEPTH,JMIN,JSYNC,gFP); }
    { struct sigaction sa{}; sa.sa_handler=onTerm; sigemptyset(&sa.sa_mask); sigaction(SIGTERM,&sa,nullptr); }
    std::atomic<size_t> nextI{0}; std::mutex rm; std::vector<double> sizes=prevSizes; double sumN=prevNodes; long long ndone=prevDone; double sumSec=0; std::atomic<bool> finF{false};
    auto t1=std::chrono::steady_clock::now();
    // prof7L29: per-job bookkeeping for donated pieces
    const size_t NF=frontier.size(); std::unique_ptr<std::atomic<int>[]> outst(new std::atomic<int>[NF]); for(size_t i=0;i<NF;i++) outst[i]=0; gOutst=outst.get();
    std::vector<char> rootDone(NF,0); std::vector<long long> jnodes(NF,0), jl0(NF,0), jp0(NF,0), jlv(NF,0), jpf(NF,0); std::atomic<long long> gReplayCut{0}; std::vector<std::chrono::steady_clock::time_point> jt0(NF);
    int activeR=0, activeP=0; bool fdone=false;
    // prof7L41: jobs finished elsewhere (--skipfile), re-read by whichever worker first sees the file is due
    std::unique_ptr<std::atomic<char>[]> skipIdx(new std::atomic<char>[NF]); for(size_t i=0;i<NF;i++) skipIdx[i]=0;
    std::unique_ptr<std::atomic<char>[]> jab(new std::atomic<char>[NF]); for(size_t i=0;i<NF;i++) jab[i]=0; gJab=jab.get(); std::atomic<long long> nAborted{0}; std::atomic<bool> drainNow{false};
    std::atomic<long long> skipLoad{0}, nSkipped{0}; std::mutex skipmu; auto tSkip=std::chrono::steady_clock::now()-std::chrono::hours(1);
    auto loadSkip=[&](){ if(!SKIPF) return; std::unique_lock<std::mutex> lk(skipmu,std::try_to_lock); if(!lk.owns_lock()) return;
      auto now=std::chrono::steady_clock::now(); if(std::chrono::duration<double>(now-tSkip).count()<SKIPEVERY) return; tSkip=now;
      if(DRAINF && !drainNow && access(DRAINF,F_OK)==0){ drainNow=true; fprintf(stderr,"drain file %s seen: no new list jobs\n",DRAINF); }
      FILE* f=fopen(SKIPF,"r"); if(!f) return; long long x, n=0; while(fscanf(f,"%lld",&x)==1){ if(x>=0 && (size_t)x<NF){ skipIdx[x]=1; n++; } } fclose(f); skipLoad=n; };
    loadSkip(); if(ABORTDONE && SKIPF) gSkipP=skipIdx.get();
    auto writeState=[&](int ix){   // caller holds rm
      if(jab[ix].load()){ nAborted++; if(VERB) fprintf(stderr,"abandoned %d (done elsewhere)\n",ix); return; }   // prof7L48: no state line
      long long nn=jnodes[ix]; double sec=std::chrono::duration<double>(std::chrono::steady_clock::now()-jt0[ix]).count();
      sizes.push_back(nn); sumN+=nn; ndone++; sumSec+=sec;
      if(SF){ char sb[160]; snprintf(sb,sizeof sb,"%d %lld %lld %lld %.2f\n",ix,nn,jlv[ix],jpf[ix],sec); if(gJSF){ std::lock_guard<std::mutex> lk(gJmu); gSpend.push_back(sb); } else { fputs(sb,SF); fflush(SF); } }   // prof7L84: committed after the profiles
      if(VERB) fprintf(stderr,"end %d nodes %lld sec %.1f\n",ix,nn,sec); };
    auto checkFin=[&](){   // caller holds qmu
      if(nextI.load()>=order.size() && Q.empty() && activeR==0 && activeP==0 && !fdone){ fdone=true; qcv.notify_all(); } };
    auto worker=[&](int tid){ Search s; s.tid=tid; s.doneP=&doneT[tid*8];
      auto runPiece=[&](Job& job){ int ix=job.ix; s.curJob=ix; long long v0=s.visited, lv0=s.myLeaf, pf0=s.myProf; s.jstart=std::chrono::steady_clock::now();
        if(!s.replay(job.seq)){ fprintf(stderr,"replay failed (piece)\n"); exit(5); }
        const long long pv0=s.visited, pl0=s.myLeaf, pp0=s.myProf, pd0=s.donN;   // prof7L84
        s.pcBegin(ix,1,job.seq,job.dinh,&job.win);   // prof7R3: the piece's segment (prefix, the donor's dead mask; batch 12: its witness rows)
        s.resetLists(); s.jobBase=*s.doneP; s.dfs(job.seq.back(),R-(int)job.seq.size(),job.w); s.unreplay(job.seq); certFlush(); if(PCF) pcChunk(true);
        if(gJF && s.donN==pd0 && !jab[ix].load() && nprof<MAXPROF && s.visited-pv0>=JMIN){   // prof7L84: a finished piece
          char b[96]; std::string t; snprintf(b,sizeof b,"P %d %lld %lld %lld %zu",ix,s.visited-pv0,s.myLeaf-pl0,s.myProf-pp0,job.seq.size()); t+=b;
          for(int l2:job.seq){ snprintf(b,sizeof b," %d",vecOf[l2]); t+=b; } if(PCF){ snprintf(b,sizeof b," %llu",tlPc.id); t+=b; } t+='\n'; std::lock_guard<std::mutex> lk(gJmu); gJpend.push_back(std::move(t)); }   // prof7R3: segment of the piece
        { std::lock_guard<std::mutex> lk(rm); jnodes[ix]+=s.visited-v0; jlv[ix]+=s.myLeaf-lv0; jpf[ix]+=s.myProf-pf0; if(--outst[ix]==0 && rootDone[ix]) writeState(ix); }
        { std::lock_guard<std::mutex> lq(qmu); activeP--; checkFin(); } };
      while(true){
        if(AGEDON>0 && qsizeA.load(std::memory_order_relaxed)>0){ Job pj; bool got=false;   // prof7L48: queued pieces before new list jobs
          { std::lock_guard<std::mutex> lq(qmu); if(!Q.empty()){ pj=std::move(Q.front()); Q.pop_front(); qsizeA--; activeP++; got=true; } }
          if(got){ runPiece(pj); continue; } }
        size_t k=drainNow.load(std::memory_order_relaxed)?order.size():nextI++;
        if(k>=order.size() && drainNow.load(std::memory_order_relaxed)){ size_t cur=nextI.load(); while(cur<order.size() && !nextI.compare_exchange_weak(cur,order.size())){} }
        if(k<order.size()){ int ix=order[k]; if(doneIdx[ix]) continue;
          if(SKIPF){ loadSkip(); if(skipIdx[ix]){ nSkipped++; continue; } }
          { std::lock_guard<std::mutex> lq(qmu); activeR++; }
          long long v0=s.visited; s.jstart=std::chrono::steady_clock::now(); { std::lock_guard<std::mutex> lk(rm); jt0[ix]=std::chrono::steady_clock::now(); jl0[ix]=nleaf; jp0[ix]=nprof; }
          const auto& job=frontier[ix]; s.curJob=ix;
          if(VERB){ std::lock_guard<std::mutex> lk(rm); fprintf(stderr,"start %d:",ix); for(int l:job) fprintf(stderr," %d(r%d)",vecOf[l],rk[l]); fprintf(stderr,"\n"); } if(!s.replay(job)){ if(s.replayWhy!=2){ fprintf(stderr,"replay failed (canonicity)\n"); exit(5); }
            if(PCF){ pcOpen(ix,2,job,nullptr); std::string& B=tlPc.buf; pcU8(B,0x03); pcU8(B,11); pcU8(B,(unsigned)(s.rp.size()-1)); pcU8(B,(unsigned)s.addWhy);   // prof7R3: replay cut segment
              if(s.addWhy==1 || s.addWhy==2){ pcU8(B,(unsigned)s.addDim); for(int j=0;j<s.addDim;j++) pcU16(B,s.addRows[j]); } else pcU8(B,(unsigned)s.addW); pcChunk(true); }
            s.unreplay(job); gReplayCut++;   // prof7L39: the prefix breaks a capacity of this table: no profiles below it
            { std::lock_guard<std::mutex> lk(rm); rootDone[ix]=1; if(outst[ix].load()==0) writeState(ix); }
            { std::lock_guard<std::mutex> lq(qmu); activeR--; checkFin(); } continue; }
          long long lv0=s.myLeaf, pf0=s.myProf;
          if(KEST>0){ std::mt19937_64 krng(SAMPLE_SEED*1000003ULL+ix); double sm=0,s2=0,mx=0; auto tk=std::chrono::steady_clock::now();
            for(long long kk=0;kk<KEST;kk++){ s.resetLists(); double e=s.kdive(job.back(),R-(int)job.size(),krng); sm+=e; s2+=e*e; mx=std::max(mx,e); }
            s.unreplay(job); double K=KEST, mean=sm/K, se=sqrt(std::max(0.0,s2/K-mean*mean)/K);
            double ks=std::chrono::duration<double>(std::chrono::steady_clock::now()-tk).count();
            { std::lock_guard<std::mutex> lk(rm); fprintf(stderr,"kest %d:",ix); for(int l:job) fprintf(stderr," %d",vecOf[l]);
              fprintf(stderr," | dives %lld mean %.4g se %.3g max %.4g | %.1fs\n",KEST,mean,se,mx,ks); }
            { std::lock_guard<std::mutex> lq(qmu); activeR--; checkFin(); } continue; }
          s.pcBegin(ix,0,job,std::array<uint64_t,8>{});   // prof7R3: the job's root segment
          s.resetLists(); s.jobBase=*s.doneP; s.dfs(job.back(),R-(int)job.size(),1.0); s.unreplay(job); certFlush(); if(PCF) pcChunk(true);
          { std::lock_guard<std::mutex> lk(rm); jnodes[ix]+=s.visited-v0-1; jlv[ix]+=s.myLeaf-lv0; jpf[ix]+=s.myProf-pf0; rootDone[ix]=1; if(outst[ix].load()==0) writeState(ix); }
          { std::lock_guard<std::mutex> lq(qmu); activeR--; checkFin(); }
          continue; }
        // job list exhausted: run donated pieces until every job is finished
        Job job;
        { std::unique_lock<std::mutex> lq(qmu); checkFin(); idleN++; qcv.wait(lq,[&]{ return !Q.empty() || fdone; }); idleN--;
          if(Q.empty() && fdone) break; job=std::move(Q.front()); Q.pop_front(); qsizeA--; activeP++; }
        runPiece(job); }
      totv+=s.visited&1023; s.flush(); certFlush();
      { std::lock_guard<std::mutex> lk(fkmu); const fkx::Stats& a=s.fk.st; gFkSt.calls+=a.calls; gFkSt.cert+=a.cert; gFkSt.feas+=a.feas; gFkSt.err+=a.err; gFkSt.rounds+=a.rounds; gFkSt.lps+=a.lps; gFkSt.cliques+=a.cliques; gFkSt.lazyAdded+=a.lazyAdded; gFkSt.mwcCalls+=a.mwcCalls; gFkSt.mwcCut+=a.mwcCut; gFkSt.over+=a.over; gFkSt.units+=a.units; gFkSt.sing+=a.sing; for(int k=0;k<6;k++) gFkSt.cyc[k]+=a.cyc[k]; } };
    auto report=[&](bool fin){ std::lock_guard<std::mutex> lk(rm); double el=std::chrono::duration<double>(std::chrono::steady_clock::now()-t1).count();
      double S=ndone; if(S<1){ fprintf(stderr,"t=%.0fs none done yet nodes~%lld",el,(long long)totv); lpStats(stderr); stStats(stderr); double pg=0; for(int i=0;i<THREADS;i++) pg+=doneT[i*8]; fprintf(stderr," | prog %.9f\n",pg); return; } double mean=sumN/S; double s2=0; for(double x:sizes) s2+=(x-mean)*(x-mean); double sd=sqrt(s2/std::max(1.0,S-1));
      double F=frontier.size(); double est=above+F+F*mean; double se=F*sd/sqrt(S); double mx=0; for(double x:sizes) mx=std::max(mx,x);
      double rate=(sumN-prevNodes)/std::max(1.0,el); double remain=(F-S)*mean/std::max(1.0,rate);
      fprintf(stderr,"%st=%.0fs done %lld/%zu (%.3f%%) mean %.4g sd %.3g max %.4g | EST total %.4g +- %.2g nodes | rate %.3g n/s | ETA %.3g h | leaves %lld profiles %lld | wl nodes %lld",fin?"FINAL ":"",el,ndone,frontier.size(),100.0*S/F,mean,sd,mx,est,se,rate,remain/3600,(long long)nleaf,(long long)nprof,(long long)wNodes);
      for(int k=DMAX+1;k<=8;k++) fprintf(stderr," d%d %lld/%lld",k,(long long)wKill[k],(long long)wScan[k]);
      lpStats(stderr); stStats(stderr);
      { double pg=0; for(int i=0;i<THREADS;i++) pg+=doneT[i*8]; fprintf(stderr," | prog %.9f",pg); }
      fprintf(stderr,"\n"); };
    std::thread mon([&](){ int nr=0; while(!finF){ for(int i=0;i<60&&!finF;i++) std::this_thread::sleep_for(std::chrono::seconds(1)); if(!finF){ report(false); loadSkip(); if(drainNow){ std::lock_guard<std::mutex> lq(qmu); checkFin(); } if(lpx::PROF && ++nr%10==0) lpx::prof_print(stderr); } } });
    std::thread jth([&](){ auto last=std::chrono::steady_clock::now();   // prof7L84: committer and SIGTERM watcher
      while(!finF){ std::this_thread::sleep_for(std::chrono::milliseconds(100));
        if(gTermSig){ std::lock_guard<std::mutex> lr(rm); std::lock_guard<std::mutex> lo(outmu);   // no state or profile line is half written now, and none starts
          std::vector<std::string> J,S; { std::lock_guard<std::mutex> lk(gJmu); J.swap(gJpend); S.swap(gSpend); }
          if(OUT){ fflush(OUT); fdatasync(fileno(OUT)); } { std::lock_guard<std::mutex> lc(certmu); if(CERTF){ fflush(CERTF); fdatasync(fileno(CERTF)); } } { std::lock_guard<std::mutex> lp2(pcmu); if(PCF){ fflush(PCF); fdatasync(fileno(PCF)); } } jwrite(J,S,SF);   // prof7R2: certificate first (prof7R3: and the pcert stream)
          fprintf(stderr,"SIGTERM: profiles synced, %zu journal records and %zu state lines committed; exit 143\n",J.size(),S.size()); fflush(stderr); _exit(143); }
        if(gJF && std::chrono::duration<double>(std::chrono::steady_clock::now()-last).count()>=JSYNC){ jcommit(); last=std::chrono::steady_clock::now(); } } });
    std::vector<std::thread> th; for(int i=0;i<THREADS;i++) th.emplace_back(worker,i); for(auto& t:th) t.join(); finF=true; mon.join(); jth.join(); jcommit(); report(true);
    if(PCF){ fflush(PCF); fdatasync(fileno(PCF)); fclose(PCF); PCF=nullptr;   // prof7R3
      fprintf(stderr,"R3 pcert: %lld bytes in %lld blocks; records NODE %lld LEAF %lld CUT %lld OPEN %lld VROWS %lld XROWS %lld WB %lld BLK %lld (labels %lld) | T %lld C %lld X %lld (kill types T %lld C %lld X %lld) CANON %lld PREFF %lld TYPE %lld DOOM %lld ADDF %lld DON %lld SKR %lld SKP %lld ABORT %lld | internal check failures %lld\n",
        (long long)gPcBytes,(long long)gPcBlocks,(long long)gPcN[1],(long long)gPcN[2],(long long)gPcN[3],(long long)gPcN[4],(long long)gPcN[0x10],(long long)gPcN[0x11],(long long)gPcN[0x12],(long long)gPcN[0x13],(long long)gPcBlk,
        (long long)gPcN[0x20],(long long)gPcN[0x21],(long long)gPcN[0x22],(long long)gPcTC[0],(long long)gPcTC[1],(long long)gPcTC[2],(long long)gPcN[0x23],(long long)gPcN[0x24],(long long)gPcN[0x25],(long long)gPcN[0x26],(long long)gPcN[0x27],(long long)gPcN[0x28],(long long)gPcN[0x29],(long long)gPcN[0x2A],(long long)gPcN[6],(long long)gPcErr);
      if(PCFK>0){ static const char* BK[7]={"0-1","2-8","9-15","16-63","64-255","256-1000","1001+"}; fprintf(stderr,"R3 Farkas%s (kind bb: attempts certificates ms/attempt B/cert constraints/cert units/cert):",PCFK6?" check6":"");
        for(int k=1;k<6;k++) for(int b=0;b<7;b++) if(gFkA[k][b]) fprintf(stderr," | %d %s: %lld %lld %.2f %.0f %.1f %.1f",k,BK[b],(long long)gFkA[k][b],(long long)gFkS[k][b],gFkC[k][b]/2.6e6/gFkA[k][b],gFkS[k][b]?(double)gFkB[k][b]/gFkS[k][b]:0.0,gFkS[k][b]?(double)gFkN[k][b]/gFkS[k][b]:0.0,gFkS[k][b]?(double)gFkU[k][b]/gFkS[k][b]:0.0);
        fprintf(stderr,"\n"); }
      if(XPS){ static const char* BK[7]={"0-1","2-8","9-15","16-63","64-255","256-1000","1001+"}; fprintf(stderr,"R3 bulk peel (kind bb: attempts certificates ms/attempt B/cert):");
        for(int k=2;k<6;k++) for(int b=0;b<7;b++) if(gXpA[k][b]) fprintf(stderr," | %d %s: %lld %lld %.2f %.0f",k,BK[b],(long long)gXpA[k][b],(long long)gXpS[k][b],gXpC[k][b]/2.6e6/gXpA[k][b],gXpS[k][b]?(double)gXpB[k][b]/gXpS[k][b]:0.0);
        if(XP2){ static const char* PH[7]={"gen","setup","tree","cover","excl","prune","emit"}; static const char* BQ[7]={"0-1","2-8","9-15","16-63","64-255","256-1000","1001+"};
          fprintf(stderr,"\nR3 xp2 context row gathering %.3f ms each; contexts with a crow kill %lld, with kind-4 kills only %lld",gX2CtxN?gX2Gath/1e4/gX2CtxN:0.0,(long long)gX2CtxK5,(long long)gX2CtxK4);
          for(int c=0;c<3;c++) if(gX2GN[c]) fprintf(stderr,"\nR3 xp2 contexts %s: %lld, gathering %.3f ms each, residual-2 rows %.0f each",c==2?"with a crow kill":c==1?"with kind-4 kills only":"with kinds 2/3 only",(long long)gX2GN[c],gX2GC[c]/1e4/gX2GN[c],(double)gX2GR[c]/gX2GN[c]);
          fprintf(stderr,"\nR3 xp2 node contexts %lld: %.3f ms each (rows %.0f residual-1, %.0f residual-2), dictionary %.1f, extras outside L1 %.1f, node rows %.1f per context; X records %lld bytes\n",(long long)gX2CtxN,gX2CtxN?gX2Ctx/1e4/gX2CtxN:0.0,gX2CtxN?(double)gX2Rows1/gX2CtxN:0.0,gX2CtxN?(double)gX2Rows2/gX2CtxN:0.0,gX2CtxN?(double)gX2Dict/gX2CtxN:0.0,gX2CtxN?(double)gX2Ext/gX2CtxN:0.0,gX2CtxN?(double)gX2NodeR/gX2CtxN:0.0,(long long)gX2B);
          double tot[7]={0}; for(int k=2;k<=5;k++) for(int b=0;b<7;b++){ if(!gX2A[k][b]) continue; fprintf(stderr,"R3 xp2 kind %d bb %-8s: %8lld kills, %8lld certificates | us/kill",k,BQ[b],(long long)gX2A[k][b],(long long)gX2S[k][b]);
              for(int q=0;q<7;q++){ fprintf(stderr," %s %.0f",PH[q],gX2P[k][b][q]/10.0/gX2A[k][b]); tot[q]+=gX2P[k][b][q]/10.0; } fprintf(stderr," | total %.1f s\n",gX2P[k][b][0]/1e7); }
          fprintf(stderr,"R3 xp2 total s:"); for(int q=0;q<7;q++) fprintf(stderr," %s %.1f",PH[q],tot[q]/1e6); fprintf(stderr," contexts %.1f\n",gX2Ctx/1e7); }
        fprintf(stderr,"\nR3 bulk peel nodes: %lld node contexts, %.1f rows each, setup %.2f ms each, node records %lld bytes | node cuts 5/6: %lld certified, %lld not, %.2f ms each\n",(long long)gXpNodes,gXpNodes?(double)gXpRows/gXpNodes:0.0,gXpNodes?gXpNodeC/2.6e6/gXpNodes:0.0,(long long)gXpNodeB,(long long)gXpCut[0],(long long)gXpCut[1],(gXpCut[0]+gXpCut[1])?gXpCutC/2.6e6/(gXpCut[0]+gXpCut[1]):0.0); }
      if(PCFK>0) fprintf(stderr,"R3 Farkas generator: check6 units %lld (singletons %lld), integer candidates rejected for supply per point > %lld: %lld | scale D of certificates 1: %lld 2: %lld 3-4: %lld 5-8: %lld 9-16: %lld 17-64: %lld 65+: %lld\n",gFkSt.units,gFkSt.sing,PCFK6SUP,gFkSt.over,(long long)gFkDh[0],(long long)gFkDh[1],(long long)gFkDh[2],(long long)gFkDh[3],(long long)gFkDh[4],(long long)gFkDh[5],(long long)gFkDh[6]);
      if(PCFK>0) fprintf(stderr,"R3 Farkas generator: calls %lld certificates %lld LP-feasible %lld errors %lld | rounds %lld LPs %lld cliques %lld lazy rows %lld | exact separations %lld (node limit %lld) | Gcycles first LP %.1f later LPs %.1f Farkas LP %.1f integer %.1f lazy sep %.1f clique sep %.1f build %.1f | residual-2 rows per node %.0f\n",gFkSt.calls,gFkSt.cert,gFkSt.feas,gFkSt.err,gFkSt.rounds,gFkSt.lps,gFkSt.cliques,gFkSt.lazyAdded,gFkSt.mwcCalls,gFkSt.mwcCut,gFkSt.cyc[0]/1e9,gFkSt.cyc[1]/1e9,gFkSt.cyc[2]/1e9,gFkSt.cyc[3]/1e9,gFkSt.cyc[4]/1e9,gFkSt.cyc[5]/1e9,gFkBuild/1e9,gFkR2n?(double)gFkR2/gFkR2n:0.0);
      { static const char* BK[7]={"0-1","2-8","9-15","16-63","64-255","256-1000","1001+"}; long long tn=0, tb=0; fprintf(stderr,"R3 X kills (kind bb: kills search-nodes):");
        for(int k=1;k<7;k++) for(int b=0;b<7;b++) if(gXn[k][b]){ fprintf(stderr," | %d %s: %lld %lld",k,BK[b],(long long)gXn[k][b],(long long)gXb[k][b]); tn+=gXn[k][b]; tb+=gXb[k][b]; }
        fprintf(stderr," | total %lld %lld\n",tn,tb); }
      if(PCEXP>0 || PCEXP5>0 || PCNOREP) fprintf(stderr,"R3 expansion: %lld kills expanded, %lld nodes inside them, %lld accepted leaves inside them (must be 0)\n",(long long)gExpK,(long long)gExpN,(long long)gExpBad);
      if(LEAFV7) fprintf(stderr,"R3 leafv7: %lld leaf certificate records (%lld need none: rank sum < 27), %lld via the fit fallback, %lld / %lld retried at 2e6 / 2e7 calls, %lld without a certificate (must be 0); %.1f bits each, %.2f ms each, max %.1f ms\n",(long long)gLv7N,(long long)gLv7None,(long long)gLv7Fit,(long long)gLv7Big1,(long long)gLv7Big2,(long long)gLv7Fail,gLv7N?(double)gLv7Bits/gLv7N:0.0,gLv7N?gLv7Us/1e3/gLv7N:0.0,gLv7MaxUs/1e3);   // batch 13
      if(PCNOREP) fprintf(stderr,"R3 no replay: X kills expanded for lack of a certificate by kind 1-5: %lld %lld %lld %lld %lld; node cuts 5 / 6 not taken: %lld / %lld (%lld nodes searched instead)\n",(long long)gNrX[1],(long long)gNrX[2],(long long)gNrX[3],(long long)gNrX[4],(long long)gNrX[5],(long long)gNrCut[0],(long long)gNrCut[1],(long long)gNrCutN);
      if(TLMAX>=0){ long long t=0,k=0,n=0; for(int d=0;d<24;d++){ t+=gTLt[d]; k+=gTLk[d]; n+=gTLn[d]; } fprintf(stderr,"R3 tl2: tests %lld cuts %lld search nodes %lld\n",t,k,n); }
      fprintf(stderr,"R3 cover attempts/successes by node count:"); for(int b=0;b<17;b++) if(gPcAtt[b]) fprintf(stderr," %d:%lld/%lld",b,(long long)gPcAtt[b],(long long)gPcSuc[b]); fprintf(stderr,"\n");
      fprintf(stderr,"R3 pcert cycles (G): enter %.1f classify rows %.1f classify kills %.1f open %.1f | classify calls %llu, residual-1 rows per call %.0f\n",gPcCyc[0]/1e9,gPcCyc[1]/1e9,gPcCyc[2]/1e9,gPcCyc[3]/1e9,(unsigned long long)gPcCyc[6],gPcCyc[6]?(double)gPcCyc[5]/gPcCyc[6]:0.0); }
    if(gJF || gJdmask || gJrmask) fprintf(stderr,"L84: journal records %lld (%lld commits), subtrees skipped %lld (%lld nodes)\n",(long long)gJrec,(long long)gJsyncs,(long long)gJskip,(long long)gJskipN);
    if(gJF){ fclose(gJF); gJF=nullptr; }
    if(lpx::PROF){ lpx::prof_print(stderr); fprintf(stderr,"LPPROF first builds %.0f ms, pool rebuilds %lld (%.0f ms)\n",gBLDns/1e6,(long long)gRBn,gRBns/1e6); }
    if(SF) fclose(SF); if(OUT) fclose(OUT);
    { double est=0; fprintf(stderr,"job-tree depth counts (scaled by 1/p below the sample depth):");
      for(int d=0;d<=R;d++){ if(!gDepth[d]) continue; double sc=(SAMPLE_D>=0&&d>SAMPLE_D)?1.0/SAMPLE_P:1.0; est+=gDepth[d]*sc; fprintf(stderr," d%d %lld(%.4g)",d,gDepth[d],gDepth[d]*sc); }
      fprintf(stderr,"\nEST job-tree nodes %.4g\n",est);
      if(!gSub.empty()){ std::sort(gSub.begin(),gSub.end()); double sm=0,s2=0; for(auto x:gSub){ sm+=x; s2+=(double)x*x; } double S=gSub.size(); double mean=sm/S; double sd=sqrt(std::max(0.0,s2/S-mean*mean));
        fprintf(stderr,"SAMPLE depth %d p %g: N_D %lld sampled %zu mean %.1f sd %.1f median %lld p90 %lld max %lld\n",SAMPLE_D,SAMPLE_P,gDepth[SAMPLE_D],gSub.size(),mean,sd,gSub[gSub.size()/2],gSub[(size_t)(0.9*S)],gSub.back()); } }
    fprintf(stderr,"DONE frontier run: profiles %lld (minr1 cuts %lld, jobs cut at replay %lld, skipped as done elsewhere %lld, abandoned as done elsewhere %lld)\n",(long long)nprof,(long long)gR1cut,(long long)gReplayCut,(long long)nSkipped,(long long)nAborted);
    if(wcut::ON){ fprintf(stderr,"WCUT"); wcut::stats(stderr); fprintf(stderr,"\n"); }
    if(WBLOCK) fprintf(stderr,"WBLOCK nodes %lld labels %lld W-checks %lld\n",(long long)gWbN,(long long)gWbL,(long long)gWbC);
    if(FLOOK<24){ fprintf(stderr,"FLOOK (tests/cuts by depth):"); for(int d=FLOOK;d<24;d++) if(gFlN[d]) fprintf(stderr," d%d %lld/%lld x%lld",d,(long long)gFlN[d],(long long)gFlC[d],(long long)gRlX[d]); fprintf(stderr,"\n"); }
    if(rootcut::ON) fprintf(stderr,"ROOTCUT leaf tests %lld, leaves cut %lld\n",(long long)rootcut::gCalls,(long long)rootcut::gCut);
    { fprintf(stderr,"DEPTHTIME (CPU s incl/excl):"); for(int d=10;d<23;d++){ unsigned long long a=gIncl[d], b=gIncl[d+1]; fprintf(stderr," d%d %.1f/%.1f",d,a/1e9,(a>b?a-b:0)/1e9); } fprintf(stderr,"\n"); }
    return 0; }
  OUT=fopen(outpath,"w");
  auto t0=std::chrono::steady_clock::now();
  Q.push_back({{},1.0}); int active=0; bool fin=false; std::atomic<int> tidc{0};
  auto worker=[&](){
    int mytid=tidc++; Search s; s.tid=mytid; s.doneP=&doneT[mytid*8];
    while(true){
      Job job;
      { std::unique_lock<std::mutex> lk(qmu); idleN++;
        qcv.wait(lk,[&]{ return !Q.empty() || fin; });
        if(Q.empty() && fin){ idleN--; break; }
        job=std::move(Q.front()); Q.pop_front(); idleN--; active++; }
      bool ok=s.replay(job.seq);
      if(!ok){ fprintf(stderr,"replay failed\n"); exit(5); }
      int last=job.seq.empty()?0:job.seq.back(); s.resetLists(); s.dfs(last,R-(int)job.seq.size(),job.w);
      s.unreplay(job.seq); certFlush();
      { std::lock_guard<std::mutex> lk(qmu); active--; if(active==0 && Q.empty()){ fin=true; qcv.notify_all(); } }
    }
    totv+=s.visited&1023; s.flush(); certFlush(); };
  std::thread mon([&](){ while(true){ bool f; size_t qs; { std::unique_lock<std::mutex> lk(qmu); qcv.wait_for(lk,std::chrono::seconds(60),[&]{return fin;}); f=fin; qs=Q.size(); } if(f) break;
      double el=std::chrono::duration<double>(std::chrono::steady_clock::now()-t0).count();
      double pr=0; for(int i=0;i<THREADS;i++) pr+=doneT[i*8]; fprintf(stderr,"t=%.0fs progress %.6f nodes~%lld leaves %lld profiles %lld donated %lld queue %zu idle %d\n",el,pr,(long long)totv,(long long)nleaf,(long long)nprof,(long long)donated,qs,(int)idleN); } });
  std::vector<std::thread> th; for(int i=0;i<THREADS;i++) th.emplace_back(worker); for(auto& t:th) t.join(); mon.join();
  double el=std::chrono::duration<double>(std::chrono::steady_clock::now()-t0).count();
  fprintf(stderr,"DONE nodes %lld leaves %lld profiles %lld donated %lld time %.1fs\n",(long long)totv,(long long)nleaf,(long long)nprof,(long long)donated,el);
  if(OUT) fclose(OUT);
  { double est=0, estL=0; fprintf(stderr,"depth  nodes  addfail  ffail  childless  (scaled est nodes)\n");
    for(int d=0;d<=R;d++){ double sc=(SAMPLE_D>=0&&d>SAMPLE_D)?1.0/SAMPLE_P:1.0; est+=gDepth[d]*sc; fprintf(stderr,"%2d %lld %lld %lld %lld  %.4g\n",d,gDepth[d],gAddFail[d],gFF[d],gChildless[d],gDepth[d]*sc); }
    estL=gDepth[R]*((SAMPLE_D>=0&&R>SAMPLE_D)?1.0/SAMPLE_P:1.0);
    fprintf(stderr,"EST total nodes %.4g leaves %.4g\n",est,estL);
    if(!gSub.empty()){ std::sort(gSub.begin(),gSub.end()); double sm=0,s2=0; for(auto x:gSub){ sm+=x; s2+=(double)x*x; } double S=gSub.size(); double mean=sm/S; double sd=sqrt(std::max(0.0,s2/S-mean*mean));
      double ND=gDepth[SAMPLE_D]; double below=0; for(int d=0;d<SAMPLE_D;d++) below+=gDepth[d];
      fprintf(stderr,"SAMPLE depth %d: N_D %.0f sampled %zu mean %.1f sd %.1f se %.1f median %lld p90 %lld p99 %lld max %lld\n",SAMPLE_D,ND,gSub.size(),mean,sd,sd/sqrt(S),gSub[gSub.size()/2],gSub[(size_t)(0.9*S)],gSub[(size_t)(0.99*S)],gSub.back());
      fprintf(stderr,"SAMPLE est total nodes %.4g +- %.2g\n",below+ND*mean,ND*sd/sqrt(S)); } }
}
