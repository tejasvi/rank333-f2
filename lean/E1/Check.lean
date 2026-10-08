module
public import R22Port.U_d41d8cd98f00
public import ECTables
public import RT.Defs
public import BranchCheck7
/-! # E1: the enumeration checker v1 (coset IPs): row binding, canonicity witnesses, delegation, leaves

Per-IP data are explicit arguments (the soundness proof is generic in them): `R`, `N` (labels `< N ≤ 127`), the IP's slot
table `sl` (slot `i`: label mask, reversed label mask and cap of row-table entry `i`, checked once against the verified
row table), the representatives `VT` (9-bit fields), the leaf domain `DOM` (`E^⊥` as a 512-bit mask) and the group `GP`
(label permutations, 7-bit fields, 896 bits per element).

**Block**: `[1] mode`, `[5] d`, `[7] pos`, `d × [7]` prefix labels (ascending), mode 1: `127 × [3]` budgets;
`[8] nd`, `nd × [540]` delegated child states (each `[5] d, [7] pos, d × [7] prefix, 127 × [3] budgets`, zero-padded);
`[12] k`, `k × [15]` slot-table indices (the block's row table); mode 0: `[8] n`, `n × [12]` rows saturated at the start;
then the node.  Row table slot `j` (264 bits): `[127]` label mask, `[127]` reversed mask, `[5]` cap.  Rows in the
stream are `[12]` slots.
**Node**: `[2]` tag: 0 leaf (the rest of the node is a v7 leaf certificate) | 1 kill `[6] k, k × ([12] row, [36] Y)` |
2 branch: `[7] cut, [2] kind, (kind 1: [12] row), [1] hd, (hd: [6] k, k × ([12], [36]), [7] nfix, nfix × ([7] l, [3] ν))`,
then per label in `[pos, min(cut, N))`: `[2]` code 0 skip | 3 non-canonical `[4] g` | 1 lookahead-killed child
`[4] n, n × [12], [1] pk, (pk 1: [12] row)` | 2 child subtree `[4] n, n × [12], [24] len, node` (`len = 0`: delegated,
followed by `[8]` the index of its state in the block header).
A non-canonical skip is justified by a group element `g` whose image of the child's prefix multiset is smaller in the
multiplicity order, i.e. whose reversed packing is numerically larger. -/
@[expose] public section
namespace E1
open ECT

local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)

noncomputable section

@[inline] def rd (k S : Nat) : Nat := Nat.land S (Nat.sub (Nat.shiftLeft 1 k) 1)
@[inline] def sk (k S : Nat) : Nat := Nat.shiftRight S k
@[inline] def FM : Nat := 0xffffffffffffffffffffffffffffffff
@[inline] def M64 : Nat := 0xffffffffffffffff
@[inline] def M127 : Nat := 0x7fffffffffffffffffffffffffffffff
@[inline] def SC : Nat := 1073741824
@[inline] def spread (m : Nat) : Nat := Nat.land (Nat.mul m SPM) REP
@[inline] def fmask (m : Nat) : Nat := Nat.mul (spread m) FM
@[inline] def fsum (v : Nat) : Nat := Nat.land (Nat.shiftRight (Nat.mul v REP) 16128) FM
@[inline] def dot (vr x : Nat) : Nat := Nat.land (Nat.shiftRight (Nat.mul vr x) 16128) FM
@[inline] def fld (v l : Nat) : Nat := Nat.land (Nat.shiftRight v (Nat.mul 128 l)) FM
@[inline] def hif (lo : Nat) : Nat := Nat.shiftLeft (Nat.shiftRight FMALL (Nat.mul 128 lo)) (Nat.mul 128 lo)
@[inline] def one (l : Nat) : Nat := Nat.shiftLeft 1 (Nat.mul 128 l)
@[inline] def oner (l : Nat) : Nat := Nat.shiftLeft 1 (Nat.mul 128 (Nat.sub 126 l))
@[inline] def deficit (T UFR lo : Nat) : Nat :=
  let D := Nat.sub DSCREP T
  dot UFR (Nat.land (Nat.land D (Nat.mul (Nat.land (Nat.shiftRight D 64) REP) M64)) (hif lo))

/-! ## Slots (checked once per IP against the verified row table) -/

