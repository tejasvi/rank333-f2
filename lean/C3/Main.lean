module
public import R22Port.U_d41d8cd98f00
public import C3.Decomp
public import C3.Check
/-! # Orderly generation as prof7 uses it

prof7 (`--rord 123 --mult1`) enumerates sets of distinct first factors in label order and keeps a child `T = seq ∪ {l}` only
if `T` is lex-minimal in its `G`-orbit (`canonCheck`).  Two facts make this a complete search:

1. **Every decomposition has a canonical representative** (`exists_canon_decomp`): some `(t, P, Q) ∈ G` maps the
   first factors to a set that is canonical, and the images are again the first factors of a decomposition.  The map is
   injective below 512 (`actN_inj`) and fixes 0 (`actN_zero`), so distinct nonzero first factors stay distinct and
   nonzero.
2. **Pruning a non-canonical prefix loses nothing** (`canon_prefix`, `not_canon_of_prefix`, `witSem_prune`): every
   label-prefix of a canonical set is canonical, so a checked witness for `T` shows that no canonical set extends `T`. -/
@[expose] public section
namespace C3
open RootSound

theorem mulF_zero (u : Nat) : mulF u 0 = 0 := by rw [mulF_eq]; simp
theorem zero_mulF (v : Nat) : mulF 0 v = 0 := by rw [mulF_eq]; simp

theorem actN_zero (t : Bool) (P Q : Nat) : actN t P Q 0 = 0 := by
  cases t
  · rw [actN, cond_false, mulF_zero, zero_mulF]
  · rw [actN, cond_true, show trN 0 = 0 from rfl, mulF_zero, zero_mulF]

/-- `G` keeps ranks (so the rank-1 count of `--minr1` and the case split are invariant). -/
theorem rank_actN {t : Bool} {P Q : Nat} (hP : isGL P = true) (hQ : isGL Q = true) (v : Nat) :
    (toM3 (actN t P Q v)).rank = (toM3 v).rank := by
  obtain ⟨hP1, -⟩ := gl_inv hP
  obtain ⟨hQ1, -⟩ := gl_inv hQ
  rw [toM3_actN, Matrix.rank_mul_eq_left_of_isUnit_det _ _ (Matrix.isUnit_det_of_right_inverse hQ1),
    Matrix.rank_mul_eq_right_of_isUnit_det _ _ (Matrix.isUnit_det_of_right_inverse hP1)]
  cases t
  · rw [cond_false]
  · rw [cond_true]; exact Matrix.rank_transpose _

/-- **Canonical representatives of decompositions.** -/
theorem exists_canon_decomp {n : ℕ} (av : Fin n → ℕ) (hav : ∀ s, av s < 512) (b c : Fin n → M3)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) :
    ∃ t P Q, isGL P = true ∧ isGL Q = true ∧
      (∃ b' c' : Fin n → M3, IsDecomp (fun s => toM3 (actN t P Q (av s))) b' c') ∧
      Canon labK Gset (Finset.univ.image (fun s => actN t P Q (av s))) := by
  obtain ⟨g, ⟨t, P, Q, hP, hQ, rfl⟩, hcan⟩ := exists_canon labK labK_inj Gset {x | x < 512} Gset_finite
    Gset_nonempty Gset_comp (Finset.univ.image av)
    (by intro x hx; obtain ⟨s, -, rfl⟩ := Finset.mem_image.mp hx; exact hav s)
  refine ⟨t, P, Q, hP, hQ, isDecomp_actN hd hP hQ, ?_⟩
  rw [Finset.image_image] at hcan
  exact hcan

end C3
