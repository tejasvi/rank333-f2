module
public import R22Port.U_a77986377abf
public import XTP.Sound
public import XTP.Thread
public import XT.R3
/-! # XTP.R3: soundness of the parsing front ends (`XT.checkR3`, `XT.checkItems`)

Both decode with an unverified parser and then run `XT.checkT` (= `XT.check`, `XTP.checkT_eq`); acceptance gives the decoded record
and `KD.xpartC` on its views (`XTP.check_sound`), so the composition can apply `KD.batchX_sound`'s X conjunct to the record the
parser produced. -/
@[expose] public section
namespace XTP

/-- **the production checker**: `checkT` accepts ⇒ `KD.xpartC` on the views -/
theorem checkT_sound (S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : ℕ) (dict : Array UInt64)
    (c2t : Array (Array UInt64)) (npW : Array XT.W8) (x : XT.XRec) (hlay : x.lay ≠ 1)
    (h : XT.checkT S D N U du last b1 m e1 dict (XT.prepC2 c2t) npW x = true) :
    KD.xpartC (npV npW) (NN.natL S 0 8) (NN.natL D 0 8) (NN.natL N 0 4096) (NN.natU U) du last b1 m e1 (NN.rowV dict)
      (nrowsV x) (aggsV c2t (NN.rowV dict) x) (XLV x) (HPV x) (DEFPV x) (JV x) (kidsV c2t x) = true := by
  rw [checkT_eq] at h
  exact check_sound S D N U du last b1 m e1 dict c2t npW x hlay h

/-- **R3 front end**: acceptance gives the parsed record, its children's labels (= the X records' labels, the coverage), and
`KD.xpartC` on its views -/
theorem checkR3_sound (S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : ℕ) (dict : Array UInt64)
    (c2t : Array (Array UInt64)) (npW : Array XT.W8) (xpn : ByteArray) (xs : Array (ℕ × ℕ × ℕ × ByteArray)) (pos : Array ℕ)
    (h : XT.checkR3 S D N U du last b1 m e1 dict (XT.prepC2 c2t) npW xpn xs pos = true) :
    ∃ x, XT.parseR3 npW xpn xs pos U du = some x ∧ (XT.kidLabels x).toList = xs.toList.map (·.1) ∧
      KD.xpartC (npV npW) (NN.natL S 0 8) (NN.natL D 0 8) (NN.natL N 0 4096) (NN.natU U) du last b1 m e1 (NN.rowV dict)
        (nrowsV x) (aggsV c2t (NN.rowV dict) x) (XLV x) (HPV x) (DEFPV x) (JV x) (kidsV c2t x) = true := by
  unfold XT.checkR3 at h
  split at h
  · rename_i x hx
    rw [Bool.and_eq_true, Bool.and_eq_true, bne_iff_ne, ne_eq] at h
    obtain ⟨⟨hlay, hlab⟩, hc⟩ := h
    have hl : XT.kidLabels x = xs.map (·.1) := by simpa using hlab
    refine ⟨x, hx, ?_, checkT_sound S D N U du last b1 m e1 dict c2t npW x hlay hc⟩
    rw [hl, Array.toList_map]
  · cases h

theorem checkItems_sound (S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : ℕ) (dict : Array UInt64)
    (c2t : Array (Array UInt64)) (npW : Array XT.W8) (lay : ℕ) (b : ByteArray) (o : ℕ)
    (h : XT.checkItems S D N U du last b1 m e1 dict (XT.prepC2 c2t) npW lay b o = true) :
    ∃ x o', XT.parse lay b o = some (x, o') ∧
      KD.xpartC (npV npW) (NN.natL S 0 8) (NN.natL D 0 8) (NN.natL N 0 4096) (NN.natU U) du last b1 m e1 (NN.rowV dict)
        (nrowsV x) (aggsV c2t (NN.rowV dict) x) (XLV x) (HPV x) (DEFPV x) (JV x) (kidsV c2t x) = true := by
  unfold XT.checkItems at h
  split at h
  · rename_i x o' hx
    rw [Bool.and_eq_true, bne_iff_ne, ne_eq] at h
    exact ⟨x, o', hx, checkT_sound S D N U du last b1 m e1 dict c2t npW x h.1 h.2⟩
  · cases h

end XTP