/-- labels whose representative has odd `<X, v>` (planes `LB`, 128 bits each) -/
def lpar (LB X : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0
    (fun i acc => cond (Nat.testBit X i) (Nat.xor acc (Nat.land (Nat.shiftRight LB (Nat.mul 128 i)) M127)) acc) 9
/-- label mask of an entry's row: the common kernel of its dual vectors -/
def labM (LB e : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) M127
    (fun j acc => Nat.land acc (Nat.xor M127 (lpar LB (RT.eV e (Nat.add (RT.eD e) j))))) (Nat.sub 9 (RT.eD e))
def slot (LB LBR e : Nat) : Nat :=
  Nat.lor (labM LB e) (Nat.lor (Nat.shiftLeft (labM LBR e) 127) (Nat.shiftLeft (RT.eCap e) 254))
/-- every dual vector of `e` is a functional of the domain, i.e. `E ⊆ U` -/
def dualIn (DOM e : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun j b => b && Nat.testBit DOM (RT.eV e (Nat.add (RT.eD e) j))) (Nat.sub 9 (RT.eD e))

/-! ## The block's row table -/

/-- the block's row table from `k` slot indices (`[15]` each) -/
def mkRT (sl : Nat → Nat) (k S : Nat) : Nat × Nat :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat × Nat) (fun T _ S => (T, S))
    (fun _ ih T j S => ih (Nat.lor T (Nat.shiftLeft (sl (rd 15 S)) (Nat.mul 264 j))) (Nat.succ j) (sk 15 S)) k 0 0 S
@[inline] def rmask (RTb j : Nat) : Nat := Nat.land (Nat.shiftRight RTb (Nat.mul 264 j)) M127
@[inline] def rmaskr (RTb j : Nat) : Nat := Nat.land (Nat.shiftRight RTb (Nat.add (Nat.mul 264 j) 127)) M127
@[inline] def rcap (RTb j : Nat) : Nat := Nat.land (Nat.shiftRight RTb (Nat.add (Nat.mul 264 j) 254)) 31

/-- read a dual of `k` rows (`[12]` slot, `[36] Y`): `(∑ Y cap, T, rest)` -/
def rdual (RTb k S : Nat) : Nat × Nat × Nat :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat × Nat × Nat) (fun BC T S => (BC, T, S))
    (fun _ ih BC T S => ih (Nat.add BC (Nat.mul (rd 36 (sk 12 S)) (rcap RTb (rd 12 S))))
      (Nat.add T (Nat.mul (rd 36 (sk 12 S)) (spread (rmask RTb (rd 12 S))))) (sk 48 S)) k 0 0 S

/-- saturation events: `n` slots; each row must be full (`m(U) = cap`), then its labels' budgets are zeroed -/
def sats (RTb n MV UF UFR S : Nat) : Bool × Nat × Nat × Nat :=
  Nat.rec (motive := fun _ => Bool → Nat → Nat → Nat → Bool × Nat × Nat × Nat) (fun ok UF UFR S => (ok, UF, UFR, S))
    (fun _ ih ok UF UFR S =>
      ih (ok ∧ᵇ Nat.beq (fsum (Nat.land MV (fmask (rmask RTb (rd 12 S))))) (rcap RTb (rd 12 S)))
        (Nat.land UF (Nat.xor FMALL (fmask (rmask RTb (rd 12 S)))))
        (Nat.land UFR (Nat.xor FMALL (fmask (rmaskr RTb (rd 12 S))))) (sk 12 S)) n true UF UFR S

/-- budget fixings `(l, ν)` from a node dual: `(ν + 1)(T_l - SC) > gap` and `ν < u_l` -/
def fixes (n T gap UF UFR S : Nat) : Bool × Nat × Nat × Nat :=
  Nat.rec (motive := fun _ => Bool → Nat → Nat → Nat → Bool × Nat × Nat × Nat) (fun ok UF UFR S => (ok, UF, UFR, S))
    (fun _ ih ok UF UFR S =>
      let l := rd 7 S
      let nu := rd 3 (sk 7 S)
      let u := fld UF l
      let t := fld T l
      ih (ok ∧ᵇ Nat.ble (Nat.succ SC) t ∧ᵇ Nat.ble (Nat.succ nu) u ∧ᵇ Nat.ble (Nat.succ gap) (Nat.mul (Nat.succ nu) (Nat.sub t SC)))
        (Nat.sub UF (Nat.mul (Nat.sub u nu) (one l))) (Nat.sub UFR (Nat.mul (Nat.sub u nu) (oner l))) (sk 10 S)) n true UF UFR S

