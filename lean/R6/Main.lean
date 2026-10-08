module
public import R22Port.U_d41d8cd98f00
public import R6.Claims
/-! # v6 ⇒ v6s refinement, part 6: the node induction, leaves, batches

`checkS_ref`: from related record lists, v6's `checkS` and v6s's give the same verdict and stream position, for every
fuel.  The node step (`node_eq`) lifts both `let` chains into the context and matches them value by value; the children
loop (`kloop_eq`) uses the induction hypothesis with the updated records (`updRecs_rel`, candidates below 512).
`batch_ref : BC6.batch fuel D = BC6s.batch fuel D`, and **`batch6v_sound`**: S6's batch theorem for the fast checker. -/
@[expose] public section
namespace BC6
open BC4 BC6
local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)
local macro:30 a:term:31 " ∨ᵇ " b:term:30 : term => `(@Bool.rec (fun _ => Bool) $b true $a)
local macro "notb " c:term:max : term => `(@Bool.rec (fun _ => Bool) true false $c)
noncomputable section
/-- one node of `BC6.checkS`, with the recursive call `ih` (copied from the checker) -/
def node6 (ih : Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat) (TERMS SS ACT need : Nat) (asg : Asg)
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
           (sel (Nat.beq B 0) [] (candsB part ss.2 Cb B))
         let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
         let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
           (fun p _ ihc S => let r := ih TERMS SS ACT' need ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
              sel r.1 (ihc r.2) (false, r.2)) cs slr.2
         (bit ACT t ∧ᵇ (notb sym ∨ᵇ isNil asg) ∧ᵇ allDom dom nt ∧ᵇ nr.1 ∧ᵇ allDom dom sl ∧ᵇ allThru a sl ∧ᵇ ss.1 ∧ᵇ kr.1,
          kr.2))

/-- the children loop of `node6` -/
def kloop6 (ih : Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat) (TERMS SS ACT' need a : Nat) (asg : Asg)
    (allr : List Rec) (dom : Nat) (cs : List (Nat × Nat)) : Nat → Bool × Nat :=
  @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
    (fun p _ ihc S => let r := ih TERMS SS ACT' need ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
       sel r.1 (ihc r.2) (false, r.2)) cs
end
end BC6

namespace R6
open BC4

local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)
local macro:30 a:term:31 " ∨ᵇ " b:term:30 : term => `(@Bool.rec (fun _ => Bool) $b true $a)
local macro "notb " c:term:max : term => `(@Bool.rec (fun _ => Bool) true false $c)

abbrev Ih6 := Nat → Nat → Nat → Nat → BC6.Asg → List BC6.Rec → Nat → Nat → Bool × Nat
abbrev Ih5 := Nat → Nat → Nat → Nat → BC5.Asg → List BC5.Rec → Nat → Nat → Bool × Nat

