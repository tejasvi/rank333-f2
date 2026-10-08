module
public import R22Port.U_2922d9433d0e
public import XTP.R3
public import XT.Cut
/-! # XTP.Cut: soundness of the node-cut check (`XT.checkCut`)

Acceptance gives a hybrid record with the single child `u` on which `KD.xpartC` holds; with `KD.xpartC_sound` (any universe `Ω`) and
`XTP.kidLabels_eq` the cut node is dead: `∀ A, Ω A → ¬ Continues A S' last u`. -/
@[expose] public section
namespace XTP

theorem checkCut_sound (S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : ℕ) (dict : Array UInt64)
    (c2t : Array (Array UInt64)) (npW : Array XT.W8) (u : ℕ) (nd ce : ByteArray) (pos expos : Array ℕ)
    (h : XT.checkCut S D N U du last b1 m e1 dict (XT.prepC2 c2t) npW u nd ce pos expos = true) :
    ∃ x, (XT.kidLabels x).toList = [u] ∧
      KD.xpartC (npV npW) (NN.natL S 0 8) (NN.natL D 0 8) (NN.natL N 0 4096) (NN.natU U) du last b1 m e1 (NN.rowV dict)
        (nrowsV x) (aggsV c2t (NN.rowV dict) x) (XLV x) (HPV x) (DEFPV x) (JV x) (kidsV c2t x) = true := by
  unfold XT.checkCut at h
  cases hp : XT.parseCut npW nd ce pos expos U du with
  | none => simp only [hp] at h; cases h
  | some x =>
    simp only [hp] at h
    cases hq : XT.prep D N U du last b1 m e1 dict (XT.prepC2 c2t) npW x with
    | none => simp only [hq] at h; cases h
    | some nc =>
      simp only [hq, Bool.and_eq_true, bne_iff_ne, ne_eq] at h
      obtain ⟨⟨hlay, hlab⟩, hc⟩ := h
      have hl : XT.kidLabels (XT.fixFu nc x) = #[u] := by simpa using hlab
      exact ⟨XT.fixFu nc x, by rw [hl], checkT_sound S D N U du last b1 m e1 dict c2t npW _ hlay hc⟩

end XTP
