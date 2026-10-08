# Run 1 incident note (case II with I / I13), 2026-10-07 UTC

For the run summary inputs. None of these produced a false theorem: every misrecorded check was found before glue and the items were
checked again. Below, "voided" means `xqctl voidchk` (the W record is voided) and "regenerated" means `xqctl regen`. A regenerated item is
searched again on another helper, and the queue accepts it only if its own counts and segment sha256 equal the original's.

## 1. Full root disks on helper boxes (12:29-14:18)

- Hosts: C3D boxes with 50 GB boot disks (r3qc01, 03, 04, 05, 07, 08, 10, 11, 14, 15, 17); hpc-workloads32 (from about 12:29);
  hpc-workloads15 (504 GB root filled by other workstreams' data, 439 GB under mm3/work/r22, from about 13:38).
- What filled the disks:
  - checkd work dirs: about 300 MB per running check, up to 56 at once. checkd never removed the work dirs of checks a restart cut
    off (16-19 GB of leftovers).
  - Unchecked segments overshooting the 4 GB pause bound: the pause stops new items, not the ones in flight.
  - Dead bytes from item 2 below.
- Effects:
  - 11 case-II checks FAILed because the checker could not write its chunk files: 78710 79040 79311 79325 79384 79901 80620 80629
    (r3qc01), 106123 106124 (r3qc03); 16852 (hpc-workloads15, cause not recoverable). The frozen checker was re-run on main
    and it accepts them; they were re-checked.
  - Five chunks were built empty on a full disk (0-byte .keys, 5208-byte olean), and the checker still printed ITEM OK. That left 11
    items recorded OK without keys: 79280 79290 79291 79312 79319 80630 80651 80658 105736 105740 105747. The missing-key check
    found them (8 job roots); a line count of all 26,702 store_run1 .keys against each chunk's item count found exactly these 5 chunks.
    All 11 were voided and regenerated; round 5 (14:50) showed 0 missing keys.
- Resolution: the 23 r3qc boot disks were resized to 250 GB (reboots 13:55-14:23). hpc-workloads15 was retired from case II; its own
  backlog is checked into /dev/shm and pulled.

## 2. Helper segment-write drift (prof7R3q in bundle a43e3e95e530)

- The helper wrote item segments with unchecked fwrite and counted the file offset itself. After the first write that failed on a full
  disk, every later segment reference from that process named the wrong bytes.
- First failed writes: hpc-workloads32 12:29:14, r3qc01 12:53:07, r3qc03 12:59:51, r3qc04 13:56, r3qc14 14:01; hpc-workloads15 after
  13:38.
- Audit, at 14:14, of all 482k current segment references on 88 hosts:
  - No reference after any failure point carries a check.
  - Every other reference either reads as its own block with the queue's sha256, or was trimmed after an OK check made before the
    failure.
  - 360 OK items on hpc-workloads32 point into its earlier /dev/shm file (lost at a preemption, path reused). All 360 were checked
    before the loss, and their chunks are in store_run1.
- About 830 drifted items, plus the earlier assembly-error items, were regenerated. 2,356 regenerations failed with rgnoseg (all on
  helpers whose disk was full); they were requested again, and a sweep now re-requests failed regenerations every 10 min.
- Guard (checkd, from bundle 4a0b0a): before checking, the block's stored sha256 must equal the queue's sha256 for the item. Without
  this, a drifted reference could meet another item's whole block of the same length.
- Fix (prof7R3q 78edbaa27c63, bundle r3q_bundle_78edbaa27c63_f53815):
  - Each block goes out in one checked write at the file's true end.
  - A failed or short write is cut off again (ftruncate), and the pcert stays unpunched.
  - ENOSPC is waited out for up to 15 min.
  - A block that is not durably on disk is never reported; the item goes out as ERR / SGL and the queue re-runs it.
  - Tested with w8 (spills, kill -9, fast-spill recovery; glue identical to the single-process reference) and w9 (ENOSPC on a 24 MB
    tmpfs, then growth).

## 3. Lost local chunk copies at a Spot preemption (hpc-workloads25, 14:47-14:51)

- checkd recorded 649420, 649912 and 650066 OK. The box was preempted before the unsynced chunk copies in its local store reached the
  disk, so both files were left with 0 bytes and pulled to GCS. The 3 items were voided and regenerated.
- Fixes:
  - checkd fsyncs local store copies (file and directory) and checks their size before recording.
  - The c4d pull uploads a chunk pair only if both files are non-empty, the .keys line count matches the chunk's item count, and every
    line's olean= equals the olean's sha256.
  - It also compares every uploaded object's size with the local file.

## 4. Checker and checkd hardening

- Native payload 5fe02d809ee7, with the same library and CHECK.native.conf: inputs are verified before the chunk, every append
  is checked, and ITEM OK is printed only when the item's own key is in the produced .keys. Deployed in place on all boxes 14:50-14:59
  and in the launch metadata.
- checkd (bundles 4a0b0a .. 78edbaa27c63_f53815):
  - Never dies on a full disk, and removes leftover work dirs at start.
  - Disk budget for checks; pauses the helper below 12 GB free.
  - Memory reserved by item size: max(4 GB, 1 GB + 18 × largest item).
  - Refuses OK items whose chunk .keys lists fewer lines than the items reported OK.
  - Regenerates unreadable segments, re-checks voided checks, keeps the checker logs of every failed check, and logs reason=.
- Two FAILs came from deployment order: on r3qc19 at 14:50, nchk_batch.sh arrived before itemcheck.py (928124, 929288). Both were
  voided and re-checked.

## 5. Checker I/O check failures on r3qc04 (15:18-15:30)

- 102 case-II items FAILed with reason=io-batchlist, raised by the new wrapper check (batch.list must hold one line per accepted
  item). A rebuild of 65 of them on r3qc04 itself passes. Diagnosis: two checker instances shared one work dir. checkd reused
  work/batch_<first id>, its timeout killed only the `bash -c` shell, and a restart re-dispatched the same items while an old checker
  kept writing.
- All 102 were voided and re-checked.
- Fixes:
  - Payload ab2163e35a33: private dirs per invocation.
  - checkd: a private work dir per attempt; each checker in its own process group, killed whole on timeout; leftover checkers killed at
    start; io* FAILs retried as errors, never recorded.
  - push_checkd now targets checkd itself; it had sometimes hit a checker's python3 and left the old checkd running.

## 6. Item hoarding and queue server load (15:20-16:00)

- 56-63 of about 78 helpers sat idle while about 150k items were leased to a few runs (up to 37k on one). The helper's want (idle
  threads) does not count items in flight, so a helper that stopped importing (paused by its checkd) kept being sent items, up to 27k
  in 2 s.
