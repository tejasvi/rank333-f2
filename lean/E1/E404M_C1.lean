module
public import R22Port.U_d41d8cd98f00
public import E1.E404M_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.E404M
theorem ok1 : E1S.extChk E1.IP_e404.C 7 lits 1 1 = true := by decide +kernel
end E1.E404M
