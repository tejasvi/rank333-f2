module
/-! # R22N.Glue: the computational glue of form (B) (layer L1; native/infra, PROOF_OBJECT.md §3, §3.2a)

Core-only, module-land.  An item's **key** is a Nat encoding its segment interface (the glue agent's `Top.Seg` without the internal
OPEN/dead sets): root node, `lo`, external children, ranges.  `Cov checked` is the closure over checked item keys; aggregator
modules prove `Cov checked (r, lo)` for closed subtrees, and the non-module bridge `R22B.Segs.segs_of_cov` turns it into the glue
agent's `segs` / `SegOKO` / `GlueOK` / root hypotheses.

**Key format** (little-endian bytes of the Nat; a node `(S, last)` is 66 bytes: `S` as 64 bytes, `last` as 2):
`root (66) | lo (2) | nExt (4) | nExt × node (66) | nRng (4) | nRng × (node (66) | l (2))`.
Encoders: `native/infra/lib/py/segkey.py`; the checker verifies the data against the decoded interface (R2). -/
@[expose] public section
namespace R22N

/-- byte field `[off, off + len)` of the key -/
def byteF (k off len : Nat) : Nat := k / 2 ^ (8 * off) % 2 ^ (8 * len)

/-- the node at byte offset `off` -/
def nodeAt (k off : Nat) : Nat × Nat := (byteF k off 64, byteF k (off + 64) 2)

/-- a segment interface -/
structure SegI where
  root : Nat × Nat
  lo : Nat
  ext : List (Nat × Nat)
  rng : List ((Nat × Nat) × Nat)

/-- decode a key -/
def SegI.ofKey (k : Nat) : SegI :=
  let nE := byteF k 68 4
  let o2 := 72 + 66 * nE
  let nR := byteF k o2 4
  { root := nodeAt k 0
    lo := byteF k 66 2
    ext := (List.range nE).map (fun i => nodeAt k (72 + 66 * i))
    rng := (List.range nR).map (fun i => (nodeAt k (o2 + 4 + 68 * i), byteF k (o2 + 4 + 68 * i + 66) 2)) }

/-- a finite conjunction over a list (kernel-friendly: reduces to nested `∧`) -/
def AllL {α : Type} (P : α → Prop) : List α → Prop
  | [] => True
  | a :: l => P a ∧ AllL P l

theorem allL_mem {α : Type} {P : α → Prop} : ∀ {l : List α}, AllL P l → ∀ x ∈ l, P x
  | [], _, _, h => nomatch h
  | a :: l, h, x, hx => by
    rcases List.mem_cons.mp hx with rfl | hx
    · exact h.1
    · exact allL_mem h.2 x hx

/-- **the closure** over checked item keys: an item covers its interface `(root, lo)` once its external children (with `lo = 0`)
and its ranges are covered -/
inductive Cov (checked : Nat → Prop) : (Nat × Nat) × Nat → Prop where
  | mk (k : Nat) : checked k →
      (∀ e ∈ (SegI.ofKey k).ext, Cov checked (e, 0)) →
      (∀ p ∈ (SegI.ofKey k).rng, Cov checked p) →
      Cov checked ((SegI.ofKey k).root, (SegI.ofKey k).lo)

/-- the constructor in the form aggregators use: the children's proofs as finite conjunctions (the kernel reduces the decoded
lists to literals) -/
theorem Cov.mk' {checked : Nat → Prop} (k : Nat) (hk : checked k) (he : AllL (fun e => Cov checked (e, 0)) (SegI.ofKey k).ext)
    (hr : AllL (fun p => Cov checked p) (SegI.ofKey k).rng) : Cov checked ((SegI.ofKey k).root, (SegI.ofKey k).lo) :=
  Cov.mk k hk (allL_mem he) (allL_mem hr)

/-- one step of a `Cov` derivation (what the bridge chooses from) -/
theorem Cov.step {checked : Nat → Prop} {x : (Nat × Nat) × Nat} (h : Cov checked x) :
    ∃ k, checked k ∧ ((SegI.ofKey k).root, (SegI.ofKey k).lo) = x ∧
      (∀ e ∈ (SegI.ofKey k).ext, Cov checked (e, 0)) ∧ (∀ p ∈ (SegI.ofKey k).rng, Cov checked p) := by
  cases h with
  | mk k hk he hr => exact ⟨k, hk, rfl, he, hr⟩

