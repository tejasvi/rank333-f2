module
public import R22Port.U_d41d8cd98f00
public import BC4Tables
public import BC6Tables
public import BranchCheck5
/-! # BranchCheck v6s: the v6 steps written on v5's code (the checker the soundness proof is about)

Same certificates, stream format and verdicts as `BranchCheck6` (branch6/, the fast kernel encoding).  Every function v5
has is v5's own (`BC5.*`), so the v5 soundness development (lean/sound5, `S5`) applies to it unchanged.  New:
* `thru1`, `rank1`, `mkRec6`, `mkSl6`, `over6`: a claim on `X` with exactly ONE assigned term through `X` reads
  `T(X) + b0 c0ᵀ` off the root record of `X` (five cases, `RootSound.Rank1`); otherwise v5's claim;
* `lgMask`: the Lemma G mask of the candidate domains (`RootSound.LemmaG`), switched on per leaf (full `T` only).
Stream format v6: the leaf's dom mode has 2 bits (bit 0: a 512-bit domain mask follows; bit 1: Lemma G on). -/
@[expose] public section
namespace BC6s
open BC4 BC5 BC6

noncomputable section

/-- number of assigned terms through `X` (capped at 2) and the `(b, c)` of one of them -/
def thru1 (X : Nat) (asg : Asg) : Nat × Nat × Nat :=
  @List.rec (Nat × Nat × Nat) (fun _ => Nat × Nat × Nat) (0, 0, 0)
    (fun e _ ih => cond (par (Nat.land e.1 X)) (cond (Nat.beq ih.1 0) (1, e.2.1, e.2.2) (2, ih.2.1, ih.2.2)) ih) asg

/-- half swap at distance `d` under mask `K` -/
def hsw (S d K : Nat) : Nat := Nat.lor (Nat.land (Nat.shiftRight S d) K) (Nat.shiftLeft (Nat.land S K) d)
/-- translate a 512-bit set by `v`: `{s ^^^ v | s ∈ S}` -/
def trans (S v : Nat) : Nat :=
  let S := cond (bit v 0) (hsw S 1 KM0) S
  let S := cond (bit v 1) (hsw S 2 KM1) S
  let S := cond (bit v 2) (hsw S 4 KM2) S
  let S := cond (bit v 3) (hsw S 8 KM3) S
  let S := cond (bit v 4) (hsw S 16 KM4) S
  let S := cond (bit v 5) (hsw S 32 KM5) S
  let S := cond (bit v 6) (hsw S 64 KM6) S
  let S := cond (bit v 7) (hsw S 128 KM7) S
  cond (bit v 8) (hsw S 256 KM8) S

/-- the first vector `k` of a packed basis `W` (vector i in the high half of 18-bit slot i) with `<k, w> = 1`, else 0 -/
def firstPar (W w : Nat) : Nat :=
  let q := Nat.land W (Nat.mul w REPR)
  let q1 := Nat.xor q (Nat.shiftRight q 1)
  let q2 := Nat.xor q1 (Nat.shiftRight q1 2)
  let pm := Nat.land (Nat.xor (Nat.xor q2 (Nat.shiftRight q2 4)) (Nat.shiftRight q 8)) REPR
  let low := Nat.xor pm (Nat.land pm (Nat.sub pm 1))
  Nat.div (Nat.land W (Nat.mul low 511)) low
def kb18 (X : Nat) : Nat := Nat.land (Nat.shiftRight KB18 (Nat.mul 128 X)) 0xffffffffffffffffffffffffffffffff
def lkb18 (X : Nat) : Nat := Nat.land (Nat.shiftRight LKB18 (Nat.mul 128 X)) 0xffffffffffffffffffffffffffffffff

/-- `P` with the rank-1 correction `(A, B)` folded in: `xof P' b = xof P b ^^^ <A, b> B`, `gof P' c = gof P c ^^^ <c, B> A` -/
def corrP (P A B : Nat) : Nat := Nat.xor P (Nat.mul (spr18 A) (Nat.shiftLeft B 9))

