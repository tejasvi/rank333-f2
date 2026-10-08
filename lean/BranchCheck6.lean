module
public import R22Port.U_d41d8cd98f00
public import BC4Tables
public import BC6Tables
/-! # BranchCheck v6: the branching leaf checker v5 plus the rank-1 fast path and the Lemma G step

Model: branch6/bmodel6.py (generator: the v4/v5 generator, `branch6/gen6.py`; emitter `branch6/emit6.py`).
Stream format: v5's, except that a leaf's dom mode has 2 bits (bit 0: a 512-bit domain mask follows, else all nonzero
functionals; bit 1: the Lemma G step is on, full-`T` leaves only).  The first version, written like v5, is kept as
`BranchCheck6a.lean` (namespace `BC6a`) for paired timing; this file computes the same verdicts.

**New step types** (v5's record semantics are unchanged: a record is `(X, P, lm, rm)` with `x(b) = xof P b` inverting
the residual on its column space, `lm ⊇ col`, `rm ⊇ row`; `XT`, `GT` below are tables of `xof P`, `gof P`):
1. *Rank-1 claim*: a claim (new tight record, slack-one record, `over`) on `X` with exactly ONE assigned term
   `(a0, b0, c0)` through `X` (`thru1`) reads the residual `T(X) + b0 c0ᵀ` off the root record of `X` (`rank1`), no
   elimination.  Five cases by `b0 ∈ col T(X)`, `c0 ∈ row T(X)`, `c0 ⬝ x(b0)`; soundness:
   `RootSound.Rank1.caseA` ... `caseE` (r22/lean/kernel/proj/RootSound/Rank1.lean).  The kernel witnesses `k`, `l` are
   CHECKED (`R1.ok`: `k ∈ ker T(X)` by the class table `KERV`, `<k, c0> = 1`; `l` likewise with `LKERV`), so soundness
   does not depend on how `firstPar` finds them.  The correction is folded into `P` (`corrP`).
2. *Lemma G mask*: on a full-`T` leaf with the flag, the candidate `b`, `c` of term `t` lie in
   `RANKGE[rank a_t - Δ]`, `Δ = ∑ rank a_s - 27`; a leaf with `∑ rank a_s < 27` is refuted outright.  Soundness:
   `RootSound.LemmaG.lemmaG_b`, `lemmaG_c`, `split_flattening` (LemmaG.lean).

**Kernel-oriented encoding** (costs measured on `decide +kernel` loops, branch6/proj/K*.lean, L*.lean, per step: a
`Nat` primitive about 1 µs, a definition call about 2.5 µs, a `let` about 7 µs, a projection about 5 µs, `Bool.rec` on a
computed `Bool` about 9 µs, but `cond` about 23 µs and `&&` about 18 µs, both through their matchers):
- `sel c a b` (one `Bool.rec` step) for `cond c a b`; `∧ᵇ`, `∨ᵇ`, `notb` for `&&`, `||`, `!` (definitionally equal);
- `Nat.sub x 1` for `Nat.pred x`, `Nat.ble (Nat.succ a) b` for `Nat.blt a b` (`Nat.pred`/`Nat.blt` are not
  accelerated);
- per-record tables `XT = [xof P j | j < 512]`, `GT = [gof P j | j < 512]` (9 bits each, built lazily by doubling:
  `xtab`, `gtab`), so the candidate loop and the record updates read `x(b)`, `g(c)` with one shift;
- the candidate loop runs over the set bits of the `b` (or `c`) domain directly (`candsB`, `candsC`, no list);
- `firstPar` reads a packed kernel basis with one parity fold; `trans` is unrolled over the 9 literal masks `KM i`.
-/
@[expose] public section
namespace BC6
open BC4 BC6

