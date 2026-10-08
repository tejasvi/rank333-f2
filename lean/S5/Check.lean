module
public import R22Port.U_d41d8cd98f00
public import S5.Enum
public import S5.Sym
/-! # The induction over `checkS`

`Inv` is the semantic state at a node for a hypothetical decomposition `(b, c)` of the leaf: the residual identity
`R(X) = ∑_{active t hit by X} b_t c_tᵀ` on the domain, valid records, and (at the root only) no records.
* `over X`: `rank R(X) ≥ rk > #hits ≥ rank R(X)`;
* `br t`: the true `(b_t, c_t)` (after the GL3 move at a `sym` root) is among the candidates, its subtree is accepted,
  and the child state is again an `Inv` (`checkS_sound`).
New step types extend `nodeS` with a branch and need one local lemma of the same shape. -/
@[expose] public section
namespace S5
open BC4 BC5 RootSound Matrix

structure Inv (T n dom : Nat) (b c : Nat → Nat) (ACT : Nat) (asg : Asg) (recs : List Rec) : Prop where
  act : ∀ t, ACT.testBit t = true → t < n
  bc : BC n b c
  asg_lt : ∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512
  hd : HD T n dom b c ACT asg
  root : asg = [] → recs = []
  recs : ∀ r ∈ recs, RecOK T n b c ACT r

theorem rd_lt (k S : Nat) : rd k S < 2 ^ k := by
  show S &&& (1 <<< k - 1) < 2 ^ k
  rw [Nat.one_shiftLeft]; exact lt_of_land_mask

theorem rdList_lt : ∀ (m S : Nat), ∀ x ∈ (rdList m S).1, x < 512 := by
  intro m
  induction m with
  | zero => intro S x hx; exact absurd hx List.not_mem_nil
  | succ m ih =>
    intro S x hx
    have e : (rdList (m + 1) S).1 = rd 9 S :: (rdList m (sk 9 S)).1 := rfl
    rw [e] at hx
    rcases List.mem_cons.mp hx with h | h
    · rw [h]; exact lt_of_lt_of_eq (rd_lt 9 S) (by norm_num)
    · exact ih _ x h

theorem andLm_le (l : List Rec) : ∀ m, andLm l m ≤ m := by
  induction l with
  | nil => intro m; exact le_rfl
  | cons r l ih => intro m; exact le_trans (ih _) Nat.and_le_left
theorem andRm_le (l : List Rec) : ∀ m, andRm l m ≤ m := by
  induction l with
  | nil => intro m; exact le_rfl
  | cons r l ih => intro m; exact le_trans (ih _) Nat.and_le_left

theorem allnz_lt : ALLNZ < 2 ^ 512 := by decide +kernel

theorem kids_ok (f : Nat × Nat → Nat → Bool × Nat) : ∀ (cs : List (Nat × Nat)) (S : Nat),
    (@List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
      (fun p _ ihc S => let r := f p S; cond r.1 (ihc r.2) (false, r.2)) cs S).1 = true →
    ∀ p ∈ cs, ∃ S', (f p S').1 = true := by
  intro cs
  induction cs with
  | nil => intro S _ p hp; exact absurd hp List.not_mem_nil
  | cons q cs ih =>
    intro S h p hp
    have e : (@List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
        (fun p _ ihc S => let r := f p S; cond r.1 (ihc r.2) (false, r.2)) (q :: cs) S) =
        cond (f q S).1 (@List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
        (fun p _ ihc S => let r := f p S; cond r.1 (ihc r.2) (false, r.2)) cs (f q S).2) (false, (f q S).2) := rfl
    rw [e] at h
    cases hq : (f q S).1
    · rw [hq, cond_false] at h; exact absurd h Bool.false_ne_true
    · rw [hq, cond_true] at h
      rcases List.mem_cons.mp hp with e1 | e1
      · exact ⟨S, e1 ▸ hq⟩
      · exact ih _ h p e1

theorem mat_add_self (M : Matrix (Fin 9) (Fin 9) F2) : M + M = 0 := by
  ext i j; exact f2_add_self _