def rootP (X : Nat) : Nat := Nat.land (rpt X) M162
def rootRk (X : Nat) : Nat := Nat.land (Nat.shiftRight RKT (Nat.mul 4 X)) 15
/-- masks of `ker T(X)` (by the row-space class) and of the left kernel (by the column-space class) -/
def kerm (X : Nat) : Nat := Nat.land (Nat.shiftRight KERV (Nat.mul 512 (Nat.land (Nat.shiftRight RIDX (Nat.mul 4 X)) 15))) M512
def lkerm (X : Nat) : Nat := Nat.land (Nat.shiftRight LKERV (Nat.mul 512 (Nat.land (Nat.shiftRight LIDX (Nat.mul 4 X)) 15))) M512

/-- the residual `T(X) + b0 c0ᵀ`: rank, column mask, row mask, corrected `P`, and whether the kernel witnesses check -/
structure R1 where
  rk : Nat
  lm : Nat
  rm : Nat
  P : Nat
  ok : Bool

def rank1 (X b0 c0 : Nat) : R1 :=
  let P := rootP X
  let r := rootRk X
  let lm := rlm X
  let rm := rrm X
  let y0 := xof P b0
  let g0 := gof P c0
  cond (bit lm b0)
    (cond (bit rm c0)
      (cond (par (Nat.land c0 y0))
        ⟨Nat.sub r 1, Nat.land lm (perp g0), Nat.land rm (perp y0), P, true⟩
        ⟨r, lm, rm, corrP P g0 y0, true⟩)
      (let k := firstPar (kb18 X) c0
       let x0 := Nat.xor y0 (cond (par (Nat.land c0 y0)) k 0)
       ⟨r, lm, Nat.lor (Nat.land rm (perp x0)) (trans (Nat.land rm (nperp x0)) c0), corrP P g0 x0,
        par (Nat.land k c0) && bit (kerm X) k⟩))
    (cond (bit rm c0)
      (let l := firstPar (lkb18 X) b0
       let z := Nat.xor g0 (cond (par (Nat.land g0 b0)) l 0)
       ⟨r, Nat.lor (Nat.land lm (perp g0)) (trans (Nat.land lm (nperp g0)) b0), rm, corrP P z y0,
        par (Nat.land l b0) && bit (lkerm X) l⟩)
      (let k := firstPar (kb18 X) c0
       let l := firstPar (lkb18 X) b0
       let b1 := Nat.xor y0 (cond (par (Nat.land g0 b0)) 0 k)
       ⟨Nat.succ r, Nat.lor lm (trans lm b0), Nat.lor rm (trans rm c0), corrP (corrP P l b1) g0 k,
        par (Nat.land k c0) && bit (kerm X) k && par (Nat.land l b0) && bit (lkerm X) l⟩))

/-- new tight record: rank-1 claim when exactly one assigned term passes through `X`, else v5's -/
def mkRec6 (SS ACT : Nat) (asg : Asg) (X : Nat) : Bool × Rec :=
  let th := thru1 X asg
  cond (Nat.beq th.1 1)
    (let q := rank1 X th.2.1 th.2.2
     (q.ok && Nat.ble (ucnt SS ACT X) q.rk, mkR X q.P 0 q.lm q.rm))
    (mkRec SS ACT asg X)

/-- slack-one data: rank-1 claim when exactly one assigned term passes through `X`, else v5's -/
def mkSl6 (SS ACT : Nat) (asg : Asg) (X : Nat) : Bool × Nat × Nat :=
  let th := thru1 X asg
  cond (Nat.beq th.1 1)
    (let q := rank1 X th.2.1 th.2.2
     (q.ok && Nat.ble (ucnt SS ACT X) (Nat.succ q.rk), q.lm, q.rm))
    (mkSl SS ACT asg X)

/-- `over X`: rank-1 claim when exactly one assigned term passes through `X`, else v5's elimination -/
def over6 (SS ACT : Nat) (asg : Asg) (X : Nat) : Bool :=
  let th := thru1 X asg
  cond (Nat.beq th.1 1)
    (let q := rank1 X th.2.1 th.2.2
     q.ok && Nat.blt (ucnt SS ACT X) q.rk)
    (let s := elim (resC X asg)
     elimOk s && Nat.blt (ucnt SS ACT X) s.rk)

