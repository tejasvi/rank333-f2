module
public import NL.Tables
/-! # NL.Check: the native v7 leaf checker (core only, precompilable)

A line-by-line mirror of the kernel checker `BC7s.leafS` (r22/lean/leaf2/BranchCheck7s.lean on `BC6s.*` and `BC5.*`), with
the kernel's packed `Nat`s replaced by machine words:
* 512-bit masks (`lm`, `rm`, domains, candidate sets) are `M8`; the tables are arrays (`NL.Tables`);
* packed 162-bit matrices (`P`, the elimination's `M`, `txc18 X`) are `S9` (nine 18-bit slots as scalars);
* the certificate is read from a `ByteArray` at a bit position (`rdb`), not by shifting a `Nat`;
* records carry no `XL`/`XH`/`GL`/`GH` tables (the kernel never reads them).
Small values (`X`, `a`, `b`, `c`, `t`, `ACT`, `need`, ranks, positions) stay `Nat` (scalars in compiled code).
Refinement: `NLP/Leaf.lean` (`NL.leafAt d p = true → BC7s.leafS (sk p (natOfBytes d)) = true`). -/
@[expose] public section
namespace NL

/-! ## Scalars -/

/-- the kernel's `bit` on a scalar -/
@[inline] def nbit (n i : Nat) : Bool := Nat.beq (Nat.land (Nat.shiftRight n i) 1) 1
/-- parity of `v < 512` -/
@[inline] def npar (v : Nat) : Bool := Nat.beq (PARB.getD v 0) 1
@[inline] def pop11 (x : Nat) : Nat := POPB.getD x 0
@[inline] def pop32 (x : Nat) : Nat :=
  Nat.add (pop11 (Nat.land x 2047)) (Nat.add (pop11 (Nat.land (Nat.shiftRight x 11) 2047)) (pop11 (Nat.shiftRight x 22)))
/-- `H(X) = XOR_{i ∈ X} S_i` (`S.s_i`: bit `s` = bit `i` of term `s`) -/
@[inline] def hx (S : S9) (X : Nat) : Nat :=
  (cond (nbit X 0) S.s0 0) ^^^ (cond (nbit X 1) S.s1 0) ^^^ (cond (nbit X 2) S.s2 0) ^^^ (cond (nbit X 3) S.s3 0) ^^^
  (cond (nbit X 4) S.s4 0) ^^^ (cond (nbit X 5) S.s5 0) ^^^ (cond (nbit X 6) S.s6 0) ^^^ (cond (nbit X 7) S.s7 0) ^^^
  (cond (nbit X 8) S.s8 0)
/-- `u(X)`: unassigned terms through `X` -/
@[inline] def ucnt (S : S9) (ACT X : Nat) : Nat := pop32 (Nat.land (hx S X) ACT)

abbrev Asg := List (Nat × Nat × Nat)

/-! ## Masks from tables -/

@[inline] def nperpM (v : Nat) : M8 := NPT.getD v default
@[inline] def rlm (X : Nat) : M8 := LMVT.getD (LIDXB.getD X 0) default
@[inline] def rrm (X : Nat) : M8 := RMVT.getD (RIDXB.getD X 0) default
@[inline] def kerm (X : Nat) : M8 := KERVT.getD (RIDXB.getD X 0) default
@[inline] def lkerm (X : Nat) : M8 := LKERVT.getD (LIDXB.getD X 0) default
@[inline] def corbM (b : Nat) : M8 := CORBV.getD (CIDXB.getD b 0) default
@[inline] def rootP (X : Nat) : S9 := RPS.getD X default
@[inline] def rootRk (X : Nat) : Nat := RKB.getD X 0
@[inline] def lgMask (need t : Nat) : M8 := RGEV.getD (Nat.land (Nat.shiftRight need (Nat.mul 2 t)) 3) default

/-! ## Slot matrices -/

/-- right half of a slot -/
@[inline] def rh (s : Nat) : Nat := Nat.land (Nat.shiftRight s 9) 511

/-- `x(b) = XOR_{h ∈ b} x_h` (the kernel's `xof`) -/
@[inline] def xof (P : S9) (b : Nat) : Nat :=
  (cond (nbit b 0) (rh P.s0) 0) ^^^ (cond (nbit b 1) (rh P.s1) 0) ^^^ (cond (nbit b 2) (rh P.s2) 0) ^^^
  (cond (nbit b 3) (rh P.s3) 0) ^^^ (cond (nbit b 4) (rh P.s4) 0) ^^^ (cond (nbit b 5) (rh P.s5) 0) ^^^
  (cond (nbit b 6) (rh P.s6) 0) ^^^ (cond (nbit b 7) (rh P.s7) 0) ^^^ (cond (nbit b 8) (rh P.s8) 0)

/-- `g(c) = ∑_h (c . x_h) e_h` (the kernel's `gof`) -/
@[inline] def gof (P : S9) (c : Nat) : Nat :=
  cond (npar (Nat.land (rh P.s0) c)) 1 0 ||| cond (npar (Nat.land (rh P.s1) c)) 2 0 |||
  cond (npar (Nat.land (rh P.s2) c)) 4 0 ||| cond (npar (Nat.land (rh P.s3) c)) 8 0 |||
  cond (npar (Nat.land (rh P.s4) c)) 16 0 ||| cond (npar (Nat.land (rh P.s5) c)) 32 0 |||
  cond (npar (Nat.land (rh P.s6) c)) 64 0 ||| cond (npar (Nat.land (rh P.s7) c)) 128 0 |||
  cond (npar (Nat.land (rh P.s8) c)) 256 0

/-- the rank-1 correction `(A, B)` folded into `P` (the kernel's `corrP`) -/
@[inline] def corrP (P : S9) (A B : Nat) : S9 :=
  let B9 := Nat.mul B 512
  ⟨cond (nbit A 0) (P.s0 ^^^ B9) P.s0, cond (nbit A 1) (P.s1 ^^^ B9) P.s1, cond (nbit A 2) (P.s2 ^^^ B9) P.s2,
    cond (nbit A 3) (P.s3 ^^^ B9) P.s3, cond (nbit A 4) (P.s4 ^^^ B9) P.s4, cond (nbit A 5) (P.s5 ^^^ B9) P.s5,
    cond (nbit A 6) (P.s6 ^^^ B9) P.s6, cond (nbit A 7) (P.s7 ^^^ B9) P.s7, cond (nbit A 8) (P.s8 ^^^ B9) P.s8⟩

/-- `∑_{z ∈ c} b e_z`-slots: slot `z` is `b` when bit `z` of `c` is set (the kernel's `spr18 c * b`) -/
@[inline] def sprM (c b : Nat) : S9 :=
  ⟨cond (nbit c 0) b 0, cond (nbit c 1) b 0, cond (nbit c 2) b 0, cond (nbit c 3) b 0, cond (nbit c 4) b 0,
    cond (nbit c 5) b 0, cond (nbit c 6) b 0, cond (nbit c 7) b 0, cond (nbit c 8) b 0⟩

/-- columns of the residual `R(X)` with the identity (the kernel's `resC`) -/
def resC (X : Nat) : Asg → S9
  | [] => (TXCS.getD X default).xor ID18S
  | e :: r => cond (npar (Nat.land e.1 X)) ((sprM e.2.2 e.2.1).xor (resC X r)) (resC X r)
/-- rows of `R(X)` with the identity (the kernel's `resR`) -/
def resR (X : Nat) : Asg → S9
  | [] => (TXRS.getD X default).xor ID18S
  | e :: r => cond (npar (Nat.land e.1 X)) ((sprM e.2.1 e.2.2).xor (resR X r)) (resR X r)

/-- no assigned term passes through `X` -/
def noasg (X : Nat) : Asg → Bool
  | [] => true
  | e :: r => !(npar (Nat.land e.1 X)) && noasg X r

/-! ## The elimination (on slots) -/

structure ES where
  P : S9
  PM : Nat
  rk : Nat
  M : S9
deriving Inhabited

/-- one elimination step at bit `h`: the first slot of `M` with bit `h` is the pivot row `p` -/
def stepE (h : Nat) (s : ES) : ES :=
  let M := s.M
  let f0 := nbit M.s0 h; let f1 := nbit M.s1 h; let f2 := nbit M.s2 h; let f3 := nbit M.s3 h; let f4 := nbit M.s4 h
  let f5 := nbit M.s5 h; let f6 := nbit M.s6 h; let f7 := nbit M.s7 h; let f8 := nbit M.s8 h
  if f0 || f1 || f2 || f3 || f4 || f5 || f6 || f7 || f8 then
    let p := if f0 then M.s0 else if f1 then M.s1 else if f2 then M.s2 else if f3 then M.s3 else if f4 then M.s4 else
      if f5 then M.s5 else if f6 then M.s6 else if f7 then M.s7 else M.s8
    let P := s.P
    let pu := fun (z x : Nat) => Nat.lor (Nat.xor x (cond (nbit x h) p 0)) (cond (Nat.beq z h) p 0)
    let mu := fun (f : Bool) (x : Nat) => cond f (Nat.xor x p) x
    ⟨⟨pu 0 P.s0, pu 1 P.s1, pu 2 P.s2, pu 3 P.s3, pu 4 P.s4, pu 5 P.s5, pu 6 P.s6, pu 7 P.s7, pu 8 P.s8⟩,
      Nat.lor s.PM (pw h), Nat.succ s.rk,
      ⟨mu f0 M.s0, mu f1 M.s1, mu f2 M.s2, mu f3 M.s3, mu f4 M.s4, mu f5 M.s5, mu f6 M.s6, mu f7 M.s7, mu f8 M.s8⟩⟩
  else s

/-- steps at bits 8, 7, ..., 0 -/
def elim (M : S9) : ES :=
  stepE 0 (stepE 1 (stepE 2 (stepE 3 (stepE 4 (stepE 5 (stepE 6 (stepE 7 (stepE 8 ⟨S9.zero, 0, 0, M⟩))))))))

/-- slot `h` of `P`: no left-half bit above `h`; pivot bits as `PM` says; zero off `PM` -/
@[inline] def okP (PM h x : Nat) : Bool :=
  Nat.beq (Nat.shiftRight (Nat.land x 511) (Nat.succ h)) 0 &&
  Nat.beq (Nat.land x PM) (cond (nbit PM h) (pw h) 0) && (nbit PM h || Nat.beq x 0)
/-- the kernel's `elimOk`, slot by slot -/
def elimOk (s : ES) : Bool :=
  Nat.beq (Nat.land s.M.s0 511) 0 && Nat.beq (Nat.land s.M.s1 511) 0 && Nat.beq (Nat.land s.M.s2 511) 0 &&
  Nat.beq (Nat.land s.M.s3 511) 0 && Nat.beq (Nat.land s.M.s4 511) 0 && Nat.beq (Nat.land s.M.s5 511) 0 &&
  Nat.beq (Nat.land s.M.s6 511) 0 && Nat.beq (Nat.land s.M.s7 511) 0 && Nat.beq (Nat.land s.M.s8 511) 0 &&
  okP s.PM 0 s.P.s0 && okP s.PM 1 s.P.s1 && okP s.PM 2 s.P.s2 && okP s.PM 3 s.P.s3 && okP s.PM 4 s.P.s4 &&
  okP s.PM 5 s.P.s5 && okP s.PM 6 s.P.s6 && okP s.PM 7 s.P.s7 && okP s.PM 8 s.P.s8

/-- `∑_{h : bit j of slot h of P} e_h` -/
@[inline] def gather (P : S9) (j : Nat) : Nat :=
  Nat.land (Nat.shiftRight P.s0 j) 1 ||| Nat.mul (Nat.land (Nat.shiftRight P.s1 j) 1) 2 |||
  Nat.mul (Nat.land (Nat.shiftRight P.s2 j) 1) 4 ||| Nat.mul (Nat.land (Nat.shiftRight P.s3 j) 1) 8 |||
  Nat.mul (Nat.land (Nat.shiftRight P.s4 j) 1) 16 ||| Nat.mul (Nat.land (Nat.shiftRight P.s5 j) 1) 32 |||
  Nat.mul (Nat.land (Nat.shiftRight P.s6 j) 1) 64 ||| Nat.mul (Nat.land (Nat.shiftRight P.s7 j) 1) 128 |||
  Nat.mul (Nat.land (Nat.shiftRight P.s8 j) 1) 256

@[inline] def lmStep (P : S9) (PM j : Nat) (acc : M8) : M8 :=
  cond (nbit PM j) acc (acc.andn (nperpM (Nat.lor (gather P j) (pw j))))
/-- AND of `perp(e_j + gather P j)` over the non-pivot `j` (the kernel's `lmC`; same order: `j = 8, …, 0`) -/
def lmC (P : S9) (PM : Nat) : M8 :=
  lmStep P PM 0 (lmStep P PM 1 (lmStep P PM 2 (lmStep P PM 3 (lmStep P PM 4 (lmStep P PM 5 (lmStep P PM 6 (lmStep P PM 7
    (lmStep P PM 8 M5128))))))))

@[inline] def kmStep (x : Nat) (acc : M8) : M8 := cond (Nat.beq x 0) acc (acc.andn (nperpM (Nat.shiftRight x 9)))
/-- AND of `perp(x)` over the nonzero slots `(0 | x)` of `M` (the kernel's `kerM`; same order) -/
def kerM (M : S9) : M8 :=
  kmStep M.s0 (kmStep M.s1 (kmStep M.s2 (kmStep M.s3 (kmStep M.s4 (kmStep M.s5 (kmStep M.s6 (kmStep M.s7
    (kmStep M.s8 M5128))))))))

/-! ## Records -/

structure Rec where
  X : Nat
  P : S9
  PM : Nat
  lm : M8
  rm : M8
deriving Inhabited

/-- v5 tight record and its validity -/
def mkRec (S : S9) (ACT : Nat) (asg : Asg) (X : Nat) : Bool × Rec :=
  cond (noasg X asg)
    (Nat.ble (ucnt S ACT X) (rootRk X), ⟨X, rootP X, RPMT.getD X 0, rlm X, rrm X⟩)
    (let s := elim (resC X asg)
     (elimOk s && Nat.ble (ucnt S ACT X) s.rk, ⟨X, s.P, s.PM, lmC s.P s.PM, kerM s.M⟩))

/-- v5 slack-one claim -/
def mkSl (S : S9) (ACT : Nat) (asg : Asg) (X : Nat) : Bool × M8 × M8 :=
  cond (noasg X asg)
    (Nat.ble (ucnt S ACT X) (Nat.succ (rootRk X)), rlm X, rrm X)
    (let s := elim (resC X asg)
     let s2 := elim (resR X asg)
     (elimOk s && elimOk s2 && Nat.ble (ucnt S ACT X) (Nat.succ s.rk), kerM s2.M, kerM s.M))

/-- number of assigned terms through `X` (capped at 2) and the `(b, c)` of one of them -/
def thru1 (X : Nat) : Asg → Nat × Nat × Nat
  | [] => (0, 0, 0)
  | e :: r =>
    let ih := thru1 X r
    cond (npar (Nat.land e.1 X)) (cond (Nat.beq ih.1 0) (1, e.2.1, e.2.2) (2, ih.2.1, ih.2.2)) ih

/-- the first of the six packed vectors of `V` with `<v, w> = 1`, else 0 (the kernel's `firstPar` on `kb18 X`) -/
def firstPar (V w : Nat) : Nat :=
  let v0 := Nat.land V 511
  cond (npar (Nat.land v0 w)) v0 (
  let v1 := Nat.land (Nat.shiftRight V 9) 511
  cond (npar (Nat.land v1 w)) v1 (
  let v2 := Nat.land (Nat.shiftRight V 18) 511
  cond (npar (Nat.land v2 w)) v2 (
  let v3 := Nat.land (Nat.shiftRight V 27) 511
  cond (npar (Nat.land v3 w)) v3 (
  let v4 := Nat.land (Nat.shiftRight V 36) 511
  cond (npar (Nat.land v4 w)) v4 (
  let v5 := Nat.land (Nat.shiftRight V 45) 511
  cond (npar (Nat.land v5 w)) v5 0)))))

structure R1 where
  rk : Nat
  lm : M8
  rm : M8
  P : S9
  ok : Bool

/-- the residual `T(X) + b0 c0ᵀ` read off the root record (the kernel's `rank1`, same five cases) -/
def rank1 (X b0 c0 : Nat) : R1 :=
  let P := rootP X
  let r := rootRk X
  let lm := rlm X
  let rm := rrm X
  let y0 := xof P b0
  let g0 := gof P c0
  cond (lm.bit b0)
    (cond (rm.bit c0)
      (cond (npar (Nat.land c0 y0))
        ⟨Nat.sub r 1, lm.andn (nperpM g0), rm.andn (nperpM y0), P, true⟩
        ⟨r, lm, rm, corrP P g0 y0, true⟩)
      (let k := firstPar (KBP.getD X 0) c0
       let x0 := Nat.xor y0 (cond (npar (Nat.land c0 y0)) k 0)
       ⟨r, lm, (rm.andn (nperpM x0)).or ((rm.and (nperpM x0)).trans c0), corrP P g0 x0,
        npar (Nat.land k c0) && (kerm X).bit k⟩))
    (cond (rm.bit c0)
      (let l := firstPar (LKBP.getD X 0) b0
       let z := Nat.xor g0 (cond (npar (Nat.land g0 b0)) l 0)
       ⟨r, (lm.andn (nperpM g0)).or ((lm.and (nperpM g0)).trans b0), rm, corrP P z y0,
        npar (Nat.land l b0) && (lkerm X).bit l⟩)
      (let k := firstPar (KBP.getD X 0) c0
       let l := firstPar (LKBP.getD X 0) b0
       let b1 := Nat.xor y0 (cond (npar (Nat.land g0 b0)) 0 k)
       ⟨Nat.succ r, lm.or (lm.trans b0), rm.or (rm.trans c0), corrP (corrP P l b1) g0 k,
        npar (Nat.land k c0) && (kerm X).bit k && npar (Nat.land l b0) && (lkerm X).bit l⟩))

/-- new tight record: rank-1 claim when exactly one assigned term passes through `X`, else v5's -/
def mkRec6 (S : S9) (ACT : Nat) (asg : Asg) (X : Nat) : Bool × Rec :=
  let th := thru1 X asg
  cond (Nat.beq th.1 1)
    (let q := rank1 X th.2.1 th.2.2
     (q.ok && Nat.ble (ucnt S ACT X) q.rk, ⟨X, q.P, 0, q.lm, q.rm⟩))
    (mkRec S ACT asg X)

/-- slack-one data: rank-1 claim when exactly one assigned term passes through `X`, else v5's -/
def mkSl6 (S : S9) (ACT : Nat) (asg : Asg) (X : Nat) : Bool × M8 × M8 :=
  let th := thru1 X asg
  cond (Nat.beq th.1 1)
    (let q := rank1 X th.2.1 th.2.2
     (q.ok && Nat.ble (ucnt S ACT X) (Nat.succ q.rk), q.lm, q.rm))
    (mkSl S ACT asg X)

/-- `over X` -/
def over6 (S : S9) (ACT : Nat) (asg : Asg) (X : Nat) : Bool :=
  let th := thru1 X asg
  cond (Nat.beq th.1 1)
    (let q := rank1 X th.2.1 th.2.2
     q.ok && Nat.blt (ucnt S ACT X) q.rk)
    (let s := elim (resC X asg)
     elimOk s && Nat.blt (ucnt S ACT X) s.rk)

def mkRecs6 (S : S9) (ACT : Nat) (asg : Asg) : List Nat → List Rec → Bool × List Rec
  | [], tail => (true, tail)
  | X :: Xs, tail => let r := mkRec6 S ACT asg X; let ih := mkRecs6 S ACT asg Xs tail; (r.1 && ih.1, r.2 :: ih.2)
def mkSls6 (S : S9) (ACT : Nat) (asg : Asg) : List Nat → Bool × List (Bool × M8 × M8)
  | [] => (true, [])
  | X :: Xs => let s := mkSl6 S ACT asg X; let ih := mkSls6 S ACT asg Xs; (s.1 && ih.1, s :: ih.2)

/-- records through `a` hit by `(b, c)` get their masks cut -/
def updRecs (a b c : Nat) : List Rec → List Rec
  | [] => []
  | r :: rs =>
    cond (npar (Nat.land r.X a))
      (⟨r.X, r.P, r.PM, r.lm.andn (nperpM (gof r.P c)), r.rm.andn (nperpM (xof r.P b))⟩ :: updRecs a b c rs)
      (r :: updRecs a b c rs)

/-- records through `a`, appended to `tail` -/
def thru (a : Nat) : List Rec → List Rec → List Rec
  | [], tail => tail
  | r :: rs, tail => cond (npar (Nat.land r.X a)) (r :: thru a rs tail) (thru a rs tail)
def app : List Rec → List Rec → List Rec
  | [], tail => tail
  | r :: rs, tail => r :: app rs tail

def andLm : List Rec → M8 → M8
  | [], m => m
  | r :: rs, m => andLm rs (m.and r.lm)
def andRm : List Rec → M8 → M8
  | [], m => m
  | r :: rs, m => andRm rs (m.and r.rm)
def cmT (b : Nat) : List Rec → M8 → M8
  | [], m => m
  | r :: rs, m => cmT b rs (m.and (nperpM (xof r.P b)))
def bmT (c : Nat) : List Rec → M8 → M8
  | [], m => m
  | r :: rs, m => bmT c rs (m.and (nperpM (gof r.P c)))
def cmS (b : Nat) : List (Bool × M8 × M8) → M8 → M8
  | [], m => m
  | s :: ss, m => cmS b ss (cond (s.2.1.bit b) m (m.and s.2.2))
def bmS (c : Nat) : List (Bool × M8 × M8) → M8 → M8
  | [], m => m
  | s :: ss, m => bmS c ss (cond (s.2.2.bit c) m (m.and s.2.1))

/-- candidate pairs, `b` over `bs`, with the pair filter at `sym` nodes (the kernel's `BC7s.candsB7`) -/
def candsB7 (sym : Bool) (part : List Rec) (ss : List (Bool × M8 × M8)) (cb : M8) : List Nat → List (Nat × Nat)
  | [] => []
  | b :: bs => M8.pLoop true b (candsB7 sym part ss cb bs) 512 (cmS b ss (cmT b part (cond sym (cb.and (corbM b)) cb)))
/-- candidate pairs, `c` over `cs` (the kernel's `candsC`) -/
def candsC (part : List Rec) (ss : List (Bool × M8 × M8)) (bm : M8) : List Nat → List (Nat × Nat)
  | [] => []
  | c :: cs => M8.pLoop false c (candsC part ss bm cs) 512 (bmS c ss (bmT c part bm))

def allDom (dom : M8) : List Nat → Bool
  | [] => true
  | X :: Xs => dom.bit X && allDom dom Xs
def allThru (a : Nat) : List Nat → Bool
  | [] => true
  | X :: Xs => npar (Nat.land a X) && allThru a Xs

/-! ## The checker -/

/-- per-leaf data: the bytes and the end `e` of the certificate window (bits at and past `e` read as 0), the first factors,
`S` (for `u(X)`), the Lemma G needs, the domain -/
structure LCtx where
  d : ByteArray
  e : Nat
  terms : Array Nat
  S : S9
  need : Nat
  dom : M8

/-- the kids loop: `f` checks one child from a position -/
def kloop (f : Nat × Nat → Nat → Bool × Nat) : List (Nat × Nat) → Nat → Bool × Nat
  | [], p => (true, p)
  | q :: qs, p => let r := f q p; cond r.1 (kloop f qs r.2) (false, r.2)

/-- the node check (the kernel's `BC7s.checkS`): verdict and the position after the subtree -/
def checkS (L : LCtx) : Nat → Nat → Asg → List Rec → Nat → Bool × Nat
  | 0, _, _, _, p => (false, p)
  | fuel + 1, ACT, asg, recs, p =>
    cond (Nat.beq (rdw L.d L.e p 1) 0)
      (let X := rdw L.d L.e (p + 1) 9
       (L.dom.bit X && over6 L.S ACT asg X, p + 10))
      (let p1 := p + 1
       let t := rdw L.d L.e p1 5
       let sym := Nat.beq (rdw L.d L.e (p1 + 5) 1) 1
       let cdir := Nat.beq (rdw L.d L.e (p1 + 6) 1) 1
       let ntr := rdList L.d L.e (rdw L.d L.e (p1 + 7) 4) (p1 + 11)
       let slr := rdList L.d L.e (rdw L.d L.e ntr.2 3) (ntr.2 + 3)
       let nt := ntr.1
       let sl := slr.1
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
          kloop (fun q p' => checkS L fuel ACT' ((a, q.1, q.2) :: asg) (updRecs a q.1 q.2 allr) p') cs slr.2)
         (false, slr.2))

/-! ## Leaf records -/

@[inline] def rk3 (v : Nat) : Nat := RK3B.getD v 0
/-- `∑_{s < n} rank a_s` (the kernel's `rkSum`, same recursion) -/
def rkSum (terms : Array Nat) : Nat → Nat
  | 0 => 0
  | s + 1 => Nat.add (rkSum terms s) (rk3 (terms.getD s 0))
/-- packed `need_s = rank a_s - D` (2 bits per term; the kernel's `needP`, same recursion) -/
def needP (terms : Array Nat) (D : Nat) : Nat → Nat
  | 0 => 0
  | s + 1 => Nat.lor (needP terms D s) (Nat.mul (Nat.sub (rk3 (terms.getD s 0)) D) (pw (Nat.mul 2 s)))
/-- `S_i = {s : bit i of a_s}` -/
def mkS (terms : List Nat) : S9 :=
  let col := fun (i : Nat) => (terms.zipIdx.foldl (fun acc (a, s) => cond (nbit a i) (Nat.lor acc (pw s)) acc) 0)
  ⟨col 0, col 1, col 2, col 3, col 4, col 5, col 6, col 7, col 8⟩

/-- the leaf record in the window `[p, e)` of `d`, bits at and past `e` read as 0 (the kernel's
`BC7s.leafS (win (natOfBytes d) e p)`); an explicit domain mask must lie inside the window -/
def leafAtW (d : ByteArray) (p e : Nat) : Bool :=
  let n := rdw d e p 6
  let tl := (rdList d e n (p + 6)).1
  let ta := tl.toArray
  let p1 := p + 6 + 9 * n
  let dm := Nat.beq (rdw d e p1 1) 0
  let lg := Nat.beq (rdw d e (p1 + 1) 1) 1 && dm
  let RS := rkSum ta n
  Nat.ble n 31 && (dm || Nat.ble (p1 + 514) e) &&
    ((lg && Nat.blt RS 27) ||
     (checkS ⟨d, e, ta, mkS tl, cond lg (needP ta (Nat.sub RS 27) n) 0, cond dm ALLNZ8 (rdM8 d (p1 + 2))⟩ 64
       (Nat.sub (pw n) 1) [] [] (cond dm (p1 + 2) (p1 + 514))).1)

/-- the leaf record at bit `p` of `d`, up to the end of `d` (the kernel's `BC7s.leafS (sk p R)`, `R` the value of `d`) -/
def leafAt (d : ByteArray) (p : Nat) : Bool := leafAtW d p (8 * d.size)

/-- the v7 certificate of a leaf with first factors `terms` (`≤ 31`, each `< 512`), domain `dom`, Lemma G off, read from
the window `[q, e)` of `B` (bits at and past `e` are 0): the leaf hook of the E1/E1G/E1P checkers (`E1.leafRec`, mode 01) -/
def leafCertW (terms : Array Nat) (dom : M8) (B : ByteArray) (q e : Nat) : Bool :=
  let tl := terms.toList
  Nat.ble terms.size 31 && tl.all (fun a => Nat.blt a 512) &&
    (checkS ⟨B, e, terms, mkS tl, 0, dom⟩ 64 (Nat.sub (pw terms.size) 1) [] [] q).1

end NL

/-! ## Test batches (harness format `[u32 nbytes][bytes]`*, each record a leaf record at bit 0 of its bytes) -/
namespace NL

@[inline] def rdU32 (d : ByteArray) (o : Nat) : Nat :=
  byteAt d o + 256 * (byteAt d (o + 1) + 256 * (byteAt d (o + 2) + 256 * byteAt d (o + 3)))

/-- every record of a harness-format byte array is an accepted leaf record (`fuel` bounds the record count) -/
def allLeaves (d : ByteArray) : Nat → Nat → Bool
  | 0, _ => true
  | f + 1, o => cond (Nat.ble (o + 4) d.size) (leafAt d (8 * (o + 4)) && allLeaves d f (o + 4 + rdU32 d o)) true

/-- hex digit value -/
@[inline] def hexv (c : UInt8) : UInt8 := if c ≤ 57 then c - 48 else if c ≤ 70 then c - 55 else c - 87
/-- bytes of a hex string (two digits per byte, low nibble second) -/
def ofHex (s : String) : ByteArray := Id.run do
  let u := s.toUTF8
  let mut b := ByteArray.emptyWithCapacity (u.size / 2)
  let mut i := 0
  while i + 1 < u.size do
    b := b.push (hexv (u.get! i) * 16 + hexv (u.get! (i + 1)))
    i := i + 2
  return b

def allLeavesHex (s : String) : Bool := allLeaves (ofHex s) 1000000000 0

end NL