/-- weight of the budgets at labels `≥ lo` outside the label mask `m` -/
@[inline] def wout (UF m lo : Nat) : Nat := fsum (Nat.land (Nat.land UF (Nat.xor FMALL (fmask m))) (hif lo))

/-! ## Canonicity witnesses -/

/-- the reversed packing of the image of the multiset with labels `pl` (`m` entries, `[7]` each) under the label
permutation `gp` (7-bit fields) -/
def imgR (gp pl m : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat) (fun acc _ => acc)
    (fun _ ih acc pl => ih (Nat.add acc (oner (Nat.land (Nat.shiftRight gp (Nat.mul 7 (rd 7 pl))) 127))) (sk 7 pl)) m 0 pl
@[inline] def gpE (GP g : Nat) : Nat := Nat.land (Nat.shiftRight GP (Nat.mul 896 g)) (Nat.sub (Nat.shiftLeft 1 896) 1)

/-! ## Leaves -/

/-- the v7 leaf record of the prefix `pl` (`R` labels) with certificate `cert`: `[6] R`, terms, dom mode `01`, `DOM`, cert -/
def leafRec (R VT DOM pl cert : Nat) : Nat :=
  let terms := Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat) (fun acc _ _ => acc)
    (fun _ ih acc i pl => ih (Nat.lor acc (Nat.shiftLeft (Nat.land (Nat.shiftRight VT (Nat.mul 9 (rd 7 pl))) 511) (Nat.mul 9 i)))
      (Nat.succ i) (sk 7 pl)) R 0 0 pl
  Nat.lor R (Nat.lor (Nat.shiftLeft terms 6) (Nat.shiftLeft (Nat.lor 1 (Nat.lor (Nat.shiftLeft DOM 2) (Nat.shiftLeft cert 514)))
    (Nat.add 6 (Nat.mul 9 R))))

/-! ## States -/

