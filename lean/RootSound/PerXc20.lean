module
public import R22Port.U_d41d8cd98f00
public import RootSound.PerX
/-! Per-functional facts for `X / 16 = 20` (kernel check). -/
@[expose] public section
namespace RootSound
set_option maxHeartbeats 0
theorem perX_c20 : ∀ X : Fin 512, X.val / 16 = 20 → X.val ≠ 0 → PerXFacts X.val := by decide +kernel
end RootSound
