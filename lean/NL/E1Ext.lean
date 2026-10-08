module
public import NL.Split
/-! # NL.E1Ext: native checks of E1's external leaves (core only)

E1 (leaf2/E1, the class raises) refutes the external leaves `C.EXT` of an IP outside the enumeration chain. Each leaf is a label
sequence `pl` of `R` 7-bit fields. Some are split monsters (main record and sub-records, leaf2/split); the rest have monolithic v7
certificates (leaf2/litsE1/e*_mono.bin). This module checks them in batches over an index range of `C.EXT`, as `S7X`/`BC7s` do.
* `e1Hdr d R VT dom pl`: the record at bit 0 of `d` has E1's leaf header for `pl`, all inside the bytes: `[6] R`, the first
  factors `(VT >>> 9 x) & 511` of the labels `x` (low label first), dom mode `01` (bits `1, 0`) and the 512-bit mask `dom`.
* `e1ExtSplitB R VT dom EXT b m k o`: the split leaves of `EXT[k] … EXT[k+m-1]`, items in `b` from byte `o`, each
  `[u32 len][main record] [u32 m0] [u32 nrec]` then `nrec × ([u32 len][path] [u32 m] [u32 len][certificate])`, with paths
  `[u8 steps]` and steps `[u8 t][u8 sym][u8 cdir][u8 |nt|][u16 nt…][u8 |sl|][u16 sl…][u32 i]` (`py/mksplit.py`). Each leaf
  needs `e1Hdr` and `nestLeaf` (BC7x).
* `e1ExtMonoB R VT dom EXT b m k o`: monolithic certificates `[u32 len][bytes]` for `EXT[k] …`, checked by `leafCertW` in
  place.
Decoders use structural recursion (no `partial`). The refinement to `E1S.LeafND` is in `NLP/E1Ext.lean`. -/
@[expose] public section
namespace NL

/-- equal words -/
@[inline] def M8.eqb (x y : M8) : Bool :=
  x.a0 == y.a0 && x.a1 == y.a1 && x.a2 == y.a2 && x.a3 == y.a3 && x.a4 == y.a4 && x.a5 == y.a5 && x.a6 == y.a6 &&
    x.a7 == y.a7

/-- the first factor of label `x` -/
@[inline] def termOfN (VT x : Nat) : Nat := Nat.land (Nat.shiftRight VT (Nat.mul 9 x)) 511

/-- the first factors of the `R` low 7-bit labels of `pl`, low label first -/
def termsN (VT : Nat) : Nat → Nat → List Nat
  | 0, _ => []
  | R + 1, pl => termOfN VT (Nat.land pl 127) :: termsN VT R (Nat.shiftRight pl 7)

/-- the 9-bit fields at `q, q + 9, …` of the window `[.., e)` of `d` are `ts` -/
def fieldsOK (d : ByteArray) (e : Nat) : List Nat → Nat → Bool
  | [], _ => true
  | t :: ts, q => Nat.beq (rdw d e q 9) t && fieldsOK d e ts (q + 9)

/-- the record at bit 0 of `d` has E1's leaf header for `pl` (`E1.leafRec R VT DOM pl _`), inside the bytes -/
def e1Hdr (d : ByteArray) (R VT : Nat) (dom : M8) (pl : Nat) : Bool :=
  let e := 8 * d.size
  Nat.beq (rdw d e 0 6) R && fieldsOK d e (termsN VT R pl) 6 &&
    Nat.beq (rdw d e (6 + 9 * R) 1) 1 && Nat.beq (rdw d e (7 + 9 * R) 1) 0 &&
    Nat.ble (520 + 9 * R) e && M8.eqb (rdM8 d (8 + 9 * R)) dom

/-! ## Decoding split items -/

@[inline] def rdU16 (b : ByteArray) (o : Nat) : Nat := byteAt b o + 256 * byteAt b (o + 1)

/-- `k` u16 values from byte `o` -/
def rd16s (b : ByteArray) : Nat → Nat → List Nat
  | 0, _ => []
  | k + 1, o => rdU16 b o :: rd16s b k (o + 2)

/-- `k` path steps from byte `o` -/
def rdSteps (b : ByteArray) : Nat → Nat → List Step
  | 0, _ => []
  | k + 1, o =>
    let nn := byteAt b (o + 3)
    let o1 := o + 4 + 2 * nn
    let ns := byteAt b o1
    let o2 := o1 + 1 + 2 * ns
    (byteAt b o, Nat.beq (byteAt b (o + 1)) 1, Nat.beq (byteAt b (o + 2)) 1, rd16s b nn (o + 4), rd16s b ns (o1 + 1),
      rdU32 b o2) :: rdSteps b k (o2 + 4)

/-- `k` sub-records from byte `o`, and the byte after them -/
def rdRecs (b : ByteArray) : Nat → Nat → List (List Step × Nat × ByteArray × Nat × Nat) × Nat
  | 0, o => ([], o)
  | k + 1, o =>
    let pl := rdU32 b o
    let P := rdSteps b (byteAt b (o + 4)) (o + 5)
    let o1 := o + 4 + pl
    let m := rdU32 b o1
    let cl := rdU32 b (o1 + 4)
    let c := b.extract (o1 + 8) (o1 + 8 + cl)
    let r := rdRecs b k (o1 + 8 + cl)
    ((P, m, c, 0, 8 * c.size) :: r.1, r.2)

/-! ## The batches -/

/-- the split leaves of `EXT[k] … EXT[k+m-1]`, items from byte `o` of `b` -/
def e1ExtSplitB (R VT : Nat) (dom : M8) (EXT : List Nat) (b : ByteArray) : Nat → Nat → Nat → Bool
  | 0, _, _ => true
  | m + 1, k, o =>
    let ml := rdU32 b o
    let d := b.extract (o + 4) (o + 4 + ml)
    let o1 := o + 4 + ml
    let m0 := rdU32 b o1
    let rr := rdRecs b (Nat.min (rdU32 b (o1 + 4)) b.size) (o1 + 8)
    e1Hdr d R VT dom (EXT.getD k 0) && nestLeaf d 0 rr.1 m0 && e1ExtSplitB R VT dom EXT b m (k + 1) rr.2

/-- the monolithic certificates of `EXT[k] … EXT[k+m-1]`, items `[u32 len][bytes]` from byte `o` of `b` -/
def e1ExtMonoB (R VT : Nat) (dom : M8) (EXT : List Nat) (b : ByteArray) : Nat → Nat → Nat → Bool
  | 0, _, _ => true
  | m + 1, k, o =>
    let cl := rdU32 b o
    leafCertW (termsN VT R (EXT.getD k 0)).toArray dom b (8 * (o + 4)) (8 * (o + 4 + cl)) &&
      e1ExtMonoB R VT dom EXT b m (k + 1) (o + 4 + cl)

end NL
