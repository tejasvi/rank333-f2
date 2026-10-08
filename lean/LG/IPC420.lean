module
public import R22Port.U_d41d8cd98f00
public import LG.Gen
public import HCap.OK_c420
/-! # The context-cap IP of class 420 (math2 README §5): `L479.IPG` from the decide facts of `hcap/HCap/OK_c420`

The IP is math2's `math2/pc/ipc2_420.txt` (profSe on C3eD, `E = span{1, 10, 68} = K_420`, `R = 20`, split rows dropped) with
its case row (`C 0 7 30 …`: the 30 cosets without a rank-1 point hold at most `7 = 20 - (14 - 1)` outside first factors) as
the extra slot `i2 = 2823`. Its rows pass `entryOK 20` of `RT.K3eD_Cls`, so `hclsN` is the main search's.

* `ipg ext`: the IP facts for every external-leaf list;
* `cap420`: `CapG K_420 20 14` (at most one first factor on `K_420` when at least 14 first factors are rank 1) from the
  enumeration (`EnumOK`), the external leaves (`LeafNoExt`, e.g. `leafNoExt_of_noLiftK` / `leafNoExt_of_nd`), `hclsN` and
  RR's bound for `{0}`;
* `classFacts420`: the class facts of `CaseK 14 hi` with class 420 raised to 21. -/
@[expose] public section
namespace L479.IPC420
open E1GS E1G.IP_c420 E1G.OK_c420

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

theorem R_eq' : (Cx []).R = 20 := rfl

/-- **the context cap of class 420** from the enumeration and the leaf refutations -/
theorem cap420 (ext : List ℕ) (henum : EnumOK (Cx ext) sl UB) (hext : ∀ pl ∈ ext, LeafNoExt (Cx ext) Em 14 pl)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c))
    (h495 : RT.Fact (RT.kM RT.K3eD_Cls.CL 495) 22) : CapG (RT.kM RT.K3eD_Cls.CL 420) 20 14 := by
  have hE : Em = RT.kM RT.K3eD_Cls.CL 420 := Em_eq
  have hb : RT.FactN 22 Em (Cx ext).R := by
    show RT.FactN 22 Em R
    rw [hE, show R = RT.cLB RT.K3eD_Cls.CL 420 by decide +kernel]; exact hclsN 420 (by decide)
  have h := capG_of (Cx ext) RT.K3eD_Cls.CL Em 14 LB LBR UB Ntab nrows i2 sl tab ge (ipg ext) henum hext hclsN hb h495
  rw [← hE]; exact h

/-- **the class facts of `CaseK 14 hi` with class 420 at 21** -/
theorem classFacts420 (hi : ℕ) (hcap : CapG (RT.kM RT.K3eD_Cls.CL 420) 20 14)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)) :
    R3RT.SpecO.ClassFactsC (R3RT.SpecO.CaseK 14 hi) (cLBG 420 20) :=
  classFactsG_of 420 20 14 hi hcap hclsN

end L479.IPC420

#print axioms L479.IPC420.ipg
#print axioms L479.IPC420.cap420
