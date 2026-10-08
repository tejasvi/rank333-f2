module
public import R22Port.U_d41d8cd98f00
public import S7.Leaf7
public import BranchCheck7x
/-! # Soundness of split leaves (BranchCheck v7x)

`checkSX_sound`: an accepted main record refutes every decomposition at its node, given that every decomposition at the end
state of each external path is refuted.  `subOK_sound`: an accepted sub-record refutes every decomposition at the end state of
its path (`walk`).  `leafSplit_sound`: an accepted main record with an accepted sub-record for each of its external paths
refutes the leaf. -/
@[expose] public section
namespace S7X
open BC4 BC5 BC6 BC6s BC7s BC7x S5 S6 S7 RootSound Matrix BC7T

theorem walk_append (TERMS SS need : Nat) : ∀ (P : List Step) (st : Nat × Asg × List Rec) (s : Step),
    walk TERMS SS need st (P ++ [s]) =
      walk TERMS SS need (walk TERMS SS need st P) [s] := by
  intro P
  induction P with
  | nil => intro st s; rfl
  | cons s0 P ih =>
    intro st s
    obtain ⟨t, sym, cdir, nt, sl, i⟩ := s0
    show walk TERMS SS need _ (P ++ [s]) = walk TERMS SS need (walk TERMS SS need _ P) [s]
    exact ih _ s

/-- the kids loop of `checkSX` -/
noncomputable def kloop (f : Nat × Nat → Nat → List (List Step) → Nat → Bool × List (List Step) × Nat) (cs : List (Nat × Nat))
    (i : Nat) (ps : List (List Step)) (S : Nat) : Bool × List (List Step) × Nat :=
  @List.rec (Nat × Nat) (fun _ => Nat → List (List Step) → Nat → Bool × List (List Step) × Nat)
    (fun _ ps S => (true, ps, S))
    (fun p _ ihc i ps S => let r := f p i ps S; cond r.1 (ihc (Nat.succ i) r.2.1 r.2.2) (false, r.2.1, r.2.2)) cs i ps S

theorem kloop_cons (f : Nat × Nat → Nat → List (List Step) → Nat → Bool × List (List Step) × Nat) (q : Nat × Nat)
    (cs : List (Nat × Nat)) (i : Nat) (ps : List (List Step)) (S : Nat) :
    kloop f (q :: cs) i ps S =
      cond (f q i ps S).1 (kloop f cs (Nat.succ i) (f q i ps S).2.1 (f q i ps S).2.2) (false, (f q i ps S).2.1, (f q i ps S).2.2) :=
  rfl

theorem kloop_ps (f : Nat × Nat → Nat → List (List Step) → Nat → Bool × List (List Step) × Nat)
    (hf : ∀ p i ps S, ∀ P ∈ (f p i ps S).2.1, P ∈ ps) :
    ∀ cs i ps S, ∀ P ∈ (kloop f cs i ps S).2.1, P ∈ ps := by
  intro cs
  induction cs with
  | nil => intro i ps S P hP; exact hP
  | cons q cs ih =>
    intro i ps S P hP
    rw [kloop_cons] at hP
    cases hq : (f q i ps S).1
    · rw [hq, cond_false] at hP; exact hf q i ps S P hP
    · rw [hq, cond_true] at hP; exact hf q i ps S P (ih _ _ _ P hP)