/-- **soundness pattern of `Cov`**: any predicate preserved by every checked item (from its children to its interface) holds at
every covered interface.  `R22B.segs_of_cov` is the case-(II) instance in the glue agent's `Seg` form. -/
theorem cov_sound {checked : Nat → Prop} (P : (Nat × Nat) × Nat → Prop)
    (step : ∀ k, checked k → (∀ e ∈ (SegI.ofKey k).ext, P (e, 0)) → (∀ p ∈ (SegI.ofKey k).rng, P p) →
      P ((SegI.ofKey k).root, (SegI.ofKey k).lo)) :
    ∀ {x}, Cov checked x → P x := by
  intro x h
  induction h with
  | mk k hk _ _ ihe ihr => exact step k hk ihe ihr

theorem allL_append {α : Type} {P : α → Prop} : ∀ {l1 l2 : List α}, AllL P l1 → AllL P l2 → AllL P (l1 ++ l2)
  | [], _, _, h2 => h2
  | _ :: _, _, h1, h2 => ⟨h1.1, allL_append h1.2 h2⟩

/-- a table's first `N` entries are covered, from a covered key list and the table equation (the equation is proved where the
table lives: e.g. `(List.range 30557).map E1G.R479_HT.entry = L` by `decide +kernel`, non-module) -/
theorem allL_table {P : Nat → Prop} {f : Nat → Nat} {N : Nat} {L : List Nat} (hL : (List.range N).map f = L) (h : AllL P L) :
    ∀ k < N, P (f k) := by
  intro k hk
  apply allL_mem h
  rw [← hL]
  exact List.mem_map.mpr ⟨k, List.mem_range.mpr hk, rfl⟩

/-- indexed access to a chunk's facts: item `i` of a checked key list (kernel cost: one `getD` evaluation, no unification with
nested membership terms) -/
theorem allL_getD {P : Nat → Prop} : ∀ {L : List Nat} (i : Nat), AllL P L → i < L.length → P (L.getD i 0)
  | [], _, _, h => absurd h (Nat.not_lt_zero _)
  | _ :: _, 0, h, _ => h.1
  | _ :: l, i + 1, h, hi => allL_getD (L := l) i h.2 (Nat.lt_of_succ_lt_succ hi)

/-! ## The generic closure (E1 / E1P / E1G jobs and root chains: interface = start state, children = delegated jobs) -/

/-- the closure over checked keys for any interface decoder `root` and children decoder `kids` -/
inductive CovG {α : Type} (root : Nat → α) (kids : Nat → List α) (checked : Nat → Prop) : α → Prop where
  | mk (k : Nat) : checked k → (∀ c ∈ kids k, CovG root kids checked c) → CovG root kids checked (root k)

theorem CovG.mk' {α : Type} {root : Nat → α} {kids : Nat → List α} {checked : Nat → Prop} (k : Nat) (hk : checked k)
    (hc : AllL (fun c => CovG root kids checked c) (kids k)) : CovG root kids checked (root k) :=
  CovG.mk k hk (allL_mem hc)

/-- **soundness pattern of `CovG`**: e.g. `P := E1PS.JobOK C sl UB`, `step` = the E1 agent's refinement theorem
(`nE1Pjob … = true → (∀ c ∈ ext, JobOK c) → JobOK key`) -/
theorem covG_sound {α : Type} {root : Nat → α} {kids : Nat → List α} {checked : Nat → Prop} (P : α → Prop)
    (step : ∀ k, checked k → (∀ c ∈ kids k, P c) → P (root k)) : ∀ {x}, CovG root kids checked x → P x := by
  intro x h
  induction h with
  | mk k hk _ ih => exact step k hk ih

/-- the chunk statement for list-keyed batches (few items per chunk): every listed key is checked -/
def KeysOK (checked : Nat → Prop) (ks : List Nat) : Prop := AllL checked ks

/-- packed fixed-width keys (many items per chunk, e.g. E1 jobs at 192 bits): key `i` is `fld K w i` -/
def fld (K w i : Nat) : Nat := K / 2 ^ (w * i) % 2 ^ w

def AllP (checked : Nat → Prop) (w n K : Nat) : Prop := ∀ i < n, checked (fld K w i)

end R22N
