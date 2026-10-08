module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import R3RT.AddT
public import G.Cover
/-! # Per-anchor assembly: batch theorems to the `G/Accept.lean` statements

* `#asmA ns d v3`: `ns.PA : G.Acc.PhaseA d ns.t0 v3` from `ns.R1`, `ns.SL_*`, `ns.G` and the batch theorems `ns.A2_*`, `ns.A3_*`.
* `#asmV ns k`: `ns.VOK : G.Acc.VOK2 ns.orb ns.nV3` (`k = 2`) or `VOK1` (`k = 1`) from the batch theorems `ns.b*`.
* `#asmS ns`: `ns.SOK : G.Acc.SOK ns.orb ns.nRec` from the batch theorems `ns.s*`.
Batch theorems are found by name prefix; their intervals are read off their statements (the start index and the list
length) and chained with `G.Cov.upto_ext`; the kernel re-checks the lengths (`Eq.refl`). -/
@[expose] public section
open Lean Elab Command Meta
namespace G.Asm

/-- the elements of a `List.cons` chain -/
meta partial def listElems (e : Expr) : Array Expr :=
  let rec go (e : Expr) (acc : Array Expr) : Array Expr :=
    if e.isAppOfArity ``List.cons 3 then go e.appArg! (acc.push e.appFn!.appArg!) else acc
  go e #[]

meta def natLit! (e : Expr) : Nat := match e.rawNatLit? with | some n => n | none => match e.nat? with | some n => n | none => 0

/-- constants `ns.<pre><digits...>` in the environment, sorted by the digits -/
meta def findBatches (ns : Name) (pre : String) : CommandElabM (Array Name) := do
  let env ← getEnv
  let mut out : Array (Nat × Name) := #[]
  for (n, _) in env.constants.toList do
    if n.getPrefix == ns then
      let s := n.getString!
      if s.startsWith pre then
        let rest := (s.drop pre.length).toString
        let key := (rest.splitOn "_").foldl (fun acc p => acc * 100000 + (p.toNat?.getD 0)) 0
        if rest.length > 0 && (rest.all fun c => c.isDigit || c == '_') then out := out.push (key, n)
  return (out.qsort (fun a b => a.1 < b.1)).map (·.2)

meta def addThm (n : Name) (ty val : Expr) : CommandElabM Unit := do
  let (w, c) ← R3RTAdd.addTimed (Declaration.thmDecl { name := n, levelParams := [], type := ty, value := val }) s!"{n}"
  logInfo m!"{n}: kernel {w} ms wall, {c} ms cpu"

/-- chain interval facts `(lo, hi, proof of ∀ i, lo ≤ i → i < hi → P i)` from 0: a proof of `∀ i, i < hiLast → P i` -/
meta def chain (P : Expr) (ints : Array (Nat × Nat × Expr)) : CommandElabM Expr := do
  let mut acc := mkApp (mkConst ``G.Cov.upto_zero) P
  let mut pos := 0
  for (lo, hi, pf) in ints do
    if lo != pos then throwError m!"asm: gap at {pos} (next interval starts at {lo})"
    acc := mkAppN (mkConst ``G.Cov.upto_ext) #[P, mkRawNatLit lo, mkRawNatLit hi, pf, acc]
    pos := hi
  return acc

/-- interval facts of `all* … lo cs = true` batch theorems: `mk` builds the interval proof from (args, lo, hi, thm) -/
meta def intervals (names : Array Name) (loIdx csIdx : Nat) (mk : Array Expr → Nat → Nat → Expr → Expr) : CommandElabM (Array (Nat × Nat × Expr)) := do
  let env ← getEnv
  let mut out := #[]
  for n in names do
    let some ci := env.find? n | throwError m!"asm: {n} not found"
    let lhs := ci.type.appFn!.appArg!  -- `@Eq Bool lhs true`
    let args := lhs.getAppArgs
    let lo := natLit! args[loIdx]!
    let hi := lo + (listElems args[csIdx]!).size
    out := out.push (lo, hi, mk args lo hi (mkConst n))
  return out

