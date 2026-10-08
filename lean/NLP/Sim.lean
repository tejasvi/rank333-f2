module
public import R22Port.U_d41d8cd98f00
public import NLP.Cands
public import NLP.Bytes
/-! # NLP.Sim: the native node check simulates the kernel's `BC7s.checkS`

`checkS_sim`: when the native `checkS L fuel ACT asg recs p` accepts, the kernel's `BC7s.checkS fuel TERMS SS ACT need asg
(recs.map Rec.abs) dom` on the window stream at `p` accepts, and both end at the same position. -/
@[expose] public section
namespace NL
open Nat S5

set_option maxRecDepth 20000

/-- the per-leaf data of the native check describe the kernel's `TERMS`, `SS`, `need`, `dom` (`n` terms) -/
structure LOK (L : LCtx) (TERMS SS need dom n : Nat) : Prop where
  terms : ∀ t < n, L.terms.getD t 0 = Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
  tlt : ∀ t, L.terms.getD t 0 < 512
  n31 : n ≤ 31
  u : UOK L.S SS
  need : L.need = need
  dom : L.dom.toNat = dom

def ACTOK (ACT n : Nat) : Prop := ∀ t, ACT.testBit t = true → t < n

/-- the kernel's branch node after its header (`BC7s.checkS`'s body; `ih` checks a child) -/
noncomputable def kbr (ih : Nat → Nat → Nat → Nat → BC5.Asg → List BC5.Rec → Nat → Nat → Bool × Nat) (TERMS SS ACT need : Nat)
    (asg : BC5.Asg) (recs : List BC5.Rec) (dom t : Nat) (sym cdir : Bool) (nt sl : List Nat) (rest : Nat) : Bool × Nat :=
  let a := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
  let nr := BC6s.mkRecs6 SS ACT asg nt []
  let part := BC5.thru a recs (BC5.thru a nr.2 [])
  let allr := BC5.app recs nr.2
  let ss := BC6s.mkSls6 SS ACT asg sl
  let lgm := BC6s.lgMask need t
  let B := BC5.andLm part (Nat.land (Nat.land BC4.ALLNZ lgm) (cond sym BC4.ORBM BC4.M512))
  let Cb := BC5.andRm part (Nat.land BC4.ALLNZ lgm)
  let cs : List (Nat × Nat) := cond cdir
    (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (BC5.candsC part ss.2 B (BC5.bitsOf Cb))))
    (cond (Nat.beq B 0) [] (BC7s.candsB7 sym part ss.2 Cb (BC5.bitsOf B)))
  let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
  let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
    (fun p _ ihc S => let r := ih TERMS SS ACT' need ((a, p.1, p.2) :: asg) (BC5.updRecs a p.1 p.2 allr) dom S
       cond r.1 (ihc r.2) (false, r.2)) cs rest
  (BC5.bit ACT t && ((!sym) || asg.isEmpty) && BC5.allDom dom nt && nr.1 && BC5.allDom dom sl && BC5.allThru a sl && ss.1 &&
    kr.1, kr.2)

theorem kcheck_succ (fuel TERMS SS ACT need : Nat) (asg : BC5.Asg) (recs : List BC5.Rec) (dom S : Nat) :
    BC7s.checkS (fuel + 1) TERMS SS ACT need asg recs dom S =
      cond (Nat.beq (BC5.rd 1 S) 0)
        (BC5.bit dom (BC5.rd 9 (BC5.sk 1 S)) && BC6s.over6 SS ACT asg (BC5.rd 9 (BC5.sk 1 S)), BC5.sk 10 S)
        (kbr (BC7s.checkS fuel) TERMS SS ACT need asg recs dom (BC5.rd 5 (BC5.sk 1 S))
          (Nat.beq (BC5.rd 1 (BC5.sk 5 (BC5.sk 1 S))) 1) (Nat.beq (BC5.rd 1 (BC5.sk 6 (BC5.sk 1 S))) 1)
          (BC5.rdList (BC5.rd 4 (BC5.sk 7 (BC5.sk 1 S))) (BC5.sk 11 (BC5.sk 1 S))).1
          (BC5.rdList (BC5.rd 3 (BC5.rdList (BC5.rd 4 (BC5.sk 7 (BC5.sk 1 S))) (BC5.sk 11 (BC5.sk 1 S))).2)
            (BC5.sk 3 (BC5.rdList (BC5.rd 4 (BC5.sk 7 (BC5.sk 1 S))) (BC5.sk 11 (BC5.sk 1 S))).2)).1
          (BC5.rdList (BC5.rd 3 (BC5.rdList (BC5.rd 4 (BC5.sk 7 (BC5.sk 1 S))) (BC5.sk 11 (BC5.sk 1 S))).2)
            (BC5.sk 3 (BC5.rdList (BC5.rd 4 (BC5.sk 7 (BC5.sk 1 S))) (BC5.sk 11 (BC5.sk 1 S))).2)).2) := rfl

/-- the native branch node after its header -/
def nbr (ih : Nat → Asg → List Rec → Nat → Bool × Nat) (L : LCtx) (ACT : Nat) (asg : Asg) (recs : List Rec) (t : Nat)
    (sym cdir : Bool) (nt sl : List Nat) (rest : Nat) : Bool × Nat :=
  let a := L.terms.getD t 0
  let nr := mkRecs6 L.S ACT asg nt []
  let ss := mkSls6 L.S ACT asg sl
  cond (nbit ACT t && ((!sym) || asg.isEmpty) && allDom L.dom nt && nr.1 && allDom L.dom sl && allThru a sl && ss.1)
    (let part := thru a recs (thru a nr.2 [])
     let allr := app recs nr.2
     let lgm := lgMask L.need t
     let B := andLm part ((ALLNZ8.and lgm).and (cond sym ORBM8 M5128))
     let Cb := andRm part (ALLNZ8.and lgm)
     let cs : List (Nat × Nat) := cond cdir
       (cond Cb.isZero [] (cond B.isZero [] (candsC part ss.2 B (M8.bLoop 512 Cb))))
       (cond B.isZero [] (candsB7 sym part ss.2 Cb (M8.bLoop 512 B)))
     let ACT' := Nat.xor ACT (pw t)
     kloop (fun q p' => ih ACT' ((a, q.1, q.2) :: asg) (updRecs a q.1 q.2 allr) p') cs rest)
    (false, rest)

theorem ncheck_succ (L : LCtx) (fuel ACT : Nat) (asg : Asg) (recs : List Rec) (p : Nat) :
    checkS L (fuel + 1) ACT asg recs p =
      cond (Nat.beq (rdw L.d L.e p 1) 0)
        (L.dom.bit (rdw L.d L.e (p + 1) 9) && over6 L.S ACT asg (rdw L.d L.e (p + 1) 9), p + 10)
        (nbr (checkS L fuel) L ACT asg recs (rdw L.d L.e (p + 1) 5) (Nat.beq (rdw L.d L.e (p + 1 + 5) 1) 1)
          (Nat.beq (rdw L.d L.e (p + 1 + 6) 1) 1) (rdList L.d L.e (rdw L.d L.e (p + 1 + 7) 4) (p + 1 + 11)).1
          (rdList L.d L.e (rdw L.d L.e (rdList L.d L.e (rdw L.d L.e (p + 1 + 7) 4) (p + 1 + 11)).2 3)
            ((rdList L.d L.e (rdw L.d L.e (p + 1 + 7) 4) (p + 1 + 11)).2 + 3)).1
          (rdList L.d L.e (rdw L.d L.e (rdList L.d L.e (rdw L.d L.e (p + 1 + 7) 4) (p + 1 + 11)).2 3)
            ((rdList L.d L.e (rdw L.d L.e (p + 1 + 7) 4) (p + 1 + 11)).2 + 3)).2) := rfl

/-! ## The kids loop -/

/-- the kernel's kids loop -/
noncomputable def kloopK (g : Nat × Nat → Nat → Bool × Nat) (cs : List (Nat × Nat)) (S : Nat) : Bool × Nat :=
  @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
    (fun p _ ihc S => let r := g p S; cond r.1 (ihc r.2) (false, r.2)) cs S

theorem kloop_sim (N e : Nat) (f g : Nat × Nat → Nat → Bool × Nat) : ∀ cs : List (Nat × Nat),
    (∀ q ∈ cs, ∀ p, (f q p).1 = true → g q (win N e p) = (true, win N e (f q p).2)) →
    ∀ p, (kloop f cs p).1 = true → kloopK g cs (win N e p) = (true, win N e (kloop f cs p).2)
  | [], _, p, _ => rfl
  | q :: qs, h, p, hk => by
    have hn : kloop f (q :: qs) p = cond (f q p).1 (kloop f qs (f q p).2) (false, (f q p).2) := rfl
    have hkk : kloopK g (q :: qs) (win N e p) =
        cond (g q (win N e p)).1 (kloopK g qs (g q (win N e p)).2) (false, (g q (win N e p)).2) := rfl
    rw [hn] at hk ⊢
    cases hf : (f q p).1
    · rw [hf] at hk; exact absurd hk (by simp)
    · rw [hf, cond_true] at hk
      rw [cond_true, hkk, h q List.mem_cons_self p hf, cond_true]
      exact kloop_sim N e f g qs (fun q' hq' => h q' (List.mem_cons_of_mem _ hq')) _ hk

theorem cs_mem_lt (l : List (Nat × Nat)) (h : R6.Bnd l) (q : Nat × Nat) (hq : q ∈ l) : q.1 < 512 ∧ q.2 < 512 := h q hq

/-! ## Masks of the node -/

theorem bmask_eq (lgm : M8) (sym : Bool) :
    ((ALLNZ8.and lgm).and (cond sym ORBM8 M5128)).toNat =
      Nat.land (Nat.land BC4.ALLNZ lgm.toNat) (cond sym BC4.ORBM BC4.M512) := by
  rw [M8.toNat_and, M8.toNat_and, allnz_fact]
  cases sym
  · simp only [cond_false]; rw [m512_fact]; rfl
  · simp only [cond_true]; rw [orbm_fact]; rfl

theorem cmask_eq (lgm : M8) : (ALLNZ8.and lgm).toNat = Nat.land BC4.ALLNZ lgm.toNat := by
  rw [M8.toNat_and, allnz_fact]; rfl

/-! ## The node, by components -/

/-- the kernel's candidate list of a branch node -/
noncomputable def kcs (SS ACT need : Nat) (asg : BC5.Asg) (recs : List BC5.Rec) (t a : Nat) (sym cdir : Bool)
    (nt sl : List Nat) : List (Nat × Nat) :=
  let nr := BC6s.mkRecs6 SS ACT asg nt []
  let part := BC5.thru a recs (BC5.thru a nr.2 [])
  let ss := BC6s.mkSls6 SS ACT asg sl
  let lgm := BC6s.lgMask need t
  let B := BC5.andLm part (Nat.land (Nat.land BC4.ALLNZ lgm) (cond sym BC4.ORBM BC4.M512))
  let Cb := BC5.andRm part (Nat.land BC4.ALLNZ lgm)
  cond cdir (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (BC5.candsC part ss.2 B (BC5.bitsOf Cb))))
    (cond (Nat.beq B 0) [] (BC7s.candsB7 sym part ss.2 Cb (BC5.bitsOf B)))

/-- the kernel's branch node from its components -/
noncomputable def kbrG (ih : Nat → Nat → Nat → Nat → BC5.Asg → List BC5.Rec → Nat → Nat → Bool × Nat)
    (TERMS SS ACT need : Nat) (asg : BC5.Asg) (dom t : Nat) (sym : Bool) (nt sl : List Nat) (a : Nat) (nr1 : Bool)
    (allr : List BC5.Rec) (ss1 : Bool) (cs : List (Nat × Nat)) (rest : Nat) : Bool × Nat :=
  (BC5.bit ACT t && ((!sym) || asg.isEmpty) && BC5.allDom dom nt && nr1 && BC5.allDom dom sl && BC5.allThru a sl && ss1 &&
    (kloopK (fun p S => ih TERMS SS (Nat.xor ACT (Nat.shiftLeft 1 t)) need ((a, p.1, p.2) :: asg)
      (BC5.updRecs a p.1 p.2 allr) dom S) cs rest).1,
   (kloopK (fun p S => ih TERMS SS (Nat.xor ACT (Nat.shiftLeft 1 t)) need ((a, p.1, p.2) :: asg)
      (BC5.updRecs a p.1 p.2 allr) dom S) cs rest).2)

theorem kbr_eq (ih : Nat → Nat → Nat → Nat → BC5.Asg → List BC5.Rec → Nat → Nat → Bool × Nat) (TERMS SS ACT need : Nat)
    (asg : BC5.Asg) (recs : List BC5.Rec) (dom t : Nat) (sym cdir : Bool) (nt sl : List Nat) (rest : Nat) :
    kbr ih TERMS SS ACT need asg recs dom t sym cdir nt sl rest =
      kbrG ih TERMS SS ACT need asg dom t sym nt sl (Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511)
        (BC6s.mkRecs6 SS ACT asg nt []).1 (BC5.app recs (BC6s.mkRecs6 SS ACT asg nt []).2) (BC6s.mkSls6 SS ACT asg sl).1
        (kcs SS ACT need asg recs t (Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511) sym cdir nt sl) rest := rfl

/-- the native candidate list of a branch node -/
def ncs (L : LCtx) (ACT : Nat) (asg : Asg) (recs : List Rec) (t a : Nat) (sym cdir : Bool) (nt sl : List Nat) :
    List (Nat × Nat) :=
  let nr := mkRecs6 L.S ACT asg nt []
  let ss := mkSls6 L.S ACT asg sl
  let part := thru a recs (thru a nr.2 [])
  let lgm := lgMask L.need t
  let B := andLm part ((ALLNZ8.and lgm).and (cond sym ORBM8 M5128))
  let Cb := andRm part (ALLNZ8.and lgm)
  cond cdir (cond Cb.isZero [] (cond B.isZero [] (candsC part ss.2 B (M8.bLoop 512 Cb))))
    (cond B.isZero [] (candsB7 sym part ss.2 Cb (M8.bLoop 512 B)))

theorem nbr_eq (ih : Nat → Asg → List Rec → Nat → Bool × Nat) (L : LCtx) (ACT : Nat) (asg : Asg) (recs : List Rec) (t : Nat)
    (sym cdir : Bool) (nt sl : List Nat) (rest : Nat) :
    nbr ih L ACT asg recs t sym cdir nt sl rest =
      cond (nbit ACT t && ((!sym) || asg.isEmpty) && allDom L.dom nt && (mkRecs6 L.S ACT asg nt []).1 &&
          allDom L.dom sl && allThru (L.terms.getD t 0) sl && (mkSls6 L.S ACT asg sl).1)
        (kloop (fun q p' => ih (Nat.xor ACT (pw t)) ((L.terms.getD t 0, q.1, q.2) :: asg)
          (updRecs (L.terms.getD t 0) q.1 q.2 (app recs (mkRecs6 L.S ACT asg nt []).2)) p')
          (ncs L ACT asg recs t (L.terms.getD t 0) sym cdir nt sl) rest)
        (false, rest) := rfl

/-- **the candidate lists agree** -/
theorem kcs_eq (L : LCtx) (TERMS SS need dom n : Nat) (hL : LOK L TERMS SS need dom n) (ACT : Nat) (asg : Asg)
    (recs : List Rec) (ha : AsgOK asg) (hr : RecsWF recs) (t a : Nat) (hA : a < 512) (sym cdir : Bool) (nt sl : List Nat)
    (hnt : ∀ x ∈ nt, x < 512) (hsl : ∀ x ∈ sl, x < 512) :
    kcs SS ACT need asg (recs.map Rec.abs) t a sym cdir nt sl = ncs L ACT asg recs t a sym cdir nt sl := by
  obtain ⟨n1, n2, n3⟩ := mkRecs6_rel L.S SS ACT asg hL.u ha [] nt hnt
  obtain ⟨s1, s2⟩ := mkSls6_rel L.S SS ACT asg hL.u ha sl hsl
  simp only [List.map_nil] at n1 n2
  have w := n3 (fun _ h => absurd h List.not_mem_nil)
  have wp : RecsWF (thru a recs (thru a (mkRecs6 L.S ACT asg nt []).2 [])) :=
    thru_wf a _ (thru_wf a [] (fun _ h => absurd h List.not_mem_nil) _ w) recs hr
  have hpart : BC5.thru a (recs.map Rec.abs) (BC5.thru a (BC6s.mkRecs6 SS ACT asg nt []).2 []) =
      (thru a recs (thru a (mkRecs6 L.S ACT asg nt []).2 [])).map Rec.abs := by
    rw [← n2, thru_map a hA, show ([] : List BC5.Rec) = ([] : List Rec).map Rec.abs from rfl, ← thru_map a hA]
  unfold kcs ncs
  simp only []
  rw [hpart, ← s2, ← hL.need, ← lgMask_eq, ← bmask_eq, ← cmask_eq, ← andLm_eq, ← andRm_eq, ← M8.isZero_eq,
    ← M8.isZero_eq, ← bitsOf_eq, ← bitsOf_eq,
    ← candsC_eq _ _ _ wp _ (bLoop_lt _), ← candsB7_eq _ _ _ _ wp _ (bLoop_lt _)]

theorem kcs_bnd (SS ACT need : Nat) (asg : BC5.Asg) (recs : List BC5.Rec) (t a : Nat) (sym cdir : Bool) (nt sl : List Nat) :
    R6.Bnd (kcs SS ACT need asg recs t a sym cdir nt sl) := by
  unfold kcs
  simp only []
  apply R7.cs_bnd7
  · exact lt_of_le_of_lt (le_trans (S5.andLm_le _ _) (le_trans Nat.and_le_left Nat.and_le_left)) S5.allnz_lt
  · exact lt_of_le_of_lt (le_trans (S5.andRm_le _ _) Nat.and_le_left) S5.allnz_lt

theorem actOK_xor (ACT n t : Nat) (hn : n ≤ 31) (hA : ACTOK ACT n) (ht : ACT.testBit t = true) :
    ACTOK (Nat.xor ACT (pw t)) n := by
  intro u hu
  have htn := hA t ht
  rw [pw_fact t (by omega), Nat.xor_eq, Nat.testBit_xor, Nat.testBit_two_pow] at hu
  by_cases e : t = u
  · subst e; exact htn
  · rw [decide_eq_false e, Bool.xor_false] at hu; exact hA u hu

/-- **the branch node** -/
theorem br_sim (L : LCtx) (TERMS SS need dom n : Nat) (hL : LOK L TERMS SS need dom n)
    (ihn : Nat → Asg → List Rec → Nat → Bool × Nat)
    (ihk : Nat → Nat → Nat → Nat → BC5.Asg → List BC5.Rec → Nat → Nat → Bool × Nat)
    (hih : ∀ ACT asg recs p, ACTOK ACT n → AsgOK asg → RecsWF recs → (ihn ACT asg recs p).1 = true →
      ihk TERMS SS ACT need asg (recs.map Rec.abs) dom (win (natOfBytes L.d) L.e p) =
        (true, win (natOfBytes L.d) L.e (ihn ACT asg recs p).2))
    (ACT : Nat) (asg : Asg) (recs : List Rec) (hACT : ACTOK ACT n) (ha : AsgOK asg) (hr : RecsWF recs)
    (t : Nat) (sym cdir : Bool) (nt sl : List Nat) (rest : Nat) (hnt : ∀ x ∈ nt, x < 512) (hsl : ∀ x ∈ sl, x < 512)
    (h : (nbr ihn L ACT asg recs t sym cdir nt sl rest).1 = true) :
    kbr ihk TERMS SS ACT need asg (recs.map Rec.abs) dom t sym cdir nt sl (win (natOfBytes L.d) L.e rest) =
      (true, win (natOfBytes L.d) L.e (nbr ihn L ACT asg recs t sym cdir nt sl rest).2) := by
  rw [nbr_eq] at h ⊢
  -- the conditions hold
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
  have hA := hL.tlt t
  have ea : Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511 = L.terms.getD t 0 := (hL.terms t htn).symm
  obtain ⟨n1, n2, n3⟩ := mkRecs6_rel L.S SS ACT asg hL.u ha [] nt hnt
  obtain ⟨s1, s2⟩ := mkSls6_rel L.S SS ACT asg hL.u ha sl hsl
  simp only [List.map_nil] at n1 n2
  have wn := n3 (fun _ h => absurd h List.not_mem_nil)
  have wall : RecsWF (app recs (mkRecs6 L.S ACT asg nt []).2) := app_wf _ wn recs hr
  rw [kbr_eq, ea, ← n1, ← n2, ← app_map, ← s1, kcs_eq L TERMS SS need dom n hL ACT asg recs ha hr t _ hA sym cdir nt sl hnt hsl]
  unfold kbrG
  have hbnd := kcs_bnd SS ACT need asg (recs.map Rec.abs) t (L.terms.getD t 0) sym cdir nt sl
  rw [kcs_eq L TERMS SS need dom n hL ACT asg recs ha hr t _ hA sym cdir nt sl hnt hsl] at hbnd
  have hpw : Nat.shiftLeft 1 t = pw t := by rw [pw_fact t (by have := hL.n31; omega), Nat.shiftLeft_eq', Nat.one_shiftLeft]
  rw [hpw]
  have hk := kloop_sim (natOfBytes L.d) L.e
    (fun q p' => ihn (Nat.xor ACT (pw t)) ((L.terms.getD t 0, q.1, q.2) :: asg)
      (updRecs (L.terms.getD t 0) q.1 q.2 (app recs (mkRecs6 L.S ACT asg nt []).2)) p')
    (fun p S => ihk TERMS SS (Nat.xor ACT (pw t)) need ((L.terms.getD t 0, p.1, p.2) :: asg)
      (BC5.updRecs (L.terms.getD t 0) p.1 p.2 ((app recs (mkRecs6 L.S ACT asg nt []).2).map Rec.abs)) dom S)
    (ncs L ACT asg recs t (L.terms.getD t 0) sym cdir nt sl) (fun q hq p hf => by
      obtain ⟨hq1, hq2⟩ := cs_mem_lt _ hbnd q hq
      obtain ⟨u1, u2⟩ := updRecs_map _ _ _ hA hq1 hq2 _ wall
      have hasg : AsgOK ((L.terms.getD t 0, q.1, q.2) :: asg) := fun e he => by
        rcases List.mem_cons.mp he with rfl | he
        · exact ⟨hA, hq1, hq2⟩
        · exact ha e he
      show ihk TERMS SS (Nat.xor ACT (pw t)) need ((L.terms.getD t 0, q.1, q.2) :: asg)
        (BC5.updRecs (L.terms.getD t 0) q.1 q.2 ((app recs (mkRecs6 L.S ACT asg nt []).2).map Rec.abs)) dom
        (win (natOfBytes L.d) L.e p) = _
      rw [← u1]
      exact hih _ _ _ p (actOK_xor ACT n t hL.n31 hACT ht) hasg u2 hf) rest h
  rw [hk]
  simp only [Bool.and_true]
  rw [show BC5.bit ACT t = nbit ACT t from rfl, ← hL.dom, ← allDom_eq, ← allDom_eq, ← allThru_eq _ hA, hC]

/-- **the native node check simulates the kernel's** -/
theorem checkS_sim (L : LCtx) (TERMS SS need dom n : Nat) (hL : LOK L TERMS SS need dom n) :
    ∀ fuel ACT asg recs p, ACTOK ACT n → AsgOK asg → RecsWF recs → (checkS L fuel ACT asg recs p).1 = true →
      BC7s.checkS fuel TERMS SS ACT need asg (recs.map Rec.abs) dom (win (natOfBytes L.d) L.e p) =
        (true, win (natOfBytes L.d) L.e (checkS L fuel ACT asg recs p).2) := by
  intro fuel
  induction fuel with
  | zero => intro ACT asg recs p _ _ _ h; exact absurd h (by simp [checkS])
  | succ fuel ih =>
    intro ACT asg recs p hACT ha hr h
    rw [ncheck_succ] at h ⊢
    rw [kcheck_succ]
    have e0 : BC5.rd 1 (win (natOfBytes L.d) L.e p) = rdw L.d L.e p 1 := (rdw_eq _ _ _ _ (by norm_num)).symm
    have s1 : BC5.sk 1 (win (natOfBytes L.d) L.e p) = win (natOfBytes L.d) L.e (p + 1) := sk_win _ _ _ _
    rw [e0, s1]
    cases htag : Nat.beq (rdw L.d L.e p 1) 0
    · -- branch node
      rw [htag] at h
      simp only [cond_false] at h ⊢
      rw [sk_win, sk_win, sk_win, sk_win, ← rdw_eq _ _ _ _ (by norm_num), ← rdw_eq _ _ _ _ (by norm_num),
        ← rdw_eq _ _ _ _ (by norm_num), ← rdw_eq _ _ _ _ (by norm_num), rdList_eq, ← rdw_eq _ _ _ _ (by norm_num),
        sk_win, rdList_eq]
      exact br_sim L TERMS SS need dom n hL (checkS L fuel) (BC7s.checkS fuel)
        (fun ACT' asg' recs' p' h1 h2 h3 h4 => ih ACT' asg' recs' p' h1 h2 h3 h4) ACT asg recs hACT ha hr _ _ _ _ _ _
        (rdList_lt _ _ _ _) (rdList_lt _ _ _ _) h
    · -- over node
      rw [htag] at h
      simp only [cond_true] at h ⊢
      have hX : rdw L.d L.e (p + 1) 9 < 512 := by have := rdw_lt L.d L.e (p + 1) 9 (le_refl _); norm_num at this ⊢; omega
      rw [← rdw_eq _ _ _ _ (le_refl _), sk_win, mbit, hL.dom, over6_eq L.S SS ACT asg _ hL.u hX ha] at *
      rw [h]

end NL