/-- `sel c a b`: `a` if `c` else `b`, as one `Bool.rec` iota step -/
local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)
local macro:30 a:term:31 " ∨ᵇ " b:term:30 : term => `(@Bool.rec (fun _ => Bool) $b true $a)
local macro "notb " c:term:max : term => `(@Bool.rec (fun _ => Bool) true false $c)

noncomputable section

@[inline] def bit (n i : Nat) : Bool := Nat.beq (Nat.land (Nat.shiftRight n i) 1) 1
@[inline] def par (v : Nat) : Bool := bit PAR v
@[inline] def txc18 (X : Nat) : Nat := Nat.land (Nat.shiftRight TXC18 (Nat.mul 162 X)) M162
@[inline] def txr18 (X : Nat) : Nat := Nat.land (Nat.shiftRight TXR18 (Nat.mul 162 X)) M162
/-- `∑_{z ∈ c} 2^(18z)` (no table: the 9 copies of `c` at offsets `17i` do not overlap) -/
@[inline] def spr18 (c : Nat) : Nat := Nat.land (Nat.mul c C17) REP18
@[inline] def nperp (v : Nat) : Nat :=
  Nat.xor (Nat.land (Nat.shiftRight NPL (Nat.mul 512 (Nat.land v 31))) M512)
    (Nat.land (Nat.shiftRight NPH (Nat.mul 512 (Nat.shiftRight v 5))) M512)
@[inline] def perp (v : Nat) : Nat := Nat.xor M512 (nperp v)
/-- `∑_{i ∈ x} 2^(32i)` -/
@[inline] def dep32 (x : Nat) : Nat := Nat.land (Nat.mul x C31) M32B
@[inline] def pop11 (x : Nat) : Nat := Nat.land (Nat.shiftRight POP11 (Nat.mul 4 x)) 15
@[inline] def hx (SS X : Nat) : Nat :=
  let y0 := Nat.land SS (Nat.mul (dep32 X) M32)
  let y1 := Nat.xor y0 (Nat.shiftRight y0 128)
  let y2 := Nat.xor y1 (Nat.shiftRight y1 64)
  let y3 := Nat.xor y2 (Nat.shiftRight y2 32)
  Nat.land (Nat.xor y3 (Nat.shiftRight y3 256)) M32
@[inline] def pop32 (x : Nat) : Nat :=
  Nat.add (pop11 (Nat.land x 2047)) (Nat.add (pop11 (Nat.land (Nat.shiftRight x 11) 2047)) (pop11 (Nat.shiftRight x 22)))
@[inline] def ucnt (SS ACT X : Nat) : Nat := pop32 (Nat.land (hx SS X) ACT)

abbrev Asg := List (Nat × Nat × Nat)

def resC (X : Nat) (asg : Asg) : Nat :=
  @List.rec (Nat × Nat × Nat) (fun _ => Nat) (Nat.xor (txc18 X) ID18)
    (fun e _ ih => sel (par (Nat.land e.1 X)) (Nat.xor (Nat.mul (spr18 e.2.2) e.2.1) ih) ih) asg
def resR (X : Nat) (asg : Asg) : Nat :=
  @List.rec (Nat × Nat × Nat) (fun _ => Nat) (Nat.xor (txr18 X) ID18)
    (fun e _ ih => sel (par (Nat.land e.1 X)) (Nat.xor (Nat.mul (spr18 e.2.1) e.2.2) ih) ih) asg

structure ES where
  P : Nat
  PM : Nat
  rk : Nat
  DG : Nat
  D18 : Nat
  M : Nat

/-- one elimination step at bit `h` -/
@[inline] def stepE (h : Nat) (s : ES) : ES :=
  let cand := Nat.land (Nat.shiftRight s.M h) REP18
  sel (Nat.beq cand 0) s
    (let p := Nat.land (Nat.div s.M (Nat.xor cand (Nat.land cand (Nat.sub cand 1)))) M18
     { P := Nat.lor (Nat.xor s.P (Nat.mul (Nat.land (Nat.shiftRight s.P h) REP18) p)) (Nat.shiftLeft p (Nat.mul 18 h)),
       PM := Nat.lor s.PM (Nat.shiftLeft 1 h), rk := Nat.succ s.rk,
       DG := Nat.lor s.DG (Nat.shiftLeft 1 (Nat.mul 19 h)), D18 := Nat.lor s.D18 (Nat.shiftLeft 1 (Nat.mul 18 h)),
       M := Nat.xor s.M (Nat.mul cand p) })
