module
public import NN.ItemN
public import NN.Dead
public import R22N.Bin7
public import R22N.Glue
/-! # NN.Cache: a batch's row lookups through one chunk cache (core only, library module)

The row interfaces (`R22D.rowEII`, `R22D.rowE321`) are interpreted data: each call walks a 16-level chunk dispatcher (18-73 µs).
An item cites 2,487 distinct rows on average (case II, batch 13 H4), but a batch of items touches few distinct chunks (the whole
1,398-item stream: 20,149 of 59,088).  `batchCached` therefore decodes every item once to collect the chunks its table needs
(`itemKeys`), fetches each distinct chunk once (`K.map (fetch chunkA chunkB)`), and checks every item with `rowCached`, a native
lookup into that cache.  `rowCached_eq`: the cached interface IS `entryOf chunkA chunkB nA nB` (whatever `K` is), so
`batchCached_sound` concludes about the plain interface `rowE` once `rowE = entryOf …` (`NN.Case`: both R22D interfaces). -/
@[expose] public section
namespace NN

/-- chunk `key / 2` of table A (`key` even) or table B (`key` odd) -/
def fetch (chunkA chunkB : Nat → Nat) (key : Nat) : Nat := if key % 2 = 0 then chunkA (key / 2) else chunkB (key / 2)

/-- the cache key of row `i`: its chunk in table A (`i < nA`) or table B -/
def rowKey (nA i : Nat) : Nat := if i < nA then 2 * (i / 64) else 2 * ((i - nA) / 64) + 1

/-- the position of row `i` in its chunk -/
def rowOff (nA i : Nat) : Nat := if i < nA then i % 64 else (i - nA) % 64

/-- the row interface through the cache `K` (sorted keys) / `V` (`V[j]` = `fetch K[j]`); rows beyond both tables are 0 -/
def rowCached (chunkA chunkB : Nat → Nat) (nA nB : Nat) (K V : Array Nat) (i : Nat) : Nat :=
  if i < nA + nB then
    let key := rowKey nA i
    let j := findIdx K key
    let c := if j < K.size ∧ K.getD j 0 = key then V.getD j 0 else fetch chunkA chunkB key
    (c >>> (520 * rowOff nA i)) % 2 ^ 520
  else 0

theorem getD_map_lt {f : Nat → Nat} {K : Array Nat} {j : Nat} (hj : j < K.size) : (K.map f).getD j 0 = f (K.getD j 0) := by
  simp [Array.getD, hj]

/-- **the cached interface is the chunked interface** -/
theorem rowCached_eq (chunkA chunkB : Nat → Nat) (nA nB : Nat) (K : Array Nat) :
    rowCached chunkA chunkB nA nB K (K.map (fetch chunkA chunkB)) = entryOf chunkA chunkB nA nB := by
  funext i
  have hc : ∀ key, (if findIdx K key < K.size ∧ K.getD (findIdx K key) 0 = key then
      (K.map (fetch chunkA chunkB)).getD (findIdx K key) 0 else fetch chunkA chunkB key) = fetch chunkA chunkB key := by
    intro key
    split
    · rename_i h; rw [getD_map_lt h.1, h.2]
    · rfl
  unfold rowCached
  simp only [hc]
  unfold entryOf rowKey rowOff fetch
  by_cases h1 : i < nA
  · have h2 : i < nA + nB := by omega
    simp only [h1, h2, if_true]
    have e1 : 2 * (i / 64) % 2 = 0 := by omega
    have e2 : 2 * (i / 64) / 2 = i / 64 := by omega
    simp only [e1, e2, if_true]
  · simp only [h1, if_false]
    by_cases h2 : i < nA + nB
    · simp only [h2, if_true]
      have e1 : (2 * ((i - nA) / 64) + 1) % 2 = 1 := by omega
      have e2 : (2 * ((i - nA) / 64) + 1) / 2 = (i - nA) / 64 := by omega
      simp only [e1, e2]
      rfl
    · simp only [h2, if_false]

