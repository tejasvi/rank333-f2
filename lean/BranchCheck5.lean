module
public import R22Port.U_d41d8cd98f00
public import BC4Tables
/-! # BranchCheck v5: v4 semantics (bmodel4.py) written with explicit recursors

Same checker as `BranchCheck4` (inherited tight records, bit-sliced elimination, precomputed root records, packed terms),
but every loop is a direct `Nat.rec` / `List.rec` application: the kernel then reduces one recursor step per iteration
instead of the `brecOn` tuples of compiled structural recursion (about 2x fewer kernel steps, measured on list folds).
Kernel-only code, hence `noncomputable`. -/
@[expose] public section
namespace BC5
open BC4

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

def mkSS (terms : List Nat) : Nat :=
  @List.rec Nat (fun _ => Nat → Nat) (fun _ => 0) (fun a _ ih s => Nat.lor (Nat.shiftLeft (dep32 a) s) (ih (Nat.succ s))) terms 0
def packT (terms : List Nat) : Nat :=
  @List.rec Nat (fun _ => Nat) 0 (fun a _ ih => Nat.lor a (Nat.shiftLeft ih 9)) terms

abbrev Asg := List (Nat × Nat × Nat)

def resC (X : Nat) (asg : Asg) : Nat :=
  @List.rec (Nat × Nat × Nat) (fun _ => Nat) (Nat.xor (txc18 X) ID18)
    (fun e _ ih => cond (par (Nat.land e.1 X)) (Nat.xor (Nat.mul (spr18 e.2.2) e.2.1) ih) ih) asg
def resR (X : Nat) (asg : Asg) : Nat :=
  @List.rec (Nat × Nat × Nat) (fun _ => Nat) (Nat.xor (txr18 X) ID18)
    (fun e _ ih => cond (par (Nat.land e.1 X)) (Nat.xor (Nat.mul (spr18 e.2.1) e.2.2) ih) ih) asg
def noasg (X : Nat) (asg : Asg) : Bool :=
  @List.rec (Nat × Nat × Nat) (fun _ => Bool) true (fun e _ ih => !(par (Nat.land e.1 X)) && ih) asg

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
  cond (Nat.beq cand 0) s
    (let p := Nat.land (Nat.div s.M (Nat.xor cand (Nat.land cand (Nat.pred cand)))) M18
     { P := Nat.lor (Nat.xor s.P (Nat.mul (Nat.land (Nat.shiftRight s.P h) REP18) p)) (Nat.shiftLeft p (Nat.mul 18 h)),
       PM := Nat.lor s.PM (Nat.shiftLeft 1 h), rk := Nat.succ s.rk,
       DG := Nat.lor s.DG (Nat.shiftLeft 1 (Nat.mul 19 h)), D18 := Nat.lor s.D18 (Nat.shiftLeft 1 (Nat.mul 18 h)),
       M := Nat.xor s.M (Nat.mul cand p) })
/-- steps at bits 8, 7, ..., 0 -/
def elim (M : Nat) : ES := @Nat.rec (fun _ => ES → ES) (fun s => s) (fun k ih s => ih (stepE k s)) 9 ⟨0, 0, 0, 0, 0, M⟩

@[inline] def elimOk (s : ES) : Bool :=
  Nat.beq (Nat.land s.M LEFT9) 0 && Nat.beq (Nat.land s.P HM) 0 &&
  Nat.beq (Nat.land s.P (Nat.mul s.PM REP18)) s.DG && Nat.beq (Nat.land s.P (Nat.mul s.D18 M18)) s.P

@[inline] def gather (P j : Nat) : Nat :=
  Nat.land (Nat.shiftRight (Nat.mul (Nat.land (Nat.shiftRight P j) REP18) MAGIC) 144) 511
def lmC (P PM : Nat) : Nat :=
  @Nat.rec (fun _ => Nat → Nat) (fun acc => acc)
    (fun j ih acc => ih (cond (bit PM j) acc (Nat.land acc (perp (Nat.lor (gather P j) (Nat.shiftLeft 1 j)))))) 9 M512
