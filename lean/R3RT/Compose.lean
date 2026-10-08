module
public import R22Port.U_d41d8cd98f00
public import R3RT.L1v5
public import K2.XNode
/-! # The composed main-search node checker (R3, measurement version)

One declaration per batch of nodes. Per node:
1. **Shared dictionary.** One list of table rows per residual class (V = 0, R1 = 1, R2 = 2), fetched once from the per-job table
   with the counts derived, as in `batch5TD`. Every certificate of the node cites rows by their position in this dictionary.
2. **L1 v5** (`node5`) on the record built from the dictionary: T/C kills, dead set, child frame.
3. **Bulk-peel children** (kill2's `K2.childL`):
   - the node matrix `clrD (addCl N' rows) DIAG` is computed from the child frame's `N'` and the node rows (dictionary positions);
   - each child's rows and tree rows are dictionary masks (`mk p` = slot `p` of the mask block), so every row is bound once per node;
   - per window size `n`, the layout constants are the loader's constants.
Not checked here, and listed in R3.md 5.10: the children's `F_u` (taken from the certificate), L3 witnesses (separate batches), and
the record kinds without a checker. -/
@[expose] public section
noncomputable section
namespace R3RT

/-- a bulk-peel tree whose rows are dictionary positions -/
inductive XTi where
  | leaf : List (ℕ × ℕ) → ℕ × ℕ → XTi
  | node : List (ℕ × ℕ) → ℕ → ℕ → List ℕ → XTi → XTi → XTi

def mapL (mk : ℕ → ℕ) : List ℕ → List ℕ :=
  List.rec (motive := fun _ => List ℕ) [] (fun p _ ih => mk p :: ih)

def toXT (mk : ℕ → ℕ) (t : XTi) : K2.XT :=
  XTi.rec (motive := fun _ => K2.XT) (fun s f => K2.XT.leaf s f)
    (fun s v c2 rows _ _ l r => K2.XT.node s v c2 (mapL mk rows) l r) t

/-- a child: `(REPm, REP, GRD, LOWS, DIAG, TOP, o, C2u, Fu, child-row positions, tree)` -/
abbrev Kid := ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × List ℕ × XTi

def MODM : ℕ := Nat.sub (Nat.shiftLeft 1 511) 1

def kidsOK (mk : ℕ → ℕ) (Anode : ℕ) : List Kid → Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun kd _ ih =>
      K2.childL kd.1 kd.2.1 kd.2.2.1 kd.2.2.2.1 MODM kd.2.2.2.2.1 512 kd.2.2.2.2.2.1 kd.2.2.2.2.2.2.1 Anode
        kd.2.2.2.2.2.2.2.1 kd.2.2.2.2.2.2.2.2.1 (mapL mk kd.2.2.2.2.2.2.2.2.2.1) (toXT mk kd.2.2.2.2.2.2.2.2.2.2) && ih)

/-- a node: `(c2, h, suf, hdr, R2 ids, R1 ids, V ids, extra residual-2 ids, extra residual-1 ids, kills, node-row positions,
children)`; the extras are bulk-peel dictionary rows that L1 does not cite (positions `m + …`, X1 first) -/
abbrev NodeC := ℕ × ℕ × ℕ × ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List Kid

/-- dictionary position `p`: L1's rows (`p < m`, slots of `MB`), then the extras (slots of `MBx`) -/
def mkD (MB MBx m p : ℕ) : ℕ :=
  Bool.rec (Nat.land (Nat.shiftRight MBx (Nat.mul 512 (Nat.sub p m))) M511) (Nat.land (Nat.shiftRight MB (Nat.mul 512 p)) M511) (Nat.blt p m)

def batchC' (tab : ℕ → ℕ) (REPmA REPA DIAGA : ℕ) : List (ℕ × ℕ × ℕ × ℕ × ℕ) → List NodeC → Bool
  | _, [] => true
  | st, (c2, h, suf, hdr, r2, r1, r0, x2, x1, ks, nrows, kids) :: rest =>
    match List.drop (Nat.land hdr 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      let nV := Nat.land (Nat.shiftRight hdr 22) 1023
      let n1 := Nat.land (Nat.shiftRight hdr 32) 1023
      let n2 := Nat.land (Nat.shiftRight hdr 52) 1023
      let m := Nat.add nV (Nat.add n1 n2)
      foldR tab 2 r2 0 0 0 0 (fun MB2 E2 b2 c2' =>
        foldR tab 1 r1 MB2 E2 b2 0 (fun MB1 E1 b1 c1' =>
          foldR tab 0 r0 MB1 E1 b1 0 (fun MB E bad c0' =>
            foldR tab 2 x2 0 0 bad 0 (fun MBx2 Ex2 bx2 _ =>
              foldR tab 1 x1 MBx2 Ex2 bx2 0 (fun MBx Ex badx cx' =>
                Nat.beq badx 0 && Nat.beq c2' n2 && Nat.beq c1' n1 && Nat.beq c0' nV &&
                node5 S D N U dP c2 h suf
                  (Nat.lor (Nat.land hdr 18446744073709551615) (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 m))) 64)) ks
                  (fun S' D' N' U' =>
                    L1.blocks MBx Ex (Nat.mul S' L1.REP63) (Nat.div (Nat.add (Nat.add cx' (List.length x2)) 62) 63) &&
                    kidsOK (mkD MB MBx m)
                      (K2.clrD (K2.addCl N' REPmA REPA (mapL (mkD MB MBx m) nrows)) DIAGA) kids &&
                    batchC' tab REPmA REPA DIAGA ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest))))))

def batchC (tab : ℕ → ℕ) (REPmA REPA DIAGA : ℕ) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)) (nodes : List NodeC) : Bool :=
  batchC' tab REPmA REPA DIAGA st nodes

end R3RT
end
