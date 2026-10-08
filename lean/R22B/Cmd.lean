module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
/-! # R22B.Cmd: `#r22b_eqs` generates the rfl bridges `R22D.<k>_<l> = <kernel constant>` (non-module side, native/infra). -/
@[expose] public section
open Lean Elab Command
/-- `#r22b_eqs k Kpre n`: theorems `R22B.<k>_eq_<l> : R22D.<k>_<l> = Kpre_<l>` for `l < n`, each by `Eq.refl` (kernel: both sides
unfold to the same Nat literal); `n = 0` means the single constant `R22D.<k> = Kpre`. -/
elab "#r22b_eqs " k:str kpre:ident n:num : command => liftCoreM do
  let ks := k.getString
  let one (a b thm : Name) : CoreM Unit := do
    let ty := mkApp3 (mkConst ``Eq [.succ .zero]) (mkConst ``Nat) (mkConst a) (mkConst b)
    addDecl (.thmDecl { name := thm, levelParams := [], type := ty, value := mkApp2 (mkConst ``Eq.refl [.succ .zero]) (mkConst ``Nat) (mkConst a) })
  if n.getNat == 0 then
    one (Name.mkStr `R22D ks) kpre.getId (Name.mkStr `R22B s!"{ks}_eq")
  else
    for l in [0:n.getNat] do
      one (Name.mkStr `R22D s!"{ks}_{l}") (Name.mkStr kpre.getId.getPrefix s!"{kpre.getId.getString!}_{l}") (Name.mkStr `R22B s!"{ks}_eq_{l}")

/-- `#r22b_arr A Kpre n`: theorem `R22B.<A>_eq : R22D.<A> = #[Kpre_0, …, Kpre_(n-1)]` by `Eq.refl` (element-wise literal equality) -/
elab "#r22b_arr " a:str kpre:ident n:num : command => liftCoreM do
  let ty := mkConst ``Nat
  let k := kpre.getId
  let l := (List.range n.getNat).foldr (fun i acc => mkApp3 (mkConst ``List.cons [.zero]) ty (mkConst (Name.mkStr k.getPrefix s!"{k.getString!}_{i}")) acc) (mkApp (mkConst ``List.nil [.zero]) ty)
  let rhs := mkApp2 (mkConst ``List.toArray [.zero]) ty l
  let aty := mkApp (mkConst ``Array [.zero]) ty
  let lhs := mkConst (Name.mkStr `R22D a.getString)
  let t := mkApp3 (mkConst ``Eq [.succ .zero]) aty lhs rhs
  addDecl (.thmDecl { name := Name.mkStr `R22B s!"{a.getString}_eq", levelParams := [], type := t, value := mkApp2 (mkConst ``Eq.refl [.succ .zero]) aty lhs })

/-- `#r22b_const A K`: theorem `R22B.<A with dots as _>_eq : A = K` by `Eq.refl`, for any two constants of the same type -/
elab "#r22b_const " a:ident b:ident : command => liftCoreM do
  let some ci := (← getEnv).find? b.getId | throwError "unknown {b.getId}"
  let t := mkApp3 (mkConst ``Eq [.succ .zero]) ci.type (mkConst a.getId) (mkConst b.getId)
  let nm := Name.mkStr `R22B ((a.getId.toString.replace "." "_") ++ "_eq")
  addDecl (.thmDecl { name := nm, levelParams := [], type := t, value := mkApp2 (mkConst ``Eq.refl [.succ .zero]) ci.type (mkConst a.getId) })

/-- `#r22b_eqsP Dpre Kpre n`: theorems `R22B.<Dpre with dots as _>_eq_<l> : Dpre_<l> = Kpre_<l>` for `l < n` (both sides given as
full prefixes, e.g. `R22D.T321.c2t` and `L1.T321.c2t`), each by `Eq.refl` -/
elab "#r22b_eqsP " d:ident k:ident n:num : command => liftCoreM do
  let dp := d.getId; let kp := k.getId
  for l in [0:n.getNat] do
    let a := Name.mkStr dp.getPrefix s!"{dp.getString!}_{l}"
    let b := Name.mkStr kp.getPrefix s!"{kp.getString!}_{l}"
    let ty := mkApp3 (mkConst ``Eq [.succ .zero]) (mkConst ``Nat) (mkConst a) (mkConst b)
    let nm := Name.mkStr `R22B s!"{dp.toString.replace "." "_"}_eq_{l}"
    let v := mkApp2 (mkConst ``Eq.refl [.succ .zero]) (mkConst ``Nat) (mkConst a)
    addDecl (.thmDecl { name := nm, levelParams := [], type := ty, value := v })

/-- `#r22b_arrP A Kpre n`: theorem `R22B.<A with dots as _>_eq : A = #[Kpre_0, …, Kpre_(n-1)]` by `Eq.refl` -/
elab "#r22b_arrP " a:ident k:ident n:num : command => liftCoreM do
  let ty := mkConst ``Nat
  let kp := k.getId
  let l := (List.range n.getNat).foldr (fun i acc => mkApp3 (mkConst ``List.cons [.zero]) ty (mkConst (Name.mkStr kp.getPrefix s!"{kp.getString!}_{i}")) acc) (mkApp (mkConst ``List.nil [.zero]) ty)
  let rhs := mkApp2 (mkConst ``List.toArray [.zero]) ty l
  let aty := mkApp (mkConst ``Array [.zero]) ty
  let t := mkApp3 (mkConst ``Eq [.succ .zero]) aty (mkConst a.getId) rhs
  let nm := Name.mkStr `R22B s!"{a.getId.toString.replace "." "_"}_eq"
  let v := mkApp2 (mkConst ``Eq.refl [.succ .zero]) aty (mkConst a.getId)
  addDecl (.thmDecl { name := nm, levelParams := [], type := t, value := v })
