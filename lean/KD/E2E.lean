module
public import R22Port.U_d41d8cd98f00
public import KD.Leaf
public import KD.Flook
public import R3RT.L1v5
/-! # KD.E2E: an end-to-end prototype of the composed node check (measurement)

`batchE` runs R3's L1 v5 node checker `R3RT.node5` (inline records, as `R3RT.batch5`) and, in its continuation, on the child
frame `(S', D', N', U')` that `node5` itself computes:
* `KD.kindsNode` (PREFF / DOOM / TYPE, suffix break);
* `KD.canonBind` for a node with CANON children (the witnesses themselves are L3's batches);
* `KD.leafBind` for each leaf child (the v7 records' trees are the leaf tier's);
* `KD.flookRec` for each look-ahead cut child, on the cut node's frame computed here as `node5` would:
  `D_cut = D' ∪ N'[u] ∪ Vm` (`Vm`: its full rows; REQUESTS.md 5), `U_cut = U' + h_u`.
X kills and the row binding are not included. -/
@[expose] public section
noncomputable section
namespace KD

/-- a look-ahead cut child: `(u, h_u, Vm, t, nT, h2, TL, TY, SL, SY)` -/
abbrev FKid := ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × List ℕ × List ℕ × List ℕ × List ℕ
/-- extras of an OPEN node: `(b, items, CANON bindings (Sc, k), leaf children (u, R), look-ahead cut children)` -/
abbrev KNode := ℕ × List ℕ × List (ℕ × ℕ) × List (ℕ × ℕ) × List FKid

def canonAll (S : ℕ) (cs : List (ℕ × ℕ)) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun x _ acc => canonBind x.1 0 x.2 S && acc) cs

def leafAll (S last : ℕ) (ls : List (ℕ × ℕ)) : Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun x _ acc => Nat.blt last x.1 && leafBind x.2 (Nat.lor S (Nat.shiftLeft 1 x.1)) && acc) ls

def flookAll (S D N U d last : ℕ) (fs : List FKid) : Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun x _ acc =>
      Nat.blt last x.1 &&
      flookRec (Nat.lor S (Nat.shiftLeft 1 x.1))
        (Nat.lor (Nat.lor D (Nat.land (Nat.shiftRight N (Nat.shiftLeft x.1 9)) L1.M512)) x.2.2.1)
        (Nat.add U x.2.1) 0 (Nat.succ d) x.1 x.2.2.2.1 x.2.2.2.2.1 x.2.2.2.2.2.1
        x.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2.2.2 && acc) fs

def nodeExtras (S D N U d last : ℕ) (kn : KNode) : Bool :=
  kindsNode S D U 0 d last kn.1 kn.2.1 && canonAll S kn.2.2.1 && leafAll S last kn.2.2.2.1 &&
    flookAll S D N U d last kn.2.2.2.2

def batchE : List (ℕ × ℕ × ℕ × ℕ × ℕ) → List (ℕ × ℕ × ℕ × ℕ × List ℕ) → List KNode → Bool
  | _, [], _ => true
  | _, _ :: _, [] => false
  | st, (c2, h, suf, rec, ks) :: rest, kn :: krest =>
    match List.drop (Nat.land rec 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      R3RT.node5 S D N U dP c2 h suf rec ks
        (fun S' D' N' U' => nodeExtras S' D' N' U' (Nat.succ dP) (Nat.land (Nat.shiftRight rec 8) 511) kn &&
          batchE ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest krest)

end KD
