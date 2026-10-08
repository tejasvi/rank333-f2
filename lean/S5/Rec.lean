module
public import R22Port.U_d41d8cd98f00
public import S5.Sem
/-! # Records and slack data: what the checker's lists certify

`RecOK`: a tight record built at a node stays valid below it: the masks contain the factors of every active term it
hits, and `c_s · x(b_t) = δ_st` (`delta_of_tight`).  `mkRec_sound`, `mkSl_sound` derive validity from the runtime
checks; `updRec_ok` shows the update after an assignment keeps it. -/
@[expose] public section
namespace S5
open BC4 BC5 RootSound Matrix

/-- `F2^9` vector → 9-bit number -/
def natOf (v : Fin 9 → F2) : Nat := mkB (fun i => if h : i < 9 then decide (v ⟨i, h⟩ = 1) else false) 9

theorem natOf_lt (v : Fin 9 → F2) : natOf v < 512 := lt_of_lt_of_eq (mkB_lt _ 9) (by norm_num)

theorem nv_natOf (v : Fin 9 → F2) : nv (natOf v) = v := by
  funext i
  show bf ((natOf v).testBit i.val) = v i
  rw [natOf, mkB_bit]
  simp only [i.isLt, decide_true, Bool.true_and, dif_pos]
  rcases zmod2_cases (v i) with h | h <;> rw [h] <;> decide

theorem bf_eq_one (x : Bool) : decide (bf x = 1) = x := by cases x <;> decide

theorem natOf_nv (w : Nat) (hw : w < 512) : natOf (nv w) = w := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [natOf, mkB_bit]
  by_cases hj : j < 9
  · simp only [hj, decide_true, Bool.true_and, dif_pos, nv, bitF_bf]
    exact bf_eq_one (w.testBit j)
  · rw [lt512_bit w j hw (by omega)]; simp [hj]

/-- factors of the hypothetical decomposition: nonzero 9-bit -/
def BC (n : Nat) (b c : Nat → Nat) : Prop := ∀ t, t < n → 0 < b t ∧ b t < 512 ∧ 0 < c t ∧ c t < 512

/-- the residual identity on the domain -/
def HD (T n dom : Nat) (b c : Nat → Nat) (ACT : Nat) (asg : Asg) : Prop :=
  ∀ X, X < 512 → dom.testBit X = true → resM X asg = ∑ t ∈ hitS T n ACT X, vecMulVec (nv (b t)) (nv (c t))

def RecOK (T n : Nat) (b c : Nat → Nat) (ACT : Nat) (r : Rec) : Prop :=
  r.X < 512 ∧
  (∀ s t, s ∈ hitS T n ACT r.X → t ∈ hitS T n ACT r.X → par (c s &&& xof r.P (b t)) = decide (s = t)) ∧
  (∀ t ∈ hitS T n ACT r.X, r.lm.testBit (b t) = true ∧ r.rm.testBit (c t) = true)

theorem mem_hitS {T n ACT X t : Nat} : t ∈ hitS T n ACT X ↔ t < n ∧ ACT.testBit t = true ∧ par (aT T t &&& X) = true := by
  simp [hitS]

/-- data of an accepted computed record -/
theorem mkR_X (X P PM lm rm : Nat) : (mkR X P PM lm rm).X = X := rfl
theorem mkR_P (X P PM lm rm : Nat) : (mkR X P PM lm rm).P = P := rfl
theorem mkR_lm (X P PM lm rm : Nat) : (mkR X P PM lm rm).lm = lm := rfl
theorem mkR_rm (X P PM lm rm : Nat) : (mkR X P PM lm rm).rm = rm := rfl

