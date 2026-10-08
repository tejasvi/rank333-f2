module
public import R22Port.U_d41d8cd98f00
public import S5.Base
/-! # `nperp v` has bit `w` iff `w · v = 1` (all `v, w < 512`), checked by the kernel -/
@[expose] public section
namespace S5
open BC4 BC5

theorem nperp_fact : allLT 512 (fun v => allLT 512 (fun w => (nperp v).testBit w == par (w &&& v))) = true := by
  decide +kernel

end S5