theorem sum_hitS_step (T n ACT X t : Nat) (htn : t < n) (hact : ACT.testBit t = true)
    (f : Nat → Matrix (Fin 9) (Fin 9) F2) :
    (∑ s ∈ hitS T n ACT X, f s) + (if par (aT T t &&& X) = true then f t else 0) =
      ∑ s ∈ hitS T n (ACT ^^^ 1 <<< t) X, f s := by
  have hmem : ∀ u, u ∈ hitS T n (ACT ^^^ 1 <<< t) X ↔ u ∈ hitS T n ACT X ∧ u ≠ t := by
    intro u
    simp only [mem_hitS, Nat.testBit_xor, Nat.one_shiftLeft, Nat.testBit_two_pow]
    by_cases e : u = t
    · subst e; simp [hact]
    · have e' : ¬ (t = u) := fun x => e x.symm
      simp [e', e]
  cases hp : par (aT T t &&& X)
  · rw [if_neg (by decide), add_zero]
    apply Finset.sum_congr _ (fun _ _ => rfl)
    ext u; rw [hmem]; constructor
    · intro hu; refine ⟨hu, fun e => ?_⟩
      rw [e, mem_hitS] at hu; rw [hu.2.2] at hp; exact absurd hp (by decide)
    · intro hu; exact hu.1
  · rw [if_pos rfl]
    have ht : t ∈ hitS T n ACT X := mem_hitS.mpr ⟨htn, hact, hp⟩
    have hset : hitS T n (ACT ^^^ 1 <<< t) X = (hitS T n ACT X).erase t := by
      ext u; rw [hmem, Finset.mem_erase]; tauto
    rw [hset, ← Finset.sum_erase_add _ _ ht, add_assoc, mat_add_self, add_zero]

/-! ## The `br` step -/

noncomputable def brNr (SS ACT : Nat) (asg : Asg) (nt : List Nat) : Bool × List Rec := mkRecs SS ACT asg nt []
noncomputable def brPart (SS ACT : Nat) (asg : Asg) (recs : List Rec) (a : Nat) (nt : List Nat) : List Rec :=
  thru a recs (thru a (brNr SS ACT asg nt).2 [])
noncomputable def brAllr (SS ACT : Nat) (asg : Asg) (recs : List Rec) (nt : List Nat) : List Rec :=
  app recs (brNr SS ACT asg nt).2
noncomputable def brB (part : List Rec) (sym : Bool) : Nat := andLm part (Nat.land ALLNZ (cond sym ORBM M512))
noncomputable def brCb (part : List Rec) : Nat := andRm part ALLNZ
noncomputable def brCs (part : List Rec) (ss : List (Bool × Nat × Nat)) (B Cb : Nat) (cdir : Bool) : List (Nat × Nat) :=
  cond cdir (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss B (bitsOf Cb))))
    (cond (Nat.beq B 0) [] (candsB part ss Cb (bitsOf B)))
/-- the candidate list of a `br` node -/
noncomputable def brCands (SS ACT : Nat) (asg : Asg) (recs : List Rec) (a : Nat) (nt sl : List Nat) (sym cdir : Bool) :
    List (Nat × Nat) :=
  brCs (brPart SS ACT asg recs a nt) (mkSls SS ACT asg sl).2 (brB (brPart SS ACT asg recs a nt) sym)
    (brCb (brPart SS ACT asg recs a nt)) cdir