theorem mkRec_cases (SS ACT : Nat) (asg : Asg) (X : Nat) (hX : X < 512) (hok : (mkRec SS ACT asg X).1 = true) :
    ∃ s : ES, s = elim (resC X asg) ∧ elimOk s = true ∧ ucnt SS ACT X ≤ s.rk ∧
      (mkRec SS ACT asg X).2 = mkR X s.P s.PM (lmC s.P s.PM) (kerM s.M) := by
  unfold mkRec at hok ⊢
  revert hok
  cases hna : noasg X asg
  · rw [cond_false]
    intro hok
    simp only [Bool.and_eq_true, Nat.ble_eq] at hok
    exact ⟨_, rfl, hok.1, hok.2, rfl⟩
  · rw [cond_true]
    intro hok
    have hroot := allLT_spec root_fact X hX
    simp only [rootOK, Bool.and_eq_true, Nat.beq_eq] at hroot
    obtain ⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩ := hroot
    have hc : resC X asg = Nat.xor (txc18 X) ID18 := (noasg_spec X asg hna).1
    simp only [Nat.ble_eq] at hok
    refine ⟨elim (Nat.xor (txc18 X) ID18), by rw [hc], h6, ?_, ?_⟩
    · rw [← h5]; exact hok
    · rw [h1, h2, h3, h4]

theorem tight_or_slack {ι : Type*} [DecidableEq ι] (S : Finset ι) (β γ : ι → Fin 9 → F2)
    (h : S.card ≤ (∑ s ∈ S, vecMulVec (β s) (γ s)).rank + 1) (t : ι) (ht : t ∈ S) :
    β t ∈ LinearMap.range (∑ s ∈ S, vecMulVec (β s) (γ s)).mulVecLin ∨
      γ t ∈ LinearMap.range (∑ s ∈ S, vecMulVec (β s) (γ s))ᵀ.mulVecLin := by
  have hle := rank_sum_le S β γ
  rcases (by omega : (∑ s ∈ S, vecMulVec (β s) (γ s)).rank = S.card ∨
      (∑ s ∈ S, vecMulVec (β s) (γ s)).rank + 1 = S.card) with e | e
  · exact Or.inl (tight_fs S β γ e t ht).1
  · exact slack_fs S β γ e t ht

section
variable {T n dom ACT : Nat} {asg : Asg} {b c : Nat → Nat}