def kerM (M : Nat) : Nat :=
  @Nat.rec (fun _ => Nat → Nat) (fun acc => acc)
    (fun z ih acc => ih (cond (Nat.beq (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) M18) 0) acc
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

/-- packed table `T[k] = XOR_{h ∈ k} n_h` over `k < 32` (512-bit entries) -/
@[inline] def dbl5 (n0 n1 n2 n3 n4 : Nat) : Nat :=
  let t1 := Nat.shiftLeft n0 512
  let t2 := Nat.lor t1 (Nat.shiftLeft (Nat.xor t1 (Nat.mul n1 REPK1)) 1024)
  let t3 := Nat.lor t2 (Nat.shiftLeft (Nat.xor t2 (Nat.mul n2 REPK2)) 2048)
  let t4 := Nat.lor t3 (Nat.shiftLeft (Nat.xor t3 (Nat.mul n3 REPK3)) 4096)
  Nat.lor t4 (Nat.shiftLeft (Nat.xor t4 (Nat.mul n4 REPK4)) 8192)
/-- the same over `k < 16` -/
@[inline] def dbl4 (n0 n1 n2 n3 : Nat) : Nat :=
  let t1 := Nat.shiftLeft n0 512
  let t2 := Nat.lor t1 (Nat.shiftLeft (Nat.xor t1 (Nat.mul n1 REPK1)) 1024)
  let t3 := Nat.lor t2 (Nat.shiftLeft (Nat.xor t2 (Nat.mul n2 REPK2)) 2048)
  Nat.lor t3 (Nat.shiftLeft (Nat.xor t3 (Nat.mul n3 REPK3)) 4096)
@[inline] def nbx (P h : Nat) : Nat := nperp (Nat.land (Nat.shiftRight P (Nat.add (Nat.mul 18 h) 9)) 511)
@[inline] def ngx (P i : Nat) : Nat := nperp (gather P (Nat.add 9 i))
@[inline] def tget (T k : Nat) : Nat := Nat.land (Nat.shiftRight T (Nat.mul 512 k)) M512

/-- tight record: `P`, `PM`, masks, and (built only when used) the tables of `b ↦ nperp(x(b))` and `c ↦ nperp(g(c))` -/
structure Rec where
  X : Nat
  P : Nat
  PM : Nat
  lm : Nat
  rm : Nat
  XL : Nat
  XH : Nat
  GL : Nat
  GH : Nat

@[inline] def mkR (X P PM lm rm : Nat) : Rec :=
  ⟨X, P, PM, lm, rm, dbl5 (nbx P 0) (nbx P 1) (nbx P 2) (nbx P 3) (nbx P 4), dbl4 (nbx P 5) (nbx P 6) (nbx P 7) (nbx P 8),
    dbl5 (ngx P 0) (ngx P 1) (ngx P 2) (ngx P 3) (ngx P 4), dbl4 (ngx P 5) (ngx P 6) (ngx P 7) (ngx P 8)⟩

@[inline] def mkRec (SS ACT : Nat) (asg : Asg) (X : Nat) : Bool × Rec :=
  cond (noasg X asg)
    (Nat.ble (ucnt SS ACT X) (Nat.land (Nat.shiftRight RKT (Nat.mul 4 X)) 15),
     mkR X (Nat.land (rpt X) M162) (Nat.land (Nat.shiftRight (rpt X) 162) 511) (rlm X) (rrm X))
    (let s := elim (resC X asg)
     (elimOk s && Nat.ble (ucnt SS ACT X) s.rk, mkR X s.P s.PM (lmC s.P s.PM) (kerM s.M)))

@[inline] def mkSl (SS ACT : Nat) (asg : Asg) (X : Nat) : Bool × Nat × Nat :=
  cond (noasg X asg)
    (Nat.ble (ucnt SS ACT X) (Nat.succ (Nat.land (Nat.shiftRight RKT (Nat.mul 4 X)) 15)), rlm X, rrm X)
    (let s := elim (resC X asg)
     let s2 := elim (resR X asg)
     (elimOk s && elimOk s2 && Nat.ble (ucnt SS ACT X) (Nat.succ s.rk), kerM s2.M, kerM s.M))

def updRecs (a b c : Nat) (l : List Rec) : List Rec :=
  @List.rec Rec (fun _ => List Rec) []
    (fun r _ ih => cond (par (Nat.land r.X a))
      (⟨r.X, r.P, r.PM, Nat.land r.lm (perp (gof r.P c)), Nat.land r.rm (perp (xof r.P b)), r.XL, r.XH, r.GL, r.GH⟩ :: ih) (r :: ih)) l

/-- records through `a` (appended to `tail`) -/
def thru (a : Nat) (l tail : List Rec) : List Rec :=
  @List.rec Rec (fun _ => List Rec) tail (fun r _ ih => cond (par (Nat.land r.X a)) (r :: ih) ih) l

def app (l tail : List Rec) : List Rec := @List.rec Rec (fun _ => List Rec) tail (fun r _ ih => r :: ih) l

def andLm (l : List Rec) (m : Nat) : Nat := @List.rec Rec (fun _ => Nat → Nat) (fun m => m) (fun r _ ih m => ih (Nat.land m r.lm)) l m
def andRm (l : List Rec) (m : Nat) : Nat := @List.rec Rec (fun _ => Nat → Nat) (fun m => m) (fun r _ ih m => ih (Nat.land m r.rm)) l m
def cmT (b : Nat) (l : List Rec) (m : Nat) : Nat :=
  @List.rec Rec (fun _ => Nat → Nat) (fun m => m) (fun r _ ih m => ih (Nat.land m (nperp (xof r.P b)))) l m
def bmT (c : Nat) (l : List Rec) (m : Nat) : Nat :=
  @List.rec Rec (fun _ => Nat → Nat) (fun m => m) (fun r _ ih m => ih (Nat.land m (nperp (gof r.P c)))) l m
def cmS (b : Nat) (l : List (Bool × Nat × Nat)) (m : Nat) : Nat :=
  @List.rec (Bool × Nat × Nat) (fun _ => Nat → Nat) (fun m => m) (fun s _ ih m => ih (cond (bit s.2.1 b) m (Nat.land m s.2.2))) l m
def bmS (c : Nat) (l : List (Bool × Nat × Nat)) (m : Nat) : Nat :=
  @List.rec (Bool × Nat × Nat) (fun _ => Nat → Nat) (fun m => m) (fun s _ ih m => ih (cond (bit s.2.2 c) m (Nat.land m s.2.1))) l m

@[inline] def lg2 (p : Nat) : Nat := Nat.land (Nat.shiftRight LOGT (Nat.mul 10 (Nat.mod p 523))) 1023

/-- `(x, c)` pairs (`bfirst`) or `(c, x)` pairs for the set bits `x` of `m`, ascending, prepended to `tail` -/
def pairs (bfirst : Bool) (c m : Nat) (tail : List (Nat × Nat)) : List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => tail)
    (fun _ ih m => cond (Nat.beq m 0) tail
      (cond bfirst (c, lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) (lg2 (Nat.xor m (Nat.land m (Nat.pred m))), c) ::
        ih (Nat.land m (Nat.pred m)))) 512 m