/-- steps at bits 8, 7, ..., 0 -/
def elim (M : Nat) : ES := @Nat.rec (fun _ => ES → ES) (fun s => s) (fun k ih s => ih (stepE k s)) 9 ⟨0, 0, 0, 0, 0, M⟩

@[inline] def elimOk (s : ES) : Bool :=
  Nat.beq (Nat.land s.M LEFT9) 0 ∧ᵇ Nat.beq (Nat.land s.P HM) 0 ∧ᵇ
  Nat.beq (Nat.land s.P (Nat.mul s.PM REP18)) s.DG ∧ᵇ Nat.beq (Nat.land s.P (Nat.mul s.D18 M18)) s.P

@[inline] def gather (P j : Nat) : Nat :=
  Nat.land (Nat.shiftRight (Nat.mul (Nat.land (Nat.shiftRight P j) REP18) MAGIC) 144) 511
def lmC (P PM : Nat) : Nat :=
  @Nat.rec (fun _ => Nat → Nat) (fun acc => acc)
    (fun j ih acc => ih (sel (bit PM j) acc (Nat.land acc (perp (Nat.lor (gather P j) (Nat.shiftLeft 1 j)))))) 9 M512
def kerM (M : Nat) : Nat :=
  @Nat.rec (fun _ => Nat → Nat) (fun acc => acc)
    (fun z ih acc => ih (sel (Nat.beq (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) M18) 0) acc
      (Nat.land acc (perp (Nat.shiftRight (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) M18) 9))))) 9 M512

@[inline] def xof (P b : Nat) : Nat :=
  let y0 := Nat.land P (Nat.mul (spr18 b) RH9)
  let y1 := Nat.xor y0 (Nat.shiftRight y0 144)
  let y2 := Nat.xor y1 (Nat.shiftRight y1 72)
  let y3 := Nat.xor y2 (Nat.shiftRight y2 36)
  Nat.land (Nat.shiftRight (Nat.xor y3 (Nat.shiftRight y3 18)) 9) 511
@[inline] def gof (P c : Nat) : Nat :=
  let q := Nat.land P (Nat.mul c REPR)
  let q1 := Nat.xor q (Nat.shiftRight q 1)
  let q2 := Nat.xor q1 (Nat.shiftRight q1 2)
  let q3 := Nat.xor q2 (Nat.shiftRight q2 4)
  gather (Nat.xor q3 (Nat.shiftRight q 8)) 9

@[inline] def rpt (X : Nat) : Nat := Nat.land (Nat.shiftRight RPT (Nat.mul 176 X)) 0xffffffffffffffffffffffffffffffffffffffffffff
/-- root masks: `col T(X)` depends only on the row space of `X`, `row T(X)` only on its column space (16 classes each) -/
@[inline] def rlm (X : Nat) : Nat := Nat.land (Nat.shiftRight LMV (Nat.mul 512 (Nat.land (Nat.shiftRight LIDX (Nat.mul 4 X)) 15))) M512
@[inline] def rrm (X : Nat) : Nat := Nat.land (Nat.shiftRight RMV (Nat.mul 512 (Nat.land (Nat.shiftRight RIDX (Nat.mul 4 X)) 15))) M512

/-! ## Records, the rank-1 fast path -/