elab "#asmV " ns:ident k:num : command => do
  let ns := ns.getId
  let k := k.getNat
  let orb := mkConst (ns ++ `orb)
  let names ← findBatches ns "b"
  let P ← liftTermElabM <| do
    let e ← if k == 2 then Term.elabTerm (← `(fun i : Nat => ∃ c : G.V2.VCert2, G.V2.allV2 $(mkIdent (ns ++ `orb)) 17 i [c] = true)) none
      else Term.elabTerm (← `(fun i : Nat => ∃ c : G.V2.VCert1, G.V2.allV1 $(mkIdent (ns ++ `orb)) 18 i [c] = true)) none
    instantiateMVars e
  -- allV2 o n1 lo cs: args #[o, n1, lo, cs]
  let ints ← intervals names 2 3 fun args lo hi thm =>
    mkAppN (mkConst (if k == 2 then ``G.Cov.allV2_int else ``G.Cov.allV1_int)) #[args[0]!, args[1]!, args[3]!, mkRawNatLit lo, mkRawNatLit hi, thm,
      mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Nat) (mkRawNatLit hi)]
  let pf ← chain P ints
  let ty := mkApp2 (mkConst (if k == 2 then ``G.Acc.VOK2 else ``G.Acc.VOK1)) orb (mkConst (ns ++ `nV3))
  addThm (ns ++ `VOK) ty pf
  logInfo m!"asmV {ns}: {names.size} batches, v < {(ints.back?.map (·.2.1)).getD 0}"

elab "#asmA " ns:ident d:num v3:num : command => do
  let ns := ns.getId
  let k (s : String) : Name := ns ++ Name.mkSimple s
  let d := d.getNat
  let v3 := v3.getNat == 1
  let t0 := mkConst (k "t0")
  let orb := mkConst (k "orb")
  let a2names ← findBatches ns "A2_"
  let P2 ← liftTermElabM <| do
    let e ← Term.elabTerm (← `(fun i : Nat => ∃ c, G.A2.allA2 $(mkIdent (k "t0")) $(Syntax.mkNumLit (toString d)) $(mkIdent (k "orb"))
      $(mkIdent (k "PC2Y0")) $(mkIdent (k "PC2Y1")) $(mkIdent (k "rB")) $(mkIdent (k "rC")) i [c] = true)) none
    instantiateMVars e
  -- allA2 t0 d o PY0 PY1 rB rC lo cs
  let ints2 ← intervals a2names 7 8 fun args lo hi thm =>
    mkAppN (mkConst ``G.Cov.allA2_int) #[args[0]!, args[1]!, args[2]!, args[3]!, args[4]!, args[5]!, args[6]!, args[8]!, mkRawNatLit lo,
      mkRawNatLit hi, thm, mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Nat) (mkRawNatLit hi)]
  let a2pf ← chain P2 ints2
  let a3pf ← if v3 then do
      let a3names ← findBatches ns "A3_"
      let P3 ← liftTermElabM <| do
        let e ← Term.elabTerm (← `(fun i : Nat => ∃ c, G.A2.allA3 $(mkIdent (k "t0")) $(Syntax.mkNumLit (toString d)) $(mkIdent (k "orb"))
          $(mkIdent (k "rV")) i [c] = true)) none
        instantiateMVars e
      let ints3 ← intervals a3names 4 5 fun args lo hi thm =>
        mkAppN (mkConst ``G.Cov.allA3_int) #[args[0]!, args[1]!, args[2]!, args[3]!, args[5]!, mkRawNatLit lo, mkRawNatLit hi, thm,
          mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Nat) (mkRawNatLit hi)]
      let c3 ← chain P3 ints3
      pure (mkLambda `h .default (mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true) (mkConst ``Bool.true)) c3)
    else liftTermElabM <| do
      let e ← Term.elabTerm (← `((fun h => absurd h Bool.false_ne_true : false = true → ∀ i, i < List.length $(mkIdent (k "rV")) →
        ∃ c, G.A2.allA3 $(mkIdent (k "t0")) $(Syntax.mkNumLit (toString d)) $(mkIdent (k "orb")) $(mkIdent (k "rV")) i [c] = true))) none
      Term.synthesizeSyntheticMVarsNoPostponing
      instantiateMVars e
  let v3E := mkConst (if v3 then ``Bool.true else ``Bool.false)
  let ty := mkAppN (mkConst ``G.Acc.PhaseA) #[mkRawNatLit d, t0, v3E]
  let val := mkAppN (mkConst ``G.Acc.PhaseA.mk) #[mkRawNatLit d, t0, v3E, orb, mkConst (k "PB1"), mkConst (k "PC1"), mkConst (k "PC2Y0"),
    mkConst (k "PC2Y1"), mkConst (k "B1"), mkConst (k "C1"), mkConst (k "nB2"), mkConst (k "nRec"), mkConst (k "nV3"),
    mkConst (k "rB"), mkConst (k "rC"), mkConst (k "rV"), mkConst (k "R1"), mkConst (k "SL_S1B"), mkConst (k "SL_S1C"),
    mkConst (k "SL_SX0"), mkConst (k "SL_SX1"), mkConst (k "SL_SY0"), mkConst (k "SL_SY1"), mkConst (k "G"), a2pf, a3pf]
  let dv : DefinitionVal := { name := k "PA", levelParams := [], type := ty, value := val, hints := .abbrev, safety := .safe }
  let (w, c) ← R3RTAdd.addTimed (Declaration.defnDecl dv) s!"{k "PA"}"
  logInfo m!"asmA {ns}: A2 batches {a2names.size}, kernel {w} ms wall, {c} ms cpu"


elab "#asmS " ns:ident : command => do
  let ns := ns.getId
  let k (s : String) : Name := ns ++ Name.mkSimple s
  let env ← getEnv
  let orb := mkConst (k "orb")
  let nRec := natLit! ((env.find? (k "nRec")).get!.value!)
  let nch := (nRec + 255) / 256
  let QE ← liftTermElabM <| do
    let e ← Term.elabTerm (← `(fun ci : Nat => G.Cov.Qch $(mkIdent (k "orb")) $(mkIdent (k "nRec")) ci)) none
    instantiateMVars e
  let mut ints : Array (Nat × Nat × Expr) := #[]
  for ci in [0:nch] do
    let names ← findBatches ns s!"s{ci}_"
    if names.isEmpty then throwError m!"asmS: no batch for chunk {ci}"
    let ch := mkConst (k s!"ch{ci}")
    -- per batch: (winsOf es, allS_sem proof); combine right-nested with allL_append
    let mut parts : Array (Expr × Expr) := #[]
    for n in names do
      let some cinfo := env.find? n | throwError m!"asmS: {n}"
      let args := cinfo.type.appFn!.appArg!.getAppArgs   -- allS o n1 ci ch es
      let es := args[4]!
      let w := mkApp (mkConst ``G.Cov.winsOf) es
      let pf := mkAppN (mkConst ``G.Cov.allS_sem) #[orb, mkRawNatLit ci, ch, es, mkConst n]
      parts := parts.push (w, pf)
    let tripTy := mkApp2 (mkConst ``Prod [Level.zero, Level.zero]) (mkConst ``Nat) (mkApp2 (mkConst ``Prod [Level.zero, Level.zero]) (mkConst ``Nat) (mkConst ``Nat))
    let p := mkAppN (mkConst ``G.Cov.WinOK) #[orb, mkRawNatLit ci, ch]
    let (W, hW) := parts.pop.foldr (fun (w, pf) (W, hW) =>
      (mkAppN (mkConst ``HAppend.hAppend [Level.zero, Level.zero, Level.zero]) #[mkApp (mkConst ``List [Level.zero]) tripTy,
        mkApp (mkConst ``List [Level.zero]) tripTy, mkApp (mkConst ``List [Level.zero]) tripTy,
        mkApp2 (mkConst ``instHAppendOfAppend [Level.zero]) (mkApp (mkConst ``List [Level.zero]) tripTy) (mkApp (mkConst ``List.instAppend [Level.zero]) tripTy), w, W],
       mkAppN (mkConst ``G.Cov.allL_append) #[tripTy, p, w, W, pf, hW])) parts.back!
    let nOff := min 256 (nRec - 256 * ci)
    let ht := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true)
    let hch := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Nat) ch
    let leT (a b : Nat) : Expr := mkApp3 (mkConst ``Nat.le_of_ble_eq_true) (mkRawNatLit a) (mkRawNatLit b)
      (mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true))
    let leP (a b : Nat) : Expr := mkApp2 (mkConst ``LE.le [Level.zero]) (mkConst ``Nat) (mkConst ``instLENat) |>.app (mkRawNatLit a) |>.app (mkRawNatLit b)
    let hn := if nOff == 256 then mkApp3 (mkConst ``Or.inl) (leP 256 nOff) (leP nRec (256 * ci + nOff)) (leT 256 nOff)
      else mkApp3 (mkConst ``Or.inr) (leP 256 nOff) (leP nRec (256 * ci + nOff)) (leT nRec (256 * ci + nOff))
    let q := mkAppN (mkConst ``G.Cov.chunk_Q) #[orb, mkConst (k "nRec"), mkRawNatLit ci, ch, mkRawNatLit nOff, W, hW, ht, hch, hn]
    ints := ints.push (ci, ci + 1, mkAppN (mkConst ``G.Cov.one_int) #[QE, mkRawNatLit ci, q])
  let all ← chain QE ints
  let hn := mkApp (mkApp2 (mkConst ``Nat.le_of_ble_eq_true) (mkConst (k "nRec")) (mkRawNatLit (256 * nch)))
    (mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true))
  let pf := mkAppN (mkConst ``G.Cov.sok_of) #[orb, mkConst (k "nRec"), mkRawNatLit nch, hn, all]
  addThm (k "SOK") (mkApp2 (mkConst ``G.Acc.SOK) orb (mkConst (k "nRec"))) pf
  logInfo m!"asmS {ns}: {nch} chunks"


