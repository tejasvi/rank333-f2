module
public import R22Port.U_bdf7b3355108
public import Mathlib.Tactic
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
/-! # Farkas certificates over 0/1 points (abstract part)

A child kill asks: is there a set `S` of new points (the completion of the child prefix) with `|S| = t` that satisfies a
list of weighted constraints `∑_{v ∈ S} a v ≥ b` or `≤ b`?  Nonnegative multipliers `m` on the constraints and an integer
`w = wp - wn` on the slot equation `|S| = t` give, for every such `S`,
`K ≤ ∑_{v ∈ S} coef v`, with `coef v = ∑_{≥} m a v - ∑_{≤} m a v + w` and `K = ∑_{≥} m b - ∑_{≤} m b + w t`.
So if some `cp : ℕ → ℕ` bounds `coef` from above on a set `U ⊇ S` and `∑_{v ∈ U} cp v < K`, no such `S` exists. -/
@[expose] public section
namespace MisF
open Finset

/-- a weighted constraint `∑_{v ∈ S} a v ≥ b` (`ge = true`) or `≤ b`, with its multiplier `m` -/
structure WCons where
  a : ℕ → ℕ
  b : ℕ
  ge : Bool
  m : ℕ

def WCons.sat (c : WCons) (S : Finset ℕ) : Prop :=
  if c.ge then c.b ≤ ∑ v ∈ S, c.a v else ∑ v ∈ S, c.a v ≤ c.b

/-- signed contribution of one constraint to the coefficient of `v` -/
def WCons.sc (c : WCons) (v : ℕ) : ℤ := if c.ge then (c.m : ℤ) * c.a v else -((c.m : ℤ) * c.a v)
/-- signed contribution of one constraint to the constant -/
def WCons.sk (c : WCons) : ℤ := if c.ge then (c.m : ℤ) * c.b else -((c.m : ℤ) * c.b)

def coef (L : List WCons) (wp wn : ℕ) (v : ℕ) : ℤ := (L.map (fun c => c.sc v)).sum + wp - wn
def kconst (L : List WCons) (wp wn t : ℕ) : ℤ := (L.map WCons.sk).sum + ((wp : ℤ) - wn) * t

theorem WCons.sk_le (c : WCons) (S : Finset ℕ) (h : c.sat S) : c.sk ≤ ∑ v ∈ S, c.sc v := by
  unfold WCons.sat at h; unfold WCons.sk WCons.sc
  cases hg : c.ge
  · simp only [hg, Bool.false_eq_true, if_false] at h ⊢
    rw [Finset.sum_neg_distrib, ← Finset.mul_sum, neg_le_neg_iff]
    have : ((∑ v ∈ S, c.a v : ℕ) : ℤ) ≤ c.b := by exact_mod_cast h
    push_cast at this
    exact mul_le_mul_of_nonneg_left this (by positivity)
  · simp only [hg, if_true] at h ⊢
    rw [← Finset.mul_sum]
    have : (c.b : ℤ) ≤ ((∑ v ∈ S, c.a v : ℕ) : ℤ) := by exact_mod_cast h
    push_cast at this
    exact mul_le_mul_of_nonneg_left this (by positivity)

theorem sum_sc (L : List WCons) (S : Finset ℕ) :
    ∑ v ∈ S, (L.map (fun c => c.sc v)).sum = (L.map (fun c => ∑ v ∈ S, c.sc v)).sum := by
  induction L with
  | nil => simp
  | cons c L ih => simp [List.map_cons, List.sum_cons, Finset.sum_add_distrib, ih]

theorem kconst_le (L : List WCons) (wp wn t : ℕ) (S : Finset ℕ) (hsat : ∀ c ∈ L, c.sat S) (hcard : S.card = t) :
    kconst L wp wn t ≤ ∑ v ∈ S, coef L wp wn v := by
  unfold kconst coef
  have h1 : (L.map WCons.sk).sum ≤ (L.map (fun c => ∑ v ∈ S, c.sc v)).sum := by
    induction L with
    | nil => simp
    | cons c L ih =>
      simp only [List.map_cons, List.sum_cons]
      exact add_le_add (c.sk_le S (hsat c (by simp))) (ih (fun d hd => hsat d (by simp [hd])))
  have h2 : ∑ v ∈ S, ((L.map (fun c => c.sc v)).sum + (wp : ℤ) - wn)
      = (L.map (fun c => ∑ v ∈ S, c.sc v)).sum + ((wp : ℤ) - wn) * t := by
    rw [← sum_sc, ← hcard]
    simp only [add_sub_assoc, Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul]
    ring
  rw [h2]; linarith

/-- **Farkas over 0/1 points.**  If `coef ≤ cp` on `U ⊇ S` and `∑_U cp < K`, the constraints, `S ⊆ U` and `|S| = t`
are incompatible. -/
theorem farkas01 (L : List WCons) (wp wn t : ℕ) (U : Finset ℕ) (cp : ℕ → ℕ)
    (hcp : ∀ v ∈ U, coef L wp wn v ≤ cp v) (hlt : ((∑ v ∈ U, cp v : ℕ) : ℤ) < kconst L wp wn t)
    (S : Finset ℕ) (hSU : S ⊆ U) (hsat : ∀ c ∈ L, c.sat S) (hcard : S.card = t) : False := by
  have h1 := kconst_le L wp wn t S hsat hcard
  have h2 : ∑ v ∈ S, coef L wp wn v ≤ ∑ v ∈ S, (cp v : ℤ) := Finset.sum_le_sum (fun v hv => hcp v (hSU hv))
  have h3 : ∑ v ∈ S, (cp v : ℤ) ≤ ∑ v ∈ U, (cp v : ℤ) :=
    Finset.sum_le_sum_of_subset_of_nonneg hSU (fun v _ _ => by positivity)
  push_cast at hlt
  linarith

end MisF
