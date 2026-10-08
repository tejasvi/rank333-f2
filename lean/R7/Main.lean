module
public import R22Port.U_d41d8cd98f00
public import R6.Main
public import S7.Leaf7
public import BranchCheck7
/-! # v7 ⇒ v7s refinement: the fast checker `BranchCheck7` accepts exactly what `BranchCheck7s` accepts

Copy of `R6.Main` (v6 ⇒ v6s) with v7's candidate loop: `candsB7_eq` (the fused loop over the bits of `B` with the pair
filter = v7s's list loop over `bitsOf B`); every other function is v6's/v6s's, related by R6's lemmas.
`batch7_ref : BC7.batch fuel D = BC7s.batch fuel D`, and **`batch7v_sound`**: S7's batch theorem for the fast checker. -/
@[expose] public section
namespace BC7
open BC4 BC6 BC7T
local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)
local macro:30 a:term:31 " ∨ᵇ " b:term:30 : term => `(@Bool.rec (fun _ => Bool) $b true $a)
local macro "notb " c:term:max : term => `(@Bool.rec (fun _ => Bool) true false $c)
noncomputable section
/-- one node of `BC7.checkS`, with the recursive call `ih` (copied from the checker) -/
def node7 (ih : Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat) (TERMS SS ACT need : Nat) (asg : Asg)
    (recs : List Rec) (dom S : Nat) : Bool × Nat :=
      sel (Nat.beq (rd 1 S) 0)
        (let X := rd 9 (sk 1 S)
         (bit dom X ∧ᵇ overOk SS ACT asg X, sk 10 S))
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
         let lgm := lgMask need t
         let B := andLm part (Nat.land (Nat.land ALLNZ lgm) (sel sym ORBM M512))
         let Cb := andRm part (Nat.land ALLNZ lgm)
         let cs : List (Nat × Nat) := sel cdir
           (sel (Nat.beq Cb 0) [] (sel (Nat.beq B 0) [] (candsC part ss.2 B Cb)))
           (sel (Nat.beq B 0) [] (candsB7 sym part ss.2 Cb B))
         let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
         let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
           (fun p _ ihc S => let r := ih TERMS SS ACT' need ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
              sel r.1 (ihc r.2) (false, r.2)) cs slr.2
         (bit ACT t ∧ᵇ (notb sym ∨ᵇ isNil asg) ∧ᵇ allDom dom nt ∧ᵇ nr.1 ∧ᵇ allDom dom sl ∧ᵇ allThru a sl ∧ᵇ ss.1 ∧ᵇ kr.1,
          kr.2))

end
end BC7

namespace R7
open BC4 R6

local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)
local macro:30 a:term:31 " ∨ᵇ " b:term:30 : term => `(@Bool.rec (fun _ => Bool) $b true $a)
local macro "notb " c:term:max : term => `(@Bool.rec (fun _ => Bool) true false $c)

/-- the loop of `BC7.candsB7` -/
noncomputable def cB7 (sym : Bool) (part : List BC6.Rec) (ss : List (Bool × Nat × Nat)) (cb n : Nat) : Nat → List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => [])
    (fun _ ih m => @Bool.rec (fun _ => List (Nat × Nat))
      (BC7.candB7 sym part ss cb (BC6.lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) (ih (Nat.land m (Nat.sub m 1)))) []
      (Nat.beq m 0)) n

