module
public import R22Port.U_d41d8cd98f00
public import E1G.Bridge2
public import LG.NoLift
/-! # The SAT-leaf bridge: a leaf with `NoLift3` refutes every decomposition with two first factors on `E`
(`E = {0, 1, 10, 11}`, all terms nonzero) whose outside multiset is the leaf's

hcls E1G version (namespace `E1GS`). `LG/LiftE1.lean` is the same proof against leaf2's E1 (never imported together).

* `outside_order`: the `R` outside terms, reordered like the leaf's labels (`lab pl t`), as in `E1S.leaf_bridge_nd`.
* `lift_bridge`: the reordered outside terms `(bb, cc)` decompose the leaf's tensor on `E^⊥`, and for a functional `Y` that
  is `1` on exactly one inside first factor `u`, `T(Y) + ∑_{t ∈ S} N_t = N_u` with `S` = the outside terms with `Y(a_t) = 1`;
  `N_u = b_u c_uᵀ` is a nonzero rank-1 matrix. The two inside first factors are two distinct points of `E`, so two of the
  three classes `X0, X1, X0 ^^^ X1` are of that kind; `NoLift3` excludes it. -/
@[expose] public section
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

namespace L479
open Finset RootSound Matrix E1GS

theorem F2_add_self' (x : F2) : x + x = 0 := by revert x; decide