/-- tight record (v5's): `X`, the preimage data `P` (`x(b) = xof P b`, `g(c) = gof P c`), allowed-`b` / allowed-`c` masks -/
structure Rec where
  X : Nat
  P : Nat
  lm : Nat
  rm : Nat
  XT : Nat
  GT : Nat

/-- `[x(j) | j < 512]` (9 bits each) with `x(j) = xof P j`, by doubling over the basis images `x(e_k)` (high half of slot k) -/
def xtab (P : Nat) : Nat :=
  let T := Nat.shiftLeft (Nat.land (Nat.shiftRight P 9) 511) 9
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (Nat.land (Nat.shiftRight P 27) 511) R91)) 18)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (Nat.land (Nat.shiftRight P 45) 511) R92)) 36)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (Nat.land (Nat.shiftRight P 63) 511) R93)) 72)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (Nat.land (Nat.shiftRight P 81) 511) R94)) 144)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (Nat.land (Nat.shiftRight P 99) 511) R95)) 288)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (Nat.land (Nat.shiftRight P 117) 511) R96)) 576)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (Nat.land (Nat.shiftRight P 135) 511) R97)) 1152)
  Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (Nat.land (Nat.shiftRight P 153) 511) R98)) 2304)
/-- `[g(j) | j < 512]` with `g(j) = gof P j`, by doubling over `g(e_i) = gather P (9 + i)` -/
def gtab (P : Nat) : Nat :=
  let T := Nat.shiftLeft (gather P 9) 9
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (gather P 10) R91)) 18)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (gather P 11) R92)) 36)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (gather P 12) R93)) 72)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (gather P 13) R94)) 144)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (gather P 14) R95)) 288)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (gather P 15) R96)) 576)
  let T := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (gather P 16) R97)) 1152)
  Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul (gather P 17) R98)) 2304)
/-- entry `j` of a 9-bit table -/
@[inline] def tb (T j : Nat) : Nat := Nat.land (Nat.shiftRight T (Nat.mul 9 j)) 511
/-- a record from its `X`, `P` and masks (the tables are built when first used) -/
@[inline] def mkR (X P lm rm : Nat) : Rec := ⟨X, P, lm, rm, xtab P, gtab P⟩

/-- `P` with the rank-1 correction `(A, B)` folded in: `xof P' b = xof P b ^^^ <A, b> B`, `gof P' c = gof P c ^^^ <c, B> A` -/
@[inline] def corrP (P A B : Nat) : Nat := Nat.xor P (Nat.mul (spr18 A) (Nat.shiftLeft B 9))

/-- half swap at distance `d` under mask `K` -/
@[inline] def hsw (S d K : Nat) : Nat := Nat.lor (Nat.land (Nat.shiftRight S d) K) (Nat.shiftLeft (Nat.land S K) d)
/-- translate a 512-bit set by `v`: `{s ^^^ v | s ∈ S}` -/
def trans (S v : Nat) : Nat :=
  let S := sel (bit v 0) (hsw S 1 KM0) S
  let S := sel (bit v 1) (hsw S 2 KM1) S
  let S := sel (bit v 2) (hsw S 4 KM2) S
  let S := sel (bit v 3) (hsw S 8 KM3) S
  let S := sel (bit v 4) (hsw S 16 KM4) S
  let S := sel (bit v 5) (hsw S 32 KM5) S
  let S := sel (bit v 6) (hsw S 64 KM6) S
  let S := sel (bit v 7) (hsw S 128 KM7) S
  sel (bit v 8) (hsw S 256 KM8) S

/-- the first vector `k` of a packed basis `W` (vector i in the high half of 18-bit slot i) with `<k, w> = 1`, else 0 -/
@[inline] def firstPar (W w : Nat) : Nat :=
  let q := Nat.land W (Nat.mul w REPR)
  let q1 := Nat.xor q (Nat.shiftRight q 1)
  let q2 := Nat.xor q1 (Nat.shiftRight q1 2)
  let pm := Nat.land (Nat.xor (Nat.xor q2 (Nat.shiftRight q2 4)) (Nat.shiftRight q 8)) REPR
  let low := Nat.xor pm (Nat.land pm (Nat.sub pm 1))
  Nat.div (Nat.land W (Nat.mul low 511)) low
