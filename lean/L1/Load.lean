module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import L1.Check
/-! Binary data loading for the L1 checker.  Lean's numeral elaboration is quadratic in the literal size (a 16 KB literal
takes ~0.8 s, 160 KB ~76 s), so certificate data enters as raw literals built from binary files in O(n log n).  The
commands only build terms; every theorem is checked by the kernel as usual. -/
@[expose] public section
open Lean Elab Command

namespace L1Load

/-- little-endian bytes `[lo, hi)` of `b` as a Nat, divide and conquer -/
meta partial def natLE (b : ByteArray) (lo hi : Nat) : Nat :=
  if hi ≤ lo then 0
  else if hi - lo ≤ 64 then Id.run do
    let mut acc := 0
    let mut i := hi
    while i > lo do
      i := i - 1
      acc := acc * 256 + (b.get! i).toNat
    return acc
  else
    let mid := lo + (hi - lo) / 2
    natLE b lo mid + (natLE b mid hi <<< (8 * (mid - lo)))

/-- the items `[u64 n][n bytes]` of a file -/
meta partial def items (b : ByteArray) (o : Nat) (acc : Array Nat) : Array Nat :=
  if o + 8 > b.size then acc else
    let n := natLE b o (o + 8)
    items b (o + 8 + n) (acc.push (natLE b (o + 8) (o + 8 + n)))

/-- user + system CPU time of this process in ms, from /proc/self/stat -/
meta def cpuMs : IO Nat := do
  let s ← IO.FS.readFile "/proc/self/stat"
  let rest := (s.splitOn ") ").getLast!
  let f := rest.splitOn " "
  return ((f[11]!).toNat! + (f[12]!).toNat!) * 10

meta def natTy : Expr := mkConst ``Nat
meta def prodTy (α β : Expr) : Expr := mkApp2 (mkConst ``Prod [Level.zero, Level.zero]) α β
meta def mkPair (α β a b : Expr) : Expr := mkApp4 (mkConst ``Prod.mk [Level.zero, Level.zero]) α β a b
meta def mkList (ty : Expr) (xs : List Expr) : Expr :=
  xs.foldr (fun x acc => mkApp3 (mkConst ``List.cons [Level.zero]) ty x acc) (mkApp (mkConst ``List.nil [Level.zero]) ty)
meta def tabName (l : Nat) : Name := Name.mkStr (Name.mkStr `L1 "T") s!"c2t_{l}"

meta def defNat (n : Name) (v : Nat) : CoreM Unit := do
  let dv : DefinitionVal := { name := n, levelParams := [], type := natTy, value := mkRawNatLit v, hints := ReducibilityHints.abbrev, safety := DefinitionSafety.safe }
  addDecl (Declaration.defnDecl dv) (forceExpose := true)

/-- `#l1tables "file"`: `L1.T.c2t_<l>` (l < 511: the cap-2 table of label l) and `L1.T.CONF1T` -/
elab "#l1tables " p:str : command => do
  let b ← IO.FS.readBinFile p.getString
  let tab := 511 * 64
  for l in [0:511] do
    liftCoreM <| defNat (tabName l) (natLE b (l * tab) ((l + 1) * tab))
  liftCoreM <| defNat `L1.T.CONF1T (natLE b (511 * tab) (512 * tab))

/-- `#l1batch name "file"`: theorem `name : L1.batch stack nodes = true` (items: s, s x (S, D, N, d), n,
n x (label, record)); logs the kernel time -/
elab "#l1batch " id:ident p:str : command => do
  let b ← IO.FS.readBinFile p.getString
  let it := items b 0 #[]
  let s := it[0]!
  let t3 := prodTy natTy (prodTy natTy natTy)
  let t4 := prodTy natTy t3
  let st := (List.range s).map fun i =>
    mkPair natTy t3 (mkRawNatLit it[1+4*i]!) (mkPair natTy (prodTy natTy natTy) (mkRawNatLit it[2+4*i]!)
      (mkPair natTy natTy (mkRawNatLit it[3+4*i]!) (mkRawNatLit it[4+4*i]!)))
  let o := 1 + 4 * s
  let n := it[o]!
  let nd := (List.range n).map fun i =>
    mkPair natTy natTy (mkConst (tabName it[o+1+2*i]!)) (mkRawNatLit it[o+2+2*i]!)
  let ty := mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool)
    (mkApp2 (mkConst ``L1.batch) (mkList t4 st) (mkList (prodTy natTy natTy) nd)) (mkConst ``Bool.true)
  let pf := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true)
  let tv : TheoremVal := { name := id.getId, levelParams := [], type := ty, value := pf }
  let decl := Declaration.thmDecl tv
  -- synchronous kernel check, timed (the regular addDecl below checks again, possibly in a background task)
  let kenv := (← getEnv).toKernelEnv
  let opts ← getOptions
  let t0 ← IO.monoNanosNow
  let c0 ← cpuMs
  match Lean.Kernel.Environment.addDecl kenv opts decl with
  | .ok _ => pure ()
  | .error e => throwError m!"{id.getId}: kernel rejects the batch: {e.toMessageData opts}"
  let t1 ← IO.monoNanosNow
  let c1 ← cpuMs
  logInfo m!"{id.getId}: {n} nodes, kernel {(t1 - t0) / 1000000} ms wall, {c1 - c0} ms cpu"
  liftCoreM <| addDecl decl

end L1Load
