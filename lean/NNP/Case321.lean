module
public import R22Port.U_d41d8cd98f00
public import NNP.CaseII
public import KD321.Canon
/-! # NNP.Case321: the per-item theorems of cases (I) and (I13) (`--rord 321`, `Top321.O`)

**`item321_sound`**: an accepted `NN.itemR3 S rowE scan c (deadR3 S c) key b` with the configuration `cfgI` (window `[0, 12]`) or `cfgI13`
(`[13, 13]`) — rank-1 labels `462..510`, no TYPE records — gives a segment with the key's interface, certified
(`SegOKO Top321.O (CaseK lo hi)`) under the facts `H`.  The frames' universe is every decomposition (`ΩT`: the case-(I) runs use
the full table `tab_C3eD`, whose rows hold by revision 5's `ClassFacts`).  `H` must give the table facts (`TabFacts321`) and nonzero
`b`, `c`; the X tier's mask table `npW` must satisfy `KD.NpOK Top321.O (XTP.npV npW)`.  These are `hsegI` / `hsegI13` of
`Top.rank_ge_23_L479` (through the same `Seg` / `SegOKO` copies as case (II)). -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Classical

/-! ## The order facts of `--rord 321` -/

theorem lo321_key (l : ℕ) (hl : l < 511) : Top321.O.key (Top321.O.vec l) = l + 1 := by
  rw [KD321.labO321.key_eq, KD321.C3T.keyT_lt (Top321.O.vec_lt l hl), KD321.labO321.lab_vec l hl]

theorem lo321_r1 (l : ℕ) (hl : l < 511) : Top321.O.rk l = 1 ↔ 462 ≤ l ∧ l < 511 := by
  rw [KD321.rk1_321]; omega

/-- the table facts of cases (I) / (I13) -/
structure TabFacts321 (S : IStat) (rowE : ℕ → ℕ) : Prop where
  c1 : Conf1OK Top321.O ΩT (natL S.st.conf1 0 4096)
  c2 : ∀ l, l < 511 → C2OK Top321.O ΩT l (c2tV S.st l)
  h : ∀ l, l < 511 → HOK Top321.O l (hV S.st l)
  ks : KStatOK Top321.O S.ks
  gl : ∀ P, P < 512 → S.ks.gl.get! P = 1 → C3.isGL P = true
  row : ∀ i, RowOK Top321.O ΩT (rowE i % 2 ^ 511) ((rowE i >>> 511) % 512)

/-- **the per-item theorem of cases (I) / (I13)** (`c = cfgI` or `cfgI13`) -/
theorem item321_sound (c : Cfg) (hc : c.r1lo = 462 ∧ c.r1hi = 511 ∧ c.ty = false)
    (S : IStat) (rowE : ℕ → ℕ) (scan : Array UInt64 → Array ℕ) (key : ℕ) (b : ByteArray) (H : Prop)
    (hstat : H → TabFacts321 S rowE) (hnz : H → ∀ A : R3RT.Spec.Dec22, ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0)
    (hsz : S.st.c2t.size = 511) (hc2W : S.c2W = XT.prepC2 S.st.c2t) (hnp : KD.NpOK Top321.O (XTP.npV S.npW))
    (h : itemR3 S rowE scan c (deadR3 S c) key b = true) :
    ∃ g : Seg, g.root = (R22N.SegI.ofKey key).root ∧ g.lo = (R22N.SegI.ofKey key).lo ∧
      g.ext = {e | e ∈ (R22N.SegI.ofKey key).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey key).rng} ∧
      (H → SegOKO Top321.O (CaseK c.lo c.hi) g) := by
  obtain ⟨h1, h2, h3⟩ := hc
  have hR1 : ∀ l, l < 511 → (Top321.O.rk l = 1 ↔ c.r1lo ≤ l ∧ l < c.r1hi) := by
    intro l hl; rw [h1, h2]; exact lo321_r1 l hl
  have hr1hi : c.r1hi ≤ 511 := by rw [h2]
  refine itemR3_sound (O := Top321.O) (Ω := ΩT) (C := CaseK c.lo c.hi) S rowE scan c (deadR3 S c) key b H
    (fun hH => let t := hstat hH
      ⟨t.c1, t.c2, t.h, t.ks, t.gl, lo321_key, hR1, hr1hi, fun hty => by rw [h3] at hty; exact absurd hty (by decide),
        t.row⟩)
    (fun hH tab => xBridge S.st hsz (hstat hH).c2 tab S.c2W hc2W S.npW hnp)
    (fun hH ids lm tab hT hW => deadR3_sound S c ids lm tab hT hW (hstat hH).c2 (hstat hH).h (hstat hH).ks hR1 hr1hi
      (fun fr lab blob hI hl A _ _ hB => leaf0OK_soundO S.ks (hstat hH).ks.vec hI lab blob hl A (hnz hH A) hB)
      (fun fr u last b1 m ids' nd ce pos expos hI hc' hs hd hm =>
        cutBridge S.st hsz (hstat hH).c2 tab S.c2W hc2W S.npW hnp fr u last b1 m ids' nd ce pos expos hI hc' hs hd hm)
      (fun _ _ => trivial) (fun _ h => h) (fun A _ => hnz hH A))
    (fun _ _ => trivial) (fun _ h => h) h

/-- case (I) -/
theorem itemI_sound (S : IStat) (rowE : ℕ → ℕ) (scan : Array UInt64 → Array ℕ) (key : ℕ) (b : ByteArray) (H : Prop)
    (hstat : H → TabFacts321 S rowE) (hnz : H → ∀ A : R3RT.Spec.Dec22, ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0)
    (hsz : S.st.c2t.size = 511) (hc2W : S.c2W = XT.prepC2 S.st.c2t) (hnp : KD.NpOK Top321.O (XTP.npV S.npW))
    (h : itemR3 S rowE scan cfgI (deadR3 S cfgI) key b = true) :
    ∃ g : Seg, g.root = (R22N.SegI.ofKey key).root ∧ g.lo = (R22N.SegI.ofKey key).lo ∧
      g.ext = {e | e ∈ (R22N.SegI.ofKey key).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey key).rng} ∧
      (H → SegOKO Top321.O (CaseK 0 12) g) :=
  item321_sound cfgI ⟨rfl, rfl, rfl⟩ S rowE scan key b H hstat hnz hsz hc2W hnp h

/-- case (I13) -/
theorem itemI13_sound (S : IStat) (rowE : ℕ → ℕ) (scan : Array UInt64 → Array ℕ) (key : ℕ) (b : ByteArray) (H : Prop)
    (hstat : H → TabFacts321 S rowE) (hnz : H → ∀ A : R3RT.Spec.Dec22, ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0)
    (hsz : S.st.c2t.size = 511) (hc2W : S.c2W = XT.prepC2 S.st.c2t) (hnp : KD.NpOK Top321.O (XTP.npV S.npW))
    (h : itemR3 S rowE scan cfgI13 (deadR3 S cfgI13) key b = true) :
    ∃ g : Seg, g.root = (R22N.SegI.ofKey key).root ∧ g.lo = (R22N.SegI.ofKey key).lo ∧
      g.ext = {e | e ∈ (R22N.SegI.ofKey key).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey key).rng} ∧
      (H → SegOKO Top321.O (CaseK 13 13) g) :=
  item321_sound cfgI13 ⟨rfl, rfl, rfl⟩ S rowE scan key b H hstat hnz hsz hc2W hnp h

end NNP