@[inline] def kb18 (X : Nat) : Nat := Nat.land (Nat.shiftRight KB18 (Nat.mul 128 X)) 0xffffffffffffffffffffffffffffffff
@[inline] def lkb18 (X : Nat) : Nat := Nat.land (Nat.shiftRight LKB18 (Nat.mul 128 X)) 0xffffffffffffffffffffffffffffffff

/-- the residual `T(X) + b0 c0ᵀ`: rank, column mask, row mask, corrected `P`, and whether the kernel witnesses check -/
structure R1 where
  rk : Nat
  lm : Nat
  rm : Nat
  P : Nat
  ok : Bool

@[inline] def rootP (X : Nat) : Nat := Nat.land (rpt X) M162
@[inline] def rootRk (X : Nat) : Nat := Nat.land (Nat.shiftRight RKT (Nat.mul 4 X)) 15
/-- mask of `ker T(X)` (class table by the row-space class) and of the left kernel (by the column-space class) -/
@[inline] def kerm (X : Nat) : Nat := Nat.land (Nat.shiftRight KERV (Nat.mul 512 (Nat.land (Nat.shiftRight RIDX (Nat.mul 4 X)) 15))) M512
@[inline] def lkerm (X : Nat) : Nat := Nat.land (Nat.shiftRight LKERV (Nat.mul 512 (Nat.land (Nat.shiftRight LIDX (Nat.mul 4 X)) 15))) M512

def rank1 (X b0 c0 : Nat) : R1 :=
  let P := rootP X
  let r := rootRk X
  let lm := rlm X
  let rm := rrm X
  let y0 := xof P b0
  let g0 := gof P c0
  sel (bit lm b0)
    (sel (bit rm c0)
      (sel (par (Nat.land c0 y0))
        ⟨Nat.sub r 1, Nat.land lm (perp g0), Nat.land rm (perp y0), P, true⟩
        ⟨r, lm, rm, corrP P g0 y0, true⟩)
      (let k := firstPar (kb18 X) c0
       let x0 := Nat.xor y0 (sel (par (Nat.land c0 y0)) k 0)
       ⟨r, lm, Nat.lor (Nat.land rm (perp x0)) (trans (Nat.land rm (nperp x0)) c0), corrP P g0 x0,
        par (Nat.land k c0) ∧ᵇ bit (kerm X) k⟩))
    (sel (bit rm c0)
      (let l := firstPar (lkb18 X) b0
       let z := Nat.xor g0 (sel (par (Nat.land g0 b0)) l 0)
       ⟨r, Nat.lor (Nat.land lm (perp g0)) (trans (Nat.land lm (nperp g0)) b0), rm, corrP P z y0,
        par (Nat.land l b0) ∧ᵇ bit (lkerm X) l⟩)
      (let k := firstPar (kb18 X) c0
       let l := firstPar (lkb18 X) b0
       let b1 := Nat.xor y0 (sel (par (Nat.land g0 b0)) 0 k)
       ⟨Nat.succ r, Nat.lor lm (trans lm b0), Nat.lor rm (trans rm c0), corrP (corrP P l b1) g0 k,
        par (Nat.land k c0) ∧ᵇ bit (kerm X) k ∧ᵇ par (Nat.land l b0) ∧ᵇ bit (lkerm X) l⟩))

/-- number of assigned terms through `X` (capped at 2) and the `(b, c)` of one of them -/
def thru1 (X : Nat) (asg : Asg) : Nat × Nat × Nat :=
  @List.rec (Nat × Nat × Nat) (fun _ => Nat × Nat × Nat) (0, 0, 0)
    (fun e _ ih => sel (par (Nat.land e.1 X)) (sel (Nat.beq ih.1 0) (1, e.2.1, e.2.2) (2, ih.2.1, ih.2.2)) ih) asg

