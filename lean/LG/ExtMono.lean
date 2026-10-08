module
public import R22Port.U_d41d8cd98f00
public import LG.Main
/-! # Monotonicity in the external-leaf list (contingency for L479 jobs with external leaves)

`E1G.leafOK C pl cert` accepts a v7 record (`cert ≠ 0`, independent of `C.EXT`) or, for `cert = 0`, membership of `pl` in
`C.EXT`. Nothing else in `Glob`, `JobOK` or `EnumOK` reads `C.EXT`. So enlarging the list only strengthens `Glob`, and every
`JobOK` / `EnumOK` proved for a context transfers to the same context with a larger external-leaf list:
* `jobOK_ext_mono`: the native L479 jobs, checked with `EXT = []` (frozen closure), give `JobOK` for `Cx ext`;
* `enumOK_ext_mono`: likewise for the enumeration statement. -/
@[expose] public section
namespace L479
open E1GS

/-- the checker's membership fold is list membership -/
theorem extMem_iff (pl : ℕ) : ∀ L : List ℕ,
    (@List.rec ℕ (fun _ => Bool) false (fun e _ ih => @Bool.rec (fun _ => Bool) ih true (Nat.beq e pl)) L) = true ↔ pl ∈ L
  | [] => by simp
  | e :: L => by
    have ih := extMem_iff pl L
    show (@Bool.rec (fun _ => Bool) _ true (Nat.beq e pl)) = true ↔ _
    cases h : Nat.beq e pl
    · have hne : e ≠ pl := fun he => by rw [he] at h; exact absurd (Nat.beq_refl pl) (by rw [h]; decide)
      simp only [List.mem_cons]
      rw [ih]
      constructor
      · exact Or.inr
      · rintro (he | hm)
        · exact absurd he.symm hne
        · exact hm
    · have he : e = pl := Nat.eq_of_beq_eq_true h
      simp [he]

/-- `leafOK` only gains accepted leaves when the external-leaf list grows -/
theorem leafOK_ext_mono (C : E1G.Ctx) (ext : List ℕ) (hsub : ∀ e ∈ C.EXT, e ∈ ext) (pl cert : ℕ)
    (h : E1G.leafOK C pl cert = true) : E1G.leafOK { C with EXT := ext } pl cert = true := by
  unfold E1G.leafOK at h ⊢
  cases hc : Nat.beq cert 0
  · rw [hc] at h; exact h
  · rw [hc] at h
    exact (extMem_iff pl ext).mpr (hsub pl ((extMem_iff pl C.EXT).mp h))

/-- `Glob` for the larger list implies `Glob` for the smaller one -/
theorem glob_ext_mono {C : E1G.Ctx} {ext : List ℕ} (hsub : ∀ e ∈ C.EXT, e ∈ ext) {x : ℕ → ℕ}
    (h : Glob { C with EXT := ext } x) : Glob C x where
  N_le := h.N_le
  R_le := h.R_le
  xN := h.xN
  xR := h.xR
  leaf := fun pl cert hx hl => h.leaf pl cert hx (leafOK_ext_mono C ext hsub pl cert hl)
  canon := h.canon
  gp := h.gp

/-- **a job checked with a smaller external-leaf list holds for a larger one** -/
theorem jobOK_ext_mono {C : E1G.Ctx} {ext : List ℕ} (hsub : ∀ e ∈ C.EXT, e ∈ ext) {sl : ℕ → ℕ} {UB S : ℕ}
    (h : JobOK C sl UB S) : JobOK { C with EXT := ext } sl UB S :=
  fun x hg hsl hub hx => h x (glob_ext_mono hsub hg) hsl hub hx

/-- **the same for the enumeration statement** -/
theorem enumOK_ext_mono {C : E1G.Ctx} {ext : List ℕ} (hsub : ∀ e ∈ C.EXT, e ∈ ext) {sl : ℕ → ℕ} {UB : ℕ}
    (h : EnumOK C sl UB) : EnumOK { C with EXT := ext } sl UB :=
  fun x hg hsl hub hx => h x (glob_ext_mono hsub hg) hsl hub hx

end L479

#print axioms L479.jobOK_ext_mono
#print axioms L479.enumOK_ext_mono
