module
public import R22Port.U_d41d8cd98f00
public import LG.CapT
public import HCap.OK_c422
/-! # The context-cap IP of class 422 (math2 README §5): `L479.IPG` from the decide facts of `hcap/HCap/OK_c422`

The IP is math2's `math2/pc/ipc2_422.txt` (profSe on C3eD, `E = span{1, 20, 66}`, `R = 19`, split rows dropped) with its case
row (`C 0 6 28 …`: the 28 cosets without a rank-1 point hold at most `6 = 19 - (14 - 1)` outside first factors) as the extra
slot `i2 = 2823`. Its rows pass `entryOK 19` of `RT.K3eD_Cls`, so `hclsN` is the main search's. `E` is not the class
representative `K_422 = span{1, 10, 96}`: the symmetry `(true, 161, 273)` maps `K_422` into `E` (`capG_transport`) and
`(true, 273, 161)` maps `E` into `K_422` (`factN_transport` for `E`'s base bound).

* `ipg ext`: the IP facts for every external-leaf list;
* `cap422`: `CapG K_422 19 14` (at most two first factors on `K_422` when at least 14 first factors are rank 1) from the
  enumeration (`EnumOK`), the external leaves (`LeafNoExt`), `hclsN` and RR's bound for `{0}`;
* `classFacts422`: the class facts of `CaseK 14 hi` with class 422 raised to 20. -/
@[expose] public section
namespace L479.IPC422
open E1GS E1G.IP_c422 E1G.OK_c422

theorem rk1 : rk1cnt Em = 1 := rkc

/-- **the IP facts** -/
theorem ipg (ext : List ℕ) : IPG (Cx ext) RT.K3eD_Cls.CL Em 14 LB LBR UB Ntab nrows i2 sl tab ge where
  N_le := N_le
  R_le := R_le
  R_pos := R_pos
  DOM_lt := DOM_lt
  cosets := cosets
  domperp := domperp
  planes := planes
  planesR := planesR
  sl_spec := sl_spec
  cls_lt := cls_lt
  Ntab_le := Ntab_le
  i2_lt := i2_lt
  c2 := Or.inr ⟨by show R + rk1cnt Em ≤ _; rw [rk1]; exact c2cap, c2rev, c2lt, c2mask⟩
  sl_zero := sl_zero
  capslot := capslot
  grp := grp

theorem mapK : HC.mapsTo true 161 273 Em (RT.kM RT.K3eD_Cls.CL 422) = true := by decide +kernel
theorem mapE : HC.mapsTo true 273 161 (RT.kM RT.K3eD_Cls.CL 422) Em = true := by decide +kernel

/-- **the context cap of class 422** from the enumeration and the leaf refutations -/
theorem cap422 (ext : List ℕ) (henum : EnumOK (Cx ext) sl UB) (hext : ∀ pl ∈ ext, LeafNoExt (Cx ext) Em 14 pl)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c))
    (h495 : RT.Fact (RT.kM RT.K3eD_Cls.CL 495) 22) : CapG (RT.kM RT.K3eD_Cls.CL 422) 19 14 := by
  have hb : RT.FactN 22 Em (Cx ext).R := by
    show RT.FactN 22 Em R
    rw [show R = RT.cLB RT.K3eD_Cls.CL 422 by decide +kernel]
    exact factN_transport (by decide) (by decide) mapE (hclsN 422 (by decide))
  have h := capG_of (Cx ext) RT.K3eD_Cls.CL Em 14 LB LBR UB Ntab nrows i2 sl tab ge (ipg ext) henum hext hclsN hb h495
  exact capG_transport (by decide) (by decide) mapK h

/-- **the class facts of `CaseK 14 hi` with class 422 at 20** -/
theorem classFacts422 (hi : ℕ) (hcap : CapG (RT.kM RT.K3eD_Cls.CL 422) 19 14)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)) :
    R3RT.SpecO.ClassFactsC (R3RT.SpecO.CaseK 14 hi) (cLBG 422 19) :=
  classFactsG_of 422 19 14 hi hcap hclsN

end L479.IPC422

#print axioms L479.IPC422.ipg
#print axioms L479.IPC422.cap422
