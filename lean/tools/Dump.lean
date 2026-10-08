import Lean
/-!
`lean --run Dump.lean OUT MODS [LEVEL [ROOTS]]` (V2, PROOF_OBJECT.md §10.3): load the modules listed in the file MODS (one per
line) from a root at LEVEL (`private`, default: a non-module root, which loads every module's private part; or `exported`: what
a `module` root importing them sees) and write one line per constant of those modules. With ROOTS (comma-separated constant
names): one line per constant of the roots' chain instead (audit P-2: the statements' constants, the values of definitions, the
constructors of inductives, from any module; see `chainOf`):

  module <TAB> name <TAB> aux <TAB> kind <TAB> type <TAB> value <TAB> extra <TAB> type (p.i.) <TAB> value (p.i.)

* name: with any `_private.<M>.0.` prefix removed. aux = 1 if a component is auxiliary: it starts with `_` (`_proof_N`,
  `_simp_N`, `_abel_N`, `_unfold`, `_f`, `_hyg`, …), is `match_N`, `proof_N`, `eq_N`, `eq_def` or `splitter`, is numeric, or
  the name has macro scopes.
* type / value: 64-bit structural hashes, computed here (not `Expr.hash`, which keeps only the low 64 bits of a Nat literal).
  Binder names and `mdata` are ignored, binder infos are not. A constant is hashed by its normalized name, except an
  auxiliary constant, which is hashed by (kind, type, value if a definition) of its own declaration, recursively, so a
  renumbered or newly private `_proof_N`/`match_N` with the same statement gives the same hash.
* value: definitions only (theorem proofs are irrelevant); `-` otherwise.
* p.i. (proof-irrelevant) hashes: the same, except that every proof subterm (`fun xs => t …` whose head `t` is a theorem)
  hashes to one constant. Two declarations with equal p.i. hashes differ at most in proofs, i.e. they are definitionally
  equal by proof irrelevance. Module mode abstracts proofs inside definitions into `_proof_N` theorems at a different point
  than non-module mode (other binders, other statements), so values can differ in their proof arguments only.
* extra: inductives: params, indices, constructors; constructors: fields; recursors: rules count; definitions: safety.
-/
open Lean

def auxStr (s : String) : Bool :=
  s.startsWith "_" || s.startsWith "proof_" || s.startsWith "match_" || s.startsWith "eq_" || s == "eq_def" ||
  s == "splitter"

def isAux (n : Name) : Bool :=
  n.hasMacroScopes || n.components.any fun c => match c with
    | .str _ s => auxStr s
    | .num _ _ => true
    | .anonymous => false

def normName (n : Name) : Name := privateToUserName n

structure St where
  cache : Std.HashMap Expr UInt64 := {}
  aux : Std.HashMap (Name × Bool) UInt64 := {}
  busy : Std.HashSet (Name × Bool) := {}

structure Ctx where
  env : Environment
  pi : Bool

abbrev M := ReaderT Ctx (StateM St)

def mix (a b : UInt64) : UInt64 := mixHash a b

partial def hNat (n : Nat) : UInt64 :=
  if n < 2 ^ 64 then mix 11 n.toUInt64
  else
    let k := (n.log2 / 128 + 1) * 64
    mix 12 (mix (hNat (n >>> k)) (hNat (n &&& (2 ^ k - 1))))

def kindStr : ConstantInfo → String
  | .defnInfo _ => "def" | .thmInfo _ => "thm" | .axiomInfo _ => "ax" | .opaqueInfo _ => "opq"
  | .inductInfo _ => "ind" | .ctorInfo _ => "ctor" | .recInfo _ => "rec" | .quotInfo _ => "quot"

def lamBody : Expr → Expr
  | .lam _ _ b _ => lamBody b
  | .mdata _ b => lamBody b
  | e => e

/-- `fun xs => t args` with `t` a theorem: a proof -/
def isProofTerm (env : Environment) (e : Expr) : Bool :=
  match (lamBody e).getAppFn with
  | .const n _ => (env.find? n).any (· matches .thmInfo _)
  | _ => false

/-- the children whose hashes a node's hash combines (none for a proof term in proof-irrelevant mode) -/
def children (pi : Bool) (env : Environment) (e : Expr) : Array Expr :=
  if pi && (e.isApp || e.isLambda || e.isConst) && isProofTerm env e then #[] else
  match e with
  | .app f a => #[f, a]
  | .lam _ d b _ | .forallE _ d b _ => #[d, b]
  | .letE _ t v b _ => #[t, v, b]
  | .mdata _ b | .proj _ _ b => #[b]
  | _ => #[]

