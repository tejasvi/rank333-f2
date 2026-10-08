module
public import R22Port.U_d41d8cd98f00
public import S6.Check6
public import S7.Corb
public import BranchCheck7s
/-! # The node induction for BranchCheck v7s, and the leaf and batch theorems

S6's induction (`S6.Check6`) with v7's candidate loop: at a `sym` node with `cdir = false` the `c`-mask of a candidate `b`
starts from `Cb ∧ CORB[b]` (`BC7s.candsB7`).  The true pair is still a candidate because the GL3 move of the root is
`sym_transform7` (`b_t ∈ ORBM` and `c_t ∈ CORB[b_t]`).  Claims, records and the Lemma G masks are S6's. -/
@[expose] public section
namespace S7
open BC4 BC5 BC6 BC6s BC7s S5 S6 RootSound Matrix BC7T

theorem candsB7_mem (sym : Bool) (part : List Rec) (ss : List (Bool × Nat × Nat)) (cb : Nat) (hcb : cb < 2 ^ 512)
    (bb w : Nat) : ∀ bs : List Nat, bb ∈ bs →
      (cmS bb ss (cmT bb part (cond sym (Nat.land cb (corbM bb)) cb))).testBit w = true → (bb, w) ∈ candsB7 sym part ss cb bs := by
  intro bs
  induction bs with
  | nil => intro h; exact absurd h List.not_mem_nil
  | cons b' bs ih =>
    intro hb hw
    have e : candsB7 sym part ss cb (b' :: bs) =
        pairs true b' (cmS b' ss (cmT b' part (cond sym (Nat.land cb (corbM b')) cb))) (candsB7 sym part ss cb bs) := rfl
    rw [e]
    have hlt : ∀ b'', cmS b'' ss (cmT b'' part (cond sym (Nat.land cb (corbM b'')) cb)) < 2 ^ 512 := by
      intro b''
      refine lt_of_le_of_lt (le_trans (cmS_le _ _ _) (cmT_le _ _ _)) ?_
      cases sym
      · rw [cond_false]; exact hcb
      · rw [cond_true, Nat.land_eq]; exact lt_of_le_of_lt Nat.and_le_left hcb
    rcases List.mem_cons.mp hb with h | h
    · subst h; exact (pairs_mem true bb _ _ (hlt bb)).2 w hw
    · exact (pairs_mem true b' _ _ (hlt b')).1 _ (ih h hw)

/-! ## The `br` step -/

noncomputable def brNr7 (SS ACT : Nat) (asg : Asg) (nt : List Nat) : Bool × List Rec := mkRecs6 SS ACT asg nt []
noncomputable def brPart7 (SS ACT : Nat) (asg : Asg) (recs : List Rec) (a : Nat) (nt : List Nat) : List Rec :=
  thru a recs (thru a (brNr7 SS ACT asg nt).2 [])
noncomputable def brAllr7 (SS ACT : Nat) (asg : Asg) (recs : List Rec) (nt : List Nat) : List Rec :=
  app recs (brNr7 SS ACT asg nt).2