theorem mkRec_sound (hn : n ≤ 32) {SS : Nat} (hSS : SSok T n SS) (hact : ∀ t, ACT.testBit t = true → t < n) (hbc : BC n b c)
    (hasg : ∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) (hd : HD T n dom b c ACT asg) (X : Nat) (hX : X < 512)
    (hdom : dom.testBit X = true) (hok : (mkRec SS ACT asg X).1 = true) :
    RecOK T n b c ACT (mkRec SS ACT asg X).2 := by
  obtain ⟨s, hs, hok', hle, hrec⟩ := mkRec_cases _ ACT asg X hX hok
  rw [hrec]
  obtain ⟨hA, hRI⟩ := resC_sem X hX asg hasg
  have hf : ElimFacts (resM X asg) s := by
    have := elim_facts (resC X asg) hRI (hs ▸ hok'); rw [hA] at this; rw [hs]; exact this
  have hR := hd X hX hdom
  have hcard : (hitS T n ACT X).card ≤ s.rk := by rw [← ucnt_eq' T n ACT X SS hSS hn hX hact]; exact hle
  have hrk := rank_ge_elim hf
  rw [hR] at hrk
  have htight : (∑ t ∈ hitS T n ACT X, vecMulVec (nv (b t)) (nv (c t))).rank = (hitS T n ACT X).card :=
    le_antisymm (rank_sum_le _ _ _) (by omega)
  have hbt : ∀ t ∈ hitS T n ACT X, t < n := fun t ht => (mem_hitS.mp ht).1
  rw [RecOK, mkR_X, mkR_P, mkR_lm, mkR_rm]
  refine ⟨hX, ?_, ?_⟩
  · intro s' t hs' ht
    have hδ := delta_of_tight (hitS T n ACT X) (fun t => nv (b t)) (fun t => nv (c t)) htight
      (fun v => nv (xof s.P (natOf v))) (by
        intro v hv
        rw [← hR] at hv ⊢
        have := xof_inv hf (natOf v) (natOf_lt v) (by rw [nv_natOf]; exact hv)
        rw [nv_natOf] at this; exact this) s' t hs' ht
    simp only [natOf_nv _ (hbc t (hbt t ht)).2.1] at hδ
    rw [dot_nv _ _ (hbc s' (hbt s' hs')).2.2.2] at hδ
    apply bf_inj
    rw [hδ]
    by_cases e : s' = t <;> simp [e, bf]
  · intro t ht
    have h3 := tight_fs (hitS T n ACT X) (fun t => nv (b t)) (fun t => nv (c t)) htight t ht
    rw [← hR] at h3
    exact ⟨lmC_of_range hf _ (hbc t (hbt t ht)).2.1 h3.1, kerM_of_range hf _ (hbc t (hbt t ht)).2.2.2 h3.2.1⟩

/-- an accepted slack datum: `b_t` in the column-space mask or `c_t` in the row-space mask -/
theorem mkSl_sound (hn : n ≤ 32) {SS : Nat} (hSS : SSok T n SS) (hact : ∀ t, ACT.testBit t = true → t < n) (hbc : BC n b c)
    (hasg : ∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) (hd : HD T n dom b c ACT asg) (X : Nat) (hX : X < 512)
    (hdom : dom.testBit X = true) (hok : (mkSl SS ACT asg X).1 = true) (t : Nat)
    (ht : t ∈ hitS T n ACT X) :
    (mkSl SS ACT asg X).2.1.testBit (b t) = true ∨ (mkSl SS ACT asg X).2.2.testBit (c t) = true := by
  have htn := (mem_hitS.mp ht).1
  obtain ⟨_, hb, _, hc⟩ := hbc t htn
  have hR := hd X hX hdom
  obtain ⟨hA, hRI⟩ := resC_sem X hX asg hasg
  obtain ⟨hA2, hRI2⟩ := resR_sem X hX asg hasg
  -- masks containing col R and row R, and the count bound
  have key : ∀ (bm cm rk : Nat), (∀ w, w < 512 → nv w ∈ LinearMap.range (resM X asg).mulVecLin → bm.testBit w = true) →
      (∀ w, w < 512 → nv w ∈ LinearMap.range (resM X asg)ᵀ.mulVecLin → cm.testBit w = true) →
      rk ≤ (resM X asg).rank → ucnt SS ACT X ≤ rk + 1 → bm.testBit (b t) = true ∨ cm.testBit (c t) = true := by
    intro bm cm rk hbm hcm hrk hu
    rw [ucnt_eq' T n ACT X SS hSS hn hX hact] at hu
    rw [hR] at hrk hbm hcm
    have hc' : (hitS T n ACT X).card ≤ (∑ t ∈ hitS T n ACT X, vecMulVec (nv (b t)) (nv (c t))).rank + 1 := by
      omega
    rcases tight_or_slack (hitS T n ACT X) (fun t => nv (b t)) (fun t => nv (c t)) hc' t ht with h | h
    · exact Or.inl (hbm _ hb h)
    · exact Or.inr (hcm _ hc h)
  unfold mkSl at hok ⊢
  revert hok
  cases hna : noasg X asg
  · rw [cond_false]
    intro hok
    simp only [Bool.and_eq_true, Nat.ble_eq] at hok
    obtain ⟨⟨h1, h2⟩, h3⟩ := hok
    have hf : ElimFacts (resM X asg) (elim (resC X asg)) := by
      have := elim_facts (resC X asg) hRI h1; rwa [hA] at this
    have hf2 : ElimFacts (resM X asg)ᵀ (elim (resR X asg)) := by
      have := elim_facts (resR X asg) hRI2 h2; rwa [hA2] at this
    exact key _ _ _ (fun w hw hv => kerM_of_range hf2 w hw (by rw [Matrix.transpose_transpose]; exact hv))
      (fun w hw hv => kerM_of_range hf w hw hv) (rank_ge_elim hf) h3
  · rw [cond_true]
    intro hok
    have hroot := allLT_spec root_fact X hX
    simp only [rootOK, Bool.and_eq_true, Nat.beq_eq] at hroot
    obtain ⟨⟨⟨⟨⟨_, _⟩, h3⟩, h4⟩, h5⟩, h6⟩ := hroot
    have hc' : resC X asg = Nat.xor (txc18 X) ID18 := (noasg_spec X asg hna).1
    have hf : ElimFacts (resM X asg) (elim (Nat.xor (txc18 X) ID18)) := by
      have := elim_facts (resC X asg) hRI (by rw [hc']; exact h6); rw [hA, hc'] at this; exact this
    simp only [Nat.ble_eq] at hok
    refine key _ _ _ (fun w hw hv => ?_) (fun w hw hv => ?_) (rank_ge_elim hf) (by rw [← h5]; exact hok)
    · show (rlm X).testBit w = true
      rw [h3]; exact lmC_of_range hf w hw hv
    · show (rrm X).testBit w = true
      rw [h4]; exact kerM_of_range hf w hw hv

end

/-! ## List helpers -/

theorem mem_thru (a : Nat) (l tail : List Rec) (r : Rec) :
    r ∈ thru a l tail → (r ∈ l ∧ par (r.X &&& a) = true) ∨ r ∈ tail := by
  induction l with
  | nil => intro h; exact Or.inr h
  | cons r0 l ih =>
    intro h
    have e : thru a (r0 :: l) tail = cond (par (r0.X &&& a)) (r0 :: thru a l tail) (thru a l tail) := rfl
    rw [e] at h
    cases hp : par (r0.X &&& a)
    · rw [hp, cond_false] at h
      rcases ih h with ⟨h1, h2⟩ | h1
      · exact Or.inl ⟨List.mem_cons_of_mem _ h1, h2⟩
      · exact Or.inr h1
    · rw [hp, cond_true] at h
      rcases List.mem_cons.mp h with h1 | h1
      · subst h1; exact Or.inl ⟨List.mem_cons_self, hp⟩
      · rcases ih h1 with ⟨h2, h3⟩ | h2
        · exact Or.inl ⟨List.mem_cons_of_mem _ h2, h3⟩
        · exact Or.inr h2

theorem mem_app (l tail : List Rec) (r : Rec) : r ∈ app l tail → r ∈ l ∨ r ∈ tail := by
  induction l with
  | nil => intro h; exact Or.inr h
  | cons r0 l ih =>
    intro h
    rcases List.mem_cons.mp (show r ∈ r0 :: app l tail from h) with h1 | h1
    · exact Or.inl (h1 ▸ List.mem_cons_self)
    · rcases ih h1 with h2 | h2
      · exact Or.inl (List.mem_cons_of_mem _ h2)
      · exact Or.inr h2

theorem andLm_bit (l : List Rec) : ∀ (m w : Nat), m.testBit w = true → (∀ r ∈ l, r.lm.testBit w = true) →
    (andLm l m).testBit w = true := by
  induction l with
  | nil => intro m w hm _; exact hm
  | cons r l ih =>
    intro m w hm hl
    show (andLm l (m &&& r.lm)).testBit w = true
    exact ih _ w (by rw [Nat.testBit_and, hm, hl r List.mem_cons_self]; rfl)
      (fun r' hr' => hl r' (List.mem_cons_of_mem _ hr'))

theorem andRm_bit (l : List Rec) : ∀ (m w : Nat), m.testBit w = true → (∀ r ∈ l, r.rm.testBit w = true) →
    (andRm l m).testBit w = true := by
  induction l with
  | nil => intro m w hm _; exact hm
  | cons r l ih =>
    intro m w hm hl
    show (andRm l (m &&& r.rm)).testBit w = true
    exact ih _ w (by rw [Nat.testBit_and, hm, hl r List.mem_cons_self]; rfl)
      (fun r' hr' => hl r' (List.mem_cons_of_mem _ hr'))

theorem cmT_bit (bb : Nat) (l : List Rec) : ∀ (m w : Nat), m.testBit w = true →
    (∀ r ∈ l, (nperp (xof r.P bb)).testBit w = true) → (cmT bb l m).testBit w = true := by
  induction l with
  | nil => intro m w hm _; exact hm
  | cons r l ih =>
    intro m w hm hl
    show (cmT bb l (m &&& nperp (xof r.P bb))).testBit w = true
    exact ih _ w (by rw [Nat.testBit_and, hm, hl r List.mem_cons_self]; rfl)
      (fun r' hr' => hl r' (List.mem_cons_of_mem _ hr'))

theorem bmT_bit (cc : Nat) (l : List Rec) : ∀ (m w : Nat), m.testBit w = true →
    (∀ r ∈ l, (nperp (gof r.P cc)).testBit w = true) → (bmT cc l m).testBit w = true := by
  induction l with
  | nil => intro m w hm _; exact hm
  | cons r l ih =>
    intro m w hm hl
    show (bmT cc l (m &&& nperp (gof r.P cc))).testBit w = true
    exact ih _ w (by rw [Nat.testBit_and, hm, hl r List.mem_cons_self]; rfl)
      (fun r' hr' => hl r' (List.mem_cons_of_mem _ hr'))

theorem cmS_bit (bb : Nat) (l : List (Bool × Nat × Nat)) : ∀ (m w : Nat), m.testBit w = true →
    (∀ sd ∈ l, sd.2.1.testBit bb = true ∨ sd.2.2.testBit w = true) → (cmS bb l m).testBit w = true := by
  induction l with
  | nil => intro m w hm _; exact hm
  | cons sd l ih =>
    intro m w hm hl
    have e : cmS bb (sd :: l) m = cmS bb l (cond (bit sd.2.1 bb) m (m &&& sd.2.2)) := rfl
    rw [e]
    apply ih _ w _ (fun s' hs' => hl s' (List.mem_cons_of_mem _ hs'))
    rw [bit_eq]
    cases h1 : sd.2.1.testBit bb
    · rw [cond_false, Nat.testBit_and, hm]
      rcases hl sd List.mem_cons_self with h | h
      · rw [h1] at h; exact absurd h (by decide)
      · rw [h]; rfl
    · rw [cond_true]; exact hm

theorem bmS_bit (cc : Nat) (l : List (Bool × Nat × Nat)) : ∀ (m w : Nat), m.testBit w = true →
    (∀ sd ∈ l, sd.2.2.testBit cc = true ∨ sd.2.1.testBit w = true) → (bmS cc l m).testBit w = true := by
  induction l with
  | nil => intro m w hm _; exact hm
  | cons sd l ih =>
    intro m w hm hl
    have e : bmS cc (sd :: l) m = bmS cc l (cond (bit sd.2.2 cc) m (m &&& sd.2.1)) := rfl
    rw [e]
    apply ih _ w _ (fun s' hs' => hl s' (List.mem_cons_of_mem _ hs'))
    rw [bit_eq]
    cases h1 : sd.2.2.testBit cc
    · rw [cond_false, Nat.testBit_and, hm]
      rcases hl sd List.mem_cons_self with h | h
      · rw [h1] at h; exact absurd h (by decide)
      · rw [h]; rfl
    · rw [cond_true]; exact hm