mutual
partial def hConst (n : Name) : M UInt64 := do
  let nn := normName n
  unless isAux nn do return hash nn
  let pi := (← read).pi
  if let some h := (← get).aux[(n, pi)]? then return h
  if (← get).busy.contains (n, pi) then return mix 99 (hash nn)
  let some ci := (← read).env.find? n | return mix 98 (hash nn)
  modify fun s => { s with busy := s.busy.insert (n, pi) }
  -- hash the auxiliary declaration with a fresh expression cache (the outer one is saved and restored)
  let saved := (← get).cache
  modify fun s => { s with cache := {} }
  let ht ← hExpr ci.type
  let hv ← match ci with
    | .defnInfo d => hExpr d.value
    | _ => pure 0
  modify fun s => { s with cache := saved }
  -- a theorem is exported as an axiom (R-f): at the exported level an auxiliary `_proof_N` has kind `ax`; hash it as a theorem
  -- so that both levels agree (an auxiliary constant is never a real axiom)
  let k := match ci with | .axiomInfo _ => "thm" | _ => kindStr ci
  let h := mix (hash k) (mix ht hv)
  modify fun s => { s with aux := s.aux.insert (n, pi) h, busy := s.busy.erase (n, pi) }
  return h

/-- iterative post-order hashing with an explicit stack (literal lists nest tens of thousands deep: no recursion over terms) -/
partial def hExpr (e : Expr) : M UInt64 := do
  if let some h := (← get).cache[e]? then return h
  let ctx ← read
  let mut stack : Array (Expr × Bool) := #[(e, false)]
  while h : 0 < stack.size do
    let (x, ready) := stack[stack.size - 1]
    stack := stack.pop
    if (← get).cache.contains x then continue
    let cs := children ctx.pi ctx.env x
    if !ready && !cs.isEmpty then
      stack := stack.push (x, true)
      for c in cs do
        unless (← get).cache.contains c do stack := stack.push (c, false)
      continue
    let get' (c : Expr) : M UInt64 := do return (← get).cache[c]!
    let hx ← if ctx.pi && (x.isApp || x.isLambda || x.isConst) && isProofTerm ctx.env x then pure (mix 15 0) else
      match x with
      | .bvar i => pure (mix 1 i.toUInt64)
      | .fvar f => pure (mix 2 (hash f.name))
      | .mvar m => pure (mix 3 (hash m.name))
      | .sort l => pure (mix 4 (hash l))
      | .const n ls => do pure (mix 5 (mix (← hConst n) (hash ls)))
      | .app f a => do pure (mix 6 (mix (← get' f) (← get' a)))
      | .lam _ d b bi => do pure (mix 7 (mix (mix (← get' d) (← get' b)) (hash bi.toUInt64)))
      | .forallE _ d b bi => do pure (mix 8 (mix (mix (← get' d) (← get' b)) (hash bi.toUInt64)))
      | .letE _ t v b nd => do pure (mix 9 (mix (mix (← get' t) (← get' v)) (mix (← get' b) (hash nd))))
      | .lit (.natVal n) => pure (mix 10 (hNat n))
      | .lit (.strVal s) => pure (mix 13 (hash s))
      | .mdata _ b => get' b
      | .proj s i b => do pure (mix 14 (mix (hash (normName s)) (mix i.toUInt64 (← get' b))))
    modify fun st => { st with cache := st.cache.insert x hx }
  return (← get).cache[e]!
end

def hexStr (h : UInt64) : String :=
  let s := String.ofList (Nat.toDigits 16 h.toNat)
  "".pushn '0' (16 - s.length) ++ s

def extraStr : ConstantInfo → String
  | .inductInfo v => s!"p{v.numParams} i{v.numIndices} r{v.isRec} c:{",".intercalate (v.ctors.map (toString ∘ normName))}"
  | .ctorInfo v => s!"p{v.numParams} f{v.numFields} i{v.cidx}"
  | .recInfo v => s!"p{v.numParams} i{v.numIndices} m{v.numMotives} n{v.numMinors} r{v.rules.length} k{v.k}"
  | .defnInfo v => s!"{repr v.safety}"
  | _ => "-"

/-- (type hash, value hash) of a declaration in one mode -/
def hDecl (ci : ConstantInfo) : M (UInt64 × Option UInt64) := do
  modify fun s => { s with cache := {} }
  let ht ← hExpr ci.type
  let hv ← match ci with
    | .defnInfo d => do pure (some (← hExpr d.value))
    | _ => pure none
  return (ht, hv)

/-- the constants that the statements of `roots` depend on (audit P-2, "the chain" of the final statement): everything a
reached constant's type mentions, a definition's value (its unfolding is part of what a statement means), an inductive's
constructors and a constructor's inductive; not the proofs of theorems -/
def chainOf (env : Environment) (roots : Array Name) : Std.HashSet Name := Id.run do
  let mut seen : Std.HashSet Name := {}
  let mut todo : Array Name := roots
  while h : 0 < todo.size do
    let n := todo[todo.size - 1]
    todo := todo.pop
    if seen.contains n then continue
    seen := seen.insert n
    let some ci := env.find? n | continue
    let mut refs := ci.type.getUsedConstants
    match ci with
    | .defnInfo d => refs := refs ++ d.value.getUsedConstants
    | .inductInfo v => refs := refs ++ v.ctors.toArray
    | .ctorInfo v => refs := refs.push v.induct
    | _ => pure ()
    for r in refs do
      unless seen.contains r do todo := todo.push r
  return seen

def main (args : List String) : IO Unit := do
  initSearchPath (← getBuildDir)
  let (out, modsFile, level, chain) ← match args with
    | [o, m] => pure (o, m, OLeanLevel.private, none)
    | [o, m, "exported"] => pure (o, m, OLeanLevel.exported, none)
    | [o, m, "private"] => pure (o, m, OLeanLevel.private, none)
    | [o, m, "exported", r] => pure (o, m, OLeanLevel.exported, some r)
    | [o, m, "private", r] => pure (o, m, OLeanLevel.private, some r)
    | _ => throw <| IO.userError "usage: Dump OUT MODS [private|exported [ROOT,ROOT,...]]"
  let mods := (← IO.FS.lines modsFile).filter (· ≠ "") |>.map String.toName
  let t0 ← IO.monoMsNow
  let env ← importModules (mods.map fun m => { module := m }) {} (trustLevel := 1024) (level := level) (loadExts := false)
  let t1 ← IO.monoMsNow
  IO.eprintln s!"imported {mods.size} modules ({env.header.moduleNames.size} in total) in {t1 - t0} ms"
  let want : Std.HashSet Name := mods.foldl (·.insert ·) {}
  let modNames := env.header.moduleNames
  -- chain mode (4th argument: ROOT,ROOT,... or @FILE with one root per line): dump the chain of the given root constants, from
  -- every module, instead of the listed modules
  let roots : Array Name ← match chain with
    | none => pure #[]
    | some r =>
      if r.startsWith "@" then
        pure ((← IO.FS.lines ((r.drop 1).toString)).filter (· ≠ "") |>.map String.toName)
      else pure ((r.splitOn ",").filter (· ≠ "") |>.map String.toName |>.toArray)
  for x in roots do
    unless env.contains x do IO.eprintln s!"chain root not found: {x}"
  let chainSet : Option (Std.HashSet Name) := chain.map fun _ => chainOf env roots
  let mut byMod : Std.HashMap Nat (Array (Name × ConstantInfo)) := {}
  for (n, ci) in env.constants.map₁.toList do
    let some i := env.getModuleIdxFor? n | continue
    let keep := match chainSet with
      | some cs => cs.contains n
      | none => want.contains modNames[i.toNat]!
    if keep then
      byMod := byMod.insert i.toNat ((byMod.getD i.toNat #[]).push (n, ci))
  let h ← IO.FS.Handle.mk out .write
  let mut st : St := {}
  let mut cnt := 0
  for i in [0:modNames.size] do
    let some cs := byMod[i]? | continue
    let m := modNames[i]!
    let mut lines : Array String := #[]
    for (n, ci) in cs do
      let ((ht, hv), st1) := (hDecl ci).run { env, pi := false } |>.run st
      let ((pt, pv), st2) := (hDecl ci).run { env, pi := true } |>.run st1
      st := st2
      let nn := normName n
      let o (x : Option UInt64) := (x.map hexStr).getD "-"
      lines := lines.push s!"{m}\t{nn}\t{if isAux nn then 1 else 0}\t{kindStr ci}\t{hexStr ht}\t{o hv}\t{extraStr ci}\t{hexStr pt}\t{o pv}"
    for l in lines.qsort (· < ·) do h.putStrLn l
    cnt := cnt + cs.size
  h.flush
  IO.eprintln s!"dumped {cnt} constants of {byMod.size} modules in {(← IO.monoMsNow) - t1} ms"
