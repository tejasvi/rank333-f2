module
public import R22Port.U_d41d8cd98f00
public meta import Lean
public import KD.XBind
/-! # KD.XConstN: the window constants of `KD.xchild` as named literals

For every `n ≤ 510`: `KD.XC.rep_<n>`, `repm_<n>`, `grd_<n>`, `lows_<n>`, `diag_<n>` (kill2's `REP`, `REPm`, `GRD`, `LOWS`, `DIAG` of `n`
fields, stride 512) and **`KD.XC.cp_<n> : KD.CPn n (rep_<n>, repm_<n>, grd_<n>, lows_<n>, diag_<n>)`**, proved by one kernel
evaluation of `KD.constBeq` (`KD.cpn_of_beq`).  A child certificate names its constants; the composer cites `cp_<510-u>`. -/
@[expose] public section
open Lean Elab Command
namespace KDXC
meta def natT : Expr := mkConst ``Nat
meta def prodT (a b : Expr) : Expr := mkApp2 (mkConst ``Prod [Level.zero, Level.zero]) a b
meta def pairE (a b x y : Expr) : Expr := mkApp4 (mkConst ``Prod.mk [Level.zero, Level.zero]) a b x y
meta def cname (k : String) (n : Nat) : Name := Name.mkStr (Name.mkStr `KD "XC") s!"{k}_{n}"
/-- the tuple `(rep_n, repm_n, grd_n, lows_n, diag_n)` -/
meta def tupleE (n : Nat) : Expr :=
  let t2 := prodT natT natT; let t3 := prodT natT t2; let t4 := prodT natT t3
  pairE natT t4 (mkConst (cname "rep" n)) (pairE natT t3 (mkConst (cname "repm" n)) (pairE natT t2 (mkConst (cname "grd" n))
    (pairE natT natT (mkConst (cname "lows" n)) (mkConst (cname "diag" n)))))
end KDXC
open KDXC in
elab "#kdxconstN" : command => do
  for n in [0:511] do
    let rep := KD.pkMeta 512 n (fun _ => 1)
    liftCoreM <| KD.defLit (cname "rep" n) rep
    liftCoreM <| KD.defLit (cname "repm" n) (KD.pkMeta 511 n (fun _ => 1))
    liftCoreM <| KD.defLit (cname "grd" n) (rep <<< 511)
    liftCoreM <| KD.defLit (cname "lows" n) ((rep <<< 511) - rep)
    liftCoreM <| KD.defLit (cname "diag" n) (KD.pkMeta 512 n (fun i => 2 ^ i))
    let tru := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true)
    let hn := mkApp3 (mkConst ``Nat.le_of_ble_eq_true) (mkRawNatLit n) (mkRawNatLit 510) tru
    let ty := mkApp2 (mkConst ``KD.CPn) (mkRawNatLit n) (tupleE n)
    let pf := mkAppN (mkConst ``KD.cpn_of_beq) #[mkRawNatLit n, tupleE n, hn, tru]
    liftCoreM <| addDecl (Declaration.thmDecl { name := cname "cp" n, levelParams := [], type := ty, value := pf })
#kdxconstN