theorem kloop_ok (f : Nat × Nat → Nat → List (List Step) → Nat → Bool × List (List Step) × Nat)
    (hf : ∀ p i ps S, ∀ P ∈ (f p i ps S).2.1, P ∈ ps) :
    ∀ cs i ps S, (kloop f cs i ps S).1 = true →
      ∀ j < cs.length, ∃ ps' S', (∀ P ∈ ps', P ∈ ps) ∧ (f (cs.getD j (0, 0)) (i + j) ps' S').1 = true := by
  intro cs
  induction cs with
  | nil => intro i ps S _ j hj; exact absurd hj (by simp)
  | cons q cs ih =>
    intro i ps S h j hj
    rw [kloop_cons] at h
    cases hq : (f q i ps S).1
    · rw [hq, cond_false] at h; exact absurd h Bool.false_ne_true
    · rw [hq, cond_true] at h
      rcases j with _ | j
      · exact ⟨ps, S, fun P hP => hP, by simpa using hq⟩
      · obtain ⟨ps', S', hps', hS'⟩ := ih (Nat.succ i) _ _ h j (by simp at hj; omega)
        refine ⟨ps', S', fun P hP => hf q i ps S P (hps' P hP), ?_⟩
        simp only [List.getD_cons_succ]
        rw [show i + (j + 1) = Nat.succ i + j by omega]; exact hS'

theorem cands_eq (T SS ACT need : Nat) (asg : Asg) (recs : List Rec) (t : Nat) (sym cdir : Bool) (nt sl : List Nat) :
    cands T SS ACT need asg recs t sym cdir nt sl = brCands7 SS ACT need asg recs t (aT T t) nt sl sym cdir := rfl

theorem childSt_eq (T SS ACT : Nat) (asg : Asg) (recs : List Rec) (t : Nat) (nt : List Nat) (p : Nat × Nat) :
    childSt T SS ACT asg recs t nt p =
      (ACT ^^^ 1 <<< t, (aT T t, p.1, p.2) :: asg, updRecs (aT T t) p.1 p.2 (brAllr7 SS ACT asg recs nt)) := rfl

theorem checkSX_unf (fuel TERMS SS ACT need : Nat) (asg : Asg) (recs : List Rec) (dom : Nat) (pth : List Step)
    (ps : List (List Step)) (S : Nat) :
    checkSX (fuel + 1) TERMS SS ACT need asg recs dom pth ps S =
      cond (Nat.beq (rd 1 S) 0)
        (cond (Nat.beq (rd 9 (sk 1 S)) 0)
           (@List.rec (List Step) (fun _ => Bool × List (List Step) × Nat) (false, [], sk 10 S)
              (fun P ps' _ => (P == pth.reverse, ps', sk 10 S)) ps)
           (bit dom (rd 9 (sk 1 S)) && over6 SS ACT asg (rd 9 (sk 1 S)), ps, sk 10 S))
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
         let cs := cands TERMS SS ACT need asg recs t sym cdir nt sl
         let ss := mkSls6 SS ACT asg sl
         let kr := kloop (fun p i ps S => checkSX fuel TERMS SS (childSt TERMS SS ACT asg recs t nt p).1 need
             (childSt TERMS SS ACT asg recs t nt p).2.1 (childSt TERMS SS ACT asg recs t nt p).2.2 dom
             ((t, sym, cdir, nt, sl, i) :: pth) ps S) cs 0 ps slr.2
         (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 && kr.1,
          kr.2.1, kr.2.2)) := rfl

theorem checkSX_ps (TERMS SS need dom : Nat) : ∀ fuel ACT asg recs pth ps S,
    ∀ P ∈ (checkSX fuel TERMS SS ACT need asg recs dom pth ps S).2.1, P ∈ ps := by
  intro fuel
  induction fuel with
  | zero => intro ACT asg recs pth ps S P hP; exact hP
  | succ fuel ih =>
    intro ACT asg recs pth ps S P hP
    rw [checkSX_unf] at hP
    revert hP
    cases Nat.beq (rd 1 S) 0
    · rw [cond_false]
      intro hP
      exact kloop_ps _ (fun p i ps S => ih _ _ _ _ ps S) _ _ _ _ P hP
    · rw [cond_true]
      cases Nat.beq (rd 9 (sk 1 S)) 0
      · rw [cond_false]; intro hP; exact hP
      · rw [cond_true]
        cases ps with
        | nil => intro hP; exact absurd hP List.not_mem_nil
        | cons Q ps' => intro hP; exact List.mem_cons_of_mem _ hP

