module
public import R22Port.U_d41d8cd98f00
public import LG.Gen
/-! # The general lifting statement: any subspace `E`, any inside count `k` (math2 README §5, criterion (3))

For a decomposition `(b_t, c_t)_{t < n}` of `T mod E` with the leaf record's first factors (as in `S5.NoDecomp`):
* `LiftK n b c Em k`: it lifts to a decomposition of `T` with `k` inside terms at distinct nonzero points of `E`. That is,
  there are `k` distinct nonzero points `P ⊆ E` and nonzero rank-1 matrices `u_p v_pᵀ` (`p ∈ P`) such that for every
  functional `X`, `T(X) + Σ_{t ∈ S} b_t c_tᵀ = Σ_{p ∈ P, X(p) = 1} u_p v_pᵀ` for some set `S` of outside terms (`S` = the
  outside terms whose bit `X(a_t)` the lift flips). This is math2's `δ(φ) = Σ_i φ(p_i) [N_i]` modulo
  `V = span{b_t c_tᵀ}`, stated for every `X` (the checker may use any subset of the `X`, e.g. a dual basis).
* `NoLiftK T n dom Em k`: no decomposition of `T mod E` with the record's first factors lifts that way.

`leafNoExt_of_noLiftK`: a leaf record `r = E1G.leafRec R VT DOM pl 0` (`DOM = E^⊥`) with
`NoLiftK (leafT r) (leafN r) (leafDom6 r) Em (22 - R)` is refuted for the parametric glue (`LeafNoExt`), for every `E`,
`R` and `lo`. Proof: the outside terms reordered like the leaf's labels decompose `T mod E` (`lift_bridge`'s
construction), and `lift_identity` at every `X` gives the lift with `P` = the inside first factors (distinct, nonzero, in
`E`, `22 - R` of them).

L479 (`E = K_479`, `k = 2`) is the case where `P` is a pair of points of a line: `NoLift3` (`LG/NoLift.lean`) refutes it
through the three dual pairs. Planes (`k = 2, 3`) need the configurations of math2's criterion (independent triples: the
28 dual bases; collinear: the line's annihilator plus the lift3 condition). -/
@[expose] public section
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

namespace L479
open Finset RootSound Matrix E1GS

/-- the decomposition `(b_t, c_t)_{t < n}` of `T mod E` lifts with `k` inside terms at distinct nonzero points of `E` -/
def LiftK (n : ℕ) (b c : ℕ → ℕ) (Em k : ℕ) : Prop :=
  ∃ P : Finset ℕ, P.card = k ∧ (∀ p ∈ P, p < 512 ∧ p ≠ 0 ∧ Em.testBit p = true) ∧
    ∃ u v : ℕ → Fin 9 → F2, (∀ p ∈ P, u p ≠ 0 ∧ v p ≠ 0) ∧
      ∀ X, X < 512 → ∃ S ⊆ range n,
        TX (toM3 X) + ∑ t ∈ S, vecMulVec (S5.nv (b t)) (S5.nv (c t)) =
          ∑ p ∈ P.filter (fun p => BC5.par (p &&& X) = true), vecMulVec (u p) (v p)

/-- no decomposition of `T mod E` with the record's first factors (`T`, `n`, domain `dom`) lifts with `k` inside terms -/
def NoLiftK (T n dom Em k : ℕ) : Prop :=
  ∀ b c : ℕ → ℕ, S5.BC n b c →
    (∀ X, X < 512 → dom.testBit X = true →
      TX (toM3 X) = ∑ t ∈ (range n).filter (fun t => BC5.par (S5.aT T t &&& X) = true),
        vecMulVec (S5.nv (b t)) (S5.nv (c t))) →
    ¬ LiftK n b c Em k

