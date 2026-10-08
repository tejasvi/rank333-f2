module
public import R22Port.U_d41d8cd98f00
public import S7.Corb
public import LG.NoLift
/-! # Lifts under the GL3 move of the root

The root move of the v7 checker is `(b, c) ↦ (b S, S⁻¹ c)` (`S7.sym_move`).  On the 9×9 matrices `M` (rows: `b`
coordinates, columns: `c` coordinates) it acts by `phi k k' M` (`k = S`, `k' = S⁻¹`):
* `phi` is additive (`phi_add`, `phi_sum`);
* it sends `u vᵀ` to `(lu k u)(rv k' v)ᵀ` (`phi_vmv`), in particular `nv b · nv cᵀ` to `nv (b S) · nv (S⁻¹ c)ᵀ` (`phi_N`),
  and `lu`, `rv` are invertible (`lu_lu`, `rv_rv`), so nonzero rank-1 matrices stay nonzero rank-1;
* it fixes every `T(X)` (`phi_TX`, the computation of `S5.sym_sum`).
So a lift in `Y` (`L479.Lift`) moves to a lift in `Y` (`lift_move`). -/
@[expose] public section
namespace S7L
open BC4 BC5 S5 S7 RootSound Matrix

/-- the move on 9×9 matrices: `(phi k k' M) y z = ∑_{m,n} k_{m, lo y} k'_{hi z, n} M (ix (hi y) m) (ix n (lo z))` -/
def phi (k k' : Nat) (M : Matrix (Fin 9) (Fin 9) F2) : Matrix (Fin 9) (Fin 9) F2 :=
  fun y z => ∑ m : Fin 3, ∑ n : Fin 3, (toM3 k m (lo y) * toM3 k' (hi z) n) * M (ix (hi y) m) (ix n (lo z))

/-- the move on `b` vectors: `u ↦ u k` (as 3×3 matrices) -/
def lu (k : Nat) (u : Fin 9 → F2) : Fin 9 → F2 := fun y => ∑ m : Fin 3, u (ix (hi y) m) * toM3 k m (lo y)
/-- the move on `c` vectors: `v ↦ k' v` -/
def rv (k' : Nat) (v : Fin 9 → F2) : Fin 9 → F2 := fun z => ∑ n : Fin 3, toM3 k' (hi z) n * v (ix n (lo z))

theorem phi_add (k k' : Nat) (M N : Matrix (Fin 9) (Fin 9) F2) : phi k k' (M + N) = phi k k' M + phi k k' N := by
  funext y z
  simp only [phi, Matrix.add_apply, mul_add, Finset.sum_add_distrib]

theorem phi_zero (k k' : Nat) : phi k k' 0 = 0 := by
  funext y z
  simp only [phi, Matrix.zero_apply, mul_zero, Finset.sum_const_zero]

theorem phi_sum (k k' : Nat) (f : Nat → Matrix (Fin 9) (Fin 9) F2) (S : Finset Nat) :
    phi k k' (∑ t ∈ S, f t) = ∑ t ∈ S, phi k k' (f t) := by
  classical
  induction S using Finset.induction_on with
  | empty => simp only [Finset.sum_empty, phi_zero]
  | insert a s ha ih => rw [Finset.sum_insert ha, Finset.sum_insert ha, phi_add, ih]

theorem phi_vmv (k k' : Nat) (u v : Fin 9 → F2) : phi k k' (vecMulVec u v) = vecMulVec (lu k u) (rv k' v) := by
  funext y z
  simp only [phi, lu, rv, vecMulVec_apply]
  rw [Finset.sum_mul_sum]
  refine Finset.sum_congr rfl (fun m _ => Finset.sum_congr rfl (fun n _ => ?_))
  ring

theorem lu_nv (k b : Nat) : lu k (nv b) = nv (mul3 b k) := by
  funext y; rw [nv_mul3_left]; rfl

theorem rv_nv (k' c : Nat) : rv k' (nv c) = nv (mul3 k' c) := by
  funext z; rw [nv_mul3_right]; rfl

theorem phi_N (k k' b c : Nat) : phi k k' (vecMulVec (nv b) (nv c)) = vecMulVec (nv (mul3 b k)) (nv (mul3 k' c)) := by
  rw [phi_vmv, lu_nv, rv_nv]

theorem ix_hi_lo (y : Fin 9) : ix (hi y) (lo y) = y := by
  apply Fin.ext; simp only [ix, hi, lo]; omega

theorem phi_TX (k k' : Nat) (hkk : toM3 k' * toM3 k = 1) (X : M3) : phi k k' (TX X) = TX X := by
  funext y z
  simp only [phi, TX_ix, mul_ite, mul_zero]
  have e1 : ∀ m : Fin 3, (∑ n : Fin 3, if m = n then toM3 k m (lo y) * toM3 k' (hi z) n * X (lo z) (hi y) else 0) =
      toM3 k' (hi z) m * toM3 k m (lo y) * X (lo z) (hi y) := by
    intro m
    rw [Finset.sum_ite_eq, if_pos (Finset.mem_univ _)]; ring
  rw [Finset.sum_congr rfl (fun m _ => e1 m), ← Finset.sum_mul]
  have hone : ∑ m : Fin 3, toM3 k' (hi z) m * toM3 k m (lo y) = (1 : M3) (hi z) (lo y) := by
    rw [← hkk, Matrix.mul_apply]
  rw [hone, Matrix.one_apply]
  show _ = if lo y = hi z then X (lo z) (hi y) else 0
  by_cases e : lo y = hi z
  · rw [if_pos e.symm, if_pos e, one_mul]
  · rw [if_neg (fun x => e x.symm), if_neg e, zero_mul]

theorem lu_lu (k k' : Nat) (hkk : toM3 k * toM3 k' = 1) (u : Fin 9 → F2) : lu k' (lu k u) = u := by
  funext y
  simp only [lu, hi_ix, lo_ix, Finset.sum_mul]
  rw [Finset.sum_comm]
  have e1 : ∀ m : Fin 3, (∑ m' : Fin 3, u (ix (hi y) m) * toM3 k m m' * toM3 k' m' (lo y)) =
      u (ix (hi y) m) * (1 : M3) m (lo y) := by
    intro m
    rw [← hkk, Matrix.mul_apply, Finset.mul_sum]
    refine Finset.sum_congr rfl (fun m' _ => ?_); ring
  rw [Finset.sum_congr rfl (fun m _ => e1 m)]
  simp only [Matrix.one_apply, mul_ite, mul_one, mul_zero, Finset.sum_ite_eq', Finset.mem_univ, if_true, ix_hi_lo]

theorem rv_rv (k k' : Nat) (hkk : toM3 k * toM3 k' = 1) (v : Fin 9 → F2) : rv k (rv k' v) = v := by
  funext z
  simp only [rv, hi_ix, lo_ix, Finset.mul_sum]
  rw [Finset.sum_comm]
  have e1 : ∀ n' : Fin 3, (∑ n : Fin 3, toM3 k (hi z) n * (toM3 k' n n' * v (ix n' (lo z)))) =
      (1 : M3) (hi z) n' * v (ix n' (lo z)) := by
    intro n'
    rw [← hkk, Matrix.mul_apply, Finset.sum_mul]
    refine Finset.sum_congr rfl (fun n _ => ?_); ring
  rw [Finset.sum_congr rfl (fun n' _ => e1 n')]
  simp only [Matrix.one_apply, ite_mul, one_mul, zero_mul, Finset.sum_ite_eq, Finset.mem_univ, if_true, ix_hi_lo]

theorem lu_zero (k : Nat) : lu k 0 = 0 := by
  funext y; simp only [lu, Pi.zero_apply, zero_mul, Finset.sum_const_zero]

theorem rv_zero (k' : Nat) : rv k' 0 = 0 := by
  funext z; simp only [rv, Pi.zero_apply, mul_zero, Finset.sum_const_zero]

/-- **A lift moves with the GL3 move** `(b, c) ↦ (b S, S⁻¹ c)` (`S = p.1`, `S⁻¹ = p.2`). -/
theorem lift_move (n : Nat) (b c : Nat → Nat) (Y : Nat) (p : Nat × Nat) (hinv : mul3 p.1 p.2 = 273)
    (h : L479.Lift n b c Y) : L479.Lift n (fun u => mul3 (b u) p.1) (fun u => mul3 p.2 (c u)) Y := by
  have hSS : toM3 p.1 * toM3 p.2 = 1 := by rw [← toM3_mul3, hinv, toM3_273]
  have hSS' : toM3 p.2 * toM3 p.1 = 1 := mul_eq_one_comm.mp hSS
  obtain ⟨S, hS, u, v, hu, hv, h⟩ := h
  refine ⟨S, hS, lu p.1 u, rv p.2 v, fun h0 => hu ?_, fun h0 => hv ?_, ?_⟩
  · rw [← lu_lu p.1 p.2 hSS u, h0, lu_zero]
  · rw [← rv_rv p.1 p.2 hSS v, h0, rv_zero]
  · have e := congrArg (phi p.1 p.2) h
    rw [phi_add, phi_TX p.1 p.2 hSS', phi_sum, phi_vmv] at e
    simpa only [phi_N] using e

end S7L