/-- **Main records.** -/
theorem checkSX_sound (T n dom need : Nat) (hn : n ≤ 31) (root : Nat × Asg × List Rec) (paths : List (List Step))
    (H : ∀ P ∈ paths, ∀ b c, Inv T n dom b c (walk T (mkSSP T n) need root P).1 (walk T (mkSSP T n) need root P).2.1
      (walk T (mkSSP T n) need root P).2.2 → LGok n need b c → False) :
    ∀ fuel ACT asg recs (pth : List Step) (ps : List (List Step)) S, (∀ P ∈ ps, P ∈ paths) →
      (ACT, asg, recs) = walk T (mkSSP T n) need root pth.reverse →
      (checkSX fuel T (mkSSP T n) ACT need asg recs dom pth ps S).1 = true →
      ∀ b c, Inv T n dom b c ACT asg recs → LGok n need b c → False := by
  intro fuel
  induction fuel with
  | zero => intro ACT asg recs pth ps S _ _ h; exact absurd h Bool.false_ne_true
  | succ fuel ih =>
    intro ACT asg recs pth ps S hps hst hchk b c hinv hlg
    rw [checkSX_unf] at hchk
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
        let cs := cands T (mkSSP T n) ACT need asg recs t sym cdir nt sl
        let ss := mkSls6 (mkSSP T n) ACT asg sl
        let kr := kloop (fun p i ps S => checkSX fuel T (mkSSP T n) (childSt T (mkSSP T n) ACT asg recs t nt p).1 need
             (childSt T (mkSSP T n) ACT asg recs t nt p).2.1 (childSt T (mkSSP T n) ACT asg recs t nt p).2.2 dom
             ((t, sym, cdir, nt, sl, i) :: pth) ps S) cs 0 ps slr.2
        (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 &&
          kr.1) = true → False
      intro S1 t sym cdir ntr slr nt sl a nr cs ss kr hchk
      have ha : a = aT T t := rfl
      have hcs : cs = brCands7 (mkSSP T n) ACT need asg recs t a nt sl sym cdir := rfl
      have hnr : nr = mkRecs6 (mkSSP T n) ACT asg nt [] := rfl
      have hss : ss = mkSls6 (mkSSP T n) ACT asg sl := rfl
      have hkr : kr = kloop (fun p i ps S => checkSX fuel T (mkSSP T n) (childSt T (mkSSP T n) ACT asg recs t nt p).1 need
             (childSt T (mkSSP T n) ACT asg recs t nt p).2.1 (childSt T (mkSSP T n) ACT asg recs t nt p).2.2 dom
             ((t, sym, cdir, nt, sl, i) :: pth) ps S) cs 0 ps slr.2 := rfl
      have hnt : ∀ x ∈ nt, x < 512 := rdList_lt _ _
      have hsl : ∀ x ∈ sl, x < 512 := rdList_lt _ _
      have hcs' : cs = cands T (mkSSP T n) ACT need asg recs t sym cdir nt sl := rfl
      clear_value S1 t sym cdir ntr slr nt sl a nr cs ss kr
      subst ha hnr hss hkr
      simp only [Bool.and_eq_true] at hchk
      obtain ⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩ := hchk
      refine br_step7 T n dom need (by omega) (mkSSP T n) (mkSSP_ok T n (by omega)) ACT asg recs t sym cdir nt sl hnt hsl
        h1 h2 h3 h4 h5 h6 h7 ?_ b c hinv hlg
      intro p hp b' c' hinv' hlg'
      rw [← hcs] at hp
      obtain ⟨j, hj, hpj⟩ := List.getElem_of_mem hp
      have hgd : cs.getD j (0, 0) = p := by rw [List.getD_eq_getElem _ _ hj, hpj]
      obtain ⟨ps', S', hps', hS'⟩ := kloop_ok _ (fun p i ps S => checkSX_ps _ _ _ _ _ _ _ _ _ ps S) cs 0 ps slr.2 h8 j hj
      rw [hgd, Nat.zero_add] at hS'
      have hst' : childSt T (mkSSP T n) ACT asg recs t nt p =
          walk T (mkSSP T n) need root ((t, sym, cdir, nt, sl, j) :: pth).reverse := by
        rw [List.reverse_cons, walk_append, ← hst]
        show childSt T (mkSSP T n) ACT asg recs t nt p =
          childSt T (mkSSP T n) ACT asg recs t nt ((cands T (mkSSP T n) ACT need asg recs t sym cdir nt sl).getD j (0, 0))
        rw [← hcs', hgd]
      rw [childSt_eq] at hst' hS'
      exact ih _ _ _ _ ps' S' (fun P hP => hps P (hps' P hP)) hst' hS' b' c' hinv' hlg'
    · rw [cond_true]
      cases hX : Nat.beq (rd 9 (sk 1 S)) 0
      · rw [cond_false]
        intro hchk
        exact over_step7 T n dom (by omega) (mkSSP T n) (mkSSP_ok T n (by omega)) ACT asg recs _
          (lt_of_lt_of_eq (rd_lt 9 _) (by norm_num)) hchk b c hinv
      · rw [cond_true]
        cases ps with
        | nil => intro hchk; exact absurd hchk Bool.false_ne_true
        | cons Q ps' =>
          intro hchk
          have hQ : Q = pth.reverse := beq_iff_eq.mp hchk
          have hmem : pth.reverse ∈ paths := by rw [← hQ]; exact hps Q List.mem_cons_self
          have := H _ hmem b c
          rw [← hst] at this
          exact this hinv hlg

/-- **Sub-records.** -/
theorem subOK_sound (R : Nat) (P : List Step) (cert : Nat) (h : subOK R P cert = true) :
    ∀ b c, Inv (hdr R).2.1 (hdr R).1 (hdr R).2.2.1 b c
      (walk (hdr R).2.1 (mkSSP (hdr R).2.1 (hdr R).1) (hdr R).2.2.2.1 (Nat.pred (Nat.shiftLeft 1 (hdr R).1), [], []) P).1
      (walk (hdr R).2.1 (mkSSP (hdr R).2.1 (hdr R).1) (hdr R).2.2.2.1 (Nat.pred (Nat.shiftLeft 1 (hdr R).1), [], []) P).2.1
      (walk (hdr R).2.1 (mkSSP (hdr R).2.1 (hdr R).1) (hdr R).2.2.2.1 (Nat.pred (Nat.shiftLeft 1 (hdr R).1), [], []) P).2.2 →
      LGok (hdr R).1 (hdr R).2.2.2.1 b c → False := by
  unfold subOK at h
  rw [Bool.and_eq_true, Nat.ble_eq] at h
  intro b c hinv hlg
  exact checkS7_sound _ _ _ _ h.1 64 _ _ _ _ h.2 b c hinv hlg

theorem leafSX_eq (R : Nat) (paths : List (List Step)) : leafSX R paths =
    (Nat.ble (rd 6 R) 31 &&
      ((Nat.beq (rd 1 (sk 1 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R))) 1 &&
          Nat.beq (rd 1 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R)) 0) && Nat.blt (rkSum (leafT R) (leafN R)) 27 ||
       (checkSX 64 (leafT R) (mkSSP (leafT R) (leafN R)) (Nat.pred (Nat.shiftLeft 1 (leafN R)))
          (cond (Nat.beq (rd 1 (sk 1 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R))) 1 &&
              Nat.beq (rd 1 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R)) 0)
            (needP (leafT R) (leafN R) (Nat.sub (rkSum (leafT R) (leafN R)) 27)) 0) [] [] (leafDom6 R) [] paths
          (cond (Nat.beq (rd 1 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R)) 0)
            (sk 2 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R)) (sk 514 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R)))).1)) := rfl

