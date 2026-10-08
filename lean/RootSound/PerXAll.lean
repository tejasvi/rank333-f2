module
public import R22Port.U_d41d8cd98f00
public import RootSound.PerX
public import RootSound.PerXc00
public import RootSound.PerXc01
public import RootSound.PerXc02
public import RootSound.PerXc03
public import RootSound.PerXc04
public import RootSound.PerXc05
public import RootSound.PerXc06
public import RootSound.PerXc07
public import RootSound.PerXc08
public import RootSound.PerXc09
public import RootSound.PerXc10
public import RootSound.PerXc11
public import RootSound.PerXc12
public import RootSound.PerXc13
public import RootSound.PerXc14
public import RootSound.PerXc15
public import RootSound.PerXc16
public import RootSound.PerXc17
public import RootSound.PerXc18
public import RootSound.PerXc19
public import RootSound.PerXc20
public import RootSound.PerXc21
public import RootSound.PerXc22
public import RootSound.PerXc23
public import RootSound.PerXc24
public import RootSound.PerXc25
public import RootSound.PerXc26
public import RootSound.PerXc27
public import RootSound.PerXc28
public import RootSound.PerXc29
public import RootSound.PerXc30
public import RootSound.PerXc31
/-! The per-functional facts for every `X ≠ 0`. -/
@[expose] public section
namespace RootSound
theorem perX_all (X : Nat) (hX : X < 512) (h0 : X ≠ 0) : PerXFacts X := by
  have hk : X / 16 < 32 := by omega
  let Y : Fin 512 := ⟨X, hX⟩
  have : Y.val = X := rfl
  rcases (show ∃ k, k < 32 ∧ X / 16 = k from ⟨_, hk, rfl⟩) with ⟨k, hk, hkX⟩
  interval_cases k
  · exact perX_c00 Y hkX h0
  · exact perX_c01 Y hkX h0
  · exact perX_c02 Y hkX h0
  · exact perX_c03 Y hkX h0
  · exact perX_c04 Y hkX h0
  · exact perX_c05 Y hkX h0
  · exact perX_c06 Y hkX h0
  · exact perX_c07 Y hkX h0
  · exact perX_c08 Y hkX h0
  · exact perX_c09 Y hkX h0
  · exact perX_c10 Y hkX h0
  · exact perX_c11 Y hkX h0
  · exact perX_c12 Y hkX h0
  · exact perX_c13 Y hkX h0
  · exact perX_c14 Y hkX h0
  · exact perX_c15 Y hkX h0
  · exact perX_c16 Y hkX h0
  · exact perX_c17 Y hkX h0
  · exact perX_c18 Y hkX h0
  · exact perX_c19 Y hkX h0
  · exact perX_c20 Y hkX h0
  · exact perX_c21 Y hkX h0
  · exact perX_c22 Y hkX h0
  · exact perX_c23 Y hkX h0
  · exact perX_c24 Y hkX h0
  · exact perX_c25 Y hkX h0
  · exact perX_c26 Y hkX h0
  · exact perX_c27 Y hkX h0
  · exact perX_c28 Y hkX h0
  · exact perX_c29 Y hkX h0
  · exact perX_c30 Y hkX h0
  · exact perX_c31 Y hkX h0
end RootSound
