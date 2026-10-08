module
public import R22Port.U_d41d8cd98f00
public import HCap.R473_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R473
open E1GS
theorem okB0 : blkChk E1G.IP_h473.C (E1G.slc E1G.SL_h473.chunk) E1G.IP_h473.UB E1G.IP_h473.UBR lits 0 16 = true := by decide +kernel
end E1G.R473
