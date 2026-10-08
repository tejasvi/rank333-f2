module
public import R22Port.U_d41d8cd98f00
public import S5.Base
/-! # The packed `T(X)` tables, checked by the kernel: column `z` of `T(X)` (`txc18`), row `y` (`txr18`) -/
@[expose] public section
namespace S5
open BC4 BC5

/-- bit `i = 18z + y` of `txc18 X`: entry `(y, z)` of `T(X)` -/
def txcSpec (X i : Nat) : Bool :=
  decide (i % 18 < 9) && decide (i % 18 % 3 = i / 18 / 3) && X.testBit (3 * (i / 18 % 3) + i % 18 / 3)
/-- bit `i = 18y + z` of `txr18 X`: entry `(y, z)` of `T(X)` -/
def txrSpec (X i : Nat) : Bool :=
  decide (i % 18 < 9) && decide (i / 18 % 3 = i % 18 / 3) && X.testBit (3 * (i % 18 % 3) + i / 18 / 3)

theorem txc_fact : allLT 512 (fun X => allLT 162 (fun i => (txc18 X).testBit i == txcSpec X i)) = true := by
  decide +kernel
theorem txr_fact : allLT 512 (fun X => allLT 162 (fun i => (txr18 X).testBit i == txrSpec X i)) = true := by
  decide +kernel

end S5