/-- **Split leaves.** An accepted main record with an accepted sub-record for each external path: no decomposition. -/
theorem leafSplit_sound (R : Nat) (subs : List (List Step × Nat)) (hmain : leafSX R (subs.map Prod.fst) = true)
    (hsubs : ∀ q ∈ subs, subOK R q.1 q.2 = true) : NoDecomp (leafT R) (leafN R) (leafDom6 R) := by
  rintro ⟨b, c, hbc, hd⟩
  rw [leafSX_eq] at hmain
  set R1 := sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R with hR1
  set dm := Nat.beq (rd 1 R1) 0 with hdm
  set lg := Nat.beq (rd 1 (sk 1 R1)) 1 && dm with hlg
  set RS := rkSum (leafT R) (leafN R) with hRS
  have epred : Nat.pred (Nat.shiftLeft 1 (leafN R)) = 2 ^ leafN R - 1 := by
    show 1 <<< leafN R - 1 = _; rw [Nat.one_shiftLeft]
  rw [epred] at hmain
  rw [Bool.and_eq_true, Nat.ble_eq, Bool.or_eq_true] at hmain
  obtain ⟨hn, hmain⟩ := hmain
  have hfull : lg = true → leafDom6 R = ALLNZ := by
    intro hl
    have hd' : dm = true := by rw [hlg, Bool.and_eq_true] at hl; exact hl.2
    show cond dm ALLNZ _ = ALLNZ
    rw [hd', cond_true]
  have hdfull : lg = true → ∀ X, X < 512 → ALLNZ.testBit X = true →
      TX (toM3 X) = ∑ t ∈ (Finset.range (leafN R)).filter (fun t => par (aT (leafT R) t &&& X) = true),
        vecMulVec (nv (b t)) (nv (c t)) := by
    intro hl X hX hX'
    exact hd X hX (by rw [hfull hl]; exact hX')
  rcases hmain with h | h
  · rw [Bool.and_eq_true, Nat.blt_eq] at h
    obtain ⟨hl, hlt⟩ := h
    have := (lg_root (leafT R) (leafN R) b c hbc (hdfull hl)).1
    omega
  · have hlgok : LGok (leafN R) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0) b c := by
      cases hl : lg
      · rw [cond_false]; exact lgok_zero _ b c hbc
      · rw [cond_true]
        exact (lg_root (leafT R) (leafN R) b c hbc (hdfull hl)).2
    have hH : ∀ P ∈ subs.map Prod.fst, ∀ b c, Inv (leafT R) (leafN R) (leafDom6 R) b c
        (walk (leafT R) (mkSSP (leafT R) (leafN R)) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0)
          (2 ^ leafN R - 1, [], []) P).1
        (walk (leafT R) (mkSSP (leafT R) (leafN R)) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0)
          (2 ^ leafN R - 1, [], []) P).2.1
        (walk (leafT R) (mkSSP (leafT R) (leafN R)) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0)
          (2 ^ leafN R - 1, [], []) P).2.2 →
        LGok (leafN R) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0) b c → False := by
      intro P hP b' c' hinv' hlg'
      obtain ⟨q, hq, rfl⟩ := List.mem_map.mp hP
      have hs := subOK_sound R q.1 q.2 (hsubs q hq)
      have e : Nat.pred (Nat.shiftLeft 1 (hdr R).1) = 2 ^ leafN R - 1 := epred
      rw [e] at hs
      exact hs b' c' hinv' hlg'
    exact checkSX_sound (leafT R) (leafN R) (leafDom6 R) _ hn (2 ^ leafN R - 1, [], []) (subs.map Prod.fst) hH 64 _ [] []
      [] _ _ (fun P hP => hP) rfl h b c (S5.inv_root _ _ _ b c hbc hd) hlgok

end S7X
