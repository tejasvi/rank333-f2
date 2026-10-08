module
public import R22Port.U_ad3ca0de9aa5
public import NLP.LeafAt
public import NL.Split
public import S7.NestT
/-! # NLP.Split: native split and nested-split leaves refine `BC7x`

* `checkSX_sim`: the native `checkSX` simulates `BC7x.checkSX` (paths and unused sub-record paths are plain data, equal).
* `walk_rel`: the native `walk` replays the kernel's `BC7x.walk` (valid steps).
* `mainRec_sound`, `subRec_sound`: the main record is `BC7x.leafSX`, a sub-record is `BC7x.subOKN`.
* `mainRec_ref`, `subRec_ref`: the certificate-free forms `(∀ P ∈ Q, RefP R P) → …` (infra R3).
* `nestLeaf_sound`: a native nested split leaf has no decomposition (`S7X.nestSplitT_sound`). -/
@[expose] public section
namespace NL
open Nat S5

set_option maxRecDepth 20000

/-! ## Candidates and child states -/

theorem kcands_eq (TERMS SS ACT need : Nat) (asg : BC5.Asg) (recs : List BC5.Rec) (t : Nat) (sym cdir : Bool)
    (nt sl : List Nat) : BC7x.cands TERMS SS ACT need asg recs t sym cdir nt sl =
      kcs SS ACT need asg recs t (Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511) sym cdir nt sl := rfl

theorem ncands_eq (L : LCtx) (ACT : Nat) (asg : Asg) (recs : List Rec) (t : Nat) (sym cdir : Bool) (nt sl : List Nat) :
    cands L ACT asg recs t sym cdir nt sl = ncs L ACT asg recs t (L.terms.getD t 0) sym cdir nt sl := rfl

theorem cands_rel (L : LCtx) (TERMS SS need dom n : Nat) (hL : LOK L TERMS SS need dom n) (ACT : Nat) (asg : Asg)
    (recs : List Rec) (ha : AsgOK asg) (hr : RecsWF recs) (t : Nat) (ht : t < n) (sym cdir : Bool) (nt sl : List Nat)
    (hnt : ∀ x ∈ nt, x < 512) (hsl : ∀ x ∈ sl, x < 512) :
    BC7x.cands TERMS SS ACT need asg (recs.map Rec.abs) t sym cdir nt sl = cands L ACT asg recs t sym cdir nt sl := by
  rw [kcands_eq, ncands_eq, ← hL.terms t ht]
  exact kcs_eq L TERMS SS need dom n hL ACT asg recs ha hr t _ (hL.tlt t) sym cdir nt sl hnt hsl

theorem cands_bnd (L : LCtx) (ACT : Nat) (asg : Asg) (recs : List Rec) (t : Nat) (sym cdir : Bool) (nt sl : List Nat)
    (TERMS SS need dom n : Nat) (hL : LOK L TERMS SS need dom n) (ha : AsgOK asg) (hr : RecsWF recs)
    (hnt : ∀ x ∈ nt, x < 512) (hsl : ∀ x ∈ sl, x < 512) : R6.Bnd (cands L ACT asg recs t sym cdir nt sl) := by
  rw [ncands_eq, ← kcs_eq L TERMS SS need dom n hL ACT asg recs ha hr t _ (hL.tlt t) sym cdir nt sl hnt hsl]
  exact kcs_bnd _ _ _ _ _ _ _ _ _ _ _