@[inline] def mkRec (SS ACT : Nat) (asg : Asg) (X : Nat) : Bool × Rec :=
  let th := thru1 X asg
  sel (Nat.beq th.1 0)
    (Nat.ble (ucnt SS ACT X) (rootRk X), mkR X (rootP X) (rlm X) (rrm X))
    (sel (Nat.beq th.1 1)
      (let q := rank1 X th.2.1 th.2.2
       (q.ok ∧ᵇ Nat.ble (ucnt SS ACT X) q.rk, mkR X q.P q.lm q.rm))
      (let s := elim (resC X asg)
       (elimOk s ∧ᵇ Nat.ble (ucnt SS ACT X) s.rk, mkR X s.P (lmC s.P s.PM) (kerM s.M))))

@[inline] def mkSl (SS ACT : Nat) (asg : Asg) (X : Nat) : Bool × Nat × Nat :=
  let th := thru1 X asg
  sel (Nat.beq th.1 0)
    (Nat.ble (ucnt SS ACT X) (Nat.succ (rootRk X)), rlm X, rrm X)
    (sel (Nat.beq th.1 1)
      (let q := rank1 X th.2.1 th.2.2
       (q.ok ∧ᵇ Nat.ble (ucnt SS ACT X) (Nat.succ q.rk), q.lm, q.rm))
      (let s := elim (resC X asg)
       let s2 := elim (resR X asg)
       (elimOk s ∧ᵇ elimOk s2 ∧ᵇ Nat.ble (ucnt SS ACT X) (Nat.succ s.rk), kerM s2.M, kerM s.M)))

/-- `over X`: the residual's rank exceeds the number of unassigned terms through `X` -/
@[inline] def overOk (SS ACT : Nat) (asg : Asg) (X : Nat) : Bool :=
  let th := thru1 X asg
  sel (Nat.beq th.1 0) (Nat.ble (Nat.succ (ucnt SS ACT X)) (rootRk X))
    (sel (Nat.beq th.1 1) (let q := rank1 X th.2.1 th.2.2; q.ok ∧ᵇ Nat.ble (Nat.succ (ucnt SS ACT X)) q.rk)
      (let s := elim (resC X asg)
       elimOk s ∧ᵇ Nat.ble (Nat.succ (ucnt SS ACT X)) s.rk))

def updRecs (a b c : Nat) (l : List Rec) : List Rec :=
  @List.rec Rec (fun _ => List Rec) []
    (fun r _ ih => sel (par (Nat.land r.X a))
      (⟨r.X, r.P, Nat.land r.lm (perp (tb r.GT c)), Nat.land r.rm (perp (tb r.XT b)), r.XT, r.GT⟩ :: ih) (r :: ih)) l

/-- records through `a` (appended to `tail`) -/
def thru (a : Nat) (l tail : List Rec) : List Rec :=
  @List.rec Rec (fun _ => List Rec) tail (fun r _ ih => sel (par (Nat.land r.X a)) (r :: ih) ih) l

def app (l tail : List Rec) : List Rec := @List.rec Rec (fun _ => List Rec) tail (fun r _ ih => r :: ih) l

def andLm (l : List Rec) (m : Nat) : Nat := @List.rec Rec (fun _ => Nat → Nat) (fun m => m) (fun r _ ih m => ih (Nat.land m r.lm)) l m
def andRm (l : List Rec) (m : Nat) : Nat := @List.rec Rec (fun _ => Nat → Nat) (fun m => m) (fun r _ ih m => ih (Nat.land m r.rm)) l m
def cmT (b : Nat) (l : List Rec) (m : Nat) : Nat :=
  @List.rec Rec (fun _ => Nat → Nat) (fun m => m) (fun r _ ih m => ih (Nat.land m (nperp (tb r.XT b)))) l m