- xqd ran at 100% CPU: every checkd's SEGS walked all 1.2M items (1.25 s per call), 88 hosts every few seconds.
- Fixes:
  - Hoarding helpers restarted (15:39).
  - xqd restarted at 15:52 (51 s down) with a per-run lease cap of 2 × threads + 64. HOLD at reconnect re-queued every item a helper
    never imported, about 115k items.
  - xqd restarted at 16:00 (57 s down) with an index of items by segment host. SEGS takes 0.02-0.04 s and gives identical answers on
    the same snapshot.
  - checkd fetches SEGS at most every 30 s and backs off retries.
  - xqd CPU fell to about 10%.

## 7. Checks recorded nowhere (15:20-16:01) and slow recording

- When the queue was down or timed out (the 100%-CPU period and the two xqd restarts), checkd logged "recorded no" and never sent the
  record again: 26,889 OK checks on 70 hosts. They were re-sent at 16:27 from each box's checkd records (TSV + log), with 0 errors and
  nothing re-checked.
- Since then checkd keeps an unrecorded check pending, re-sends it every pass, and stores the record fields in checked_<host>.tsv so a
  restart re-sends it too.
- Recording was one admin connection per item: 12 items/s from us-west4 (h15's 2,000-item I13 batches). checkd now pipelines a batch's
  CHECK lines over one connection and punches segments in process.

## 8. Preempted helper boxes (16:40-17:25)

- hpc-workloads24 (stocked out) lost its unchecked segments (12,032 items) and 13 chunks not yet pulled (740 items recorded OK). All of
  them were voided where needed and regenerated elsewhere.
- r3qc01, 04, 06, 07, 10, 21, 25 and r3qm32 were preempted. Their unchecked items were regenerated. regen_lost_loop.sh now does this
  for any stopped box.
- The 11 original case-II FAILs were all re-checked OK (conf unchanged); none was a refutation.

## 9. Job state files written by a test server (15:55), cleaned 17:52

- A load test of the patched xqd ran on a copy of the manifest with simulated helpers. Because the statedir is absolute, it wrote 238
  fake job completions into the production run1/gather/xq/state_*_xq.txt.
- Removed (backup in gather/xq_backup_1752). The state files match the manifest's S records exactly: 150,704 lines, no duplicates.
- The manifest was never touched.

## 10. Truncated split messages: nine jobs re-run (17:58)

- Nine Q children from N4 helpers' SP lines reached xqd truncated (dinh or win cut). Every helper rejects them (F "badline"), so their
  jobs could never complete: 165430 165817 286440 293748 251628 426263 810551 1264396 1386905.
- Probable cause: a partial last line at a connection loss is parsed as a whole message.
- The nine jobs were queued again as fresh job roots in spaces run1_<batch>_redo, same pools and ix.
- The glue must use the redo tree's root for these nine job roots.
- A tenth job, poolC_poolH_d11_002 ix 1800, lost split children the same way. Item 1088887's SP line (r3qm25) was cut after its counts.
  xqd recorded it as a report with no children and a dangling seg=pending, so the job looked complete but under-counted.
  - Original S: 869,699 nodes / 12,568 leaves / 10,740 admissible. The cut-off part is 16,900 / 119 / 103: 1088887's own full search
    (25,006/165/135, from the refused regeneration) minus what was reported (8,106/46/32).
  - Re-run as root 1930442 (space run1_poolC_poolH_d11_002_redo2): 886,599 / 12,687 / 10,843.
  - The glue catches lost children, because the parent's segment references them. The missing-key rounds (0 uncovered) show no
    other job lost children.
- Fix before any further run: xqd rejects a partial last line at EOF, and SP carries its child count.

## State at 15:20

- store_run1 holds 7 zero-byte objects, all from the chunks in items 1 and 3. None is referenced by a live OK check.
- kept_run1 holds no zero-byte objects.


## Distributed E1 tiers (L479, point tree, classes): pipeline notes and incidents


- **Batch mode** (`run/e1batch.sh FILE`): one queue file (≤ 4 jobs of one parent; 50 for top-level cuts with > 500 children) =
  one generator process (`py/e1gen.py <tier>b`) and one native chunk per ≤ 1 GB of items. A job over budget is not split in place
  (`E1DEFER=1`): its subtree is cut X levels deeper (3 for top-level jobs, 1 for sub-jobs) into a split node
  `run/fleet/split/<TIER>_<K>/` (sub.txt, top.bin, prefix.txt) and result `SPLIT nsub root=<key>`; the children `l479s K.i` run
  anywhere; once every child has a root key the top part `l479t <TIER>_<K>` (kids.txt) is checked. Ext-leaf jobs report
  `FAIL:ext-leaves root=<key>`. Budget: `E1BUDGET` (3M), `*_smallbudget_*` files 300k, rules in `run/fleet/budget.txt`
  ("PREFIX BUDGET", first match; e.g. `41. 500000`). gen7 per-leaf budget `E1_GEN7_MAXNODES=10000000`.
- **Chunk verification before any OK** (operator 2026-10-07, after empty chunks written on full disks were reported OK):
  the nchk.sh a3e34db9 (input, copy and key-count checks) plus `run/keyscheck.sh` in e1batch/e1job and `keys_bad` in e1gen's
  stream mode: the produced `.keys` must equal chunk.list (order, complete lines, olean= = thm) and the stored olean must hash to
  thm; nchk's ndecl must equal the items the generator wrote; job OKs are read from the produced `.keys` (one awk join over the
  files: a top part's item key carries its kids, hundreds of KB). A bad chunk goes to `outbox/bad/`, its jobs FAIL.
- **Runner** (`run/e1q2.sh SLOTS 1`): queue directory `run/fleet/q.d` (atomic claims into q.run/), low-priority instance
  `E1QD=q.low E1RECHECK=1` at nice 19 (legacy re-checks). Work dirs in /dev/shm; a failed per-line job's work dir is removed
  (logs to `run/fleet/faillogs/`). `run/memguard2.sh 15`: while MemAvailable < 15% it kills the largest generator / check /
  driver of the runner's own process trees (explicit PID). Root disk > 90%: e1batch gives a claimed file back (`diskguard.log`).
  `run/e1boot.sh` (@reboot crontab, `run/fleet/workers.conf`) restarts everything after a Spot preemption; `run/fleetwatch.sh`
  (main) restarts runners on boxes that come back without one.
- **Controller** (`run/l479ctl2.py`, one per tier: `L479_STORE=store3 L479_TIER=l479`, `store4 pt L479_NJ=2352`): rounds of
  ~20 s on 45 boxes: one ssh per box (disk use + the new tail of its res.log by byte offset into `reslog/<ip>.log`); fetches only
  the split dirs / ext files named by new lines; pushes only new split dirs + kids.txt (one tar per box); enqueues children,
  top parts and one retry per failure (blocks of 4, least-pending box first). Boxes: `ctl/boxes.txt` (re-read every round;
  "IP drain" = no new jobs); a new box gets one full split rsync first (`ctl/ready.txt`); a box above 90% root disk is not fed
  and its waiting queue files of the tier family move elsewhere. A plain FAIL never overrides an OK/SPLIT seen on another box
  (per-box logs are merged box by box); `FAIL:keyscan…` does. State files as before (assigned/expanded/topq/retried).
- **New boxes** (`run/newbox.sh [-w W] [-l LOW] [-k] [-H] [-n] IP…`): home dir + rsync/zstd, one tar stream (toolchain and the
  checker libraries only if missing; runner package; hcls generator + L479 inputs; hpt inputs; hcap inputs unless -H; -k keeps
  existing files), workers.conf + @reboot hook, memguard2, runners (default min(0.85 nproc, MemGB/2.4) + 1/8 low), and the IP
  appended to both controllers' box files and `run/agg/boxes.txt`.
- **Incremental glue** (hpc-agg2): `run/aggloop.sh` → `aggpull.sh` (new NC_b* chunks per box) + `agground.sh FAM` (glue.py
  GLUE_COMPLETE rounds over the roots file + gabuild).
- **Audits**: `py/keysscan.py FLEETDIR OUT` (every OK result of a box against the chunks it names; 2026-10-07: ~3.6M batch +
  ~11M per-line OKs verified, 2 bad, both regenerated); `py/classaudit.py STORE OUT` (hcap classes: result, chunk keys = items,
  olean hash = thm, archive); `py/l479est.py` (Knuth projection of the remaining L479 work over the split trees);
  `py/subtree.py NODE…` (status of a split subtree).
- **Coverage gate before every final** (operator 2026-10-08: 0 uncovered before a final starts).
  - L479 / pt: `/tmp/missclosure.py FAM ROOTS` on agg2, a traversal of the dedup index from the roots.
  - Classes: `py/classclosure.py C` on main, over the same chunk set as mkfinal. It writes `run/audit/classclosure_h<C>.txt`
    (missing interface, its name in the split trees, parent).
  - `run/finalwatch.sh C...` repeats classpull + gate every 10 min and runs `run/classfinals.sh C` when the gate reads 0.
- **One key per interface.** glue.py refuses an interface covered by two different keys.
  - Classes: `py/keysel.py` is used by mkfinal and classclosure. It keeps the whole-job key, else the smallest top part whose
    children are all covered. aggdedup's first-seen choice could keep an incomplete top part from a failed run.
  - L479: `py/aggenforce.py STORE STATE [NPROC]` is the full pass of aggdedup. It reads every .keys (~2 min with 16 workers)
    and strips every key that differs from the index's choice, which is the choice the closure check traverses.
  - On 2026-10-08 the incremental pass had left 3,445 such interfaces (3,711 keys); the first GAl479f glue failed on one.
  - Never run aggdedup/aggenforce while a glue is in its store scan. glue.py lists the store once and then opens each .keys
    (~25 GB, 15-25 min).
- **Result-log NULs.** A Spot box stopped uncleanly leaves a run of NULs in res.log (appended data never flushed). The first
  line after the restart starts with them.
  - The controllers used to skip such a line. Its job then stayed pending, and the parent's top part was never queued
    (h487s_523.3075 on 2026-10-08).
  - `l479ctl2.py` and `lostjobs.py` now drop NULs before parsing.
- **aggpull** (2026-10-08):
  - New chunks are found by ctime (`-cnewer`); a move into the outbox keeps the mtime.
  - A store file is never replaced. An identical re-pull is dropped; a different file of the same name goes to `store.collide/`.
    A running final pins its chunk oleans.
  - A box whose transfer failed is retried with less parallelism (24, 6, 2). sshd's MaxStartups drops some of 24 parallel
    connections to agg2. A box still failing is logged as `pull INCOMPLETE`.
- **Tail latency** (S32 node 32.156.0.1.0.1.1, 2026-10-08): its 8 biggest kids ran whole for hours.
  - Cure: `*_smallbudget_*` copies (300k) of the slow jobs; a budget rule `32.156.0.1.0.1.1. 300000` on every box; the L479
    controller restarted with `L479_BLOCK=1`. One-job files avoid running the biggest siblings one after another in a single
    generator.
  - Pending went from 44 to 0 in 20 min.
  - Chunks on a box preempted before the pull (r3qm09) were regenerated by re-running those jobs (`*_rcS32_*`).
- **Lost chunks.** A class job reported OK whose chunk is in no outbox (h490s_986.1160, 2026-10-07 22:33, empty res file) is
  found by the gate and re-run.
- **Stale queue.** Box 10.202.0.16 (hpc-workloads22) is tagged dead in every controller. After a restart its runners worked
  through a 10,441-file queue from 2026-10-07 14:30 whose results nobody collected; the queue was parked in
  `q.stale_20261008`.
- **Frozen inputs (2026-10-08 06:30).** The finals pin their chunk oleans (GA/CHUNKS.sha256), so their stores stay frozen:
  run/store2, run/store5, and hpc-agg2's run/agg/{l479,pt}/store. No classpull, aggpull, dedup or enforce runs on them.
  - Incident: an in-process whole-job run of h487_564 kept streaming same-name chunks (NC_h487_564c0..c11) until 03:40.
    Classpulls after the 03:31 h487 final then copied 8 changed oleans over the pinned ones.
  - The originals were put back from the h18 copy, and the later files were moved to run/store2/outbox_newrun_h487_564/.
    GAh487f (03:31) is unchanged. `gatemplate check` is OK for all 21 class finals, GAptf, GAl479s, and GAl479f (post-check).
  - Lesson: names of per-line chunks repeat across runs of one job (NC_<tier>_<K>c<j>), so a pull into a store that a built
    final pins must never overwrite (aggpull now uses no-clobber; classpull's `rsync -u` does not, and must not run after a
    final).

## Aggregation, final assembly and audit, 2026-10-07/08 UTC

1. **Case II, 10 job roots re-run (redo).** A record truncated at a connection loss left 10 job trees that could never close. They were
   re-run as fresh jobs and glued under an explicit exception list (`glue.py GLUE_EXCEPT`, EXCEPT_run1.txt): the 10 roots, the redo
   root item that must cover each, and the original trees' own items excluded (665 store items, each pinned by its key's sha256).
   Nothing else was relaxed; two keys for one interface still stop the glue.