/-- `#accType name Accept_x a₀ a₁ …`: `name : Accept_x` (a statement `∀ t0 ∈ L, P t0`) from the per-anchor theorems `aₖ : P Lₖ`,
in the order of the list `L` -/
elab "#accType " nm:ident typ:ident accs:ident* : command => do
  let env ← getEnv
  let some tci := env.find? typ.getId | throwError "accType: unknown {typ.getId}"
  let body := tci.value!   -- ∀ t0, t0 ∈ L → P t0
  let (pf, lst, P) ← liftTermElabM do
    let lst := body.bindingBody!.bindingDomain!.appArg!   -- Membership.mem L t0 (args: …, L, t0)? normalize below
    let _ := lst
    let mut pf := mkConst ``True.intro
    for a in accs.reverse do pf ← mkAppM ``And.intro #[mkConst a.getId, pf]
    -- extract L and P: body = fun-free `∀ t0, Membership.mem L t0 → P t0`
    let memE := body.bindingBody!.bindingDomain!
    let L := memE.getAppArgs[3]!
    let Pt := body.bindingBody!.bindingBody!     -- P t0 with t0 = bvar 1
    let P := mkLambda `t0 .default (mkConst ``G.State) (Pt.lowerLooseBVars 1 1)
    return (pf, L, P)
  let val := mkLambda `t0 .default (mkConst ``G.State) (mkLambda `ht0 .default (mkApp5 (mkConst ``Membership.mem [Level.zero, Level.zero])
    (mkConst ``G.State) (mkApp (mkConst ``List [Level.zero]) (mkConst ``G.State)) (mkApp (mkConst ``List.instMembership [Level.zero]) (mkConst ``G.State)) lst (mkBVar 0))
    (mkAppN (mkConst ``G.Cov.allL_mem) #[mkConst ``G.State, P, lst, pf, mkBVar 1, mkBVar 0]))
  addThm nm.getId (mkConst typ.getId) val

end G.Asm