theorem mem_updRecs (a bb cc : Nat) (l : List Rec) (r : Rec) : r ∈ updRecs a bb cc l →
    ∃ r0 ∈ l, (par (r0.X &&& a) = false ∧ r = r0) ∨
      (par (r0.X &&& a) = true ∧ r = ⟨r0.X, r0.P, r0.PM, r0.lm &&& perp (gof r0.P cc), r0.rm &&& perp (xof r0.P bb),
        r0.XL, r0.XH, r0.GL, r0.GH⟩) := by
  induction l with
  | nil => intro h; exact absurd h List.not_mem_nil
  | cons r0 l ih =>
    intro h
    have e : updRecs a bb cc (r0 :: l) = cond (par (r0.X &&& a))
      (⟨r0.X, r0.P, r0.PM, r0.lm &&& perp (gof r0.P cc), r0.rm &&& perp (xof r0.P bb), r0.XL, r0.XH, r0.GL, r0.GH⟩ ::
        updRecs a bb cc l) (r0 :: updRecs a bb cc l) := rfl
    rw [e] at h
    cases hp : par (r0.X &&& a)
    · rw [hp, cond_false] at h
      rcases List.mem_cons.mp h with h1 | h1
      · exact ⟨r0, List.mem_cons_self, Or.inl ⟨hp, h1⟩⟩
      · obtain ⟨r1, hr1, h2⟩ := ih h1; exact ⟨r1, List.mem_cons_of_mem _ hr1, h2⟩
    · rw [hp, cond_true] at h
      rcases List.mem_cons.mp h with h1 | h1
      · exact ⟨r0, List.mem_cons_self, Or.inr ⟨hp, h1⟩⟩
      · obtain ⟨r1, hr1, h2⟩ := ih h1; exact ⟨r1, List.mem_cons_of_mem _ hr1, h2⟩