/-- set bits of `m`, ascending -/
def bitsOf (m : Nat) : List Nat :=
  @Nat.rec (fun _ => Nat → List Nat) (fun _ => [])
    (fun _ ih m => cond (Nat.beq m 0) [] (lg2 (Nat.xor m (Nat.land m (Nat.pred m))) :: ih (Nat.land m (Nat.pred m)))) 512 m

def candsB (part : List Rec) (ss : List (Bool × Nat × Nat)) (cb : Nat) (bs : List Nat) : List (Nat × Nat) :=
  @List.rec Nat (fun _ => List (Nat × Nat)) [] (fun b _ ih => pairs true b (cmS b ss (cmT b part cb)) ih) bs
def candsC (part : List Rec) (ss : List (Bool × Nat × Nat)) (bm : Nat) (cs : List Nat) : List (Nat × Nat) :=
  @List.rec Nat (fun _ => List (Nat × Nat)) [] (fun c _ ih => pairs false c (bmS c ss (bmT c part bm)) ih) cs

def allDom (dom : Nat) (l : List Nat) : Bool := @List.rec Nat (fun _ => Bool) true (fun X _ ih => bit dom X && ih) l
def allThru (a : Nat) (l : List Nat) : Bool := @List.rec Nat (fun _ => Bool) true (fun X _ ih => par (Nat.land a X) && ih) l

/-- new records: validity of all, and the records appended to `tail` -/
def mkRecs (SS ACT : Nat) (asg : Asg) (nt : List Nat) (tail : List Rec) : Bool × List Rec :=
  @List.rec Nat (fun _ => Bool × List Rec) (true, tail)
    (fun X _ ih => let r := mkRec SS ACT asg X; (r.1 && ih.1, r.2 :: ih.2)) nt
def mkSls (SS ACT : Nat) (asg : Asg) (sl : List Nat) : Bool × List (Bool × Nat × Nat) :=
  @List.rec Nat (fun _ => Bool × List (Bool × Nat × Nat)) (true, [])
    (fun X _ ih => let s := mkSl SS ACT asg X; (s.1 && ih.1, s :: ih.2)) sl

inductive Cert where
  | over (X : Nat)
  | br (t : Nat) (nt sl : List Nat) (sym cdir : Bool) (kids : List Cert)

