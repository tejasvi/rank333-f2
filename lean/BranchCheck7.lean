module
public import R22Port.U_d41d8cd98f00
public import BC4Tables
public import BC6Tables
public import BC7Tables
public import BranchCheck6
/-! # BranchCheck v7: v6 plus the GL3 pair symmetry at `sym` nodes

`(a, b, c) ↦ (a, b S, S⁻¹ c)` (`S ∈ GL3(F2)`) maps decompositions to decompositions (`S5.sym_sum`).  v6 uses it at a `sym`
node (the leaf root) to restrict `b_t` to the orbit representatives `ORBM`.  The stabilizer `Stab(b) = {S : b S = b}`
still acts on `c_t` (by `c ↦ S⁻¹ c`), so v7 also restricts `c_t` to `CORB[b_t]`, the orbit minima of that action
(`BC7Tables`, `leaf2/mktab7.py`): at a `sym` node branched with `cdir = false` the `c`-mask of a candidate `b` starts from
`cb ∧ CORB[b]` instead of `cb`.  Everything else is v6's code (`BC6.*`); with `sym = false` a node is v6's node.
Soundness: `leaf2/S7` (v7s) and `leaf2/R7` (v7 = v7s). -/
@[expose] public section
namespace BC7
open BC4 BC6 BC7T

local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)
local macro:30 a:term:31 " ∨ᵇ " b:term:30 : term => `(@Bool.rec (fun _ => Bool) $b true $a)
local macro "notb " c:term:max : term => `(@Bool.rec (fun _ => Bool) true false $c)

noncomputable section

/-- `BC6.candB1` with the pair filter at `sym` nodes -/
@[inline] def candB7 (sym : Bool) (part : List Rec) (ss : List (Bool × Nat × Nat)) (cb b : Nat) (tail : List (Nat × Nat)) :
    List (Nat × Nat) :=
  pairsB b (cmS b ss (cmT b part (sel sym (Nat.land cb (corbM b)) cb))) tail
/-- candidate pairs, `b` over the set bits of `B` ascending (`BC6.candsB` with `candB7`) -/
def candsB7 (sym : Bool) (part : List Rec) (ss : List (Bool × Nat × Nat)) (cb B : Nat) : List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => [])
    (fun _ ih m => sel (Nat.beq m 0) [] (candB7 sym part ss cb (lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) (ih (Nat.land m (Nat.sub m 1))))) 512 B

def checkS (fuel : Nat) : Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat :=
  @Nat.rec (fun _ => Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat) (fun _ _ _ _ _ _ _ S => (false, S))
    (fun _ ih TERMS SS ACT need asg recs dom S =>
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
          kr.2)))
    fuel

/-- one leaf record (v6's format) -/
def leafS (R : Nat) : Bool :=
  let n := rd 6 R
  let T := rd (Nat.mul 9 n) (sk 6 R)
  let R1 := sk (Nat.add 6 (Nat.mul 9 n)) R
  let dm := Nat.beq (rd 1 R1) 0
  let lg := Nat.beq (rd 1 (sk 1 R1)) 1 ∧ᵇ dm
  let RS := rkSum T n
  Nat.ble n 31 ∧ᵇ
    ((lg ∧ᵇ Nat.ble (Nat.succ RS) 27) ∨ᵇ
     (checkS 64 T (mkSSP T n) (Nat.sub (Nat.shiftLeft 1 n) 1) (sel lg (needP T n (Nat.sub RS 27)) 0) [] []
       (sel dm ALLNZ (rd 512 (sk 2 R1))) (sel dm (sk 2 R1) (sk 514 R1))).1)

/-- a batch tree of leaf records -/
def batch (fuel D : Nat) : Bool :=
  @Nat.rec (fun _ => Nat → Bool) (fun _ => false)
    (fun _ ih D => sel (Nat.beq (rd 1 D) 1) (leafS (sk 1 D))
      (let L := rd 24 (sk 1 D); ih (rd L (sk 25 D)) ∧ᵇ ih (sk (Nat.add 25 L) D))) fuel D

end
end BC7