theorem mem_mkRecs (SS ACT : Nat) (asg : Asg) (nt : List Nat) (tail : List Rec) (hok : (mkRecs SS ACT asg nt tail).1 = true)
    (r : Rec) (hr : r ∈ (mkRecs SS ACT asg nt tail).2) :
    r ∈ tail ∨ ∃ X ∈ nt, (mkRec SS ACT asg X).1 = true ∧ r = (mkRec SS ACT asg X).2 := by
  induction nt with
  | nil => exact Or.inl hr
  | cons X nt ih =>
    have e1 : (mkRecs SS ACT asg (X :: nt) tail).1 = ((mkRec SS ACT asg X).1 && (mkRecs SS ACT asg nt tail).1) := rfl
    have e2 : (mkRecs SS ACT asg (X :: nt) tail).2 = (mkRec SS ACT asg X).2 :: (mkRecs SS ACT asg nt tail).2 := rfl
    rw [e1, Bool.and_eq_true] at hok
    rw [e2] at hr
    rcases List.mem_cons.mp hr with h | h
    · exact Or.inr ⟨X, List.mem_cons_self, hok.1, h⟩
    · rcases ih hok.2 h with h1 | ⟨X', hX', h2, h3⟩
      · exact Or.inl h1
      · exact Or.inr ⟨X', List.mem_cons_of_mem _ hX', h2, h3⟩