noncomputable def brCands7 (SS ACT need : Nat) (asg : Asg) (recs : List Rec) (t a : Nat) (nt sl : List Nat) (sym cdir : Bool) :
    List (Nat × Nat) :=
  let part := brPart7 SS ACT asg recs a nt
  let ss := mkSls6 SS ACT asg sl
  let B := andLm part (Nat.land (Nat.land ALLNZ (lgMask need t)) (cond sym ORBM M512))
  let Cb := andRm part (Nat.land ALLNZ (lgMask need t))
  cond cdir (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
    (cond (Nat.beq B 0) [] (candsB7 sym part ss.2 Cb (bitsOf B)))

/-- **`br` step (v6).** -/
theorem br_step7 (T n dom need : Nat) (hn : n ≤ 32) (SS : Nat) (hSS : SSok T n SS) (ACT : Nat) (asg : Asg) (recs : List Rec)
    (t : Nat) (sym cdir : Bool) (nt sl : List Nat) (hnt : ∀ x ∈ nt, x < 512) (hsl : ∀ x ∈ sl, x < 512)
    (h1 : bit ACT t = true) (h2 : ((!sym) || asg.isEmpty) = true) (h3 : allDom dom nt = true)
    (h4 : (mkRecs6 SS ACT asg nt []).1 = true) (h5 : allDom dom sl = true) (h6 : allThru (aT T t) sl = true)
    (h7 : (mkSls6 SS ACT asg sl).1 = true)
    (hkids : ∀ p ∈ brCands7 SS ACT need asg recs t (aT T t) nt sl sym cdir, ∀ b c : Nat → Nat,
      Inv T n dom b c (ACT ^^^ 1 <<< t) ((aT T t, p.1, p.2) :: asg)
        (updRecs (aT T t) p.1 p.2 (brAllr7 SS ACT asg recs nt)) → LGok n need b c → False)
    (b c : Nat → Nat) (hinv : Inv T n dom b c ACT asg recs) (hlg : LGok n need b c) : False := by
  set nr := mkRecs6 SS ACT asg nt [] with hnr
  set part := thru (aT T t) recs (thru (aT T t) nr.2 []) with hpart
  set allr := app recs nr.2 with hallr
  set ss := mkSls6 SS ACT asg sl with hss
  set lgm := lgMask need t with hlgm
  set B := andLm part (Nat.land (Nat.land ALLNZ lgm) (cond sym ORBM M512)) with hB
  set Cb := andRm part (Nat.land ALLNZ lgm) with hCb
  set cs := brCands7 SS ACT need asg recs t (aT T t) nt sl sym cdir with hcs0
  have hcs : cs = cond cdir (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
      (cond (Nat.beq B 0) [] (candsB7 sym part ss.2 Cb (bitsOf B))) := rfl
  have hallr' : brAllr7 SS ACT asg recs nt = allr := rfl
  rw [hallr'] at hkids
  clear_value nr part allr ss lgm B Cb cs
  have hact : ACT.testBit t = true := by rw [← bit_eq]; exact h1
  have htn : t < n := hinv.act t hact
  -- the decomposition to follow (moved by GL3 at a `sym` root), with the Lemma G masks kept
  obtain ⟨b', c', hinv', hlg', horb, hcorb⟩ : ∃ b' c' : Nat → Nat, Inv T n dom b' c' ACT asg recs ∧ LGok n need b' c' ∧
      (sym = true → ORBM.testBit (b' t) = true) ∧ (sym = true → (corbM (b' t)).testBit (c' t) = true) := by
    cases hs : sym
    · exact ⟨b, c, hinv, hlg, fun h => absurd h Bool.false_ne_true, fun h => absurd h Bool.false_ne_true⟩
    · rw [hs] at h2
      have hasg : asg = [] := by simpa using h2
      have hrecs := hinv.root hasg
      subst hasg; subst hrecs
      obtain ⟨b', c', hbc', hd', ho, hco, hrk⟩ := sym_transform7 hinv.bc hinv.hd t htn
      refine ⟨b', c', ⟨hinv.act, hbc', hinv.asg_lt, hd', fun _ => rfl, fun r hr => absurd hr List.not_mem_nil⟩,
        fun u hu => ?_, fun _ => ho, fun _ => hco⟩
      obtain ⟨_, hb, _, hc⟩ := hinv.bc u hu
      obtain ⟨_, hb', _, hc'⟩ := hbc' u hu
      obtain ⟨e1, e2⟩ := hrk u hu
      obtain ⟨l1, l2⟩ := hlg u hu
      rw [lgMask_bit _ _ _ hb] at l1
      rw [lgMask_bit _ _ _ hc] at l2
      rw [lgMask_bit _ _ _ hb', lgMask_bit _ _ _ hc', e1, e2]
      exact ⟨l1, l2⟩
  clear hinv hlg
  obtain ⟨_, hb1, _, hc1⟩ := hinv'.bc t htn
  -- records and slack data
  have hnrok : ∀ r ∈ nr.2, RecOK T n b' c' ACT r := by
    intro r hr
    rw [hnr] at hr h4
    rcases mem_mkRecs6 _ _ _ _ _ h4 r hr with h | ⟨X, hX, hok, rfl⟩
    · exact absurd h List.not_mem_nil
    · exact mkRec6_sound hn hSS hinv'.act hinv'.bc hinv'.asg_lt hinv'.hd X (hnt X hX) (allDom_spec dom nt h3 X hX) hok
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
    obtain ⟨X, hX, hok, rfl⟩ := mem_mkSls6 _ _ _ _ h7 sd hsd
    exact mkSl6_sound hn hSS hinv'.act hinv'.bc hinv'.asg_lt hinv'.hd X (hsl X hX) (allDom_spec dom sl h5 X hX) hok t
      (mem_hitS.mpr ⟨htn, hact, allThru_spec _ sl h6 X hX⟩)
  -- the true factors pass every mask
  obtain ⟨hlgb, hlgc⟩ := hlg' t htn
  have hBlt : B < 2 ^ 512 := by
    rw [hB]; exact lt_of_le_of_lt (le_trans (andLm_le _ _) (le_trans Nat.and_le_left Nat.and_le_left)) allnz_lt
  have hCblt : Cb < 2 ^ 512 := by
    rw [hCb]; exact lt_of_le_of_lt (le_trans (andRm_le _ _) Nat.and_le_left) allnz_lt
  have hBbit : B.testBit (b' t) = true := by
    rw [hB]
    refine andLm_bit part _ _ ?_ (fun r hr => ((hpartok r hr).1.2.2 t (hpartok r hr).2).1)
    show ((ALLNZ &&& lgm) &&& cond sym ORBM M512).testBit (b' t) = true
    rw [Nat.testBit_and, Nat.testBit_and, allnz_bit, hlgm, hlgb]
    have h0 : decide (0 < b' t ∧ b' t < 512) = true := decide_eq_true ⟨by omega, hb1⟩
    rw [h0, Bool.true_and, Bool.true_and]
    cases hs : sym
    · rw [cond_false, m512_eq, Nat.testBit_two_pow_sub_one]; exact decide_eq_true hb1
    · rw [cond_true]; exact horb hs
  have hCbit : Cb.testBit (c' t) = true := by
    rw [hCb]
    refine andRm_bit part _ _ ?_ (fun r hr => ((hpartok r hr).1.2.2 t (hpartok r hr).2).2)
    show (ALLNZ &&& lgm).testBit (c' t) = true
    rw [Nat.testBit_and, allnz_bit, hlgm, hlgc]
    exact Bool.and_true _ ▸ decide_eq_true ⟨by omega, hc1⟩
  have hCbit7 : (cond sym (Nat.land Cb (corbM (b' t))) Cb).testBit (c' t) = true := by
    cases hs : sym
    · rw [cond_false]; exact hCbit
    · rw [cond_true, Nat.land_eq, Nat.testBit_and, hCbit, hcorb hs]; rfl
  have hcm : (cmS (b' t) ss.2 (cmT (b' t) part (cond sym (Nat.land Cb (corbM (b' t))) Cb))).testBit (c' t) = true := by
    apply cmS_bit _ _ _ _ _ hssok
    apply cmT_bit _ _ _ _ hCbit7
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
      exact candsB7_mem sym part ss.2 Cb hCblt (b' t) (c' t) (bitsOf B) (bitsOf_mem B hBlt _ hBbit) hcm
    · rw [cond_true, hC0, cond_false, hB0, cond_false]
      exact candsC_mem part ss.2 B hBlt (c' t) (b' t) (bitsOf Cb) (bitsOf_mem Cb hCblt _ hCbit) hbm
  refine hkids _ hmem b' c' ⟨?_, hinv'.bc, ?_, ?_, fun h => absurd h (List.cons_ne_nil _ _), ?_⟩ hlg'
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

/-- **`over` step (v6).** -/
theorem over_step7 (T n dom : Nat) (hn : n ≤ 32) (SS : Nat) (hSS : SSok T n SS) (ACT : Nat) (asg : Asg) (recs : List Rec)
    (X : Nat) (hX : X < 512) (h : (bit dom X && over6 SS ACT asg X) = true)
    (b c : Nat → Nat) (hinv : Inv T n dom b c ACT asg recs) : False := by
  rw [Bool.and_eq_true, bit_eq] at h
  exact over6_false hn hSS hinv.act hinv.asg_lt hinv.hd X hX h.1 h.2

/-- one node of `BC7s.checkS`, with the recursive call `ih` -/
noncomputable def nodeS7 (ih : Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat) (TERMS SS ACT need : Nat)
    (asg : Asg) (recs : List Rec) (dom S : Nat) : Bool × Nat :=
      cond (Nat.beq (rd 1 S) 0)
        (let X := rd 9 (sk 1 S)
         (bit dom X && over6 SS ACT asg X, sk 10 S))
        (let S1 := sk 1 S
         let t := rd 5 S1
         let sym := Nat.beq (rd 1 (sk 5 S1)) 1
         let cdir := Nat.beq (rd 1 (sk 6 S1)) 1
         let ntr := rdList (rd 4 (sk 7 S1)) (sk 11 S1)
         let slr := rdList (rd 3 ntr.2) (sk 3 ntr.2)
         let nt := ntr.1
         let sl := slr.1
         let a := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
         let nr := mkRecs6 SS ACT asg nt []
         let part := thru a recs (thru a nr.2 [])
         let allr := app recs nr.2
         let ss := mkSls6 SS ACT asg sl
         let lgm := lgMask need t
         let B := andLm part (Nat.land (Nat.land ALLNZ lgm) (cond sym ORBM M512))
         let Cb := andRm part (Nat.land ALLNZ lgm)
         let cs : List (Nat × Nat) := cond cdir
           (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
           (cond (Nat.beq B 0) [] (candsB7 sym part ss.2 Cb (bitsOf B)))
         let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
         let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
           (fun p _ ihc S => let r := ih TERMS SS ACT' need ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
              cond r.1 (ihc r.2) (false, r.2)) cs slr.2
         (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 && kr.1,
          kr.2))

theorem checkS7_succ (fuel TERMS SS ACT need : Nat) (asg : Asg) (recs : List Rec) (dom S : Nat) :
    BC7s.checkS (fuel + 1) TERMS SS ACT need asg recs dom S = nodeS7 (BC7s.checkS fuel) TERMS SS ACT need asg recs dom S := rfl

/-- **Soundness of the node induction (v6).** -/
theorem checkS7_sound (T n dom need : Nat) (hn : n ≤ 31) : ∀ fuel ACT asg recs S,
    (BC7s.checkS fuel T (mkSSP T n) ACT need asg recs dom S).1 = true →
      ∀ b c, Inv T n dom b c ACT asg recs → LGok n need b c → False := by
  intro fuel
  induction fuel with
  | zero => intro ACT asg recs S h; exact absurd h Bool.false_ne_true
  | succ fuel ih =>
    intro ACT asg recs S hchk b c hinv hlg
    rw [checkS7_succ] at hchk
    unfold nodeS7 at hchk
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
        let nr := mkRecs6 (mkSSP T n) ACT asg nt []
        let part := thru a recs (thru a nr.2 [])
        let allr := app recs nr.2
        let ss := mkSls6 (mkSSP T n) ACT asg sl
        let lgm := lgMask need t
        let B := andLm part (Nat.land (Nat.land ALLNZ lgm) (cond sym ORBM M512))
        let Cb := andRm part (Nat.land ALLNZ lgm)
        let cs : List (Nat × Nat) := cond cdir
          (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
          (cond (Nat.beq B 0) [] (candsB7 sym part ss.2 Cb (bitsOf B)))
        let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
        let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
          (fun p _ ihc S => let r := BC7s.checkS fuel T (mkSSP T n) ACT' need ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
             cond r.1 (ihc r.2) (false, r.2)) cs slr.2
        (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 &&
          kr.1) = true → False
      intro S1 t sym cdir ntr slr nt sl a nr part allr ss lgm B Cb cs ACT' kr hchk
      have ha : a = aT T t := rfl
      have hcs : cs = brCands7 (mkSSP T n) ACT need asg recs t a nt sl sym cdir := rfl
      have hallr : allr = brAllr7 (mkSSP T n) ACT asg recs nt := rfl
      have hnr : nr = mkRecs6 (mkSSP T n) ACT asg nt [] := rfl
      have hss : ss = mkSls6 (mkSSP T n) ACT asg sl := rfl
      have hACT' : ACT' = ACT ^^^ 1 <<< t := rfl
      have hkr : kr = @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
          (fun p _ ihc S => let r := BC7s.checkS fuel T (mkSSP T n) ACT' need ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
             cond r.1 (ihc r.2) (false, r.2)) cs slr.2 := rfl
      have hnt : ∀ x ∈ nt, x < 512 := rdList_lt _ _
      have hsl : ∀ x ∈ sl, x < 512 := rdList_lt _ _
      clear_value S1 t sym cdir ntr slr nt sl a nr part allr ss lgm B Cb cs ACT' kr
      subst ha hcs hallr hnr hss hACT' hkr
      simp only [Bool.and_eq_true] at hchk
      obtain ⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩ := hchk
      refine br_step7 T n dom need (by omega) (mkSSP T n) (mkSSP_ok T n (by omega)) ACT asg recs t sym cdir nt sl hnt hsl
        h1 h2 h3 h4 h5 h6 h7 ?_ b c hinv hlg
      intro p hp b' c' hinv' hlg'
      obtain ⟨S', hS'⟩ := kids_ok (fun p S => BC7s.checkS fuel T (mkSSP T n) (ACT ^^^ 1 <<< t) need ((aT T t, p.1, p.2) :: asg)
        (updRecs (aT T t) p.1 p.2 (brAllr7 (mkSSP T n) ACT asg recs nt)) dom S) _ slr.2 h8 p hp
      exact ih _ _ _ S' hS' b' c' hinv' hlg'
    · rw [cond_true]
      intro hchk
      exact over_step7 T n dom (by omega) (mkSSP T n) (mkSSP_ok T n (by omega)) ACT asg recs _
        (lt_of_lt_of_eq (rd_lt 9 _) (by norm_num)) hchk b c hinv

end S7