def bmT (c : Nat) (l : List Rec) (m : Nat) : Nat :=
  @List.rec Rec (fun _ => Nat → Nat) (fun m => m) (fun r _ ih m => ih (Nat.land m (nperp (tb r.GT c)))) l m
def cmS (b : Nat) (l : List (Bool × Nat × Nat)) (m : Nat) : Nat :=
  @List.rec (Bool × Nat × Nat) (fun _ => Nat → Nat) (fun m => m) (fun s _ ih m => ih (sel (bit s.2.1 b) m (Nat.land m s.2.2))) l m
def bmS (c : Nat) (l : List (Bool × Nat × Nat)) (m : Nat) : Nat :=
  @List.rec (Bool × Nat × Nat) (fun _ => Nat → Nat) (fun m => m) (fun s _ ih m => ih (sel (bit s.2.2 c) m (Nat.land m s.2.1))) l m

@[inline] def lg2 (p : Nat) : Nat := Nat.land (Nat.shiftRight LOGT (Nat.mul 10 (Nat.mod p 523))) 1023

/-- `(b, x)` pairs for the set bits `x` of `m`, ascending, prepended to `tail` -/
def pairsB (b m : Nat) (tail : List (Nat × Nat)) : List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => tail)
    (fun _ ih m => sel (Nat.beq m 0) tail ((b, lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) :: ih (Nat.land m (Nat.sub m 1)))) 512 m
/-- `(x, c)` pairs for the set bits `x` of `m`, ascending, prepended to `tail` -/
def pairsC (c m : Nat) (tail : List (Nat × Nat)) : List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => tail)
    (fun _ ih m => sel (Nat.beq m 0) tail ((lg2 (Nat.xor m (Nat.land m (Nat.sub m 1))), c) :: ih (Nat.land m (Nat.sub m 1)))) 512 m

/-- set bits of `m`, ascending -/
def bitsOf (m : Nat) : List Nat :=
  @Nat.rec (fun _ => Nat → List Nat) (fun _ => [])
    (fun _ ih m => sel (Nat.beq m 0) [] (lg2 (Nat.xor m (Nat.land m (Nat.sub m 1))) :: ih (Nat.land m (Nat.sub m 1)))) 512 m

@[inline] def candB1 (part : List Rec) (ss : List (Bool × Nat × Nat)) (cb b : Nat) (tail : List (Nat × Nat)) : List (Nat × Nat) :=
  pairsB b (cmS b ss (cmT b part cb)) tail
@[inline] def candC1 (part : List Rec) (ss : List (Bool × Nat × Nat)) (bm c : Nat) (tail : List (Nat × Nat)) : List (Nat × Nat) :=
  pairsC c (bmS c ss (bmT c part bm)) tail
/-- candidate pairs, `b` over the set bits of `B` ascending (no intermediate list) -/
def candsB (part : List Rec) (ss : List (Bool × Nat × Nat)) (cb B : Nat) : List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => [])
    (fun _ ih m => sel (Nat.beq m 0) [] (candB1 part ss cb (lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) (ih (Nat.land m (Nat.sub m 1))))) 512 B
def candsC (part : List Rec) (ss : List (Bool × Nat × Nat)) (bm C : Nat) : List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => [])
    (fun _ ih m => sel (Nat.beq m 0) [] (candC1 part ss bm (lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) (ih (Nat.land m (Nat.sub m 1))))) 512 C

def allDom (dom : Nat) (l : List Nat) : Bool := @List.rec Nat (fun _ => Bool) true (fun X _ ih => bit dom X ∧ᵇ ih) l
def allThru (a : Nat) (l : List Nat) : Bool := @List.rec Nat (fun _ => Bool) true (fun X _ ih => par (Nat.land a X) ∧ᵇ ih) l
def isNil (l : Asg) : Bool := @List.rec (Nat × Nat × Nat) (fun _ => Bool) true (fun _ _ _ => false) l