theorem mem_mkSls (SS ACT : Nat) (asg : Asg) (sl : List Nat) (hok : (mkSls SS ACT asg sl).1 = true)
    (sd : Bool × Nat × Nat) (hsd : sd ∈ (mkSls SS ACT asg sl).2) :
    ∃ X ∈ sl, (mkSl SS ACT asg X).1 = true ∧ sd = mkSl SS ACT asg X := by
  induction sl with
  | nil => exact absurd hsd List.not_mem_nil
  | cons X sl ih =>
    have e1 : (mkSls SS ACT asg (X :: sl)).1 = ((mkSl SS ACT asg X).1 && (mkSls SS ACT asg sl).1) := rfl
    have e2 : (mkSls SS ACT asg (X :: sl)).2 = mkSl SS ACT asg X :: (mkSls SS ACT asg sl).2 := rfl
    rw [e1, Bool.and_eq_true] at hok
    rw [e2] at hsd
    rcases List.mem_cons.mp hsd with h | h
    · exact ⟨X, List.mem_cons_self, hok.1, h⟩
    · obtain ⟨X', hX', h2, h3⟩ := ih hok.2 h
      exact ⟨X', List.mem_cons_of_mem _ hX', h2, h3⟩

theorem allDom_spec (dom : Nat) (l : List Nat) (h : allDom dom l = true) : ∀ X ∈ l, dom.testBit X = true := by
  induction l with
  | nil => intro X hX; exact absurd hX List.not_mem_nil
  | cons X l ih =>
    have e : allDom dom (X :: l) = (bit dom X && allDom dom l) := rfl
    rw [e, Bool.and_eq_true, bit_eq] at h
    intro Y hY
    rcases List.mem_cons.mp hY with h1 | h1
    · rw [h1]; exact h.1
    · exact ih h.2 Y h1

theorem allThru_spec (a : Nat) (l : List Nat) (h : allThru a l = true) : ∀ X ∈ l, par (a &&& X) = true := by
  induction l with
  | nil => intro X hX; exact absurd hX List.not_mem_nil
  | cons X l ih =>
    have e : allThru a (X :: l) = (par (a &&& X) && allThru a l) := rfl
    rw [e, Bool.and_eq_true] at h
    intro Y hY
    rcases List.mem_cons.mp hY with h1 | h1
    · rw [h1]; exact h.1
    · exact ih h.2 Y h1

/-! ## Duality and the update -/