def mkRecs6 (SS ACT : Nat) (asg : Asg) (nt : List Nat) (tail : List Rec) : Bool × List Rec :=
  @List.rec Nat (fun _ => Bool × List Rec) (true, tail)
    (fun X _ ih => let r := mkRec6 SS ACT asg X; (r.1 && ih.1, r.2 :: ih.2)) nt
def mkSls6 (SS ACT : Nat) (asg : Asg) (sl : List Nat) : Bool × List (Bool × Nat × Nat) :=
  @List.rec Nat (fun _ => Bool × List (Bool × Nat × Nat)) (true, [])
    (fun X _ ih => let s := mkSl6 SS ACT asg X; (s.1 && ih.1, s :: ih.2)) sl

/-- Lemma G mask of term `t`: `RGE[need_t]`, `need` packed 2 bits per term (all 0 when the step is off) -/
def lgMask (need t : Nat) : Nat :=
  Nat.land (Nat.shiftRight RGE (Nat.mul 512 (Nat.land (Nat.shiftRight need (Nat.mul 2 t)) 3))) M512

def checkS (fuel : Nat) : Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat :=
  @Nat.rec (fun _ => Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat) (fun _ _ _ _ _ _ _ S => (false, S))
    (fun _ ih TERMS SS ACT need asg recs dom S =>
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
           (cond (Nat.beq B 0) [] (candsB part ss.2 Cb (bitsOf B)))
         let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
         let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
           (fun p _ ihc S => let r := ih TERMS SS ACT' need ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
              cond r.1 (ihc r.2) (false, r.2)) cs slr.2
         (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 && kr.1,
          kr.2)))
    fuel

def rk3 (v : Nat) : Nat := Nat.land (Nat.shiftRight RK3 (Nat.mul 2 v)) 3
/-- `∑_{s < n} rank a_s` -/
def rkSum (T n : Nat) : Nat :=
  @Nat.rec (fun _ => Nat) 0 (fun s ih => Nat.add ih (rk3 (Nat.land (Nat.shiftRight T (Nat.mul 9 s)) 511))) n
/-- packed `need_s = rank a_s - Δ` (truncated at 0), 2 bits per term -/
def needP (T n D : Nat) : Nat :=
  @Nat.rec (fun _ => Nat) 0 (fun s ih => Nat.lor ih (Nat.shiftLeft (Nat.sub (rk3 (Nat.land (Nat.shiftRight T (Nat.mul 9 s)) 511)) D) (Nat.mul 2 s))) n

/-- one leaf record (v6 format) -/
def leafS (R : Nat) : Bool :=
  let n := rd 6 R
  let T := rd (Nat.mul 9 n) (sk 6 R)
  let R1 := sk (Nat.add 6 (Nat.mul 9 n)) R
  let dm := Nat.beq (rd 1 R1) 0
  let lg := Nat.beq (rd 1 (sk 1 R1)) 1 && dm   -- Lemma G needs the full tensor: only with dom = ALLNZ
  let RS := rkSum T n
  Nat.ble n 31 &&
    ((lg && Nat.blt RS 27) ||
     (checkS 64 T (mkSSP T n) (Nat.pred (Nat.shiftLeft 1 n)) (cond lg (needP T n (Nat.sub RS 27)) 0) [] []
       (cond dm ALLNZ (rd 512 (sk 2 R1))) (cond dm (sk 2 R1) (sk 514 R1))).1)

/-- a batch tree of leaf records -/
def batch (fuel D : Nat) : Bool :=
  @Nat.rec (fun _ => Nat → Bool) (fun _ => false)
    (fun _ ih D => cond (Nat.beq (rd 1 D) 1) (leafS (sk 1 D))
      (let L := rd 24 (sk 1 D); ih (rd L (sk 25 D)) && ih (sk (Nat.add 25 L) D))) fuel D

end
end BC6s