/-- the kernel child state of the native one -/
theorem childSt_rel (L : LCtx) (TERMS SS need dom n : Nat) (hL : LOK L TERMS SS need dom n) (ACT : Nat) (asg : Asg)
    (recs : List Rec) (ha : AsgOK asg) (hr : RecsWF recs) (t : Nat) (ht : t < n) (nt : List Nat)
    (hnt : ∀ x ∈ nt, x < 512) (q : Nat × Nat) (hq : q.1 < 512 ∧ q.2 < 512) :
    let ns := childSt L ACT asg recs t nt q
    BC7x.childSt TERMS SS ACT asg (recs.map Rec.abs) t nt q = (ns.1, ns.2.1, ns.2.2.map Rec.abs) ∧
      AsgOK ns.2.1 ∧ RecsWF ns.2.2 := by
  obtain ⟨n1, n2, n3⟩ := mkRecs6_rel L.S SS ACT asg hL.u ha [] nt hnt
  simp only [List.map_nil] at n1 n2
  have wn := n3 (fun _ h => absurd h List.not_mem_nil)
  have wall : RecsWF (app recs (mkRecs6 L.S ACT asg nt []).2) := app_wf _ wn recs hr
  obtain ⟨u1, u2⟩ := updRecs_map _ _ _ (hL.tlt t) hq.1 hq.2 _ wall
  refine ⟨?_, ?_, u2⟩
  · show (Nat.xor ACT (Nat.shiftLeft 1 t), (Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511, q.1, q.2) :: asg,
        BC5.updRecs (Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511) q.1 q.2
          (BC5.app (recs.map Rec.abs) (BC6s.mkRecs6 SS ACT asg nt []).2)) =
      (Nat.xor ACT (pw t), (L.terms.getD t 0, q.1, q.2) :: asg,
        (updRecs (L.terms.getD t 0) q.1 q.2 (app recs (mkRecs6 L.S ACT asg nt []).2)).map Rec.abs)
    rw [← hL.terms t ht, ← n2, ← app_map, u1, pw_fact t (by have := hL.n31; omega), Nat.shiftLeft_eq', Nat.one_shiftLeft]
  · intro e he
    rcases List.mem_cons.mp he with rfl | he
    · exact ⟨hL.tlt t, hq.1, hq.2⟩
    · exact ha e he

/-- **the native walk replays the kernel's** (valid steps) -/
theorem walk_rel (L : LCtx) (TERMS SS need dom n : Nat) (hL : LOK L TERMS SS need dom n) :
    ∀ (P : List Step) (ACT : Nat) (asg : Asg) (recs : List Rec), P.all (stepOK n) = true → AsgOK asg → RecsWF recs →
      let ns := walk L (ACT, asg, recs) P
      BC7x.walk TERMS SS need (ACT, asg, recs.map Rec.abs) P = (ns.1, ns.2.1, ns.2.2.map Rec.abs) ∧
        AsgOK ns.2.1 ∧ RecsWF ns.2.2
  | [], ACT, asg, recs, _, ha, hr => ⟨rfl, ha, hr⟩
  | (t, sym, cdir, nt, sl, i) :: P, ACT, asg, recs, hP, ha, hr => by
    simp only [List.all_cons, Bool.and_eq_true] at hP
    obtain ⟨hs, hP⟩ := hP
    unfold stepOK at hs
    simp only [Bool.and_eq_true, Nat.blt_eq, List.all_eq_true] at hs
    obtain ⟨⟨ht, hnt⟩, hsl⟩ := hs
    have hnt' : ∀ x ∈ nt, x < 512 := fun x hx => by simpa using hnt x hx
    have hsl' : ∀ x ∈ sl, x < 512 := fun x hx => by simpa using hsl x hx
    have hc := cands_rel L TERMS SS need dom n hL ACT asg recs ha hr t ht sym cdir nt sl hnt' hsl'
    have hb := cands_bnd L ACT asg recs t sym cdir nt sl TERMS SS need dom n hL ha hr hnt' hsl'
    have hq : ((cands L ACT asg recs t sym cdir nt sl).getD i (0, 0)).1 < 512 ∧
        ((cands L ACT asg recs t sym cdir nt sl).getD i (0, 0)).2 < 512 := by
      by_cases hi : i < (cands L ACT asg recs t sym cdir nt sl).length
      · rw [List.getD_eq_getElem _ _ hi]; exact hb _ (List.getElem_mem hi)
      · rw [List.getD_eq_default _ _ (by omega)]; exact ⟨by norm_num, by norm_num⟩
    obtain ⟨e1, e2, e3⟩ := childSt_rel L TERMS SS need dom n hL ACT asg recs ha hr t ht nt hnt' _ hq
    show BC7x.walk TERMS SS need (BC7x.childSt TERMS SS ACT asg (recs.map Rec.abs) t nt
        ((BC7x.cands TERMS SS ACT need asg (recs.map Rec.abs) t sym cdir nt sl).getD i (0, 0))) P = _ ∧ _
    rw [hc, e1]
    exact walk_rel L TERMS SS need dom n hL P _ _ _ hP e2 e3

/-! ## The node with external subtrees -/

abbrev KIhX := Nat → Nat → Nat → Nat → BC5.Asg → List BC5.Rec → Nat → List Step → List (List Step) → Nat →
  Bool × List (List Step) × Nat

/-- the kernel's branch node of `checkSX` after its header -/
noncomputable def kbrX (ih : KIhX) (TERMS SS ACT need : Nat) (asg : BC5.Asg) (recs : List BC5.Rec) (dom t : Nat)
    (sym cdir : Bool) (nt sl : List Nat) (pth : List Step) (ps : List (List Step)) (rest : Nat) :
    Bool × List (List Step) × Nat :=
  let a := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
  let nr := BC6s.mkRecs6 SS ACT asg nt []
  let cs := BC7x.cands TERMS SS ACT need asg recs t sym cdir nt sl
  let ss := BC6s.mkSls6 SS ACT asg sl
  let kr := S7X.kloop (fun p i ps S => ih TERMS SS (BC7x.childSt TERMS SS ACT asg recs t nt p).1 need
      (BC7x.childSt TERMS SS ACT asg recs t nt p).2.1 (BC7x.childSt TERMS SS ACT asg recs t nt p).2.2 dom
      ((t, sym, cdir, nt, sl, i) :: pth) ps S) cs 0 ps rest
  (BC5.bit ACT t && ((!sym) || asg.isEmpty) && BC5.allDom dom nt && nr.1 && BC5.allDom dom sl && BC5.allThru a sl && ss.1 &&
    kr.1, kr.2.1, kr.2.2)

theorem kcheckX_succ (fuel TERMS SS ACT need : Nat) (asg : BC5.Asg) (recs : List BC5.Rec) (dom : Nat) (pth : List Step)
    (ps : List (List Step)) (S : Nat) :
    BC7x.checkSX (fuel + 1) TERMS SS ACT need asg recs dom pth ps S =
      cond (Nat.beq (BC5.rd 1 S) 0)
        (cond (Nat.beq (BC5.rd 9 (BC5.sk 1 S)) 0)
           (@List.rec (List Step) (fun _ => Bool × List (List Step) × Nat) (false, [], BC5.sk 10 S)
              (fun P ps' _ => (P == pth.reverse, ps', BC5.sk 10 S)) ps)
           (BC5.bit dom (BC5.rd 9 (BC5.sk 1 S)) && BC6s.over6 SS ACT asg (BC5.rd 9 (BC5.sk 1 S)), ps, BC5.sk 10 S))
        (kbrX (BC7x.checkSX fuel) TERMS SS ACT need asg recs dom (BC5.rd 5 (BC5.sk 1 S))
          (Nat.beq (BC5.rd 1 (BC5.sk 5 (BC5.sk 1 S))) 1) (Nat.beq (BC5.rd 1 (BC5.sk 6 (BC5.sk 1 S))) 1)
          (BC5.rdList (BC5.rd 4 (BC5.sk 7 (BC5.sk 1 S))) (BC5.sk 11 (BC5.sk 1 S))).1
          (BC5.rdList (BC5.rd 3 (BC5.rdList (BC5.rd 4 (BC5.sk 7 (BC5.sk 1 S))) (BC5.sk 11 (BC5.sk 1 S))).2)
            (BC5.sk 3 (BC5.rdList (BC5.rd 4 (BC5.sk 7 (BC5.sk 1 S))) (BC5.sk 11 (BC5.sk 1 S))).2)).1 pth ps
          (BC5.rdList (BC5.rd 3 (BC5.rdList (BC5.rd 4 (BC5.sk 7 (BC5.sk 1 S))) (BC5.sk 11 (BC5.sk 1 S))).2)
            (BC5.sk 3 (BC5.rdList (BC5.rd 4 (BC5.sk 7 (BC5.sk 1 S))) (BC5.sk 11 (BC5.sk 1 S))).2)).2) := rfl