/-- the checker at fuel `n` -/
def check (fuel : Nat) : Nat → Nat → Nat → Asg → List Rec → Nat → Cert → Bool :=
  @Nat.rec (fun _ => Nat → Nat → Nat → Asg → List Rec → Nat → Cert → Bool) (fun _ _ _ _ _ _ _ => false)
    (fun _ ih TERMS SS ACT asg recs dom c =>
      @Cert.casesOn (fun _ => Bool) c
        (fun X =>
          let s := elim (resC X asg)
          bit dom X && elimOk s && Nat.blt (ucnt SS ACT X) s.rk)
        (fun t nt sl sym cdir kids =>
          let a := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
          let nr := mkRecs SS ACT asg nt []
          let part := thru a recs (thru a nr.2 [])
          let allr := app recs nr.2
          let ss := mkSls SS ACT asg sl
          let B := andLm part (Nat.land ALLNZ (cond sym ORBM M512))
          let Cb := andRm part ALLNZ
          let cs : List (Nat × Nat) := cond cdir
            (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
            (cond (Nat.beq B 0) [] (candsB part ss.2 Cb (bitsOf B)))
          let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
          bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 &&
            @List.rec (Nat × Nat) (fun _ => List Cert → Bool) (fun ks => ks.isEmpty)
              (fun p _ ihc ks => @List.casesOn Cert (fun _ => Bool) ks false
                (fun k ks' => ih TERMS SS ACT' ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom k && ihc ks')) cs kids))
    fuel

/-- a leaf (list of first factors, at most 32) is refuted on domain `dom` by `c` -/
def leaf (terms : List Nat) (dom : Nat) (c : Cert) : Bool :=
  Nat.ble terms.length 32 && check 64 (packT terms) (mkSS terms) (Nat.pred (Nat.shiftLeft 1 terms.length)) [] [] dom c

end

end BC5

/-! ## Stream format (production): leaves and certificates packed in one `Nat`, no Lean-level data terms

Elaborating list and constructor literals costs ~11 ms per leaf and every `decide` theorem ~12 ms of fixed overhead, so a
batch of leaves is one hex literal.  Bits are read from the low end.
* batch: `1` + leaf record, or `0` + 24-bit length `L` + left batch (`L` bits) + right batch;
* leaf record: `n` (6 bits), the `n` first factors (9 bits each), dom mode (1 bit: 0 = all nonzero functionals, 1 = 512-bit
  mask follows), then the certificate in preorder;
* node: tag `0` + `X` (9 bits) = `over X`; tag `1` + `t` (5) + `sym` (1) + `cdir` (1) + `#nt` (4) + `nt` (9 each) + `#sl`
  (3) + `sl` (9 each), then one subtree per candidate (the checker computes the candidate list, so no count is stored). -/
namespace BC5
open BC4
noncomputable section

@[inline] def rd (k S : Nat) : Nat := Nat.land S (Nat.pred (Nat.shiftLeft 1 k))
@[inline] def sk (k S : Nat) : Nat := Nat.shiftRight S k

/-- `m` 9-bit values and the rest of the stream -/
def rdList (m S : Nat) : List Nat × Nat :=
  @Nat.rec (fun _ => Nat → List Nat × Nat) (fun S => ([], S)) (fun _ ih S => let r := ih (sk 9 S); (rd 9 S :: r.1, r.2)) m S

def checkS (fuel : Nat) : Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat :=
  @Nat.rec (fun _ => Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat) (fun _ _ _ _ _ _ S => (false, S))
    (fun _ ih TERMS SS ACT asg recs dom S =>
      cond (Nat.beq (rd 1 S) 0)
        (let X := rd 9 (sk 1 S)
         let s := elim (resC X asg)
         (bit dom X && elimOk s && Nat.blt (ucnt SS ACT X) s.rk, sk 10 S))
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
         let B := andLm part (Nat.land ALLNZ (cond sym ORBM M512))
         let Cb := andRm part ALLNZ
         let cs : List (Nat × Nat) := cond cdir
           (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
           (cond (Nat.beq B 0) [] (candsB part ss.2 Cb (bitsOf B)))
         let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
         let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
           (fun p _ ihc S => let r := ih TERMS SS ACT' ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
              cond r.1 (ihc r.2) (false, r.2)) cs slr.2
         (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 && kr.1, kr.2)))
    fuel

/-- `SS` from packed terms -/
def mkSSP (T n : Nat) : Nat :=
  @Nat.rec (fun _ => Nat) 0 (fun s ih => Nat.lor ih (Nat.shiftLeft (dep32 (Nat.land (Nat.shiftRight T (Nat.mul 9 s)) 511)) s)) n

/-- one leaf record -/
def leafS (R : Nat) : Bool :=
  let n := rd 6 R
  let T := rd (Nat.mul 9 n) (sk 6 R)
  let R1 := sk (Nat.add 6 (Nat.mul 9 n)) R
  let dm := Nat.beq (rd 1 R1) 0
  Nat.ble n 31 &&
    (checkS 64 T (mkSSP T n) (Nat.pred (Nat.shiftLeft 1 n)) [] [] (cond dm ALLNZ (rd 512 (sk 1 R1)))
      (cond dm (sk 1 R1) (sk 513 R1))).1

/-- a batch tree of leaf records -/
def batch (fuel D : Nat) : Bool :=
  @Nat.rec (fun _ => Nat → Bool) (fun _ => false)
    (fun _ ih D => cond (Nat.beq (rd 1 D) 1) (leafS (sk 1 D))
      (let L := rd 24 (sk 1 D); ih (rd L (sk 25 D)) && ih (sk (Nat.add 25 L) D))) fuel D

end
end BC5
