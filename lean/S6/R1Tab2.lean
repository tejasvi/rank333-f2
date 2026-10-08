module
public import R22Port.U_d41d8cd98f00
public import S6.R1Def
@[expose] public section
namespace S6
open BC4 BC5 BC6 BC6s S5
theorem root6_fact2 : allFrom 256 128 (fun X => allLT 512 (root6OK X)) = true := by decide +kernel
end S6