/-- the native branch node of `checkSX` after its header -/
def nbrX (ih : Nat → Asg → List Rec → List Step → List (List Step) → Nat → Bool × List (List Step) × Nat) (L : LCtx)
    (ACT : Nat) (asg : Asg) (recs : List Rec) (t : Nat) (sym cdir : Bool) (nt sl : List Nat) (pth : List Step)
    (ps : List (List Step)) (rest : Nat) : Bool × List (List Step) × Nat :=
  let a := L.terms.getD t 0
  let nr := mkRecs6 L.S ACT asg nt []
  let ss := mkSls6 L.S ACT asg sl
  cond (nbit ACT t && ((!sym) || asg.isEmpty) && allDom L.dom nt && nr.1 && allDom L.dom sl && allThru a sl && ss.1)
    (kloopX (fun q i ps' p' => ih (childSt L ACT asg recs t nt q).1 (childSt L ACT asg recs t nt q).2.1
        (childSt L ACT asg recs t nt q).2.2 ((t, sym, cdir, nt, sl, i) :: pth) ps' p')
      (cands L ACT asg recs t sym cdir nt sl) 0 ps rest)
    (false, ps, rest)

theorem ncheckX_succ (L : LCtx) (fuel ACT : Nat) (asg : Asg) (recs : List Rec) (pth : List Step) (ps : List (List Step))
    (p : Nat) :
    checkSX L (fuel + 1) ACT asg recs pth ps p =
      cond (Nat.beq (rdw L.d L.e p 1) 0)
        (cond (Nat.beq (rdw L.d L.e (p + 1) 9) 0)
          (match ps with
           | [] => (false, [], p + 10)
           | P :: ps' => (P == pth.reverse, ps', p + 10))
          (L.dom.bit (rdw L.d L.e (p + 1) 9) && over6 L.S ACT asg (rdw L.d L.e (p + 1) 9), ps, p + 10))
        (nbrX (checkSX L fuel) L ACT asg recs (rdw L.d L.e (p + 1) 5) (Nat.beq (rdw L.d L.e (p + 1 + 5) 1) 1)
          (Nat.beq (rdw L.d L.e (p + 1 + 6) 1) 1) (rdList L.d L.e (rdw L.d L.e (p + 1 + 7) 4) (p + 1 + 11)).1
          (rdList L.d L.e (rdw L.d L.e (rdList L.d L.e (rdw L.d L.e (p + 1 + 7) 4) (p + 1 + 11)).2 3)
            ((rdList L.d L.e (rdw L.d L.e (p + 1 + 7) 4) (p + 1 + 11)).2 + 3)).1 pth ps
          (rdList L.d L.e (rdw L.d L.e (rdList L.d L.e (rdw L.d L.e (p + 1 + 7) 4) (p + 1 + 11)).2 3)
            ((rdList L.d L.e (rdw L.d L.e (p + 1 + 7) 4) (p + 1 + 11)).2 + 3)).2) := rfl

