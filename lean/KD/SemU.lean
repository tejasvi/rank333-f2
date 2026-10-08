module
public import R22Port.U_d41d8cd98f00
public import KD.Count
public import R3RT.SpecO
/-! # KD.SemU: the row, frame and kill semantics of spec revision 6a over a label order `O` and a universe `Ω`

`FrameOKO O Ω` etc. are `R3RT.SpecO`'s; the `…U` names are the `LO123` instances (revision 6a's `Has` / `Below` / `Continues` /
`packU` at `LO123` are revision 5's by `Iff.rfl` / `rfl`).  `…_of5`: revision 5's facts give the instances at the trivial
universe `ΩT` (SpecO's `*_123` bridges), so every `…U` theorem specializes to its revision-5 statement. -/
@[expose] public section
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical

abbrev FrameOKO (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) := R3RT.SpecO.FrameOK O Ω
abbrev C2OKO (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) := R3RT.SpecO.C2OK O Ω
abbrev RowOKO (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) := R3RT.SpecO.RowOK O Ω
abbrev TabOKO (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) := R3RT.SpecO.TabOK O Ω
abbrev KillsOKO (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) := R3RT.SpecO.KillsOK O Ω
abbrev FrameOKU (Ω : Dec22 → Prop) := FrameOKO R3RT.SpecO.LO123 Ω
abbrev C2OKU (Ω : Dec22 → Prop) := C2OKO R3RT.SpecO.LO123 Ω
abbrev RowOKU (Ω : Dec22 → Prop) := RowOKO R3RT.SpecO.LO123 Ω
abbrev TabOKU (Ω : Dec22 → Prop) := TabOKO R3RT.SpecO.LO123 Ω
abbrev KillsOKU (Ω : Dec22 → Prop) := KillsOKO R3RT.SpecO.LO123 Ω

theorem rowOKO_apply {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {m cap : ℕ} (h : RowOKO O Ω m cap) (A : Dec22) (hA : Ω A) :
    (R3RT.SpecO.inMask O A m).card ≤ cap :=
  h A hA

theorem frameOKO_apply {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {S D N U d : ℕ} (h : FrameOKO O Ω S D N U d) (A : Dec22)
    (hA : Ω A) (hB : R3RT.SpecO.Below O A S (lastOf S)) :
    (∀ l, lastOf S < l → l < 511 → D.testBit l = true → ¬ R3RT.SpecO.Has O A l) ∧
    (∀ v w, v < 511 → w < 511 → S.testBit v = false → S.testBit w = false → v ≠ w →
      (N >>> (512 * v)).testBit w = true → R3RT.SpecO.Has O A v → ¬ R3RT.SpecO.Has O A w) :=
  h.2.2.2.2 A hA hB

theorem frameOKO_basic {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {S D N U d : ℕ} (h : FrameOKO O Ω S D N U d) :
    0 < S ∧ S < 2 ^ 511 ∧ ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d ∧ U = R3RT.SpecO.packU O S :=
  ⟨h.1, h.2.1, h.2.2.1, h.2.2.2.1⟩

theorem rowOKU_apply {Ω : Dec22 → Prop} {m cap : ℕ} (h : RowOKU Ω m cap) (A : Dec22) (hA : Ω A) : (inMask A m).card ≤ cap :=
  h A hA

theorem frameOKU_apply {Ω : Dec22 → Prop} {S D N U d : ℕ} (h : FrameOKU Ω S D N U d) (A : Dec22) (hA : Ω A)
    (hB : Below A S (lastOf S)) :
    (∀ l, lastOf S < l → l < 511 → D.testBit l = true → ¬ A.Has l) ∧
    (∀ v w, v < 511 → w < 511 → S.testBit v = false → S.testBit w = false → v ≠ w →
      (N >>> (512 * v)).testBit w = true → A.Has v → ¬ A.Has w) :=
  h.2.2.2.2 A hA hB

theorem frameOKU_basic {Ω : Dec22 → Prop} {S D N U d : ℕ} (h : FrameOKU Ω S D N U d) :
    0 < S ∧ S < 2 ^ 511 ∧ ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d ∧ U = packU S :=
  ⟨h.1, h.2.1, h.2.2.1, h.2.2.2.1⟩


/-- revision 5's frame is the `LO123` frame at the trivial universe -/
theorem frameOKU_of5 {S D N U d : ℕ} (h : FrameOK S D N U d) : FrameOKU R3RT.SpecO.ΩT S D N U d :=
  (R3RT.SpecO.frameOK_123 S D N U d).mpr h

theorem rowOKU_of5 {m cap : ℕ} (h : RowOK m cap) : RowOKU R3RT.SpecO.ΩT m cap := (R3RT.SpecO.rowOK_123 m cap).mpr h

theorem c2OKU_of5 {l c2 : ℕ} (h : C2OK l c2) : C2OKU R3RT.SpecO.ΩT l c2 := (R3RT.SpecO.c2OK_123 l c2).mpr h

theorem tabOKU_of5 {tab : ℕ → ℕ} (h : TabOK tab) : TabOKU R3RT.SpecO.ΩT tab := (R3RT.SpecO.tabOK_123 tab).mpr h

end KD