2. **Rounds copied mid-build.** The transfer of case-II aggregation rounds to the final-build host took a round once its DONE file
   existed, which the glue writes before the build: two rounds were copied while still building (24 files missing). The transfer now
   waits for the round's log line; the missing files were copied and all round files were sha256-verified before the final glue.
3. **Missing-key check lag.** The early missing-key check compared the store with a list of complete jobs taken after a 40-minute
   round, so it named jobs whose chunks arrived after the pull (all covered by the next pull). The list is now taken before the pull.
4. **Giant top items.** Top items with ~10,000 children took hours each to elaborate in the aggregators. The glue now writes their
   children as a literal list, proved equal to the key's children by one kernel evaluation (`decide +kernel`), and puts each such
   item in its own module; the statements are unchanged and the aggregator template admits exactly that form.
5. **A class glue's chunks overwritten.** After the h487 class glue was built, a later run streamed chunks under the same names,
   and they replaced the originals in the class store. The copy on the final-build host predated the overwrite and matched the glue's
   pins; the originals were restored from it, so no rebuild was needed.
6. **Stripped key lines.** A one-key-per-interface pass that ran after the main L479 glue had read the store removed lines from
   147 chunk key files it uses (5 files entirely). The lines were restored byte-identical from the pre-edit originals before the audit.
7. **Early chunks without the checker-pair record.** 187,578 chunks of the first L479 and point batches predate the record of the
   checker pair in their key files. For them the pair is derived from each chunk's kernel-checked statement and the unique soundness
   lemma of the required shape in the pinned library (every statement and every key line checked); the final axiom audit counts them
   separately.
8. **Interpreted re-checks time-boxed.** The interpreter runs 45-200x slower than the compiled checks on these items, so the 1%
   sample could not complete by the end of the run; the completed re-checks count, the rest keep running and are reported later.
   Re-check runners were stopped twice to free memory for final builds, by killing whole process groups, so no partial result was
   recorded.
