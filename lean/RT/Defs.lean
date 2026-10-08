module
public import R22Port.U_d41d8cd98f00
public import BC4Tables
public import BranchCheck5
public import C3.Act
public import RootSound.TransBits
/-! # The verified row table: entries and their kernel check

A **row** is a subspace `U` of `A = F2^9` with a cap; it is *valid* for a bound `k` when every decomposition of `<3,3,3>` has at
least `k` terms whose first factor lies outside `U` (`RT.Fact`, in `RT.Sound`).  Certificates that cite rows (the coset
enumeration EC, the main search) need `k = R - cap`.  An **entry** proves it from the class table: a class `c` whose
subspace `K_c` has the bound `lb c`, and a group element `h = (t, P, Q)` (prof7's group, `C3.actN`) with `h(U) ⊆ K_c`.
Entry layout (118 bits): `[4] d`, nine 9-bit vectors (the first `d` an RREF basis of `U`, the other `9 - d` a basis of `U^⊥`),
`[5] cap`, `[9] c`, `[1] t`, `[9] P`, `[9] Q`.  The check (`entryOK`): the span of the primal basis equals the common kernel of
the dual one (both as 512-bit point masks), `P, Q` invertible, `h(u_i) ∈ K_c` for the primal vectors, and `R ≤ cap + lb c`.
The class table `CL` has 96-bit slots: `[4] n`, `[5] lb`, `n` 9-bit vectors spanning `K_c^⊥` (`K_c` = their common kernel). -/
@[expose] public section
namespace RT
open BC4 BC5

/-! ## Entry fields -/
def eD (e : Nat) : Nat := e % 16
def eV (e i : Nat) : Nat := (e >>> (4 + 9 * i)) % 512
def eCap (e : Nat) : Nat := (e >>> 85) % 32
def eCls (e : Nat) : Nat := (e >>> 90) % 512
def eT (e : Nat) : Bool := (e >>> 99) % 2 == 1
def eP (e : Nat) : Nat := (e >>> 100) % 512
def eQ (e : Nat) : Nat := (e >>> 109) % 512

/-! ## Class table fields -/
def cN (CL c : Nat) : Nat := (CL >>> (96 * c)) % 16
def cLB (CL c : Nat) : Nat := (CL >>> (96 * c + 4)) % 32
def cV (CL c j : Nat) : Nat := (CL >>> (96 * c + 9 + 9 * j)) % 512

/-- the common kernel of `n` vectors `f j`, as a 512-bit point mask -/
def kerM (f : Nat → Nat) (n : Nat) : Nat := Nat.rec (motive := fun _ => Nat) M512 (fun j S => S &&& perp (f j)) n
/-- `w` lies in the class subspace `K_c` -/
def inK (CL c w : Nat) : Bool := Nat.rec (motive := fun _ => Bool) true (fun j b => b && !par (w &&& cV CL c j)) (cN CL c)
/-- the point mask of `K_c` -/
def kM (CL c : Nat) : Nat := kerM (cV CL c) (cN CL c)

/-- the span of the first `d` vectors by doubling (`S ∪ (S + u)`), cut to 512 bits -/
def spanM (e : Nat) : Nat :=
  M512 &&& Nat.rec (motive := fun _ => Nat) 1 (fun i S => S ||| RootSound.TransBits.trans S (eV e i)) (eD e)
/-- the common kernel of the dual vectors `d .. 8` -/
def dualM (e : Nat) : Nat := kerM (fun j => eV e (eD e + j)) (9 - eD e)

/-- all primal vectors map into `K_c` under `h` -/
def mapsIn (CL e : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true
    (fun i b => b && inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) (eV e i))) (eD e)

/-- **the entry check** -/
def entryOK (R CL e : Nat) : Bool :=
  Nat.ble (eD e) 9 && spanM e == dualM e && C3.isGL (eP e) && C3.isGL (eQ e) && mapsIn CL e &&
    Nat.ble R (eCap e + cLB CL (eCls e))

end RT