theorem cB7_eq {part6 : List BC6.Rec} {part5 : List BC5.Rec} (h : List.Forall₂ RR part6 part5) (sym : Bool)
    (ss : List (Bool × Nat × Nat)) (cb : Nat) :
    ∀ n m, m < 2 ^ 512 → cB7 sym part6 ss cb n m = BC7s.candsB7 sym part5 ss cb (S5.bLoop n m) := by
  intro n
  induction n with
  | zero => intro m _; rfl
  | succ k ih =>
    intro m hm
    have e6 : cB7 sym part6 ss cb (k + 1) m = @Bool.rec (fun _ => List (Nat × Nat))
        (BC7.candB7 sym part6 ss cb (BC6.lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) (cB7 sym part6 ss cb k (Nat.land m (Nat.sub m 1))))
        [] (Nat.beq m 0) := rfl
    rw [e6, bL5_succ, sel_eq, sub1_eq, lg2_eq]
    cases h0 : Nat.beq m 0
    · rw [condF, condF]
      have hm0 : m ≠ 0 := by intro e; rw [e] at h0; exact absurd h0 (by decide)
      have hb := lowbit_lt m hm0 hm
      have e1 : BC7.candB7 sym part6 ss cb (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))))
          (cB7 sym part6 ss cb k (Nat.land m (Nat.pred m))) =
          BC6.pairsB (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))))
            (BC6.cmS (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) ss
              (BC6.cmT (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) part6
                (@Bool.rec (fun _ => Nat) cb (Nat.land cb (BC7T.corbM (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))))) sym)))
            (cB7 sym part6 ss cb k (Nat.land m (Nat.pred m))) := rfl
      have e2 : BC7s.candsB7 sym part5 ss cb (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))) :: S5.bLoop k (Nat.land m (Nat.pred m))) =
          BC5.pairs true (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))))
            (BC5.cmS (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) ss
              (BC5.cmT (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) part5
                (cond sym (Nat.land cb (BC7T.corbM (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))))) cb)))
            (BC7s.candsB7 sym part5 ss cb (S5.bLoop k (Nat.land m (Nat.pred m)))) := rfl
      rw [e1, e2, sel_eq, cmT_eq _ hb h, cmS_eq, pairsB_eq, ih _ (land_pred_lt m hm)]
    · rw [condT, condT]; rfl

theorem candsB7_eq {part6 : List BC6.Rec} {part5 : List BC5.Rec} (h : List.Forall₂ RR part6 part5) (sym : Bool)
    (ss : List (Bool × Nat × Nat)) (cb B : Nat) (hB : B < 2 ^ 512) :
    BC7.candsB7 sym part6 ss cb B = BC7s.candsB7 sym part5 ss cb (BC5.bitsOf B) := cB7_eq h sym ss cb 512 B hB

theorem candsB7_bnd (sym : Bool) (part : List BC5.Rec) (ss : List (Bool × Nat × Nat)) (cb : Nat) (hcb : cb < 2 ^ 512) :
    ∀ bs : List Nat, (∀ x ∈ bs, x < 512) → Bnd (BC7s.candsB7 sym part ss cb bs)
  | [], _ => fun _ hp => absurd hp List.not_mem_nil
  | b :: bs, hbs => by
    have e : BC7s.candsB7 sym part ss cb (b :: bs) =
        BC5.pairs true b (BC5.cmS b ss (BC5.cmT b part (cond sym (Nat.land cb (BC7T.corbM b)) cb))) (BC7s.candsB7 sym part ss cb bs) := rfl
    rw [e]
    have hlt : cond sym (Nat.land cb (BC7T.corbM b)) cb < 2 ^ 512 := by
      cases sym
      · rw [condF]; exact hcb
      · rw [condT]; exact lt_of_le_of_lt (land_le_left _ _) hcb
    exact pLoop_bnd true b (hbs b List.mem_cons_self) _ (candsB7_bnd sym part ss cb hcb bs (fun x hx => hbs x (List.mem_cons_of_mem _ hx)))
      512 _ (lt_of_le_of_lt (le_trans (S5.cmS_le _ _ _) (S5.cmT_le _ _ _)) hlt)

