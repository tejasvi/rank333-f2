module
public import R22Port.U_d41d8cd98f00
public import S5.Base
/-! # Finite-domain table facts, checked by the kernel -/
@[expose] public section
namespace S5
open BC4 BC5

theorem par_fact : allLT 512 (fun v => par v == xorBits v 9) = true := by decide +kernel
theorem pop11_fact : allLT 2048 (fun x => pop11 x == cntB x 11) = true := by decide +kernel
theorem lg2_fact : allLT 512 (fun k => lg2 (2 ^ k) == k) = true := by decide +kernel
theorem gcore_fact : allLT 512 (fun k => gcore (spr18 k) == k) = true := by decide +kernel

end S5
