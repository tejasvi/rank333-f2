module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # Per-IP facts of `ptc` (decide): the group, 1152 elements padded with element 0 to 2048 -/
namespace E1P.OK_ptc
open E1PS E1P.IP_ptc
theorem pad : ∀ g < 2048, 1152 ≤ g → GP g = GP 0 ∧ ge g = ge 0 := by decide +kernel
theorem gl : ∀ g < 1152, C3.isGL (ge g).2.1 = true ∧ C3.isGL (ge g).2.2 = true := by decide +kernel
theorem fixE_0 : ∀ g < 128, 0 ≤ g → ∀ a < 512, Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 a) = Em.testBit a := by decide +kernel
theorem labs_0 : ∀ g < 128, 0 ≤ g → ∀ l < N, gpf (GP g) l < N ∧
    Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 (vt VT l) ^^^ vt VT (gpf (GP g) l)) = true := by
  unfold gpf vt; decide +kernel
theorem fixE_128 : ∀ g < 256, 128 ≤ g → ∀ a < 512, Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 a) = Em.testBit a := by decide +kernel
theorem labs_128 : ∀ g < 256, 128 ≤ g → ∀ l < N, gpf (GP g) l < N ∧
    Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 (vt VT l) ^^^ vt VT (gpf (GP g) l)) = true := by
  unfold gpf vt; decide +kernel
theorem fixE_256 : ∀ g < 384, 256 ≤ g → ∀ a < 512, Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 a) = Em.testBit a := by decide +kernel
theorem labs_256 : ∀ g < 384, 256 ≤ g → ∀ l < N, gpf (GP g) l < N ∧
    Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 (vt VT l) ^^^ vt VT (gpf (GP g) l)) = true := by
  unfold gpf vt; decide +kernel
theorem fixE_384 : ∀ g < 512, 384 ≤ g → ∀ a < 512, Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 a) = Em.testBit a := by decide +kernel
theorem labs_384 : ∀ g < 512, 384 ≤ g → ∀ l < N, gpf (GP g) l < N ∧
    Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 (vt VT l) ^^^ vt VT (gpf (GP g) l)) = true := by
  unfold gpf vt; decide +kernel
theorem fixE_512 : ∀ g < 640, 512 ≤ g → ∀ a < 512, Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 a) = Em.testBit a := by decide +kernel
theorem labs_512 : ∀ g < 640, 512 ≤ g → ∀ l < N, gpf (GP g) l < N ∧
    Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 (vt VT l) ^^^ vt VT (gpf (GP g) l)) = true := by
  unfold gpf vt; decide +kernel
theorem fixE_640 : ∀ g < 768, 640 ≤ g → ∀ a < 512, Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 a) = Em.testBit a := by decide +kernel
theorem labs_640 : ∀ g < 768, 640 ≤ g → ∀ l < N, gpf (GP g) l < N ∧
    Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 (vt VT l) ^^^ vt VT (gpf (GP g) l)) = true := by
  unfold gpf vt; decide +kernel
theorem fixE_768 : ∀ g < 896, 768 ≤ g → ∀ a < 512, Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 a) = Em.testBit a := by decide +kernel
theorem labs_768 : ∀ g < 896, 768 ≤ g → ∀ l < N, gpf (GP g) l < N ∧
    Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 (vt VT l) ^^^ vt VT (gpf (GP g) l)) = true := by
  unfold gpf vt; decide +kernel
theorem fixE_896 : ∀ g < 1024, 896 ≤ g → ∀ a < 512, Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 a) = Em.testBit a := by decide +kernel
theorem labs_896 : ∀ g < 1024, 896 ≤ g → ∀ l < N, gpf (GP g) l < N ∧
    Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 (vt VT l) ^^^ vt VT (gpf (GP g) l)) = true := by
  unfold gpf vt; decide +kernel
theorem fixE_1024 : ∀ g < 1152, 1024 ≤ g → ∀ a < 512, Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 a) = Em.testBit a := by decide +kernel
theorem labs_1024 : ∀ g < 1152, 1024 ≤ g → ∀ l < N, gpf (GP g) l < N ∧
    Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 (vt VT l) ^^^ vt VT (gpf (GP g) l)) = true := by
  unfold gpf vt; decide +kernel
theorem fixE : ∀ g < 1152, ∀ a < 512, Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 a) = Em.testBit a := by
  intro g hg
  by_cases h0 : g < 128
  · exact fixE_0 g h0 (by omega)
  by_cases h128 : g < 256
  · exact fixE_128 g h128 (by omega)
  by_cases h256 : g < 384
  · exact fixE_256 g h256 (by omega)
  by_cases h384 : g < 512
  · exact fixE_384 g h384 (by omega)
  by_cases h512 : g < 640
  · exact fixE_512 g h512 (by omega)
  by_cases h640 : g < 768
  · exact fixE_640 g h640 (by omega)
  by_cases h768 : g < 896
  · exact fixE_768 g h768 (by omega)
  by_cases h896 : g < 1024
  · exact fixE_896 g h896 (by omega)
  by_cases h1024 : g < 1152
  · exact fixE_1024 g h1024 (by omega)
  omega
theorem labs : ∀ g < 1152, ∀ l < N, gpf (GP g) l < N ∧
    Em.testBit (C3.actN (ge g).1 (ge g).2.1 (ge g).2.2 (vt VT l) ^^^ vt VT (gpf (GP g) l)) = true := by
  intro g hg
  by_cases h0 : g < 128
  · exact labs_0 g h0 (by omega)
  by_cases h128 : g < 256
  · exact labs_128 g h128 (by omega)
  by_cases h256 : g < 384
  · exact labs_256 g h256 (by omega)
  by_cases h384 : g < 512
  · exact labs_384 g h384 (by omega)
  by_cases h512 : g < 640
  · exact labs_512 g h512 (by omega)
  by_cases h640 : g < 768
  · exact labs_640 g h640 (by omega)
  by_cases h768 : g < 896
  · exact labs_768 g h768 (by omega)
  by_cases h896 : g < 1024
  · exact labs_896 g h896 (by omega)
  by_cases h1024 : g < 1152
  · exact labs_1024 g h1024 (by omega)
  omega
theorem grp : ∀ g < 2048, GElt Em VT N (GP g) (ge g).1 (ge g).2.1 (ge g).2.2 := by
  intro g hg
  by_cases h : g < 1152
  · exact ⟨(gl g h).1, (gl g h).2, fixE g h, labs g h⟩
  · obtain ⟨h1, h2⟩ := pad g hg (by omega)
    rw [h1, h2]
    exact ⟨(gl 0 (by decide)).1, (gl 0 (by decide)).2, fixE 0 (by decide), labs 0 (by decide)⟩
end E1P.OK_ptc
