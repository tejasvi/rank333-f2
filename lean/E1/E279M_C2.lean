module
public import R22Port.U_d41d8cd98f00
public import E1.E279M_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.E279M
theorem ok2 : E1S.extChk E1.IP_e279.C 18 lits 2 1 = true := by decide +kernel
end E1.E279M