theorem kloopX_sim (N e : Nat) (f g : Nat × Nat → Nat → List (List Step) → Nat → Bool × List (List Step) × Nat) :
    ∀ cs : List (Nat × Nat),
      (∀ q ∈ cs, ∀ j ps p, (f q j ps p).1 = true → g q j ps (win N e p) = (true, (f q j ps p).2.1, win N e (f q j ps p).2.2)) →
      ∀ i ps p, (kloopX f cs i ps p).1 = true →
        S7X.kloop g cs i ps (win N e p) = (true, (kloopX f cs i ps p).2.1, win N e (kloopX f cs i ps p).2.2)
  | [], _, i, ps, p, _ => rfl
  | q :: qs, h, i, ps, p, hk => by
    have hn : kloopX f (q :: qs) i ps p =
        cond (f q i ps p).1 (kloopX f qs (Nat.succ i) (f q i ps p).2.1 (f q i ps p).2.2) (false, (f q i ps p).2.1, (f q i ps p).2.2) :=
      rfl
    rw [hn] at hk ⊢
    rw [S7X.kloop_cons]
    cases hf : (f q i ps p).1
    · rw [hf] at hk; exact absurd hk (by simp)
    · rw [hf, cond_true] at hk
      rw [cond_true, h q List.mem_cons_self i ps p hf, cond_true]
      exact kloopX_sim N e f g qs (fun q' hq' => h q' (List.mem_cons_of_mem _ hq')) _ _ _ hk

