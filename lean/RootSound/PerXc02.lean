module
public import R22Port.U_d41d8cd98f00
public import RootSound.PerX
/-! Per-functional facts for `X / 16 = 2` (kernel check). -/
@[expose] public section
namespace RootSound
set_option maxHeartbeats 0
theorem perX_c02 : ∀ X : Fin 512, X.val / 16 = 2 → X.val ≠ 0 → PerXFacts X.val := by decide +kernel
end RootSound