/-- **The general SAT-leaf bridge**: `NoLiftK` of an external leaf's record refutes it in the parametric glue -/
theorem leafNoExt_of_noLiftK {C : E1G.Ctx} {Em lo pl : ℕ} (hN : C.N ≤ 127) (hR : C.R ≤ 31) (hC : Cosets Em C.VT C.N)
    (hD : DomPerp C.DOM Em) (hDOM : C.DOM < 2 ^ 512)
    (hnl : NoLiftK (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
      (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0)) Em (22 - C.R)) : LeafNoExt C Em lo pl := by
  intro av b c hom hx
  obtain ⟨hav, hnz, hinj, hd, hbc, hII, hR'⟩ := hom
  rw [leafN_rec _ _ _ _ _ (by omega) hDOM, leafT_rec _ _ _ _ _ (by omega) hDOM, leafDom_rec _ _ _ _ _ (by omega) hDOM]
    at hnl
  classical
  set R := C.R
  set s0 : Fin 22 := 0
  obtain ⟨L', hlen, hmemL', hlab, hsum⟩ := outside_order C.VT C.N Em R hN hC av hav pl hx s0
  let bb : ℕ → ℕ := fun t => S5.natOf (vecB (b (L'.getD t s0)))
  let cc : ℕ → ℕ := fun t => S5.natOf (vecC (c (L'.getD t s0)))
  let F : Fin 22 → Matrix (Fin 9) (Fin 9) F2 := fun s => vecMulVec (vecB (b s)) (vecC (c s))
  have hF : ∀ t, vecMulVec (S5.nv (bb t)) (S5.nv (cc t)) = F (L'.getD t s0) := fun t => by
    simp only [bb, cc, F, S5.nv_natOf]
  -- the reordered outside terms decompose the leaf's tensor on `E^⊥` (as `lift_bridge`)
  have hBC : S5.BC R bb cc := by
    intro t ht
    obtain ⟨h1, h2⟩ := hbc (L'.getD t s0)
    have p1 : 0 < S5.natOf (vecB (b (L'.getD t s0))) := by
      apply Nat.pos_of_ne_zero; intro e
      apply h1; apply S5.vecB_inj; rw [← S5.nv_natOf (vecB _), e]; funext i; simp [S5.nv, bitF]
    have p2 : 0 < S5.natOf (vecC (c (L'.getD t s0))) := by
      apply Nat.pos_of_ne_zero; intro e
      apply h2; apply S5.vecC_inj; rw [← S5.nv_natOf (vecC _), e]; funext i; simp [S5.nv, bitF]
    exact ⟨p1, S5.natOf_lt _, p2, S5.natOf_lt _⟩
  have hTX : ∀ X, X < 512 → C.DOM.testBit X = true →
      TX (toM3 X) = ∑ t ∈ (range R).filter (fun t => BC5.par (S5.aT (termsOf R C.VT pl) t &&& X) = true),
        vecMulVec (S5.nv (bb t)) (S5.nv (cc t)) := by
    intro X hX hdom
    rw [TX_eq_sum hd (toM3 X)]
    let G : Fin 22 → Matrix (Fin 9) (Fin 9) F2 := fun s => if BC5.par (av s &&& X) = true then F s else 0
    have e1 : ∑ s ∈ hitSet (fun s => toM3 (av s)) (toM3 X), F s = ∑ s : Fin 22, G s := by
      rw [hitSet, Finset.sum_filter]
      apply Finset.sum_congr rfl; intro s _
      simp only [G]
      rw [S5.pair_par X (av s) hX (hav s)]
      cases BC5.par (av s &&& X) <;> simp [S5.bf, F]
    rw [e1, hsum G (fun s hs => by simp only [G]; rw [hD X hX hdom (av s) (hav s) hs]; simp), Finset.sum_filter]
    apply Finset.sum_congr rfl; intro t ht
    rw [Finset.mem_range] at ht
    have hpar : BC5.par (av (L'.getD t s0) &&& X) = BC5.par (S5.aT (termsOf R C.VT pl) t &&& X) := by
      rw [aT_terms R C.VT pl t ht]
      exact par_coset hD X hX hdom _ _ (hav _) (vt_lt C.VT _) (hlab t ht)
    simp only [G]
    rw [hpar, hF]
  -- the lift: `P` = the inside first factors
  apply hnl bb cc hBC hTX
  let I : Finset (Fin 22) := univ.filter (fun s => Em.testBit (av s) = true)
  let O : Finset (Fin 22) := univ.filter (fun s => Em.testBit (av s) = false)
  have hIO : I.card + O.card = 22 := by
    have h := Finset.filter_card_add_filter_neg_card_eq_card (s := (univ : Finset (Fin 22)))
      (fun s => Em.testBit (av s) = true)
    simp only [Finset.card_univ, Fintype.card_fin, Bool.not_eq_true] at h
    exact h
  have hO : O.card = R := hR'
  have hinjI : Set.InjOn av (I : Set (Fin 22)) := fun x _ y _ h => hinj h
  let uu : ℕ → Fin 9 → F2 := fun p => if h : ∃ s, av s = p then vecB (b (Classical.choose h)) else 0
  let vv : ℕ → Fin 9 → F2 := fun p => if h : ∃ s, av s = p then vecC (c (Classical.choose h)) else 0
  have huu : ∀ s, uu (av s) = vecB (b s) := by
    intro s
    have h : ∃ s', av s' = av s := ⟨s, rfl⟩
    simp only [uu, dif_pos h]
    rw [hinj (Classical.choose_spec h)]
  have hvv : ∀ s, vv (av s) = vecC (c s) := by
    intro s
    have h : ∃ s', av s' = av s := ⟨s, rfl⟩
    simp only [vv, dif_pos h]
    rw [hinj (Classical.choose_spec h)]
  refine ⟨I.image av, ?_, ?_, uu, vv, ?_, ?_⟩
  · rw [Finset.card_image_of_injOn hinjI]; omega
  · intro p hp
    obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp hp
    exact ⟨hav s, hnz s, (Finset.mem_filter.mp hs).2⟩
  · intro p hp
    obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp hp
    rw [huu, hvv]
    exact ⟨fun h0 => (hbc s).1 (S5.vecB_inj _ h0), fun h0 => (hbc s).2 (S5.vecC_inj _ h0)⟩
  · intro X hX
    refine ⟨(range R).filter (fun t => BC5.par (av (L'.getD t s0) &&& X) = true), filter_subset _ _, ?_⟩
    have hid := lift_identity Em av b c hav hd R L' s0 hmemL' hsum hlen X hX
    have e1 : ∑ t ∈ (range R).filter (fun t => BC5.par (av (L'.getD t s0) &&& X) = true),
        vecMulVec (S5.nv (bb t)) (S5.nv (cc t)) =
        ∑ t ∈ (range R).filter (fun t => BC5.par (av (L'.getD t s0) &&& X) = true),
          vecMulVec (vecB (b (L'.getD t s0))) (vecC (c (L'.getD t s0))) :=
      Finset.sum_congr rfl (fun t _ => hF t)
    have e2 : ∑ p ∈ (I.image av).filter (fun p => BC5.par (p &&& X) = true), vecMulVec (uu p) (vv p) =
        ∑ s ∈ univ.filter (fun s => Em.testBit (av s) = true ∧ BC5.par (av s &&& X) = true),
          vecMulVec (vecB (b s)) (vecC (c s)) := by
      rw [Finset.filter_image, Finset.sum_image (fun x _ y _ h => hinj h), Finset.filter_filter]
      exact Finset.sum_congr rfl (fun s _ => by rw [huu, hvv])
    rw [e1, e2]
    exact hid

end L479

#print axioms L479.leafNoExt_of_noLiftK
