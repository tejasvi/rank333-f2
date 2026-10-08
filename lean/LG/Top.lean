module
public import R22Port.U_d41d8cd98f00
public import LG.Final
public import LG.RR495
public import LG.W
/-! # L479 in case (II) with the capacity table and RR's bound plugged in

What remains open in `HC.L479II_of_ip` / `HC.classFactsII_of_ip`:
* `hraise`: the E1 statements of the raised classes (the same hypothesis as `HC.hclsN_K3eD_final`);
* for the l479cw IP (hcls): `IPL …` (decide) and `EnumOK C sl UB` (the chain theorems);
* the external leaves (leaf2 / hcls): `NoDecomp` or `NoLift3` of each `E1G.leafRec 20 VT DOM pl 0`, `pl ∈ C.EXT`. -/
@[expose] public section
namespace HC
open RootSound

theorem L479II_of_ip (hraise : ∀ c ∈ RAISED_K3eD_N, E1Concl (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c - 1))
    (C : E1G.Ctx) (Em LB LBR UB Ntab nrows i2 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : L479.IPL C Em LB LBR UB Ntab nrows i2 sl tab GE) (henum : L479.EnumOK C sl UB)
    (hext : ∀ pl ∈ C.EXT,
      S5.NoDecomp (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
        (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0)) ∨
      L479.NoLift3 (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
        (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0))) : L479II :=
  L479.l479II_of C Em LB LBR UB Ntab nrows i2 sl tab GE h henum hext (hclsN_K3eD_final hraise) L479.h495

theorem classFactsII_of_ip (hraise : ∀ c ∈ RAISED_K3eD_N, E1Concl (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c - 1))
    (C : E1G.Ctx) (Em LB LBR UB Ntab nrows i2 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : L479.IPL C Em LB LBR UB Ntab nrows i2 sl tab GE) (henum : L479.EnumOK C sl UB)
    (hext : ∀ pl ∈ C.EXT,
      S5.NoDecomp (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
        (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0)) ∨
      L479.NoLift3 (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
        (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0))) :
    R3RT.SpecO.ClassFactsC (R3RT.SpecO.CaseK 14 22) cLBII :=
  classFactsII_of (L479II_of_ip hraise C Em LB LBR UB Ntab nrows i2 sl tab GE h henum hext) (hclsN_K3eD_final hraise)

/-- the W variant (two W rows at cap 9): Lemma W(a) is discharged by `L479.lemmaWa` (RR's table) -/
theorem L479II_of_ipW (hraise : ∀ c ∈ RAISED_K3eD_N, E1Concl (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c - 1))
    (C : E1G.Ctx) (Em LB LBR UB Ntab nrows i2 iw0 iw1 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : L479.IPLW C Em LB LBR UB Ntab nrows i2 iw0 iw1 sl tab GE) (henum : L479.EnumOK C sl UB) (hext : L479.ExtOK C) :
    L479II :=
  L479.l479II_ofW C Em LB LBR UB Ntab nrows i2 iw0 iw1 sl tab GE h henum hext (hclsN_K3eD_final hraise) L479.h495
    (fun av b c hav hd => L479.lemmaWa av b c hav hd (by norm_num))

end HC

#print axioms HC.L479II_of_ipW
#print axioms HC.L479II_of_ip
#print axioms HC.classFactsII_of_ip
