module
public import R22Port.U_d41d8cd98f00
public import E1G.OK_l479cw
public import LG.Main
public import E1G.Bridge2
/-! # LG.IPL479: the l479cw instance of `L479.IPL` (hcls's IP-facts module `E1G.OK_l479cw`)

hcls's module states every field of `L479.IPL` on the raw constants (all by `decide`), so the instance holds for every
external-leaf list `ext` (the context is `E1G.OK_l479cw.Cx ext`; the IP's own `C` is `Cx EXT`, `E1G.IP_l479cw.C_eq`).
`l479II_cw`: L479 in case (II) from the enumeration and the external leaves alone. -/
@[expose] public section
namespace L479
open E1G.OK_l479cw E1G.IP_l479cw

/-- the l479cw instance of the glue's `IPL`, for every external-leaf list -/
theorem ipl_cw (ext : List ℕ) : IPL (Cx ext) Em LB LBR UB Ntab nrows i2 sl tab ge :=
  ⟨N_le, R_eq, DOM_lt, Em_eq, cosets, domperp, planes, planesR, sl_spec, cls_lt, Ntab_le, i2_lt, c2_cap, c2_rev, c2_lt,
   c2_mask, sl_zero, capslot, grp⟩

theorem ipl_cwC : IPL C Em LB LBR UB Ntab nrows i2 sl tab ge := by rw [C_eq]; exact ipl_cw EXT

/-- `ExtOK` from per-leaf facts about the records **with their certificates** (`leafT` / `leafN` / `leafDom6` of
`E1G.leafRec R VT DOM pl cert` do not depend on `cert`: `E1GS.leafT_rec`, `leafN_rec`, `leafDom_rec`, for `R < 64` and
`DOM < 2^512`) -/
theorem extOK_of_cert (C' : E1G.Ctx) (hR : C'.R < 64) (hD : C'.DOM < 2 ^ 512) (cert : ℕ → ℕ)
    (h : ∀ pl ∈ C'.EXT,
      S5.NoDecomp (S5.leafT (E1G.leafRec C'.R C'.VT C'.DOM pl (cert pl))) (S5.leafN (E1G.leafRec C'.R C'.VT C'.DOM pl (cert pl)))
        (S6.leafDom6 (E1G.leafRec C'.R C'.VT C'.DOM pl (cert pl))) ∨
      NoLift3 (S5.leafT (E1G.leafRec C'.R C'.VT C'.DOM pl (cert pl))) (S5.leafN (E1G.leafRec C'.R C'.VT C'.DOM pl (cert pl)))
        (S6.leafDom6 (E1G.leafRec C'.R C'.VT C'.DOM pl (cert pl)))) : ExtOK C' := by
  intro pl hpl
  have h1 := h pl hpl
  rw [E1GS.leafT_rec _ _ _ _ _ hR hD, E1GS.leafN_rec _ _ _ _ _ hR hD, E1GS.leafDom_rec _ _ _ _ _ hR hD] at h1
  rw [E1GS.leafT_rec _ _ _ _ _ hR hD, E1GS.leafN_rec _ _ _ _ _ hR hD, E1GS.leafDom_rec _ _ _ _ _ hR hD]
  exact h1

/-- the l479cw instance: `ExtOK (Cx ext)` from the external leaves' certified records -/
theorem extOK_cw (ext : List ℕ) (cert : ℕ → ℕ)
    (h : ∀ pl ∈ ext,
      S5.NoDecomp (S5.leafT (E1G.leafRec (Cx ext).R (Cx ext).VT (Cx ext).DOM pl (cert pl)))
        (S5.leafN (E1G.leafRec (Cx ext).R (Cx ext).VT (Cx ext).DOM pl (cert pl)))
        (S6.leafDom6 (E1G.leafRec (Cx ext).R (Cx ext).VT (Cx ext).DOM pl (cert pl))) ∨
      NoLift3 (S5.leafT (E1G.leafRec (Cx ext).R (Cx ext).VT (Cx ext).DOM pl (cert pl)))
        (S5.leafN (E1G.leafRec (Cx ext).R (Cx ext).VT (Cx ext).DOM pl (cert pl)))
        (S6.leafDom6 (E1G.leafRec (Cx ext).R (Cx ext).VT (Cx ext).DOM pl (cert pl)))) : ExtOK (Cx ext) :=
  extOK_of_cert (Cx ext) (by rw [(ipl_cw ext).R_eq]; norm_num) (ipl_cw ext).DOM_lt cert h

end L479

#print axioms L479.ipl_cw
#print axioms L479.ipl_cwC
#print axioms L479.extOK_of_cert
#print axioms L479.extOK_cw