def mkRecs (SS ACT : Nat) (asg : Asg) (nt : List Nat) (tail : List Rec) : Bool × List Rec :=
  @List.rec Nat (fun _ => Bool × List Rec) (true, tail)
    (fun X _ ih => let r := mkRec SS ACT asg X; (r.1 ∧ᵇ ih.1, r.2 :: ih.2)) nt
def mkSls (SS ACT : Nat) (asg : Asg) (sl : List Nat) : Bool × List (Bool × Nat × Nat) :=
  @List.rec Nat (fun _ => Bool × List (Bool × Nat × Nat)) (true, [])
    (fun X _ ih => let s := mkSl SS ACT asg X; (s.1 ∧ᵇ ih.1, s :: ih.2)) sl

/-- Lemma G mask of term `t`: `RGE[need_t]`, `need` packed 2 bits per term (all 0 when the step is off) -/
@[inline] def lgMask (need t : Nat) : Nat :=
  Nat.land (Nat.shiftRight RGE (Nat.mul 512 (Nat.land (Nat.shiftRight need (Nat.mul 2 t)) 3))) M512

/-! ## Stream format (as v6) -/

@[inline] def rd (k S : Nat) : Nat := Nat.land S (Nat.sub (Nat.shiftLeft 1 k) 1)
@[inline] def sk (k S : Nat) : Nat := Nat.shiftRight S k

def rdList (m S : Nat) : List Nat × Nat :=
  @Nat.rec (fun _ => Nat → List Nat × Nat) (fun S => ([], S)) (fun _ ih S => let r := ih (sk 9 S); (rd 9 S :: r.1, r.2)) m S

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
           (sel (Nat.beq B 0) [] (candsB part ss.2 Cb B))
         let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
         let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
           (fun p _ ihc S => let r := ih TERMS SS ACT' need ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
              sel r.1 (ihc r.2) (false, r.2)) cs slr.2
         (bit ACT t ∧ᵇ (notb sym ∨ᵇ isNil asg) ∧ᵇ allDom dom nt ∧ᵇ nr.1 ∧ᵇ allDom dom sl ∧ᵇ allThru a sl ∧ᵇ ss.1 ∧ᵇ kr.1,
          kr.2)))
    fuel

def mkSSP (T n : Nat) : Nat :=
  @Nat.rec (fun _ => Nat) 0 (fun s ih => Nat.lor ih (Nat.shiftLeft (dep32 (Nat.land (Nat.shiftRight T (Nat.mul 9 s)) 511)) s)) n

@[inline] def rk3 (v : Nat) : Nat := Nat.land (Nat.shiftRight RK3 (Nat.mul 2 v)) 3
/-- `∑_{s < n} rank a_s` -/
def rkSum (T n : Nat) : Nat :=
  @Nat.rec (fun _ => Nat) 0 (fun s ih => Nat.add ih (rk3 (Nat.land (Nat.shiftRight T (Nat.mul 9 s)) 511))) n
/-- packed `need_s = rank a_s - Δ` (truncated at 0), 2 bits per term -/
def needP (T n D : Nat) : Nat :=
  @Nat.rec (fun _ => Nat) 0 (fun s ih => Nat.lor ih (Nat.shiftLeft (Nat.sub (rk3 (Nat.land (Nat.shiftRight T (Nat.mul 9 s)) 511)) D) (Nat.mul 2 s))) n

/-- one leaf record -/
def leafS (R : Nat) : Bool :=
  let n := rd 6 R
  let T := rd (Nat.mul 9 n) (sk 6 R)
  let R1 := sk (Nat.add 6 (Nat.mul 9 n)) R
  let dm := Nat.beq (rd 1 R1) 0
  let lg := Nat.beq (rd 1 (sk 1 R1)) 1 ∧ᵇ dm   -- Lemma G needs the full tensor: only with dom = ALLNZ
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
end BC6