theorem cs_bnd7 (part : List BC5.Rec) (ss : List (Bool × Nat × Nat)) (sym cdir : Bool) (B Cb : Nat) (hB : B < 2 ^ 512)
    (hCb : Cb < 2 ^ 512) :
    Bnd (cond cdir (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (BC5.candsC part ss B (BC5.bitsOf Cb))))
      (cond (Nat.beq B 0) [] (BC7s.candsB7 sym part ss Cb (BC5.bitsOf B)))) := by
  have hnil : Bnd [] := fun _ hp => absurd hp List.not_mem_nil
  cases cdir
  · rw [condF]; cases Nat.beq B 0
    · rw [condF]; exact candsB7_bnd sym part ss Cb hCb _ (bitsOf_bnd B hB)
    · rw [condT]; exact hnil
  · rw [condT]; cases Nat.beq Cb 0
    · rw [condF]; cases Nat.beq B 0
      · rw [condF]; exact candsC_bnd part ss B hB _ (bitsOf_bnd Cb hCb)
      · rw [condT]; exact hnil
    · rw [condT]; exact hnil

/-- **The node step.** -/
theorem node7_eq (ih6 : Ih6) (ih5 : Ih5) (IH : IHrel ih6 ih5) (TERMS SS ACT need : Nat) (asg : List (Nat × Nat × Nat))
    {recs6 : List BC6.Rec} {recs5 : List BC5.Rec} (hrecs : List.Forall₂ RR recs6 recs5) (dom S : Nat) :
    BC7.node7 ih6 TERMS SS ACT need asg recs6 dom S = S7.nodeS7 ih5 TERMS SS ACT need asg recs5 dom S := by
  unfold BC7.node7 S7.nodeS7
  rw [rd_eq 1 S, sel_eq]
  cases Nat.beq (BC5.rd 1 S) 0
  · rw [condF, condF]
    show
      let S1 := BC6.sk 1 S
      let t := BC6.rd 5 S1
      let sym := Nat.beq (BC6.rd 1 (BC6.sk 5 S1)) 1
      let cdir := Nat.beq (BC6.rd 1 (BC6.sk 6 S1)) 1
      let ntr := BC6.rdList (BC6.rd 4 (BC6.sk 7 S1)) (BC6.sk 11 S1)
      let slr := BC6.rdList (BC6.rd 3 ntr.2) (BC6.sk 3 ntr.2)
      let nt := ntr.1
      let sl := slr.1
      let a := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
      let nr := BC6.mkRecs SS ACT asg nt []
      let part := BC6.thru a recs6 (BC6.thru a nr.2 [])
      let allr := BC6.app recs6 nr.2
      let ss := BC6.mkSls SS ACT asg sl
      let lgm := BC6.lgMask need t
      let B := BC6.andLm part (Nat.land (Nat.land ALLNZ lgm) (sel sym ORBM M512))
      let Cb := BC6.andRm part (Nat.land ALLNZ lgm)
      let cs : List (Nat × Nat) := sel cdir
        (sel (Nat.beq Cb 0) [] (sel (Nat.beq B 0) [] (BC6.candsC part ss.2 B Cb)))
        (sel (Nat.beq B 0) [] (BC7.candsB7 sym part ss.2 Cb B))
      let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
      let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
        (fun p _ ihc S => let r := ih6 TERMS SS ACT' need ((a, p.1, p.2) :: asg) (BC6.updRecs a p.1 p.2 allr) dom S
           sel r.1 (ihc r.2) (false, r.2)) cs slr.2
      let S1' := BC5.sk 1 S
      let t' := BC5.rd 5 S1'
      let sym' := Nat.beq (BC5.rd 1 (BC5.sk 5 S1')) 1
      let cdir' := Nat.beq (BC5.rd 1 (BC5.sk 6 S1')) 1
      let ntr' := BC5.rdList (BC5.rd 4 (BC5.sk 7 S1')) (BC5.sk 11 S1')
      let slr' := BC5.rdList (BC5.rd 3 ntr'.2) (BC5.sk 3 ntr'.2)
      let nt' := ntr'.1
      let sl' := slr'.1
      let a' := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t')) 511
      let nr' := BC6s.mkRecs6 SS ACT asg nt' []
      let part' := BC5.thru a' recs5 (BC5.thru a' nr'.2 [])
      let allr' := BC5.app recs5 nr'.2
      let ss' := BC6s.mkSls6 SS ACT asg sl'
      let lgm' := BC6s.lgMask need t'
      let B' := BC5.andLm part' (Nat.land (Nat.land ALLNZ lgm') (cond sym' ORBM M512))
      let Cb' := BC5.andRm part' (Nat.land ALLNZ lgm')
      let cs' : List (Nat × Nat) := cond cdir'
        (cond (Nat.beq Cb' 0) [] (cond (Nat.beq B' 0) [] (BC5.candsC part' ss'.2 B' (BC5.bitsOf Cb'))))
        (cond (Nat.beq B' 0) [] (BC7s.candsB7 sym' part' ss'.2 Cb' (BC5.bitsOf B')))
      let ACT'' := Nat.xor ACT (Nat.shiftLeft 1 t')
      let kr' := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
        (fun p _ ihc S => let r := ih5 TERMS SS ACT'' need ((a', p.1, p.2) :: asg) (BC5.updRecs a' p.1 p.2 allr') dom S
           cond r.1 (ihc r.2) (false, r.2)) cs' slr'.2
      (BC6.bit ACT t ∧ᵇ (notb sym ∨ᵇ BC6.isNil asg) ∧ᵇ BC6.allDom dom nt ∧ᵇ nr.1 ∧ᵇ BC6.allDom dom sl ∧ᵇ
          BC6.allThru a sl ∧ᵇ ss.1 ∧ᵇ kr.1, kr.2) =
        (BC5.bit ACT t' && ((!sym') || asg.isEmpty) && BC5.allDom dom nt' && nr'.1 && BC5.allDom dom sl' &&
          BC5.allThru a' sl' && ss'.1 && kr'.1, kr'.2)
    intro S1 t sym cdir ntr slr nt sl a nr part allr ss lgm B Cb cs ACT' kr
      S1' t' sym' cdir' ntr' slr' nt' sl' a' nr' part' allr' ss' lgm' B' Cb' cs' ACT'' kr'
    have hS1 : S1 = S1' := sk_eq 1 S
    have ht : t = t' := by show BC6.rd 5 S1 = BC5.rd 5 S1'; rw [rd_eq, hS1]
    have hsym : sym = sym' := by
      show Nat.beq (BC6.rd 1 (BC6.sk 5 S1)) 1 = Nat.beq (BC5.rd 1 (BC5.sk 5 S1')) 1; rw [rd_eq, sk_eq, hS1]
    have hcdir : cdir = cdir' := by
      show Nat.beq (BC6.rd 1 (BC6.sk 6 S1)) 1 = Nat.beq (BC5.rd 1 (BC5.sk 6 S1')) 1; rw [rd_eq, sk_eq, hS1]
    have hntr : ntr = ntr' := by
      show BC6.rdList (BC6.rd 4 (BC6.sk 7 S1)) (BC6.sk 11 S1) = BC5.rdList (BC5.rd 4 (BC5.sk 7 S1')) (BC5.sk 11 S1')
      rw [rdList_eq, rd_eq, sk_eq, sk_eq, hS1]
    have hslr : slr = slr' := by
      show BC6.rdList (BC6.rd 3 ntr.2) (BC6.sk 3 ntr.2) = BC5.rdList (BC5.rd 3 ntr'.2) (BC5.sk 3 ntr'.2)
      rw [rdList_eq, rd_eq, sk_eq, hntr]
    have hnt : nt = nt' := by show ntr.1 = ntr'.1; rw [hntr]
    have hsl : sl = sl' := by show slr.1 = slr'.1; rw [hslr]
    have ha : a = a' := by
      show Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511 = Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t')) 511; rw [ht]
    have hnr : nr.1 = nr'.1 ∧ List.Forall₂ RR nr.2 nr'.2 := by
      show (BC6.mkRecs SS ACT asg nt []).1 = (BC6s.mkRecs6 SS ACT asg nt' []).1 ∧
        List.Forall₂ RR (BC6.mkRecs SS ACT asg nt []).2 (BC6s.mkRecs6 SS ACT asg nt' []).2
      rw [← hnt]; exact mkRecs_rel SS ACT asg nt List.Forall₂.nil
    have hpart : List.Forall₂ RR part part' := by
      show List.Forall₂ RR (BC6.thru a recs6 (BC6.thru a nr.2 [])) (BC5.thru a' recs5 (BC5.thru a' nr'.2 []))
      rw [← ha]; exact thru_rel a (thru_rel a List.Forall₂.nil hnr.2) hrecs
    have hallr : List.Forall₂ RR allr allr' := by
      show List.Forall₂ RR (BC6.app recs6 nr.2) (BC5.app recs5 nr'.2); exact app_rel hnr.2 hrecs
    have hss : ss = ss' := by show BC6.mkSls SS ACT asg sl = BC6s.mkSls6 SS ACT asg sl'; rw [hsl, mkSls_eq]
    have hlgm : lgm = lgm' := by show BC6.lgMask need t = BC6s.lgMask need t'; rw [ht, lgMask_eq]
    have hB : B = B' := by
      show BC6.andLm part (Nat.land (Nat.land ALLNZ lgm) (sel sym ORBM M512)) =
        BC5.andLm part' (Nat.land (Nat.land ALLNZ lgm') (cond sym' ORBM M512))
      rw [andLm_eq hpart, hlgm, hsym, sel_eq]
    have hCb : Cb = Cb' := by
      show BC6.andRm part (Nat.land ALLNZ lgm) = BC5.andRm part' (Nat.land ALLNZ lgm'); rw [andRm_eq hpart, hlgm]
    have hB'lt : B' < 2 ^ 512 :=
      lt_of_le_of_lt (le_trans (andLm_le _ _) (le_trans (land_le_left _ _) (land_le_left _ _))) allnz_lt
    have hCb'lt : Cb' < 2 ^ 512 := lt_of_le_of_lt (le_trans (andRm_le _ _) (land_le_left _ _)) allnz_lt
    have hcs : cs = cs' := by
      show sel cdir (sel (Nat.beq Cb 0) [] (sel (Nat.beq B 0) [] (BC6.candsC part ss.2 B Cb)))
          (sel (Nat.beq B 0) [] (BC7.candsB7 sym part ss.2 Cb B)) =
        cond cdir' (cond (Nat.beq Cb' 0) [] (cond (Nat.beq B' 0) [] (BC5.candsC part' ss'.2 B' (BC5.bitsOf Cb'))))
          (cond (Nat.beq B' 0) [] (BC7s.candsB7 sym' part' ss'.2 Cb' (BC5.bitsOf B')))
      rw [candsC_eq hpart _ _ _ (hCb ▸ hCb'lt), candsB7_eq hpart sym _ _ _ (hB ▸ hB'lt), hB, hCb, hss, hcdir, hsym]
      simp only [sel_eq]
    have hACT : ACT' = ACT'' := by
      show Nat.xor ACT (Nat.shiftLeft 1 t) = Nat.xor ACT (Nat.shiftLeft 1 t'); rw [ht]
    have hcsb : Bnd cs := by
      rw [hcs]; exact cs_bnd7 part' ss'.2 sym' cdir' B' Cb' hB'lt hCb'lt
    have hkr : kr = kr' := by
      show BC6.kloop6 ih6 TERMS SS ACT' need a asg allr dom cs slr.2 = kloop5 ih5 TERMS SS ACT'' need a' asg allr' dom cs' slr'.2
      rw [← hACT, ← ha, ← hcs, ← hslr]
      exact kloop_eq ih6 ih5 IH TERMS SS ACT' need a asg hallr dom cs hcsb slr.2
    rw [ht, hsym, hnt, hsl, ha, hnr.1, hss, hkr]
    simp only [bit_eq, isNil_eq, allDom_eq, allThru_eq, sel_eq, cond_and, cond_or, cond_not, Bool.and_assoc]
  · rw [condT, condT]
    show (BC6.bit dom (BC6.rd 9 (BC6.sk 1 S)) ∧ᵇ BC6.overOk SS ACT asg (BC6.rd 9 (BC6.sk 1 S)), BC6.sk 10 S) =
      (BC5.bit dom (BC5.rd 9 (BC5.sk 1 S)) && BC6s.over6 SS ACT asg (BC5.rd 9 (BC5.sk 1 S)), BC5.sk 10 S)
    rw [rd_eq, sk_eq, sk_eq, bit_eq, overOk_eq _ _ _ _ (rd_lt9 _), sel_eq, cond_and]

theorem checkS_succ7 (fuel TERMS SS ACT need : Nat) (asg : BC6.Asg) (recs : List BC6.Rec) (dom S : Nat) :
    BC7.checkS (fuel + 1) TERMS SS ACT need asg recs dom S = BC7.node7 (BC7.checkS fuel) TERMS SS ACT need asg recs dom S :=
  rfl

/-- **Refinement of the node induction.** -/
theorem checkS7_ref : ∀ fuel, IHrel (BC7.checkS fuel) (BC7s.checkS fuel) := by
  intro fuel
  induction fuel with
  | zero => intro TERMS SS ACT need asg recs6 recs5 _ dom S; rfl
  | succ n ih =>
    intro TERMS SS ACT need asg recs6 recs5 hrecs dom S
    rw [checkS_succ7, S7.checkS7_succ]
    exact node7_eq _ _ ih TERMS SS ACT need asg hrecs dom S

theorem checkS7_nil (fuel TERMS SS ACT need : Nat) (asg : List (Nat × Nat × Nat)) (dom S : Nat) :
    BC7.checkS fuel TERMS SS ACT need asg [] dom S = BC7s.checkS fuel TERMS SS ACT need asg [] dom S :=
  checkS7_ref fuel TERMS SS ACT need asg [] [] List.Forall₂.nil dom S

theorem leafS7_ref (R : Nat) : BC7.leafS R = BC7s.leafS R := by
  simp only [BC7.leafS, BC7s.leafS, rd_eq, sk_eq, rkSum_eq, needP_eq, mkSSP_eq, sub1_eq, blt_eq, checkS7_nil, sel_eq,
    cond_and, cond_or]

theorem batch7_ref : ∀ fuel D, BC7.batch fuel D = BC7s.batch fuel D := by
  intro fuel
  induction fuel with
  | zero => intro D; rfl
  | succ k ih =>
    intro D
    have e6 : BC7.batch (k + 1) D = sel (Nat.beq (BC6.rd 1 D) 1) (BC7.leafS (BC6.sk 1 D))
        (BC7.batch k (BC6.rd (BC6.rd 24 (BC6.sk 1 D)) (BC6.sk 25 D)) ∧ᵇ
          BC7.batch k (BC6.sk (Nat.add 25 (BC6.rd 24 (BC6.sk 1 D))) D)) := rfl
    have e5 : BC7s.batch (k + 1) D = cond (Nat.beq (BC5.rd 1 D) 1) (BC7s.leafS (BC5.sk 1 D))
        (BC7s.batch k (BC5.rd (BC5.rd 24 (BC5.sk 1 D)) (BC5.sk 25 D)) &&
          BC7s.batch k (BC5.sk (Nat.add 25 (BC5.rd 24 (BC5.sk 1 D))) D)) := rfl
    rw [e6, e5, ih, ih, leafS7_ref, sel_eq, sel_eq, cond_and]
    simp only [rd_eq, sk_eq]

/-- **Batch theorem for the fast checker v7.** Every leaf of a batch accepted by `BranchCheck7` has no decomposition. -/
theorem batch7v_sound (fuel D : Nat) (h : BC7.batch fuel D = true) :
    ∀ R ∈ S5.leaves fuel D, S5.NoDecomp (S5.leafT R) (S5.leafN R) (S6.leafDom6 R) :=
  S7.batch7_sound fuel D (by rw [← batch7_ref]; exact h)

end R7