/-- **the branch node with external subtrees** -/
theorem brX_sim (L : LCtx) (TERMS SS need dom n : Nat) (hL : LOK L TERMS SS need dom n)
    (ihn : Nat → Asg → List Rec → List Step → List (List Step) → Nat → Bool × List (List Step) × Nat) (ihk : KIhX)
    (hih : ∀ ACT asg recs pth ps p, ACTOK ACT n → AsgOK asg → RecsWF recs → (ihn ACT asg recs pth ps p).1 = true →
      ihk TERMS SS ACT need asg (recs.map Rec.abs) dom pth ps (win (natOfBytes L.d) L.e p) =
        (true, (ihn ACT asg recs pth ps p).2.1, win (natOfBytes L.d) L.e (ihn ACT asg recs pth ps p).2.2))
    (ACT : Nat) (asg : Asg) (recs : List Rec) (hACT : ACTOK ACT n) (ha : AsgOK asg) (hr : RecsWF recs)
    (t : Nat) (sym cdir : Bool) (nt sl : List Nat) (pth : List Step) (ps : List (List Step)) (rest : Nat)
    (hnt : ∀ x ∈ nt, x < 512) (hsl : ∀ x ∈ sl, x < 512)
    (h : (nbrX ihn L ACT asg recs t sym cdir nt sl pth ps rest).1 = true) :
    kbrX ihk TERMS SS ACT need asg (recs.map Rec.abs) dom t sym cdir nt sl pth ps (win (natOfBytes L.d) L.e rest) =
      (true, (nbrX ihn L ACT asg recs t sym cdir nt sl pth ps rest).2.1,
        win (natOfBytes L.d) L.e (nbrX ihn L ACT asg recs t sym cdir nt sl pth ps rest).2.2) := by
  unfold nbrX at h ⊢
  dsimp only at h ⊢
  cases hC : (nbit ACT t && ((!sym) || asg.isEmpty) && allDom L.dom nt && (mkRecs6 L.S ACT asg nt []).1 &&
      allDom L.dom sl && allThru (L.terms.getD t 0) sl && (mkSls6 L.S ACT asg sl).1)
  · rw [hC] at h; exact absurd h (by simp)
  rw [hC] at h
  simp only [cond_true] at h ⊢
  have hC' := hC
  simp only [Bool.and_eq_true] at hC'
  obtain ⟨⟨⟨⟨⟨⟨c1, c2⟩, c3⟩, c4⟩, c5⟩, c6⟩, c7⟩ := hC'
  have ht : ACT.testBit t = true := by rw [← nbit_eq]; exact c1
  have htn : t < n := hACT t ht
  obtain ⟨n1, -, -⟩ := mkRecs6_rel L.S SS ACT asg hL.u ha [] nt hnt
  obtain ⟨s1, -⟩ := mkSls6_rel L.S SS ACT asg hL.u ha sl hsl
  simp only [List.map_nil] at n1
  have hb := cands_bnd L ACT asg recs t sym cdir nt sl TERMS SS need dom n hL ha hr hnt hsl
  unfold kbrX
  simp only []
  rw [cands_rel L TERMS SS need dom n hL ACT asg recs ha hr t htn sym cdir nt sl hnt hsl, ← hL.terms t htn, ← n1, ← s1]
  have hk := kloopX_sim (natOfBytes L.d) L.e
    (fun q i ps' p' => ihn (childSt L ACT asg recs t nt q).1 (childSt L ACT asg recs t nt q).2.1
        (childSt L ACT asg recs t nt q).2.2 ((t, sym, cdir, nt, sl, i) :: pth) ps' p')
    (fun q i ps S => ihk TERMS SS (BC7x.childSt TERMS SS ACT asg (recs.map Rec.abs) t nt q).1 need
      (BC7x.childSt TERMS SS ACT asg (recs.map Rec.abs) t nt q).2.1 (BC7x.childSt TERMS SS ACT asg (recs.map Rec.abs) t nt q).2.2 dom
      ((t, sym, cdir, nt, sl, i) :: pth) ps S)
    (cands L ACT asg recs t sym cdir nt sl) (fun q hq j ps' p' hf => by
      obtain ⟨e1, e2, e3⟩ := childSt_rel L TERMS SS need dom n hL ACT asg recs ha hr t htn nt hnt q (hb q hq)
      show ihk TERMS SS (BC7x.childSt TERMS SS ACT asg (recs.map Rec.abs) t nt q).1 need
        (BC7x.childSt TERMS SS ACT asg (recs.map Rec.abs) t nt q).2.1
        (BC7x.childSt TERMS SS ACT asg (recs.map Rec.abs) t nt q).2.2 dom ((t, sym, cdir, nt, sl, j) :: pth) ps'
        (win (natOfBytes L.d) L.e p') = _
      rw [e1]
      exact hih _ _ _ _ ps' p' (actOK_xor ACT n t hL.n31 hACT ht) e2 e3 hf) 0 ps rest h
  rw [hk]
  simp only [Bool.and_true]
  rw [show BC5.bit ACT t = nbit ACT t from rfl, ← hL.dom, ← allDom_eq, ← allDom_eq, ← allThru_eq _ (hL.tlt t), hC]

/-- **the native `checkSX` simulates the kernel's** -/
theorem checkSX_sim (L : LCtx) (TERMS SS need dom n : Nat) (hL : LOK L TERMS SS need dom n) :
    ∀ fuel ACT asg recs pth ps p, ACTOK ACT n → AsgOK asg → RecsWF recs → (checkSX L fuel ACT asg recs pth ps p).1 = true →
      BC7x.checkSX fuel TERMS SS ACT need asg (recs.map Rec.abs) dom pth ps (win (natOfBytes L.d) L.e p) =
        (true, (checkSX L fuel ACT asg recs pth ps p).2.1, win (natOfBytes L.d) L.e (checkSX L fuel ACT asg recs pth ps p).2.2) := by
  intro fuel
  induction fuel with
  | zero => intro ACT asg recs pth ps p _ _ _ h; exact absurd h (by simp [checkSX])
  | succ fuel ih =>
    intro ACT asg recs pth ps p hACT ha hr h
    rw [ncheckX_succ] at h ⊢
    rw [kcheckX_succ]
    have e0 : BC5.rd 1 (win (natOfBytes L.d) L.e p) = rdw L.d L.e p 1 := (rdw_eq _ _ _ _ (by norm_num)).symm
    have s1 : BC5.sk 1 (win (natOfBytes L.d) L.e p) = win (natOfBytes L.d) L.e (p + 1) := sk_win _ _ _ _
    rw [e0, s1]
    cases htag : Nat.beq (rdw L.d L.e p 1) 0
    · rw [htag] at h
      simp only [cond_false] at h ⊢
      rw [sk_win, sk_win, sk_win, sk_win, ← rdw_eq _ _ _ _ (by norm_num), ← rdw_eq _ _ _ _ (by norm_num),
        ← rdw_eq _ _ _ _ (by norm_num), ← rdw_eq _ _ _ _ (by norm_num), rdList_eq, ← rdw_eq _ _ _ _ (by norm_num),
        sk_win, rdList_eq]
      exact brX_sim L TERMS SS need dom n hL (checkSX L fuel) (BC7x.checkSX fuel)
        (fun ACT' asg' recs' pth' ps' p' h1 h2 h3 h4 => ih ACT' asg' recs' pth' ps' p' h1 h2 h3 h4) ACT asg recs hACT ha hr
        _ _ _ _ _ pth ps _ (rdList_lt _ _ _ _) (rdList_lt _ _ _ _) h
    · rw [htag] at h
      simp only [cond_true] at h ⊢
      rw [← rdw_eq _ _ _ _ (le_refl _), sk_win]
      cases hX : Nat.beq (rdw L.d L.e (p + 1) 9) 0
      · rw [hX] at h; simp only [cond_false] at h ⊢
        have hX9 : rdw L.d L.e (p + 1) 9 < 512 := by
          have := rdw_lt L.d L.e (p + 1) 9 (le_refl _); norm_num at this ⊢; omega
        rw [mbit, hL.dom, over6_eq L.S SS ACT asg _ hL.u hX9 ha] at h
        rw [h]
      · rw [hX] at h; simp only [cond_true] at h ⊢
        cases ps with
        | nil => exact absurd h (by simp)
        | cons P ps' =>
          simp only at h ⊢
          rw [h]

/-! ## The header -/

/-- what the kernel reads from the record at bit `p` is what the native header holds -/
theorem leafHdr_rel (d : ByteArray) (p : Nat) :
    let N := natOfBytes d
    let R := BC5.sk p N
    let h := leafHdr d p
    let R1 := BC5.sk (Nat.add 6 (Nat.mul 9 (BC5.rd 6 R))) R
    let dm := Nat.beq (BC5.rd 1 R1) 0
    let lg := Nat.beq (BC5.rd 1 (BC5.sk 1 R1)) 1 && dm
    BC5.rd 6 R = h.2.1 ∧ lg = h.2.2.1 ∧ BC6s.rkSum (S5.leafT R) (S5.leafN R) = h.2.2.2.1 ∧
      cond dm BC4.ALLNZ (BC5.rd 512 (BC5.sk 2 R1)) = h.1.dom.toNat ∧
      cond dm (BC5.sk 2 R1) (BC5.sk 514 R1) = win N (8 * d.size) h.2.2.2.2 ∧
      (h.2.1 ≤ 31 →
        cond lg (BC6s.needP (S5.leafT R) (S5.leafN R) (Nat.sub (BC6s.rkSum (S5.leafT R) (S5.leafN R)) 27)) 0 = h.1.need ∧
        LOK h.1 (S5.leafT R) (BC5.mkSSP (S5.leafT R) h.2.1) h.1.need h.1.dom.toNat h.2.1) := by
  have hw : ∀ q, win (natOfBytes d) (8 * d.size) q = BC5.sk q (natOfBytes d) := win_full d
  have rw9 : ∀ q k, k ≤ 9 → BC5.rd k (BC5.sk q (natOfBytes d)) = rdw d (8 * d.size) q k := fun q k hk => by
    rw [rdw_eq d _ q k hk, hw]
  have skk : ∀ a b, BC5.sk a (BC5.sk b (natOfBytes d)) = BC5.sk (b + a) (natOfBytes d) := fun a b => by
    rw [sk_eq', sk_eq', sk_eq', Nat.shiftRight_add]
  unfold leafHdr
  simp only []
  set e := 8 * d.size with he
  set n := rdw d e p 6 with hn
  set tl := (rdList d e n (p + 6)).1 with htl
  have htlen : tl.length = n := rdList_length d e n (p + 6)
  have htlt : ∀ x ∈ tl, x < 512 := rdList_lt d e n (p + 6)
  have hta : ∀ s, tl.toArray.getD s 0 < 512 := fun s => by
    rw [toArray_getD]
    by_cases hs : s < tl.length
    · rw [List.getD_eq_getElem _ _ hs]; exact htlt _ (List.getElem_mem hs)
    · rw [List.getD_eq_default _ _ (by omega)]; norm_num
  have hN6 : BC5.rd 6 (BC5.sk p (natOfBytes d)) = n := rw9 p 6 (by norm_num)
  have hLN : S5.leafN (BC5.sk p (natOfBytes d)) = n := hN6
  have hLT : S5.leafT (BC5.sk p (natOfBytes d)) = BC5.rd (Nat.mul 9 n) (BC5.sk 6 (BC5.sk p (natOfBytes d))) := by
    unfold S5.leafT; rw [hN6]
  rw [hLN, hLT, hN6]
  set T := BC5.rd (Nat.mul 9 n) (BC5.sk 6 (BC5.sk p (natOfBytes d))) with hT
  have hterms : ∀ t < tl.length, tl.getD t 0 = Nat.land (Nat.shiftRight T (Nat.mul 9 t)) 511 := by
    intro t ht
    rw [htlen] at ht
    rw [hT, aT_rec _ n t ht, skk, rdList_getD d e n (p + 6) t ht, ← rw9 _ 9 (le_refl _)]
    congr 2; ring
  have htaT : ∀ s < n, tl.toArray.getD s 0 = Nat.land (Nat.shiftRight T (Nat.mul 9 s)) 511 := fun s hs => by
    rw [toArray_getD]; exact hterms s (by omega)
  set p1 := p + 6 + 9 * n with hp1
  have hR1 : BC5.sk (Nat.add 6 (Nat.mul 9 n)) (BC5.sk p (natOfBytes d)) = BC5.sk p1 (natOfBytes d) := by
    rw [skk]; congr 1; show p + (6 + 9 * n) = p + 6 + 9 * n; ring
  rw [hR1, rw9 p1 1 (by norm_num), skk, rw9 (p1 + 1) 1 (by norm_num), ← rkSum_eq tl.toArray T hta n htaT]
  refine ⟨rfl, rfl, rfl, ?_, ?_, ?_⟩
  · rw [skk, ← rdM8_toNat d (p1 + 2)]
    cases Nat.beq (rdw d e p1 1) 0
    · rfl
    · simp only [cond_true]; exact allnz_fact.symm
  · rw [skk, skk]
    cases Nat.beq (rdw d e p1 1) 0
    · simp only [cond_false]; exact (hw _).symm
    · simp only [cond_true]; exact (hw _).symm
  · intro hn31
    refine ⟨by rw [← needP_eq tl.toArray T _ hta n hn31 htaT], ?_⟩
    exact { terms := fun t ht => by show tl.toArray.getD t 0 = _; rw [toArray_getD]; exact hterms t (by omega)
            tlt := hta
            n31 := hn31
            u := by have := uok_mkS tl T (by omega) htlt hterms; rwa [htlen] at this
            need := rfl
            dom := rfl }

/-! ## Main and sub records -/

/-- **an accepted native main record is an accepted kernel main record** (`BC7x.leafSX`) -/
theorem mainRec_sound (d : ByteArray) (p : Nat) (Q : List (List Step)) (h : mainRec d p Q = true) :
    BC7x.leafSX (BC5.sk p (natOfBytes d)) Q = true := by
  obtain ⟨e1, e2, e3, e4, e5, e6⟩ := leafHdr_rel d p
  unfold mainRec at h
  simp only [] at h
  have hn31 : (leafHdr d p).2.1 ≤ 31 := by
    have h' := h; simp only [Bool.and_eq_true] at h'; exact Nat.ble_eq.mp h'.1
  obtain ⟨e7, hL⟩ := e6 hn31
  rw [S7X.leafSX_eq]
  have eN : S5.leafN (BC5.sk p (natOfBytes d)) = (leafHdr d p).2.1 := e1
  have eD : S6.leafDom6 (BC5.sk p (natOfBytes d)) = (leafHdr d p).1.dom.toNat := e4
  rw [eD, e7, e2, e3, e5, eN, e1, ← pw_sub_one _ hn31]
  rw [Nat.ble_eq.mpr hn31, Bool.true_and] at h ⊢
  cases hA : ((leafHdr d p).2.2.1 && Nat.blt (leafHdr d p).2.2.2.1 27)
  · rw [hA, Bool.false_or] at h
    rw [Bool.false_or]
    have hs := checkSX_sim (leafHdr d p).1 _ _ _ _ _ hL 64 _ [] [] [] Q _ (actOK_full _ hn31)
      (fun _ h => absurd h List.not_mem_nil) (fun _ h => absurd h List.not_mem_nil) h
    simp only [List.map_nil] at hs
    have hdL : (leafHdr d p).1.d = d := rfl
    have heL : (leafHdr d p).1.e = 8 * d.size := rfl
    rw [hdL, heL] at hs
    rw [hs]
  · rfl

/-- the native sub-record's walk keeps the active terms below `n` -/
theorem walk_act (L : LCtx) (n : Nat) (hn : n ≤ 31) : ∀ (P : List Step) (st : Nat × Asg × List Rec), ACTOK st.1 n →
    P.all (stepOK n) = true → ACTOK (walk L st P).1 n
  | [], _, h, _ => h
  | (t, sym, cdir, nt, sl, i) :: P, st, h, hP => by
    simp only [List.all_cons, Bool.and_eq_true] at hP
    obtain ⟨hs, hP⟩ := hP
    unfold stepOK at hs
    simp only [Bool.and_eq_true, Nat.blt_eq] at hs
    apply walk_act L n hn P _ _ hP
    intro u hu
    change (Nat.xor st.1 (pw t)).testBit u = true at hu
    have ht := hs.1.1
    rw [pw_fact t (by omega), Nat.xor_eq, Nat.testBit_xor, Nat.testBit_two_pow] at hu
    by_cases e : t = u
    · subst e; exact ht
    · rw [decide_eq_false e, Bool.xor_false] at hu; exact h u hu

/-- **an accepted native sub-record is an accepted kernel sub-record** (`BC7x.subOKN`) -/
theorem subRec_sound (d : ByteArray) (p : Nat) (P : List Step) (Q : List (List Step)) (B : ByteArray) (q e : Nat)
    (h : subRec d p P Q B q e = true) : BC7x.subOKN (BC5.sk p (natOfBytes d)) P Q (win (natOfBytes B) e q) = true := by
  obtain ⟨e1, e2, e3, e4, e5, e6⟩ := leafHdr_rel d p
  unfold subRec at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨h1, hP⟩, h3⟩ := h
  have hn31 : (leafHdr d p).2.1 ≤ 31 := Nat.ble_eq.mp h1
  obtain ⟨e7, hL⟩ := e6 hn31
  -- the sub-record's context has the header's data and the certificate bytes
  have hL' : LOK { (leafHdr d p).1 with d := B, e := e } (S5.leafT (BC5.sk p (natOfBytes d)))
      (BC5.mkSSP (S5.leafT (BC5.sk p (natOfBytes d))) (leafHdr d p).2.1) (leafHdr d p).1.need (leafHdr d p).1.dom.toNat
      (leafHdr d p).2.1 := { terms := hL.terms, tlt := hL.tlt, n31 := hL.n31, u := hL.u, need := hL.need, dom := hL.dom }
  obtain ⟨w1, w2, w3⟩ := walk_rel _ _ _ _ _ _ hL' P (Nat.sub (pw (leafHdr d p).2.1) 1) [] [] hP
    (fun _ h => absurd h List.not_mem_nil) (fun _ h => absurd h List.not_mem_nil)
  have wa := walk_act { (leafHdr d p).1 with d := B, e := e } (leafHdr d p).2.1 hn31 P (Nat.sub (pw (leafHdr d p).2.1) 1, [], [])
    (actOK_full _ hn31) hP
  have hs := checkSX_sim _ _ _ _ _ _ hL' 64 _ _ _ P.reverse Q q wa w2 w3 h3
  -- the kernel's subOKN
  unfold BC7x.subOKN BC7x.hdr
  simp only []
  have eN : BC5.rd 6 (BC5.sk p (natOfBytes d)) = (leafHdr d p).2.1 := e1
  rw [Nat.ble_eq.mpr (by rw [eN]; exact hn31), Bool.true_and]
  have eT : BC5.rd (Nat.mul 9 (BC5.rd 6 (BC5.sk p (natOfBytes d)))) (BC5.sk 6 (BC5.sk p (natOfBytes d))) =
      S5.leafT (BC5.sk p (natOfBytes d)) := rfl
  have e7' : cond (Nat.beq (BC5.rd 1 (BC5.sk 1 (BC5.sk (Nat.add 6 (Nat.mul 9 (BC5.rd 6 (BC5.sk p (natOfBytes d)))))
      (BC5.sk p (natOfBytes d))))) 1 && Nat.beq (BC5.rd 1 (BC5.sk (Nat.add 6 (Nat.mul 9 (BC5.rd 6 (BC5.sk p (natOfBytes d)))))
      (BC5.sk p (natOfBytes d)))) 0) (BC6s.needP (S5.leafT (BC5.sk p (natOfBytes d))) (BC5.rd 6 (BC5.sk p (natOfBytes d)))
      (Nat.sub (BC6s.rkSum (S5.leafT (BC5.sk p (natOfBytes d))) (BC5.rd 6 (BC5.sk p (natOfBytes d)))) 27)) 0 =
      (leafHdr d p).1.need := e7
  rw [eT, e7', e4, eN, ← pw_sub_one _ hn31]
  have w1' : BC7x.walk (S5.leafT (BC5.sk p (natOfBytes d))) (BC5.mkSSP (S5.leafT (BC5.sk p (natOfBytes d))) (leafHdr d p).2.1)
      (leafHdr d p).1.need (Nat.sub (pw (leafHdr d p).2.1) 1, [], []) P =
      ((walk { (leafHdr d p).1 with d := B, e := e } (Nat.sub (pw (leafHdr d p).2.1) 1, [], []) P).1,
       (walk { (leafHdr d p).1 with d := B, e := e } (Nat.sub (pw (leafHdr d p).2.1) 1, [], []) P).2.1,
       (walk { (leafHdr d p).1 with d := B, e := e } (Nat.sub (pw (leafHdr d p).2.1) 1, [], []) P).2.2.map Rec.abs) := w1
  rw [w1']
  exact (congrArg Prod.fst hs).trans rfl

/-! ## Certificate-free forms (infra R3) and nested leaves -/

/-- **a sub-record refutes its path, given that its external paths are refuted** -/
theorem subRec_ref (d : ByteArray) (p : Nat) (P : List Step) (Q : List (List Step)) (B : ByteArray) (q e : Nat)
    (h : subRec d p P Q B q e = true) (HQ : ∀ P' ∈ Q, S7X.RefP (BC5.sk p (natOfBytes d)) P') :
    S7X.RefP (BC5.sk p (natOfBytes d)) P :=
  S7X.subOKN_sound _ P Q _ (subRec_sound d p P Q B q e h) HQ

/-- **a main record refutes its leaf, given that its external paths are refuted** -/
theorem mainRec_ref (d : ByteArray) (p : Nat) (Q : List (List Step)) (h : mainRec d p Q = true)
    (HQ : ∀ P' ∈ Q, S7X.RefP (BC5.sk p (natOfBytes d)) P') :
    S5.NoDecomp (S5.leafT (BC5.sk p (natOfBytes d))) (S5.leafN (BC5.sk p (natOfBytes d)))
      (S6.leafDom6 (BC5.sk p (natOfBytes d))) :=
  S7X.leafSX_sound _ Q (mainRec_sound d p Q h) HQ

/-- the kernel record of a native record: the certificate window's value -/
def recK (r : List Step × Nat × ByteArray × Nat × Nat) : List Step × Nat × Nat :=
  (r.1, r.2.1, win (natOfBytes r.2.2.1) r.2.2.2.2 r.2.2.2.1)

theorem nestRecs_sound (d : ByteArray) (p : Nat) : ∀ (rs : List (List Step × Nat × ByteArray × Nat × Nat))
    (rest : List (List Step)) (a k : Nat), nestRecs d p rs rest a k = true →
      BC7x.nestChkT (BC5.sk p (natOfBytes d)) (rs.map recK) rest a k = true
  | [], _, _, _, _ => rfl
  | r :: rs, rest, a, k, h => by
    have e : nestRecs d p (r :: rs) rest a k = ((Nat.blt k a && subRec d p r.1 (rest.take r.2.1) r.2.2.1 r.2.2.2.1 r.2.2.2.2) &&
        nestRecs d p rs (rest.drop r.2.1) (a + r.2.1) (Nat.succ k)) := rfl
    rw [e] at h
    simp only [Bool.and_eq_true] at h
    rw [List.map_cons, S7X.nestChkT_cons]
    simp only [Bool.and_eq_true]
    exact ⟨⟨h.1.1, subRec_sound d p r.1 _ _ _ _ h.1.2⟩, nestRecs_sound d p rs _ _ _ h.2⟩

/-- **a native nested split leaf has no decomposition** -/
theorem nestLeaf_sound (d : ByteArray) (p : Nat) (recs : List (List Step × Nat × ByteArray × Nat × Nat)) (m0 : Nat)
    (h : nestLeaf d p recs m0 = true) :
    S5.NoDecomp (S5.leafT (BC5.sk p (natOfBytes d))) (S5.leafN (BC5.sk p (natOfBytes d)))
      (S6.leafDom6 (BC5.sk p (natOfBytes d))) := by
  unfold nestLeaf at h
  simp only [Bool.and_eq_true] at h
  have hf : (recs.map recK).map Prod.fst = recs.map Prod.fst := by rw [List.map_map]; rfl
  apply S7X.nestSplitT_sound _ (recs.map recK) m0
  · rw [hf]; exact mainRec_sound d p _ h.1
  · rw [hf]; exact nestRecs_sound d p recs _ m0 0 h.2

end NL