/-- **`br` step.** If the node's runtime checks pass and every accepted child state is contradictory, the node's state
is contradictory: the true `(b_t, c_t)` (after the GL3 move at a `sym` root) is a candidate. -/
theorem br_step (T n dom : Nat) (hn : n ≤ 32) (SS : Nat) (hSS : SSok T n SS) (ACT : Nat) (asg : Asg) (recs : List Rec) (t : Nat) (sym cdir : Bool)
    (nt sl : List Nat) (hnt : ∀ x ∈ nt, x < 512) (hsl : ∀ x ∈ sl, x < 512)
    (h1 : bit ACT t = true) (h2 : ((!sym) || asg.isEmpty) = true) (h3 : allDom dom nt = true)
    (h4 : (mkRecs SS ACT asg nt []).1 = true) (h5 : allDom dom sl = true) (h6 : allThru (aT T t) sl = true)
    (h7 : (mkSls SS ACT asg sl).1 = true)
    (hkids : ∀ p ∈ brCands SS ACT asg recs (aT T t) nt sl sym cdir, ∀ b c : Nat → Nat,
      Inv T n dom b c (ACT ^^^ 1 <<< t) ((aT T t, p.1, p.2) :: asg)
        (updRecs (aT T t) p.1 p.2 (brAllr SS ACT asg recs nt)) → False)
    (b c : Nat → Nat) (hinv : Inv T n dom b c ACT asg recs) : False := by
  set nr := mkRecs SS ACT asg nt [] with hnr
  set part := thru (aT T t) recs (thru (aT T t) nr.2 []) with hpart
  set allr := app recs nr.2 with hallr
  set ss := mkSls SS ACT asg sl with hss
  set B := andLm part (Nat.land ALLNZ (cond sym ORBM M512)) with hB
  set Cb := andRm part ALLNZ with hCb
  set cs := brCands SS ACT asg recs (aT T t) nt sl sym cdir with hcs0
  have hcs : cs = cond cdir (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
      (cond (Nat.beq B 0) [] (candsB part ss.2 Cb (bitsOf B))) := rfl
  have hallr' : brAllr SS ACT asg recs nt = allr := rfl
  rw [hallr'] at hkids
  clear_value nr part allr ss B Cb cs
  have hact : ACT.testBit t = true := by rw [← bit_eq]; exact h1
  have htn : t < n := hinv.act t hact
  -- the decomposition to follow (moved by GL3 at a `sym` root)
  obtain ⟨b', c', hinv', horb⟩ : ∃ b' c' : Nat → Nat, Inv T n dom b' c' ACT asg recs ∧
      (sym = true → ORBM.testBit (b' t) = true) := by
    cases hs : sym
    · exact ⟨b, c, hinv, fun h => absurd h Bool.false_ne_true⟩
    · rw [hs] at h2
      have hasg : asg = [] := by simpa using h2
      have hrecs := hinv.root hasg
      subst hasg; subst hrecs
      obtain ⟨b', c', hbc', hd', ho⟩ := sym_transform hinv.bc hinv.hd t htn
      exact ⟨b', c', ⟨hinv.act, hbc', hinv.asg_lt, hd', fun _ => rfl, fun r hr => absurd hr List.not_mem_nil⟩,
        fun _ => ho⟩
  clear hinv
  obtain ⟨_, hb1, _, hc1⟩ := hinv'.bc t htn
  -- records and slack data
  have hnrok : ∀ r ∈ nr.2, RecOK T n b' c' ACT r := by
    intro r hr
    rw [hnr] at hr h4
    rcases mem_mkRecs _ _ _ _ _ h4 r hr with h | ⟨X, hX, hok, rfl⟩
    · exact absurd h List.not_mem_nil
    · exact mkRec_sound hn hSS hinv'.act hinv'.bc hinv'.asg_lt hinv'.hd X (hnt X hX) (allDom_spec dom nt h3 X hX) hok
  have hallok : ∀ r ∈ allr, RecOK T n b' c' ACT r := by
    intro r hr; rw [hallr] at hr
    rcases mem_app _ _ r hr with h | h
    · exact hinv'.recs r h
    · exact hnrok r h
  have hpartok : ∀ r ∈ part, RecOK T n b' c' ACT r ∧ t ∈ hitS T n ACT r.X := by
    intro r hr; rw [hpart] at hr
    have hthru : ∀ r, r ∈ recs ∨ r ∈ nr.2 → par (r.X &&& aT T t) = true →
        RecOK T n b' c' ACT r ∧ t ∈ hitS T n ACT r.X := by
      intro r hr hp
      refine ⟨?_, mem_hitS.mpr ⟨htn, hact, by rw [Nat.and_comm]; exact hp⟩⟩
      rcases hr with h | h
      · exact hinv'.recs r h
      · exact hnrok r h
    rcases mem_thru _ recs _ r hr with ⟨h, hp⟩ | h
    · exact hthru r (Or.inl h) hp
    · rcases mem_thru _ nr.2 [] r h with ⟨h', hp⟩ | h'
      · exact hthru r (Or.inr h') hp
      · exact absurd h' List.not_mem_nil
  have hssok : ∀ sd ∈ ss.2, sd.2.1.testBit (b' t) = true ∨ sd.2.2.testBit (c' t) = true := by
    intro sd hsd
    rw [hss] at hsd h7
    obtain ⟨X, hX, hok, rfl⟩ := mem_mkSls _ _ _ _ h7 sd hsd
    exact mkSl_sound hn hSS hinv'.act hinv'.bc hinv'.asg_lt hinv'.hd X (hsl X hX) (allDom_spec dom sl h5 X hX) hok t
      (mem_hitS.mpr ⟨htn, hact, allThru_spec _ sl h6 X hX⟩)
  -- the true factors pass every mask
  have hBlt : B < 2 ^ 512 := by
    rw [hB]; exact lt_of_le_of_lt (le_trans (andLm_le _ _) Nat.and_le_left) allnz_lt
  have hCblt : Cb < 2 ^ 512 := by
    rw [hCb]; exact lt_of_le_of_lt (andRm_le _ _) allnz_lt
  have hBbit : B.testBit (b' t) = true := by
    rw [hB]
    refine andLm_bit part _ _ ?_ (fun r hr => ((hpartok r hr).1.2.2 t (hpartok r hr).2).1)
    show (ALLNZ &&& cond sym ORBM M512).testBit (b' t) = true
    rw [Nat.testBit_and, allnz_bit]
    have h0 : decide (0 < b' t ∧ b' t < 512) = true := decide_eq_true ⟨by omega, hb1⟩
    rw [h0, Bool.true_and]
    cases hs : sym
    · rw [cond_false, m512_eq, Nat.testBit_two_pow_sub_one]; exact decide_eq_true hb1
    · rw [cond_true]; exact horb hs
  have hCbit : Cb.testBit (c' t) = true := by
    rw [hCb]
    refine andRm_bit part _ _ ?_ (fun r hr => ((hpartok r hr).1.2.2 t (hpartok r hr).2).2)
    rw [allnz_bit]; exact decide_eq_true ⟨by omega, hc1⟩
  have hcm : (cmS (b' t) ss.2 (cmT (b' t) part Cb)).testBit (c' t) = true := by
    apply cmS_bit _ _ _ _ _ hssok
    apply cmT_bit _ _ _ _ hCbit
    intro r hr
    rw [nperp_bit _ _ (xof_lt _ _) hc1, (hpartok r hr).1.2.1 t t (hpartok r hr).2 (hpartok r hr).2]
    simp
  have hbm : (bmS (c' t) ss.2 (bmT (c' t) part B)).testBit (b' t) = true := by
    apply bmS_bit _ _ _ _ _ (fun sd hsd => (hssok sd hsd).symm)
    apply bmT_bit _ _ _ _ hBbit
    intro r hr
    rw [nperp_bit _ _ (gof_lt _ _) hb1, par_gof_xof _ _ _ hb1 hc1,
      (hpartok r hr).1.2.1 t t (hpartok r hr).2 (hpartok r hr).2]
    simp
  have hmem : (b' t, c' t) ∈ cs := by
    rw [hcs]
    have hB0 : Nat.beq B 0 = false := by
      cases e : Nat.beq B 0
      · rfl
      · rw [Nat.eq_of_beq_eq_true e, Nat.zero_testBit] at hBbit; exact absurd hBbit Bool.false_ne_true
    have hC0 : Nat.beq Cb 0 = false := by
      cases e : Nat.beq Cb 0
      · rfl
      · rw [Nat.eq_of_beq_eq_true e, Nat.zero_testBit] at hCbit; exact absurd hCbit Bool.false_ne_true
    cases cdir
    · rw [cond_false, hB0, cond_false]
      exact candsB_mem part ss.2 Cb hCblt (b' t) (c' t) (bitsOf B) (bitsOf_mem B hBlt _ hBbit) hcm
    · rw [cond_true, hC0, cond_false, hB0, cond_false]
      exact candsC_mem part ss.2 B hBlt (c' t) (b' t) (bitsOf Cb) (bitsOf_mem Cb hCblt _ hCbit) hbm
  refine hkids _ hmem b' c' ⟨?_, hinv'.bc, ?_, ?_, fun h => absurd h (List.cons_ne_nil _ _), ?_⟩
  · intro u hu
    rw [Nat.testBit_xor, Nat.one_shiftLeft, Nat.testBit_two_pow] at hu
    by_cases e : u = t
    · rw [e]; exact htn
    · have e' : ¬ (t = u) := fun x => e x.symm
      simp only [e', decide_false, Bool.xor_false] at hu
      exact hinv'.act u hu
  · intro e he
    rcases List.mem_cons.mp he with h | h
    · rw [h]; exact ⟨hb1, hc1⟩
    · exact hinv'.asg_lt e h
  · intro X hX hdom
    rw [resM_cons, hinv'.hd X hX hdom]
    exact sum_hitS_step T n ACT X t htn hact (fun s => vecMulVec (nv (b' s)) (nv (c' s)))
  · intro r hr
    obtain ⟨r0, hr0, h⟩ := mem_updRecs (aT T t) (b' t) (c' t) allr r hr
    obtain ⟨u1, u2⟩ := updRec_ok hinv'.bc t htn hact r0 (hallok r0 hr0)
    rcases h with ⟨hp, rfl⟩ | ⟨hp, rfl⟩
    · exact u1 hp
    · exact u2 hp

/-- **`over` step.** -/
theorem over_step (T n dom : Nat) (hn : n ≤ 32) (SS : Nat) (hSS : SSok T n SS) (ACT : Nat) (asg : Asg) (recs : List Rec) (X : Nat) (hX : X < 512)
    (h : (bit dom X && elimOk (elim (resC X asg)) && Nat.blt (ucnt SS ACT X) (elim (resC X asg)).rk) = true)
    (b c : Nat → Nat) (hinv : Inv T n dom b c ACT asg recs) : False := by
  simp only [Bool.and_eq_true, Nat.blt_eq, bit_eq] at h
  obtain ⟨⟨hdom, hok⟩, hlt⟩ := h
  obtain ⟨hA, hRI⟩ := resC_sem _ hX asg hinv.asg_lt
  have hf := elim_facts _ hRI hok
  rw [hA] at hf
  have hrk := rank_ge_elim hf
  rw [hinv.hd _ hX hdom] at hrk
  have hle := rank_sum_le (hitS T n ACT X) (fun t => nv (b t)) (fun t => nv (c t))
  rw [ucnt_eq' T n ACT _ SS hSS hn hX hinv.act] at hlt
  omega

/-- one node of `checkS`, with the recursive call `ih` -/
noncomputable def nodeS (ih : Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat) (TERMS SS ACT : Nat) (asg : Asg)
    (recs : List Rec) (dom S : Nat) : Bool × Nat :=
      cond (Nat.beq (rd 1 S) 0)
        (let X := rd 9 (sk 1 S)
         let s := elim (resC X asg)
         (bit dom X && elimOk s && Nat.blt (ucnt SS ACT X) s.rk, sk 10 S))
        (let S1 := sk 1 S
         let t := rd 5 S1
         let sym := Nat.beq (rd 1 (sk 5 S1)) 1
         let cdir := Nat.beq (rd 1 (sk 6 S1)) 1
         let ntr := rdList (rd 4 (sk 7 S1)) (sk 11 S1)
         let slr := rdList (rd 3 ntr.2) (sk 3 ntr.2)
         let nt := ntr.1
         let sl := slr.1
         let a := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
         let nr := mkRecs SS ACT asg nt []
         let part := thru a recs (thru a nr.2 [])
         let allr := app recs nr.2
         let ss := mkSls SS ACT asg sl
         let B := andLm part (Nat.land ALLNZ (cond sym ORBM M512))
         let Cb := andRm part ALLNZ
         let cs : List (Nat × Nat) := cond cdir
           (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
           (cond (Nat.beq B 0) [] (candsB part ss.2 Cb (bitsOf B)))
         let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
         let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
           (fun p _ ihc S => let r := ih TERMS SS ACT' ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
              cond r.1 (ihc r.2) (false, r.2)) cs slr.2
         (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 && kr.1,
           kr.2))

theorem checkS_succ (fuel TERMS SS ACT : Nat) (asg : Asg) (recs : List Rec) (dom S : Nat) :
    checkS (fuel + 1) TERMS SS ACT asg recs dom S = nodeS (checkS fuel) TERMS SS ACT asg recs dom S := rfl

/-- **Soundness of the node induction** (stream certificates). An accepted subtree admits no decomposition in state
`Inv`. -/
theorem checkS_sound (T n dom : Nat) (hn : n ≤ 31) : ∀ fuel ACT asg recs S,
    (checkS fuel T (mkSSP T n) ACT asg recs dom S).1 = true → ∀ b c, Inv T n dom b c ACT asg recs → False := by
  intro fuel
  induction fuel with
  | zero => intro ACT asg recs S h; exact absurd h Bool.false_ne_true
  | succ fuel ih =>
    intro ACT asg recs S hchk b c hinv
    rw [checkS_succ] at hchk
    unfold nodeS at hchk
    revert hchk
    cases hb : Nat.beq (rd 1 S) 0
    · rw [cond_false]
      show let S1 := sk 1 S
        let t := rd 5 S1
        let sym := Nat.beq (rd 1 (sk 5 S1)) 1
        let cdir := Nat.beq (rd 1 (sk 6 S1)) 1
        let ntr := rdList (rd 4 (sk 7 S1)) (sk 11 S1)
        let slr := rdList (rd 3 ntr.2) (sk 3 ntr.2)
        let nt := ntr.1
        let sl := slr.1
        let a := Nat.land (Nat.shiftRight T (Nat.mul 9 t)) 511
        let nr := mkRecs (mkSSP T n) ACT asg nt []
        let part := thru a recs (thru a nr.2 [])
        let allr := app recs nr.2
        let ss := mkSls (mkSSP T n) ACT asg sl
        let B := andLm part (Nat.land ALLNZ (cond sym ORBM M512))
        let Cb := andRm part ALLNZ
        let cs : List (Nat × Nat) := cond cdir
          (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
          (cond (Nat.beq B 0) [] (candsB part ss.2 Cb (bitsOf B)))
        let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
        let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
          (fun p _ ihc S => let r := checkS fuel T (mkSSP T n) ACT' ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
             cond r.1 (ihc r.2) (false, r.2)) cs slr.2
        (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 &&
          kr.1) = true → False
      intro S1 t sym cdir ntr slr nt sl a nr part allr ss B Cb cs ACT' kr hchk
      have ha : a = aT T t := rfl
      have hcs : cs = brCands (mkSSP T n) ACT asg recs a nt sl sym cdir := rfl
      have hallr : allr = brAllr (mkSSP T n) ACT asg recs nt := rfl
      have hnr : nr = mkRecs (mkSSP T n) ACT asg nt [] := rfl
      have hss : ss = mkSls (mkSSP T n) ACT asg sl := rfl
      have hACT' : ACT' = ACT ^^^ 1 <<< t := rfl
      have hkr : kr = @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
          (fun p _ ihc S => let r := checkS fuel T (mkSSP T n) ACT' ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
             cond r.1 (ihc r.2) (false, r.2)) cs slr.2 := rfl
      have hnt : ∀ x ∈ nt, x < 512 := rdList_lt _ _
      have hsl : ∀ x ∈ sl, x < 512 := rdList_lt _ _
      clear_value S1 t sym cdir ntr slr nt sl a nr part allr ss B Cb cs ACT' kr
      subst ha hcs hallr hnr hss hACT' hkr
      simp only [Bool.and_eq_true] at hchk
      obtain ⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩ := hchk
      refine br_step T n dom (by omega) (mkSSP T n) (mkSSP_ok T n (by omega)) ACT asg recs t sym cdir nt sl hnt hsl h1 h2 h3 h4 h5 h6 h7 ?_ b c hinv
      intro p hp b' c' hinv'
      obtain ⟨S', hS'⟩ := kids_ok (fun p S => checkS fuel T (mkSSP T n) (ACT ^^^ 1 <<< t) ((aT T t, p.1, p.2) :: asg)
        (updRecs (aT T t) p.1 p.2 (brAllr (mkSSP T n) ACT asg recs nt)) dom S) _ slr.2 h8 p hp
      exact ih _ _ _ S' hS' b' c' hinv'
    · rw [cond_true]
      intro hchk
      exact over_step T n dom (by omega) (mkSSP T n) (mkSSP_ok T n (by omega)) ACT asg recs _ (lt_of_lt_of_eq (rd_lt 9 _) (by norm_num)) hchk b c hinv

end S5