/-- the children loop of `S6.nodeS6` -/
noncomputable def kloop5 (ih : Ih5) (TERMS SS ACT' need a : Nat) (asg : BC5.Asg) (allr : List BC5.Rec) (dom : Nat)
    (cs : List (Nat × Nat)) : Nat → Bool × Nat :=
  @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
    (fun p _ ihc S => let r := ih TERMS SS ACT' need ((a, p.1, p.2) :: asg) (BC5.updRecs a p.1 p.2 allr) dom S
       cond r.1 (ihc r.2) (false, r.2)) cs

def IHrel (ih6 : Ih6) (ih5 : Ih5) : Prop :=
  ∀ TERMS SS ACT need asg (recs6 : List BC6.Rec) (recs5 : List BC5.Rec), List.Forall₂ RR recs6 recs5 →
    ∀ dom S, ih6 TERMS SS ACT need asg recs6 dom S = ih5 TERMS SS ACT need asg recs5 dom S

theorem kloop_eq (ih6 : Ih6) (ih5 : Ih5) (IH : IHrel ih6 ih5) (TERMS SS ACT' need a : Nat) (asg : List (Nat × Nat × Nat))
    {allr6 : List BC6.Rec} {allr5 : List BC5.Rec} (hallr : List.Forall₂ RR allr6 allr5) (dom : Nat) :
    ∀ cs : List (Nat × Nat), Bnd cs → ∀ S,
      BC6.kloop6 ih6 TERMS SS ACT' need a asg allr6 dom cs S = kloop5 ih5 TERMS SS ACT' need a asg allr5 dom cs S
  | [], _, _ => rfl
  | p :: cs, hb, S => by
    have hp := hb p List.mem_cons_self
    have hcs : Bnd cs := fun q hq => hb q (List.mem_cons_of_mem _ hq)
    have e6 : BC6.kloop6 ih6 TERMS SS ACT' need a asg allr6 dom (p :: cs) S =
        (let r := ih6 TERMS SS ACT' need ((a, p.1, p.2) :: asg) (BC6.updRecs a p.1 p.2 allr6) dom S
         sel r.1 (BC6.kloop6 ih6 TERMS SS ACT' need a asg allr6 dom cs r.2) (false, r.2)) := rfl
    have e5 : kloop5 ih5 TERMS SS ACT' need a asg allr5 dom (p :: cs) S =
        (let r := ih5 TERMS SS ACT' need ((a, p.1, p.2) :: asg) (BC5.updRecs a p.1 p.2 allr5) dom S
         cond r.1 (kloop5 ih5 TERMS SS ACT' need a asg allr5 dom cs r.2) (false, r.2)) := rfl
    rw [e6, e5, IH _ _ _ _ _ _ _ (updRecs_rel a p.1 p.2 hp.1 hp.2 hallr)]
    generalize ih5 TERMS SS ACT' need ((a, p.1, p.2) :: asg) (BC5.updRecs a p.1 p.2 allr5) dom S = r0
    show sel r0.1 (BC6.kloop6 ih6 TERMS SS ACT' need a asg allr6 dom cs r0.2) (false, r0.2) =
      cond r0.1 (kloop5 ih5 TERMS SS ACT' need a asg allr5 dom cs r0.2) (false, r0.2)
    rw [sel_eq, kloop_eq ih6 ih5 IH TERMS SS ACT' need a asg hallr dom cs hcs r0.2]

theorem andLm_le : ∀ (l : List BC5.Rec) (m : Nat), BC5.andLm l m ≤ m
  | [], _ => le_rfl
  | r :: l, m => le_trans (andLm_le l (Nat.land m r.lm)) (by rw [Nat.land_eq]; exact Nat.and_le_left)
theorem andRm_le : ∀ (l : List BC5.Rec) (m : Nat), BC5.andRm l m ≤ m
  | [], _ => le_rfl
  | r :: l, m => le_trans (andRm_le l (Nat.land m r.rm)) (by rw [Nat.land_eq]; exact Nat.and_le_left)
theorem allnz_lt : ALLNZ < 2 ^ 512 := by decide +kernel
theorem land_le_left (x y : Nat) : Nat.land x y ≤ x := by rw [Nat.land_eq]; exact Nat.and_le_left

theorem bitsOf_bnd (m : Nat) (hm : m < 2 ^ 512) : ∀ x ∈ BC5.bitsOf m, x < 512 := bLoop_bnd 512 m hm

theorem cs_bnd (part : List BC5.Rec) (ss : List (Bool × Nat × Nat)) (cdir : Bool) (B Cb : Nat) (hB : B < 2 ^ 512)
    (hCb : Cb < 2 ^ 512) :
    Bnd (cond cdir (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (BC5.candsC part ss B (BC5.bitsOf Cb))))
      (cond (Nat.beq B 0) [] (BC5.candsB part ss Cb (BC5.bitsOf B)))) := by
  have hnil : Bnd [] := fun _ hp => absurd hp List.not_mem_nil
  cases cdir
  · rw [condF]; cases Nat.beq B 0
    · rw [condF]; exact candsB_bnd part ss Cb hCb _ (bitsOf_bnd B hB)
    · rw [condT]; exact hnil
  · rw [condT]; cases Nat.beq Cb 0
    · rw [condF]; cases Nat.beq B 0
      · rw [condF]; exact candsC_bnd part ss B hB _ (bitsOf_bnd Cb hCb)
      · rw [condT]; exact hnil
    · rw [condT]; exact hnil

theorem rd_lt9 (S : Nat) : BC5.rd 9 S < 512 := by
  unfold BC5.rd
  rw [show Nat.pred (Nat.shiftLeft 1 9) = 511 from rfl, land511]
  exact Nat.mod_lt _ (by norm_num)

/-- **The node step.** -/
theorem node_eq (ih6 : Ih6) (ih5 : Ih5) (IH : IHrel ih6 ih5) (TERMS SS ACT need : Nat) (asg : List (Nat × Nat × Nat))
    {recs6 : List BC6.Rec} {recs5 : List BC5.Rec} (hrecs : List.Forall₂ RR recs6 recs5) (dom S : Nat) :
    BC6.node6 ih6 TERMS SS ACT need asg recs6 dom S = S6.nodeS6 ih5 TERMS SS ACT need asg recs5 dom S := by
  unfold BC6.node6 S6.nodeS6
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
        (sel (Nat.beq B 0) [] (BC6.candsB part ss.2 Cb B))
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
        (cond (Nat.beq B' 0) [] (BC5.candsB part' ss'.2 Cb' (BC5.bitsOf B')))
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
          (sel (Nat.beq B 0) [] (BC6.candsB part ss.2 Cb B)) =
        cond cdir' (cond (Nat.beq Cb' 0) [] (cond (Nat.beq B' 0) [] (BC5.candsC part' ss'.2 B' (BC5.bitsOf Cb'))))
          (cond (Nat.beq B' 0) [] (BC5.candsB part' ss'.2 Cb' (BC5.bitsOf B')))
      rw [candsC_eq hpart _ _ _ (hCb ▸ hCb'lt), candsB_eq hpart _ _ _ (hB ▸ hB'lt), hB, hCb, hss, hcdir]
      simp only [sel_eq]
    have hACT : ACT' = ACT'' := by
      show Nat.xor ACT (Nat.shiftLeft 1 t) = Nat.xor ACT (Nat.shiftLeft 1 t'); rw [ht]
    have hcsb : Bnd cs := by
      rw [hcs]; exact cs_bnd part' ss'.2 cdir' B' Cb' hB'lt hCb'lt
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

theorem checkS_succ6 (fuel TERMS SS ACT need : Nat) (asg : BC6.Asg) (recs : List BC6.Rec) (dom S : Nat) :
    BC6.checkS (fuel + 1) TERMS SS ACT need asg recs dom S = BC6.node6 (BC6.checkS fuel) TERMS SS ACT need asg recs dom S :=
  rfl

/-- **Refinement of the node induction.** -/
theorem checkS_ref : ∀ fuel, IHrel (BC6.checkS fuel) (BC6s.checkS fuel) := by
  intro fuel
  induction fuel with
  | zero => intro TERMS SS ACT need asg recs6 recs5 _ dom S; rfl
  | succ n ih =>
    intro TERMS SS ACT need asg recs6 recs5 hrecs dom S
    rw [checkS_succ6, S6.checkS6_succ]
    exact node_eq _ _ ih TERMS SS ACT need asg hrecs dom S

theorem checkS_nil (fuel TERMS SS ACT need : Nat) (asg : List (Nat × Nat × Nat)) (dom S : Nat) :
    BC6.checkS fuel TERMS SS ACT need asg [] dom S = BC6s.checkS fuel TERMS SS ACT need asg [] dom S :=
  checkS_ref fuel TERMS SS ACT need asg [] [] List.Forall₂.nil dom S

theorem leafS_ref (R : Nat) : BC6.leafS R = BC6s.leafS R := by
  simp only [BC6.leafS, BC6s.leafS, rd_eq, sk_eq, rkSum_eq, needP_eq, mkSSP_eq, sub1_eq, blt_eq, checkS_nil, sel_eq,
    cond_and, cond_or]

theorem batch_ref : ∀ fuel D, BC6.batch fuel D = BC6s.batch fuel D := by
  intro fuel
  induction fuel with
  | zero => intro D; rfl
  | succ k ih =>
    intro D
    have e6 : BC6.batch (k + 1) D = sel (Nat.beq (BC6.rd 1 D) 1) (BC6.leafS (BC6.sk 1 D))
        (BC6.batch k (BC6.rd (BC6.rd 24 (BC6.sk 1 D)) (BC6.sk 25 D)) ∧ᵇ
          BC6.batch k (BC6.sk (Nat.add 25 (BC6.rd 24 (BC6.sk 1 D))) D)) := rfl
    have e5 : BC6s.batch (k + 1) D = cond (Nat.beq (BC5.rd 1 D) 1) (BC6s.leafS (BC5.sk 1 D))
        (BC6s.batch k (BC5.rd (BC5.rd 24 (BC5.sk 1 D)) (BC5.sk 25 D)) &&
          BC6s.batch k (BC5.sk (Nat.add 25 (BC5.rd 24 (BC5.sk 1 D))) D)) := rfl
    rw [e6, e5, ih, ih, leafS_ref, sel_eq, sel_eq, cond_and]
    simp only [rd_eq, sk_eq]

/-- **Batch theorem for the fast checker v6.** Every leaf of a batch accepted by `BranchCheck6` has no decomposition. -/
theorem batch6v_sound (fuel D : Nat) (h : BC6.batch fuel D = true) :
    ∀ R ∈ S5.leaves fuel D, S5.NoDecomp (S5.leafT R) (S5.leafN R) (S6.leafDom6 R) :=
  S6.batch6_sound fuel D (by rw [← batch_ref]; exact h)

end R6