/-- the cache keys an item's table needs (`itemR3`'s cited ids, inside the two tables) -/
def itemKeys (nA nB : Nat) (b : ByteArray) : Array Nat :=
  match segParse b with
  | none => #[]
  | some s =>
    match (if s.kind == 3 then R3.decodeRange {} s.bytes s.pre.size s.pre.back! s.p else R3.decode {} s.bytes) with
    | none => #[]
    | some t => (sortDedup (citedT t #[] ++ s.wit)).filterMap fun i => if i < nA + nB then some (rowKey nA i) else none

/-- every chunk of tables A (`nA` rows) and B (`nB` rows) as 520 limbs (64 entries of 520 bits: label mask, then the cap in bits
511-519) -/
def chunkLimbs (chunkA chunkB : Nat → Nat) (nA nB : Nat) : Array (Array UInt64) :=
  ((Array.range ((nA + 63) / 64)).map fun k => limbsOfNat (chunkA k) 520) ++
    ((Array.range ((nB + 63) / 64)).map fun k => limbsOfNat (chunkB k) 520)

/-- **the rows full at a prefix** `S0` (8 limbs), from the chunk limbs `L` (`chunkLimbs`): every row with `|row ∩ S0| = cap ≥ 1`.
An untrusted witness generator (`rootFrameN` re-checks each proposed row); used only for dead job roots. -/
def scanLimbs (L : Array (Array UInt64)) (nA nB : Nat) (S0 : Array UInt64) : Array Nat := Id.run do
  let cA := (nA + 63) / 64
  let mut out : Array Nat := #[]
  for t in [0:2] do
    let n := if t == 0 then nA else nB
    let base := if t == 0 then 0 else nA
    for k in [0:(n + 63) / 64] do
      let ls := L.getD (if t == 0 then k else cA + k) #[]
      for j in [0:64] do
        let i := 64 * k + j
        if i < n then
          let q := (520 * j) / 64
          let r := ((520 * j) % 64).toUInt64
          let w := fun (m : Nat) =>
            let lo := ls.getD (q + m) 0
            if r == 0 then lo else (lo >>> r) ||| (ls.getD (q + m + 1) 0 <<< (64 - r))
          let mut pc := 0
          for m in [0:8] do
            let wm := if m == 7 then w m &&& 0x7FFFFFFFFFFFFFFF else w m
            pc := pc + pop64 (wm &&& S0.getD m 0)
          let cap := (((w 7 >>> 63) ||| (w 8 <<< 1)) &&& 0x1FF).toNat
          if 1 ≤ cap && pc == cap then out := out.push (base + i)
  return out

/-- the rows full at `S0`, fetching every chunk (uncached form) -/
def scanRows (chunkA chunkB : Nat → Nat) (nA nB : Nat) (S0 : Array UInt64) : Array Nat :=
  scanLimbs (chunkLimbs chunkA chunkB nA nB) nA nB S0

/-- every key with its item bytes -/
def batchB (S : IStat) (rowE : Nat → Nat) (scan : Array UInt64 → Array Nat) (c : Cfg) : List Nat → List ByteArray → Bool
  | [], [] => true
  | k :: ks, b :: bs => itemR3 S rowE scan c (deadR3 S c) k b && batchB S rowE scan c ks bs
  | _, _ => false

/-- **a batch through one chunk cache** (items as `R22N.Bin7` strings; `scan` for dead job roots) -/
def batchCached (S : IStat) (chunkA chunkB : Nat → Nat) (nA nB : Nat) (scan : Array UInt64 → Array Nat) (c : Cfg)
    (ks : List Nat) (ss : List String) : Bool :=
  let bs := ss.map R22N.Bin7.decode
  let K := sortDedup (bs.foldl (fun acc b => acc ++ itemKeys nA nB b) #[])
  batchB S (rowCached chunkA chunkB nA nB K (K.map (fetch chunkA chunkB))) scan c ks bs

theorem batchB_sound (S : IStat) (rowE : Nat → Nat) (scan : Array UInt64 → Array Nat) (c : Cfg) :
    ∀ (ks : List Nat) (ss : List String), batchB S rowE scan c ks (ss.map R22N.Bin7.decode) = true →
      R22N.KeysOK (fun k => ∃ s, itemR3 S rowE scan c (deadR3 S c) k (R22N.Bin7.decode s) = true) ks
  | [], [], _ => trivial
  | k :: ks, s :: ss, h => by
    simp only [List.map, batchB, Bool.and_eq_true] at h
    exact ⟨⟨s, h.1⟩, batchB_sound S rowE scan c ks ss h.2⟩
  | [], _ :: _, h => by simp [List.map, batchB] at h
  | _ :: _, [], h => by simp [List.map, batchB] at h

/-- **soundness of the cached batch**: the items are accepted by the plain item check at `rowE = entryOf chunkA chunkB nA nB` -/
theorem batchCached_sound (S : IStat) (chunkA chunkB : Nat → Nat) (nA nB : Nat) (scan : Array UInt64 → Array Nat)
    (rowE : Nat → Nat) (hrow : entryOf chunkA chunkB nA nB = rowE) (c : Cfg) (ks : List Nat) (ss : List String)
    (h : batchCached S chunkA chunkB nA nB scan c ks ss = true) :
    R22N.KeysOK (fun k => ∃ s, itemR3 S rowE scan c (deadR3 S c) k (R22N.Bin7.decode s) = true) ks := by
  unfold batchCached at h
  simp only [rowCached_eq, hrow] at h
  exact batchB_sound S rowE scan c ks ss h

end NN
