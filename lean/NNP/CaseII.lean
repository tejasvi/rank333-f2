module
public import R22Port.U_9ca2afdeab08
public import NNP.Flook
public import NNP.XBridge
public import NNP.Leaf0
public import NN.Stat
/-! # NNP.CaseII: the per-item theorem of case (II) (L479, `--rord 123`, `Ω = C = CaseK 14 22`)

**`itemII_sound`**: an accepted `NN.itemR3 S rowE 14 22 (deadR3 S) key b` gives a segment with exactly the key's interface, certified
(`SegOKO LO123 (CaseK 14 22)`) under the facts `H`, given that `H` provides the table facts (`TabFactsII`: cap-1 / cap-2 /
hyperplane tables, the kinds tables, the row interface), the type facts, and nonzero `b`, `c` factors of every decomposition
(for the v7 leaf records; the glue's `Top.dec22_bc HC.rr_all`).  This is infra's `SegRefH` shape (PROOF_OBJECT.md
§3.2a) with this file's copies `Seg` / `SegOKO` of `Top.Seg` / `Top.SegOKO` (identical definitions). -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Classical

/-! ## The order facts of `--rord 123` -/

theorem lo123_key (l : ℕ) (hl : l < 511) : LO123.key (LO123.vec l) = l + 1 := by
  show C3.labK (R3RT.vecL l) = l + 1
  rw [C3.labK_lt (R3RT.vecL_lt l), KD.labN_vecL l hl]

theorem lo123_r1 (l : ℕ) (_hl : l < 511) : LO123.rk l = 1 ↔ 0 ≤ l ∧ l < 49 := by
  show rk123 l = 1 ↔ 0 ≤ l ∧ l < 49
  unfold rk123; split_ifs <;> omega

theorem lo123_rk (l : ℕ) (_hl : l < 511) : LO123.rk l = rk123 l := rfl

/-- the table facts of case (II) -/
structure TabFactsII (Ω : R3RT.Spec.Dec22 → Prop) (S : IStat) (rowE : ℕ → ℕ) : Prop where
  c1 : Conf1OK LO123 Ω (natL S.st.conf1 0 4096)
  c2 : ∀ l, l < 511 → C2OK LO123 Ω l (c2tV S.st l)
  h : ∀ l, l < 511 → HOK LO123 l (hV S.st l)
  ks : KStatOK LO123 S.ks
  gl : ∀ P, P < 512 → S.ks.gl.get! P = 1 → C3.isGL P = true
  row : ∀ i, RowOK LO123 Ω (rowE i % 2 ^ 511) ((rowE i >>> 511) % 512)

/-- **the per-item theorem of case (II)** -/
theorem itemII_sound (S : IStat) (rowE : ℕ → ℕ) (scan : Array UInt64 → Array ℕ) (key : ℕ) (b : ByteArray) (H : Prop)
    (hstat : H → TabFactsII (CaseK 14 22) S rowE) (hTF : H → KD.TypeFacts)
    (hnz : H → ∀ A : R3RT.Spec.Dec22, ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0)
    (hsz : S.st.c2t.size = 511) (hc2W : S.c2W = XT.prepC2 S.st.c2t) (hnp : KD.NpOK LO123 (XTP.npV S.npW))
    (h : itemR3 S rowE scan cfgII (deadR3 S cfgII) key b = true) :
    ∃ g : Seg, g.root = (R22N.SegI.ofKey key).root ∧ g.lo = (R22N.SegI.ofKey key).lo ∧
      g.ext = {e | e ∈ (R22N.SegI.ofKey key).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey key).rng} ∧
      (H → SegOKO LO123 (CaseK 14 22) g) := by
  refine itemR3_sound (O := LO123) (Ω := CaseK 14 22) (C := CaseK 14 22) S rowE scan cfgII (deadR3 S cfgII) key b H
    (fun hH => let t := hstat hH
      ⟨t.c1, t.c2, t.h, t.ks, t.gl, lo123_key, lo123_r1, le_refl _ |>.trans (by decide), fun _ => ⟨lo123_rk, hTF hH⟩, t.row⟩)
    (fun hH tab => xBridge S.st hsz (hstat hH).c2 tab S.c2W hc2W S.npW hnp)
    (fun hH ids lm tab hT hW => deadR3_sound S cfgII ids lm tab hT hW (hstat hH).c2 (hstat hH).h (hstat hH).ks
      lo123_r1 (by decide)
      (fun fr lab blob hI hl A _ _ hB => leaf0OK_sound S.ks (hstat hH).ks.vec hI lab blob hl A (hnz hH A) hB)
      (fun fr u last b1 m ids' nd ce pos expos hI hc hs hd hm =>
        cutBridge S.st hsz (hstat hH).c2 tab S.c2W hc2W S.npW hnp fr u last b1 m ids' nd ce pos expos hI hc hs hd hm)
      (fun _ h => h) (fun _ h => h) (fun A _ => hnz hH A))
    (fun _ h => h) (fun _ h => h) h

end NNP