/-- packed budgets (field `l` at `128 l`) from `127 × [3]` fields -/
def budU (B : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0 (fun l U => Nat.add U (Nat.mul (rd 3 (sk (Nat.mul 3 l) B)) (one l))) 127
/-- reversed packed budgets (field `l` at `128 (126 - l)`) -/
def budUR (B : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0 (fun l U => Nat.add U (Nat.mul (rd 3 (sk (Nat.mul 3 l) B)) (oner l))) 127
/-- the record `r` (`[5] d, [7] pos, d × [7] prefix, 127 × [3] budgets`) is the state `(d, pos, pl, UF)` -/
def stEq (r d pos pl UF : Nat) : Bool :=
  Nat.beq (rd 5 r) d ∧ᵇ Nat.beq (rd 7 (sk 5 r)) pos ∧ᵇ Nat.beq (rd (Nat.mul 7 d) (sk 12 r)) pl ∧ᵇ
    Nat.beq (budU (sk (Nat.add 12 (Nat.mul 7 d)) r)) UF

structure Ctx where
  R : Nat
  N : Nat
  VT : Nat
  DOM : Nat
  GP : Nat
  /-- external leaves: the label sequences (`7`-bit fields) of the leaves refuted by separate theorems (split v7 leaves) -/
  EXT : List Nat

/-- a leaf of prefix `pl` with certificate `cert`: an external leaf (`cert = 0`, `pl ∈ C.EXT`) or a v7 leaf record -/
def leafOK (C : Ctx) (pl cert : Nat) : Bool :=
  sel (Nat.beq cert 0)
    (@List.rec Nat (fun _ => Bool) false (fun e _ ih => @Bool.rec (fun _ => Bool) ih true (Nat.beq e pl)) C.EXT)
    (BC7.leafS (leafRec C.R C.VT C.DOM pl cert))

/-! ## The node -/

/-- a child with codes 1 (lookahead-killed) or 2 (subtree), after its saturation events `s`
(let-free: the kernel shares repeated subterms through its cache) -/
def kidC12 (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (code d pl MV MVR l : Nat) (ihl : Nat → Nat → Bool) (s : Bool × Nat × Nat × Nat) : Bool :=
  sel (Nat.beq code 1)
    (sel (Nat.beq (rd 1 s.2.2.2) 0)
      (Nat.blt (wout s.2.1 0 l) (Nat.sub C.R (Nat.succ d)) ∧ᵇ ihl (Nat.succ l) (sk 1 s.2.2.2))
      (Nat.ble 1 (Nat.sub (Nat.add (Nat.sub C.R (Nat.succ d)) (fsum (Nat.land (Nat.add MV (one l))
          (fmask (rmask RTb (rd 12 (sk 1 s.2.2.2))))))) (rcap RTb (rd 12 (sk 1 s.2.2.2)))) ∧ᵇ
       Nat.blt (wout s.2.1 (rmask RTb (rd 12 (sk 1 s.2.2.2))) l)
         (Nat.sub (Nat.add (Nat.sub C.R (Nat.succ d)) (fsum (Nat.land (Nat.add MV (one l))
          (fmask (rmask RTb (rd 12 (sk 1 s.2.2.2))))))) (rcap RTb (rd 12 (sk 1 s.2.2.2)))) ∧ᵇ
       ihl (Nat.succ l) (sk 13 s.2.2.2)))
    (sel (Nat.beq (rd 24 s.2.2.2) 0)
      (stEq (rd 540 (sk (Nat.mul 540 (rd 8 (sk 24 s.2.2.2))) H)) (Nat.succ d) l
          (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) s.2.1 ∧ᵇ ihl (Nat.succ l) (sk 32 s.2.2.2))
      (ih (Nat.succ d) l (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) (Nat.add MV (one l)) (Nat.add MVR (oner l))
          s.2.1 s.2.2.1 (rd (rd 24 s.2.2.2) (sk 24 s.2.2.2)) ∧ᵇ
        ihl (Nat.succ l) (sk (Nat.add 24 (rd 24 s.2.2.2)) s.2.2.2)))

/-- one label of the children loop (`ihl`: the rest of the loop) -/
def kidStep (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (d pl MV MVR UF UFR : Nat) (ihl : Nat → Nat → Bool) (l S : Nat) : Bool :=
  sel (Nat.beq (rd 2 S) 0)
    (Nat.beq (fld UF l) 0 ∧ᵇ ihl (Nat.succ l) (sk 2 S))
    (sel (Nat.beq (rd 2 S) 3)
      (Nat.blt (Nat.add MVR (oner l))
          (imgR (gpE C.GP (rd 4 (sk 2 S))) (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) (Nat.succ d)) ∧ᵇ
        ihl (Nat.succ l) (sk 4 (sk 2 S)))
      (Nat.ble 1 (fld UF l) ∧ᵇ
        (sats RTb (rd 4 (sk 2 S)) (Nat.add MV (one l)) (Nat.sub UF (one l)) (Nat.sub UFR (oner l)) (sk 4 (sk 2 S))).1 ∧ᵇ
        kidC12 ih C RTb H (rd 2 S) d pl MV MVR l ihl
          (sats RTb (rd 4 (sk 2 S)) (Nat.add MV (one l)) (Nat.sub UF (one l)) (Nat.sub UFR (oner l)) (sk 4 (sk 2 S)))))

/-- the children loop of a branch node over `cnt` labels from `l` -/
def kids (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (cnt d pl MV MVR UF UFR l S : Nat) : Bool :=
  Nat.rec (motive := fun _ => Nat → Nat → Bool) (fun _ _ => true)
    (fun _ ihl l S => kidStep ih C RTb H d pl MV MVR UF UFR ihl l S) cnt l S

/-- the cut condition: no completion has all its new labels `≥ cut` -/
def cutOK (C : Ctx) (RTb kind cut cj rem MV UF' : Nat) (hd : Bool) (BC T UFR' RS : Nat) : Bool :=
  sel (Nat.beq kind 0) (Nat.ble C.N cut)
    (sel (Nat.beq kind 1)
      (Nat.ble 1 (Nat.sub (Nat.add rem (fsum (Nat.land MV (fmask (rmask RTb cj))))) (rcap RTb cj)) ∧ᵇ
       Nat.blt (wout UF' (rmask RTb cj) cut) (Nat.sub (Nat.add rem (fsum (Nat.land MV (fmask (rmask RTb cj))))) (rcap RTb cj)))
      (sel (Nat.beq kind 2) (Nat.blt (wout UF' 0 cut) rem)
        (hd ∧ᵇ Nat.blt (Nat.add BC (deficit T UFR' cut)) RS)))

/-- a branch node after its dual `du` (`(∑ Y cap, T, rest)`) and budget fixings `fx` -/
def branchT (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (d pos pl MV MVR UFR rem cut kind cj : Nat) (hd : Bool) (du : Nat × Nat × Nat) (fx : Bool × Nat × Nat × Nat) : Bool :=
  (@Bool.rec (fun _ => Bool) true
    (Nat.ble (Nat.add (Nat.mul rem SC) (dot MVR du.2.1)) (Nat.add du.1 (deficit du.2.1 UFR pos))) hd) ∧ᵇ fx.1 ∧ᵇ
    cutOK C RTb kind cut cj rem MV fx.2.1 hd du.1 du.2.1 fx.2.2.1 (Nat.add (Nat.mul rem SC) (dot MVR du.2.1)) ∧ᵇ
    kids ih C RTb H (Nat.sub (sel (Nat.ble C.N cut) C.N cut) pos) d pl MV MVR fx.2.1 fx.2.2.1 pos fx.2.2.2

/-- the stream after the branch header up to the dual: `S4` (`cut`, `kind`, optional row, `hd` read) -/
@[inline] def brS4 (S1 : Nat) : Nat := sk 1 (sel (Nat.beq (rd 2 (sk 7 S1)) 1) (sk 12 (sk 9 S1)) (sk 9 S1))
/-- the node dual flag -/
@[inline] def brHd (S1 : Nat) : Bool := Nat.beq (rd 1 (sel (Nat.beq (rd 2 (sk 7 S1)) 1) (sk 12 (sk 9 S1)) (sk 9 S1))) 1
/-- the node dual (or the empty dual) -/
@[inline] def brDu (RTb S1 : Nat) : Nat × Nat × Nat := sel (brHd S1) (rdual RTb (rd 6 (brS4 S1)) (sk 6 (brS4 S1))) (0, 0, brS4 S1)

/-- one node (`ih`: the node checker with one less fuel) -/
def nodeStep (C : Ctx) (RTb H : Nat) (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool)
    (d pos pl MV MVR UF UFR S : Nat) : Bool :=
  sel (Nat.beq (rd 2 S) 0)
    (Nat.beq (Nat.sub C.R d) 0 ∧ᵇ leafOK C pl (sk 2 S))
    (Nat.ble 1 (Nat.sub C.R d) ∧ᵇ
      sel (Nat.beq (rd 2 S) 1)
        (Nat.blt (Nat.add (rdual RTb (rd 6 (sk 2 S)) (sk 6 (sk 2 S))).1 (deficit (rdual RTb (rd 6 (sk 2 S)) (sk 6 (sk 2 S))).2.1 UFR pos))
          (Nat.add (Nat.mul (Nat.sub C.R d) SC) (dot MVR (rdual RTb (rd 6 (sk 2 S)) (sk 6 (sk 2 S))).2.1)))
        (branchT ih C RTb H d pos pl MV MVR UFR (Nat.sub C.R d) (rd 7 (sk 2 S)) (rd 2 (sk 7 (sk 2 S))) (rd 12 (sk 9 (sk 2 S)))
          (brHd (sk 2 S)) (brDu RTb (sk 2 S))
          (sel (brHd (sk 2 S))
            (fixes (rd 7 (brDu RTb (sk 2 S)).2.2) (brDu RTb (sk 2 S)).2.1
              (Nat.sub (Nat.add (brDu RTb (sk 2 S)).1 (deficit (brDu RTb (sk 2 S)).2.1 UFR pos))
                (Nat.add (Nat.mul (Nat.sub C.R d) SC) (dot MVR (brDu RTb (sk 2 S)).2.1)))
              UF UFR (sk 7 (brDu RTb (sk 2 S)).2.2))
            (true, UF, UFR, brS4 (sk 2 S)))))

/-- the node checker with `fuel` levels -/
def node (C : Ctx) (RTb H fuel : Nat) : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool)
    (fun _ _ _ _ _ _ _ _ => false)
    (fun _ ih d pos pl MV MVR UF UFR S => nodeStep C RTb H ih d pos pl MV MVR UF UFR S)
    fuel

/-- the header's delegated states: `(nd, H, rest)` -/
@[inline] def hdr (S : Nat) : Nat × Nat × Nat :=
  (rd 8 S, rd (Nat.mul 540 (rd 8 S)) (sk 8 S), sk (Nat.add 8 (Nat.mul 540 (rd 8 S))) S)

/-- prefix multiplicities `(MV, MVR)` of the `d` labels in `pl` -/
def mvOf (d pl : Nat) : Nat × Nat :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat × Nat) (fun MV MVR _ => (MV, MVR))
    (fun _ ih MV MVR pl => ih (Nat.add MV (one (rd 7 pl))) (Nat.add MVR (oner (rd 7 pl))) (sk 7 pl)) d 0 0 pl

/-! ## Blocks (let-free, with the header fields as small named pieces) -/

/-- the block's depth -/
@[inline] def bD (S : Nat) : Nat := rd 5 (sk 1 S)
/-- the block's prefix labels (`[7]` each) -/
@[inline] def bPl (S : Nat) : Nat := rd (Nat.mul 7 (bD S)) (sk 13 S)
/-- the stream after the prefix -/
@[inline] def bS1 (S : Nat) : Nat := sk (Nat.add 13 (Nat.mul 7 (bD S))) S
/-- the stream after the budgets (mode 1) -/
@[inline] def bS2 (S : Nat) : Nat := sel (Nat.beq (rd 1 S) 1) (sk 381 (bS1 S)) (bS1 S)
/-- the block's row table and the rest of the stream -/
@[inline] def bRT (sl : Nat → Nat) (S : Nat) : Nat × Nat := mkRT sl (rd 12 (hdr (bS2 S)).2.2) (sk 12 (hdr (bS2 S)).2.2)
/-- the start budgets: mode 1 explicit, mode 0 the label caps minus the prefix -/
@[inline] def bUF (UB S : Nat) : Nat := sel (Nat.beq (rd 1 S) 1) (budU (bS1 S)) (Nat.sub UB (mvOf (bD S) (bPl S)).1)
@[inline] def bUFR (UBR S : Nat) : Nat := sel (Nat.beq (rd 1 S) 1) (budUR (bS1 S)) (Nat.sub UBR (mvOf (bD S) (bPl S)).2)
/-- mode 0: the rows saturated at the start -/
@[inline] def bSat (sl : Nat → Nat) (UB UBR S : Nat) : Bool × Nat × Nat × Nat :=
  sel (Nat.beq (rd 1 S) 0)
    (sats (bRT sl S).1 (rd 8 (bRT sl S).2) (mvOf (bD S) (bPl S)).1 (bUF UB S) (bUFR UBR S) (sk 8 (bRT sl S).2))
    (true, bUF UB S, bUFR UBR S, (bRT sl S).2)

/-- a block (see the module docstring) -/
def block (C : Ctx) (sl : Nat → Nat) (UB UBR S : Nat) : Bool :=
  (bSat sl UB UBR S).1 ∧ᵇ Nat.ble (bD S) C.R ∧ᵇ
    node C (bRT sl S).1 (hdr (bS2 S)).2.1 24 (bD S) (rd 7 (sk 6 S)) (bPl S) (mvOf (bD S) (bPl S)).1 (mvOf (bD S) (bPl S)).2
      (bSat sl UB UBR S).2.1 (bSat sl UB UBR S).2.2.1 (bSat sl UB UBR S).2.2.2

/-- the block `Sc` starts (mode 1) in the state recorded as `r` -/
def glue (r Sc : Nat) : Bool :=
  Nat.beq (rd 1 Sc) 1 ∧ᵇ Nat.beq (rd (Nat.add 393 (Nat.mul 7 (rd 5 r))) (sk 1 Sc)) r

/-- the block `Sc` is a mode-0 block (a search job: budgets from the label caps) with the prefix recorded as `r`
(depth, position, labels); the recorded budgets are not needed -/
def glue0 (r Sc : Nat) : Bool :=
  Nat.beq (rd 1 Sc) 0 ∧ᵇ Nat.beq (rd (Nat.add 12 (Nat.mul 7 (rd 5 r))) (sk 1 Sc)) (rd (Nat.add 12 (Nat.mul 7 (rd 5 r))) r)

end
end E1