theorem mat_add_self (M : Matrix (Fin 9) (Fin 9) F2) : M + M = 0 := by
  ext i j; simp [F2_add_self']

/-- the outside terms in the leaf's label order (the construction of `E1S.leaf_bridge_nd`) -/
theorem outside_order (VT N Em R : ℕ) (hN : N ≤ 127) (hC : Cosets Em VT N) {n : ℕ} (av : Fin n → ℕ)
    (hav : ∀ s, av s < 512) (pl : ℕ) (hx : ∀ l, multR R pl l = xOf av Em VT N l) (s0 : Fin n) :
    ∃ L' : List (Fin n), L'.length = R ∧ (∀ s ∈ L', Em.testBit (av s) = false) ∧
      (∀ t < R, Em.testBit (av (L'.getD t s0) ^^^ vt VT (lab pl t)) = true) ∧
      (∀ G : Fin n → Matrix (Fin 9) (Fin 9) F2, (∀ s, Em.testBit (av s) = true → G s = 0) →
         ∑ s, G s = ∑ t ∈ range R, G (L'.getD t s0)) := by
  classical
  let cs : Fin n → ℕ := fun s => if h : ∃ l, l < N ∧ Em.testBit (av s ^^^ vt VT l) = true then Nat.find h else 0
  have hcs : ∀ s, Em.testBit (av s) = false → cs s < N ∧ Em.testBit (av s ^^^ vt VT (cs s)) = true := by
    intro s h0
    have hex : ∃ l, l < N ∧ Em.testBit (av s ^^^ vt VT l) = true := by
      obtain ⟨l, hl, hE⟩ := hC.cover (av s) (hav s) h0; exact ⟨l, hl, hE⟩
    have := Nat.find_spec hex
    simp only [cs, dif_pos hex]; exact this
  have hcs_eq : ∀ s l, Em.testBit (av s) = false → l < N → Em.testBit (av s ^^^ vt VT l) = true → cs s = l := by
    intro s l h0 hl hE
    obtain ⟨h1, h2⟩ := hcs s h0
    exact coset_unique hC (av s) (hav s) _ _ h1 hl h2 hE
  let Lout := (List.finRange n).filter (fun s => Em.testBit (av s) == false)
  have hLnd : Lout.Nodup := (List.nodup_finRange n).filter _
  have hmemL : ∀ s, s ∈ Lout ↔ Em.testBit (av s) = false := by
    intro s; simp [Lout, List.mem_filter, List.mem_finRange]
  have hcount : ∀ l, (Lout.map cs).count l = ((List.range R).map (lab pl)).count l := by
    intro l
    rw [← multR_count, hx l, List.count_eq_countP, List.countP_map, List.countP_eq_length_filter]
    unfold xOf
    split
    · next hl =>
      rw [← List.toFinset_card_of_nodup (hLnd.filter _)]
      apply congrArg Finset.card
      ext s
      simp only [List.mem_toFinset, List.mem_filter, hmemL, mem_filter, mem_univ, true_and, Function.comp, beq_iff_eq]
      constructor
      · rintro ⟨h0, hcl⟩; refine ⟨h0, ?_⟩; rw [← hcl]; exact (hcs s h0).2
      · rintro ⟨h0, hE⟩; exact ⟨h0, hcs_eq s l h0 hl hE⟩
    · next hl =>
      rw [List.length_eq_zero_iff, List.filter_eq_nil_iff]
      intro s hs
      simp only [Function.comp, beq_iff_eq]
      intro hcl
      have := (hcs s ((hmemL s).mp hs)).1
      omega
  obtain ⟨L', hperm, hmap⟩ := perm_map_exists' cs _ Lout (List.perm_iff_count.mpr hcount)
  have hlen : L'.length = R := by
    have := congrArg List.length hmap; simpa using this
  have hmemL' : ∀ s ∈ L', Em.testBit (av s) = false := fun s hs => (hmemL s).mp (hperm.subset hs)
  have hget : ∀ t < R, L'.getD t s0 ∈ L' := by
    intro t ht; rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem (by omega)]; exact List.getElem_mem _
  have hlabt : ∀ t < R, cs (L'.getD t s0) = lab pl t := by
    intro t ht
    have h1 := congrArg (fun L => L[t]?) hmap
    simp only [List.getElem?_map, List.getElem?_range ht, Option.map_some] at h1
    rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem (by omega), Option.getD_some]
    rw [List.getElem?_eq_getElem (by omega)] at h1
    simpa using h1
  refine ⟨L', hlen, hmemL', fun t ht => ?_, fun G hG => ?_⟩
  · rw [← hlabt t ht]; exact (hcs _ (hmemL' _ (hget t ht))).2
  · have e2 : ∑ s : Fin n, G s = (Lout.map G).sum := by
      rw [Fin.sum_univ_def]
      have : ∀ L : List (Fin n), (L.map G).sum = ((L.filter (fun s => Em.testBit (av s) == false)).map G).sum := by
        intro L
        induction L with
        | nil => rfl
        | cons x L ih =>
          rw [List.map_cons, List.sum_cons, ih]
          cases hxe : Em.testBit (av x)
          · rw [List.filter_cons_of_pos (by simp [hxe]), List.map_cons, List.sum_cons]
          · rw [List.filter_cons_of_neg (by simp [hxe]), hG x hxe, zero_add]
      exact this _
    have e3 : (Lout.map G).sum = (L'.map G).sum := (hperm.map G).sum_eq.symm
    have e4 : (L'.map G).sum = ∑ t ∈ range R, G (L'.getD t s0) := by rw [list_sum_range' s0 G L', hlen]
    rw [e2, e3, e4]

/-- **The SAT-leaf bridge.** -/
theorem lift_bridge (VT N Em DOM R : ℕ) (hN : N ≤ 127) (hR : R ≤ 31) (hC : Cosets Em VT N) (hD : DomPerp DOM Em)
    (hDOM : DOM < 2 ^ 512) (hE : ∀ a < 512, Em.testBit a = true ↔ (a = 0 ∨ a = 1 ∨ a = 10 ∨ a = 11))
    {n : ℕ} (av : Fin n → ℕ) (b c : Fin n → M3) (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) (hbc : ∀ s, b s ≠ 0 ∧ c s ≠ 0)
    (u0 u1 : Fin n) (hu : u0 ≠ u1) (hi0 : Em.testBit (av u0) = true) (hi1 : Em.testBit (av u1) = true)
    (hz0 : av u0 ≠ 0) (hz1 : av u1 ≠ 0) (hdist : av u0 ≠ av u1)
    (hins : ∀ s, Em.testBit (av s) = true → s = u0 ∨ s = u1)
    (pl cert : ℕ) (hx : ∀ l, multR R pl l = xOf av Em VT N l)
    (hnl : NoLift3 (S5.leafT (E1G.leafRec R VT DOM pl cert)) (S5.leafN (E1G.leafRec R VT DOM pl cert))
      (S6.leafDom6 (E1G.leafRec R VT DOM pl cert))) : False := by
  rw [leafN_rec _ _ _ _ _ (by omega) hDOM, leafT_rec _ _ _ _ _ (by omega) hDOM, leafDom_rec _ _ _ _ _ (by omega) hDOM]
    at hnl
  classical
  obtain ⟨L', hlen, hmemL', hlab, hsum⟩ := outside_order VT N Em R hN hC av hav pl hx u0
  set s0 := u0
  let bb : ℕ → ℕ := fun t => S5.natOf (vecB (b (L'.getD t s0)))
  let cc : ℕ → ℕ := fun t => S5.natOf (vecC (c (L'.getD t s0)))
  let F : Fin n → Matrix (Fin 9) (Fin 9) F2 := fun s => vecMulVec (vecB (b s)) (vecC (c s))
  have hF : ∀ t, vecMulVec (S5.nv (bb t)) (S5.nv (cc t)) = F (L'.getD t s0) := fun t => by
    simp only [bb, cc, F, S5.nv_natOf]
  -- the reordered outside terms decompose the leaf's tensor on `E^⊥`
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
  have hTX : ∀ X, X < 512 → DOM.testBit X = true →
      TX (toM3 X) = ∑ t ∈ (range R).filter (fun t => BC5.par (S5.aT (termsOf R VT pl) t &&& X) = true),
        vecMulVec (S5.nv (bb t)) (S5.nv (cc t)) := by
    intro X hX hdom
    rw [TX_eq_sum hd (toM3 X)]
    let G : Fin n → Matrix (Fin 9) (Fin 9) F2 := fun s => if BC5.par (av s &&& X) = true then F s else 0
    have e1 : ∑ s ∈ hitSet (fun s => toM3 (av s)) (toM3 X), F s = ∑ s : Fin n, G s := by
      rw [hitSet, Finset.sum_filter]
      apply Finset.sum_congr rfl; intro s _
      simp only [G]
      rw [S5.pair_par X (av s) hX (hav s)]
      cases BC5.par (av s &&& X) <;> simp [S5.bf, F]
    rw [e1, hsum G (fun s hs => by simp only [G]; rw [hD X hX hdom (av s) (hav s) hs]; simp), Finset.sum_filter]
    apply Finset.sum_congr rfl; intro t ht
    rw [Finset.mem_range] at ht
    have hpar : BC5.par (av (L'.getD t s0) &&& X) = BC5.par (S5.aT (termsOf R VT pl) t &&& X) := by
      rw [aT_terms R VT pl t ht]
      exact par_coset hD X hX hdom _ _ (hav _) (vt_lt VT _) (hlab t ht)
    simp only [G]
    rw [hpar, hF]
  -- a class that is `1` on exactly one inside factor lifts
  have hLift : ∀ Y, Y < 512 → ∀ u, (u = u0 ∨ u = u1) →
      (∀ s, Em.testBit (av s) = true → (BC5.par (av s &&& Y) = true ↔ s = u)) → Lift R bb cc Y := by
    intro Y hY u hu' hYu
    let G : Fin n → Matrix (Fin 9) (Fin 9) F2 := fun s => if BC5.par (av s &&& Y) = true then F s else 0
    have hTY : TX (toM3 Y) = ∑ s : Fin n, G s := by
      rw [TX_eq_sum hd (toM3 Y), hitSet, Finset.sum_filter]
      apply Finset.sum_congr rfl; intro s _
      simp only [G]
      rw [S5.pair_par Y (av s) hY (hav s)]
      cases BC5.par (av s &&& Y) <;> simp [S5.bf, F]
    let Go : Fin n → Matrix (Fin 9) (Fin 9) F2 := fun s => if Em.testBit (av s) = true then 0 else G s
    have hsplit : ∑ s : Fin n, G s = ∑ s : Fin n, Go s + F u := by
      have : ∀ s, G s = Go s + (if s = u then F u else 0) := by
        intro s
        simp only [Go, G]
        by_cases hs : Em.testBit (av s) = true
        · rw [if_pos hs, zero_add]
          by_cases hsu : s = u
          · subst hsu; rw [if_pos ((hYu _ hs).mpr rfl), if_pos rfl]
          · rw [if_neg (fun h => hsu ((hYu s hs).mp h)), if_neg hsu]
        · rw [if_neg hs]
          have hsu : s ≠ u := by
            rintro rfl
            rcases hu' with rfl | rfl
            · exact hs hi0
            · exact hs hi1
          rw [if_neg hsu, add_zero]
      rw [Finset.sum_congr rfl (fun s _ => this s), Finset.sum_add_distrib, Finset.sum_ite_eq', if_pos (mem_univ _)]
    have hGo : ∑ s : Fin n, Go s = ∑ t ∈ range R, Go (L'.getD t s0) :=
      hsum Go (fun s hs => by simp only [Go]; rw [if_pos hs])
    let S := (range R).filter (fun t => BC5.par (av (L'.getD t s0) &&& Y) = true)
    have hGoS : ∑ t ∈ range R, Go (L'.getD t s0) = ∑ t ∈ S, F (L'.getD t s0) := by
      rw [Finset.sum_filter]
      apply Finset.sum_congr rfl; intro t ht
      rw [Finset.mem_range] at ht
      have hout := hmemL' (L'.getD t s0) (by
        rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem (by omega)]; exact List.getElem_mem _)
      simp only [Go, G, hout, Bool.false_eq_true, if_false]
    refine ⟨S, filter_subset _ _, vecB (b u), vecC (c u), ?_, ?_, ?_⟩
    · intro h0; exact (hbc u).1 (S5.vecB_inj _ h0)
    · intro h0; exact (hbc u).2 (S5.vecC_inj _ h0)
    · rw [hTY, hsplit, hGo, hGoS]
      have e : ∑ t ∈ S, vecMulVec (S5.nv (bb t)) (S5.nv (cc t)) = ∑ t ∈ S, F (L'.getD t s0) :=
        Finset.sum_congr rfl (fun t _ => hF t)
      rw [e, add_comm (∑ t ∈ S, F (L'.getD t s0)) (F u), add_assoc, mat_add_self, add_zero]
  -- the inside first factors are two distinct points of `E \ {0}`; pick the two classes
  have hmem0 := (hE _ (hav u0)).mp hi0
  have hmem1 := (hE _ (hav u1)).mp hi1
  have hpY : ∀ Y a, Y < 512 → a < 512 → (Em.testBit a = true) → ∀ s, Em.testBit (av s) = true →
      (BC5.par (av s &&& Y) = true ↔ s = u0) ∨ True := fun _ _ _ _ _ _ _ => Or.inr trivial
  -- values of the three functionals on `E`
  have v1 : BC5.par (1 &&& X0) = true ∧ BC5.par (10 &&& X0) = false ∧ BC5.par (11 &&& X0) = true ∧
      BC5.par (1 &&& X1) = false ∧ BC5.par (10 &&& X1) = true ∧ BC5.par (11 &&& X1) = true ∧
      BC5.par (1 &&& (X0 ^^^ X1)) = true ∧ BC5.par (10 &&& (X0 ^^^ X1)) = true ∧
      BC5.par (11 &&& (X0 ^^^ X1)) = false := by decide
  obtain ⟨a1, a2, a3, a4, a5, a6, a7, a8, a9⟩ := v1
  have hval : ∀ s, Em.testBit (av s) = true → s = u0 ∨ s = u1 := hins
  -- the `Y`-condition from the values at `av u0`, `av u1`
  have hcond : ∀ Y, (BC5.par (av u0 &&& Y) = true ∧ BC5.par (av u1 &&& Y) = false) →
      ∀ s, Em.testBit (av s) = true → (BC5.par (av s &&& Y) = true ↔ s = u0) := by
    rintro Y ⟨h0, h1⟩ s hs
    rcases hins s hs with rfl | rfl
    · simp [h0]
    · simp only [h1, Bool.false_eq_true, false_iff]; exact fun h => hu h.symm
  have hcond' : ∀ Y, (BC5.par (av u0 &&& Y) = false ∧ BC5.par (av u1 &&& Y) = true) →
      ∀ s, Em.testBit (av s) = true → (BC5.par (av s &&& Y) = true ↔ s = u1) := by
    rintro Y ⟨h0, h1⟩ s hs
    rcases hins s hs with rfl | rfl
    · simp only [h0, Bool.false_eq_true, false_iff]; exact hu
    · simp [h1]
  have hX0 : X0 < 512 := by decide
  have hX1 : X1 < 512 := by decide
  have hX3 : X0 ^^^ X1 < 512 := by decide
  obtain ⟨n01, n03, n13⟩ := hnl
  rcases hmem0 with h0 | h0 | h0 | h0
  · exact hz0 h0
  · rcases hmem1 with h1 | h1 | h1 | h1
    · exact hz1 h1
    · exact hdist (h0.trans h1.symm)
    · -- {1, 10}: X0 lifts at u0, X1 at u1
      exact n01 bb cc hBC hTX ⟨hLift X0 hX0 u0 (Or.inl rfl) (hcond X0 (by rw [h0, h1]; exact ⟨a1, a2⟩)),
        hLift X1 hX1 u1 (Or.inr rfl) (hcond' X1 (by rw [h0, h1]; exact ⟨a4, a5⟩))⟩
    · -- {1, 11}: X0 ^^^ X1 lifts at u0, X1 at u1
      exact n13 bb cc hBC hTX ⟨hLift X1 hX1 u1 (Or.inr rfl) (hcond' X1 (by rw [h0, h1]; exact ⟨a4, a6⟩)),
        hLift (X0 ^^^ X1) hX3 u0 (Or.inl rfl) (hcond (X0 ^^^ X1) (by rw [h0, h1]; exact ⟨a7, a9⟩))⟩
  · rcases hmem1 with h1 | h1 | h1 | h1
    · exact hz1 h1
    · -- {10, 1}: X1 lifts at u0, X0 at u1
      exact n01 bb cc hBC hTX ⟨hLift X0 hX0 u1 (Or.inr rfl) (hcond' X0 (by rw [h0, h1]; exact ⟨a2, a1⟩)),
        hLift X1 hX1 u0 (Or.inl rfl) (hcond X1 (by rw [h0, h1]; exact ⟨a5, a4⟩))⟩
    · exact hdist (h0.trans h1.symm)
    · -- {10, 11}: X0 ^^^ X1 lifts at u0, X0 at u1
      exact n03 bb cc hBC hTX ⟨hLift X0 hX0 u1 (Or.inr rfl) (hcond' X0 (by rw [h0, h1]; exact ⟨a2, a3⟩)),
        hLift (X0 ^^^ X1) hX3 u0 (Or.inl rfl) (hcond (X0 ^^^ X1) (by rw [h0, h1]; exact ⟨a8, a9⟩))⟩
  · rcases hmem1 with h1 | h1 | h1 | h1
    · exact hz1 h1
    · -- {11, 1}: X1 lifts at u0, X0 ^^^ X1 at u1
      exact n13 bb cc hBC hTX ⟨hLift X1 hX1 u0 (Or.inl rfl) (hcond X1 (by rw [h0, h1]; exact ⟨a6, a4⟩)),
        hLift (X0 ^^^ X1) hX3 u1 (Or.inr rfl) (hcond' (X0 ^^^ X1) (by rw [h0, h1]; exact ⟨a9, a7⟩))⟩
    · -- {11, 10}: X0 lifts at u0, X0 ^^^ X1 at u1
      exact n03 bb cc hBC hTX ⟨hLift X0 hX0 u0 (Or.inl rfl) (hcond X0 (by rw [h0, h1]; exact ⟨a3, a2⟩)),
        hLift (X0 ^^^ X1) hX3 u1 (Or.inr rfl) (hcond' (X0 ^^^ X1) (by rw [h0, h1]; exact ⟨a9, a8⟩))⟩
    · exact hdist (h0.trans h1.symm)

end L479