/-- `b · g(c) = c · x(b)` -/
theorem par_gof_xof (P bb cc : Nat) (hb : bb < 512) (hc : cc < 512) :
    par (bb &&& gof P cc) = par (cc &&& xof P bb) := by
  apply bf_inj
  rw [← dot_nv _ _ hb, ← dot_nv _ _ hc]
  simp only [dotProduct, nv, bitF_bf]
  have hg : ∀ h : Fin 9, bf ((gof P cc).testBit h.val) =
      ∑ j : Fin 9, bf (cc.testBit j.val) * bf (P.testBit (18 * h.val + (9 + j.val))) := by
    intro h; rw [gof_bf P cc h.val hc h.isLt, ← Fin.sum_univ_eq_sum_range (fun j => bf (cc.testBit j) * bf (P.testBit (18 * h.val + (9 + j))))]
  have hx : ∀ j : Fin 9, bf ((xof P bb).testBit j.val) =
      ∑ h : Fin 9, bf (bb.testBit h.val) * bf (P.testBit (18 * h.val + (9 + j.val))) := by
    intro j; rw [xof_bf P bb j.val hb j.isLt, ← Fin.sum_univ_eq_sum_range (fun h => bf (bb.testBit h) * bf (P.testBit (18 * h + (9 + j.val))))]
  simp only [hg, hx, Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl; intro j _; apply Finset.sum_congr rfl; intro h _; ring

theorem updRec_ok {T n : Nat} {b c : Nat → Nat} {ACT : Nat} (hbc : BC n b c) (t : Nat) (htn : t < n)
    (htact : ACT.testBit t = true) (r0 : Rec) (hr0 : RecOK T n b c ACT r0) :
    (par (r0.X &&& aT T t) = false → RecOK T n b c (ACT ^^^ 1 <<< t) r0) ∧
    (par (r0.X &&& aT T t) = true → RecOK T n b c (ACT ^^^ 1 <<< t) ⟨r0.X, r0.P, r0.PM,
      r0.lm &&& perp (gof r0.P (c t)), r0.rm &&& perp (xof r0.P (b t)), r0.XL, r0.XH, r0.GL, r0.GH⟩) := by
  obtain ⟨hX, hδ, hm⟩ := hr0
  have hsub : ∀ u, u ∈ hitS T n (ACT ^^^ 1 <<< t) r0.X → u ∈ hitS T n ACT r0.X ∧ u ≠ t := by
    intro u hu
    rw [mem_hitS] at hu ⊢
    rw [Nat.testBit_xor, Nat.one_shiftLeft, Nat.testBit_two_pow] at hu
    by_cases e : u = t
    · subst e; simp [htact] at hu
    · have e' : ¬ (t = u) := fun x => e x.symm
      simp only [e', decide_false, Bool.xor_false] at hu
      exact ⟨hu, e⟩
  constructor
  · intro _
    exact ⟨hX, fun s u hs hu => hδ s u (hsub s hs).1 (hsub u hu).1, fun u hu => hm u (hsub u hu).1⟩
  · intro hp
    have ht : t ∈ hitS T n ACT r0.X := by
      rw [mem_hitS]; refine ⟨htn, htact, ?_⟩; rw [Nat.and_comm]; exact hp
    have hbt := hbc t htn
    refine ⟨hX, fun s u hs hu => hδ s u (hsub s hs).1 (hsub u hu).1, fun u hu => ?_⟩
    obtain ⟨hu', hne⟩ := hsub u hu
    have hbu := hbc u (mem_hitS.mp hu').1
    obtain ⟨hlm, hrm⟩ := hm u hu'
    constructor
    · show (r0.lm &&& perp (gof r0.P (c t))).testBit (b u) = true
      rw [Nat.testBit_and, hlm, perp_bit _ _ (gof_lt _ _) hbu.2.1, par_gof_xof _ _ _ hbu.2.1 hbt.2.2.2,
        hδ t u ht hu']
      have : ¬ (t = u) := fun x => hne x.symm
      simp [this]
    · show (r0.rm &&& perp (xof r0.P (b t))).testBit (c u) = true
      rw [Nat.testBit_and, hrm, perp_bit _ _ (xof_lt _ _) hbu.2.2.2, hδ u t hu' ht]
      simp [hne]

end S5
