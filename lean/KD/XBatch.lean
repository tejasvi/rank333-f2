module
public import R22Port.U_d41d8cd98f00
public import KD.XComp
public import L5.Batch5
public import L5.Batch5O
/-! # KD.XBatch: the composed main-search batch checker with bound bulk-peel children, and its soundness (G4; DESIGN 33)

`KD.batchX` is `K2C.batchC2` (kill2's hybrid composed checker, itself `R3RT.batchC`) with the bulk-peel part replaced by
`KD.xpartC` (frame-bound `F_u`, residual checks on node rows and child rows, the per-node deficit table, aggregate labels).  One
dictionary per node, shared with L1 v5's record: L1's V / R1 / R2 rows (fetched from the per-job table once, as `batch5TD`), then
the extra residual-1 and residual-2 rows; every certificate cites rows by position.

**`batchX_sound`**: given the table facts (`TabOK`), valid input frames, L1's static facts (`C2OK`, `HOK`) per node and, per node,
`C2OK` of its aggregates' and children's cap-2 tables and the window constants (`KidXOK`), an accepted batch satisfies `BatchOKX`:
every node's T/C kills (`KillsOK`), every bulk-peel child dead, and every child frame valid.  The dictionary's residual facts come
from L1's own `blocks` inside `node5` (`L5O.node5_eq`, `L5O.rows_ok`) and from the extras' `blocks` (the same lemma on a record
rebuilt from the extras, `L5O.rec_ok`). -/
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
noncomputable section
namespace KD
open R3RT.Spec RootSound BC4 BC5 Classical
open R3RT (M511 foldR node5 mapL mkD)

/-! ## The checker -/

/-- a composed node: `(c2, h, suf, hdr, R2 ids, R1 ids, V ids, extra residual-2 ids, extra residual-1 ids, kills, node-row
positions, aggregates, deficit-table functionals, table masks, table bounds, table size, children)` -/
abbrev NodeX := ℕ × ℕ × ℕ × ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List Agg × List ℕ × ℕ × ℕ × ℕ ×
  List KidX

def batchX' (tab : ℕ → ℕ) : List (ℕ × ℕ × ℕ × ℕ × ℕ) → List NodeX → Bool
  | _, [] => true
  | st, (c2, h, suf, hdr, r2, r1, r0, x2, x1, ks, nrows, aggs, XL, HP, DEFP, J, kids) :: rest =>
    match List.drop (Nat.land hdr 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      foldR tab 2 r2 0 0 0 0 (fun MB2 E2 b2 c2' =>
        foldR tab 1 r1 MB2 E2 b2 0 (fun MB1 E1 b1 c1' =>
          foldR tab 0 r0 MB1 E1 b1 0 (fun MB E bad c0' =>
            foldR tab 2 x2 0 0 bad 0 (fun MBx2 Ex2 bx2 _ =>
              foldR tab 1 x1 MBx2 Ex2 bx2 0 (fun MBx Ex badx cx' =>
                Nat.beq badx 0 && Nat.beq c2' (Nat.land (Nat.shiftRight hdr 52) 1023) &&
                Nat.beq c1' (Nat.land (Nat.shiftRight hdr 32) 1023) && Nat.beq c0' (Nat.land (Nat.shiftRight hdr 22) 1023) &&
                node5 S D N U dP c2 h suf
                  (Nat.lor (Nat.land hdr 18446744073709551615)
                    (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 (Nat.add c0' (Nat.add c1' c2'))))) 64)) ks
                  (fun S' D' N' U' =>
                    L1.blocks MBx Ex (Nat.mul S' L1.REP63) (Nat.div (Nat.add (Nat.add cx' (List.length x2)) 62) 63) &&
                    xpartC R3RT.nperpL S' D' N' U' (Nat.succ dP) (Nat.land (Nat.shiftRight hdr 8) 511) (Nat.add c0' c1')
                      (Nat.add c0' (Nat.add c1' c2')) (Nat.add (Nat.add c0' (Nat.add c1' c2')) cx')
                      (mkD MB MBx (Nat.add c0' (Nat.add c1' c2'))) nrows aggs XL HP DEFP J kids &&
                    batchX' tab ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest))))))

def batchX (tab : ℕ → ℕ) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)) (nodes : List NodeX) : Bool := batchX' tab st nodes

/-- the node's aggregates and children -/
def nodeAggs (x : NodeX) : List Agg := x.2.2.2.2.2.2.2.2.2.2.2.1
def nodeKids (x : NodeX) : List KidX := x.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2

/-- what an accepted batch establishes over the universe `Ω`: per node, the T/C kills, every bulk-peel child dead, and a valid
child frame -/
def BatchOKX (Ω : Dec22 → Prop) : List (ℕ × ℕ × ℕ × ℕ × ℕ) → List NodeX → Prop
  | _, [] => True
  | st, (c2, h, _suf, hdr, _r2, _r1, _r0, _x2, _x1, ks, _nr, _ag, _XL, _HP, _DEFP, _J, kids) :: rest =>
    match st.drop (hdr % 256) with
    | [] => False
    | (S, _D, N, U, dP) :: _st' =>
      KillsOKU Ω (S ||| 2 ^ ((hdr >>> 8) % 512)) ((hdr >>> 8) % 512) ks ∧
      (∀ c ∈ kids, ∀ A : Dec22, Ω A → ¬ Continues A (S ||| 2 ^ ((hdr >>> 8) % 512)) ((hdr >>> 8) % 512) c.1) ∧
      ∃ D', FrameOKU Ω (S ||| 2 ^ ((hdr >>> 8) % 512)) D' (N ||| c2) (U + h) (dP + 1) ∧
        BatchOKX Ω ((S ||| 2 ^ ((hdr >>> 8) % 512), D', N ||| c2, U + h, dP + 1) :: st.drop (hdr % 256)) rest

/-! ## Records rebuilt from class folds -/

theorem pack3_lt (B a b c x y z : ℕ) (ha : a < 2 ^ (B * x)) (hb : b < 2 ^ (B * y)) (hc : c < 2 ^ (B * z)) :
    ((0 * 2 ^ (B * z) + c) * 2 ^ (B * y) + b) * 2 ^ (B * x) + a < 2 ^ (B * (x + y + z)) := by
  calc ((0 * 2 ^ (B * z) + c) * 2 ^ (B * y) + b) * 2 ^ (B * x) + a
      = a + 2 ^ (B * x) * (b + 2 ^ (B * y) * c) := by ring
    _ < 2 ^ (B * x) + 2 ^ (B * x) * (b + 2 ^ (B * y) * c) := by omega
    _ = 2 ^ (B * x) * (b + 2 ^ (B * y) * c + 1) := by ring
    _ ≤ 2 ^ (B * x) * (2 ^ (B * y) * 2 ^ (B * z)) := by
        apply Nat.mul_le_mul_left
        calc b + 2 ^ (B * y) * c + 1 ≤ 2 ^ (B * y) + 2 ^ (B * y) * c := by omega
          _ = 2 ^ (B * y) * (c + 1) := by ring
          _ ≤ 2 ^ (B * y) * 2 ^ (B * z) := Nat.mul_le_mul_left _ (by omega)
    _ = 2 ^ (B * (x + y + z)) := by rw [← pow_add, ← pow_add]; ring_nf

theorem PK_lt (tab : ℕ → ℕ) (L : List ℕ) : L5O.PK tab L < 2 ^ (512 * L.length) :=
  E1S.pk_lt 512 _ _ (fun s _ => lt_trans (Nat.mod_lt _ (by positivity)) (by norm_num))

theorem QK_lt {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} (tab : ℕ → ℕ) (hT : TabOKO O Ω tab) (r : ℕ) (L : List ℕ) : L5O.QK tab r L < 2 ^ (8 * L.length) :=
  E1S.pk_lt 8 _ _ (fun s _ => by
    have h : L5O.capT tab (L.reverse.getD s 0) < 256 := (hT (L.reverse.getD s 0)).1
    show L5O.capT tab (L.reverse.getD s 0) - r < 2 ^ 8
    exact lt_of_le_of_lt (Nat.sub_le _ _) (lt_of_lt_of_le h (by norm_num)))

/-- the fields of a record rebuilt from three class folds -/
theorem rec_fields {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} (tab : ℕ → ℕ) (hT : TabOKO O Ω tab) (hdr : ℕ) (L2 L1 L0 : List ℕ)
    (hn2 : L2.length = (hdr >>> 52) % 1024) (hn1 : L1.length = (hdr >>> 32) % 1024) (hnV : L0.length = (hdr >>> 22) % 1024)
    (MB E : ℕ)
    (hMB : MB = ((0 * 2 ^ (512 * L2.length) + L5O.PK tab L2) * 2 ^ (512 * L1.length) + L5O.PK tab L1) * 2 ^ (512 * L0.length) +
      L5O.PK tab L0)
    (hE : E = ((0 * 2 ^ (8 * L2.length) + L5O.QK tab 2 L2) * 2 ^ (8 * L1.length) + L5O.QK tab 1 L1) * 2 ^ (8 * L0.length) +
      L5O.QK tab 0 L0) :
    L5O.n5MB (Nat.lor (Nat.land hdr 18446744073709551615)
      (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 (L0.length + L1.length + L2.length)))) 64)) = MB ∧
    L5O.n5E (Nat.lor (Nat.land hdr 18446744073709551615)
      (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 (L0.length + L1.length + L2.length)))) 64)) = E ∧
    L5O.n5m (Nat.lor (Nat.land hdr 18446744073709551615)
      (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 (L0.length + L1.length + L2.length)))) 64)) =
      L0.length + L1.length + L2.length ∧
    L5O.n5nV (Nat.lor (Nat.land hdr 18446744073709551615)
      (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 (L0.length + L1.length + L2.length)))) 64)) = L0.length ∧
    L5O.n5n1 (Nat.lor (Nat.land hdr 18446744073709551615)
      (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 (L0.length + L1.length + L2.length)))) 64)) = L1.length := by
  set m := L0.length + L1.length + L2.length with hm
  have hMBlt : MB < 2 ^ (512 * m) := by
    rw [hMB, hm]; exact pack3_lt 512 _ _ _ _ _ _ (PK_lt tab L0) (PK_lt tab L1) (PK_lt tab L2)
  have hElt : E < 2 ^ (8 * m) := by
    rw [hE, hm]; exact pack3_lt 8 _ _ _ _ _ _ (QK_lt tab hT 0 L0) (QK_lt tab hT 1 L1) (QK_lt tab hT 2 L2)
  have hbody : Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 m)) = MB + E * 2 ^ (512 * m) := by
    rw [L5.lor_eq, L5.shl_eq, L5.nmul_eq, Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hMBlt, Nat.shiftLeft_eq]; ring
  have hrec : Nat.lor (Nat.land hdr 18446744073709551615) (Nat.shiftLeft (MB + E * 2 ^ (512 * m)) 64) =
      hdr % 2 ^ 64 + (MB + E * 2 ^ (512 * m)) * 2 ^ 64 := by
    rw [L5.lor_eq, L5.land_eq, L5.shl_eq, show (18446744073709551615 : ℕ) = 2 ^ 64 - 1 by norm_num,
      Nat.and_two_pow_sub_one_eq_mod, Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt (Nat.mod_lt _ (by positivity)),
      Nat.shiftLeft_eq]; ring
  rw [hbody, hrec]
  set rec := hdr % 2 ^ 64 + (MB + E * 2 ^ (512 * m)) * 2 ^ 64 with hrecdef
  have hlo : rec % 2 ^ 64 = hdr % 2 ^ 64 := by rw [hrecdef, Nat.add_mul_mod_self_right, Nat.mod_mod]
  have hhi : rec >>> 64 = MB + E * 2 ^ (512 * m) := by
    rw [hrecdef, Nat.shiftRight_eq_div_pow, Nat.add_mul_div_right _ _ (by positivity),
      Nat.div_eq_of_lt (Nat.mod_lt _ (by positivity)), Nat.zero_add]
  have hfV : L5O.n5nV rec = L0.length := by
    rw [L5O.n5nV_eq, ← L5O.hdr_field rec 22 (by norm_num), hlo, L5O.hdr_field hdr 22 (by norm_num)]; exact hnV.symm
  have hf1 : L5O.n5n1 rec = L1.length := by
    rw [L5O.n5n1_eq, ← L5O.hdr_field rec 32 (by norm_num), hlo, L5O.hdr_field hdr 32 (by norm_num)]; exact hn1.symm
  have hf2 : L5O.n5n2 rec = L2.length := by
    rw [L5O.n5n2_eq, ← L5O.hdr_field rec 52 (by norm_num), hlo, L5O.hdr_field hdr 52 (by norm_num)]; exact hn2.symm
  have hfm : L5O.n5m rec = m := by
    unfold L5O.n5m; rw [L5.nadd_eq, L5.nadd_eq, hfV, hf1, hf2, hm]; ring
  refine ⟨?_, ?_, hfm, hfV, hf1⟩
  · rw [L5O.n5MB_eq, hfm, hhi, Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt hMBlt]
  · rw [L5O.n5E_eq, hfm, hhi, Nat.shiftRight_eq_div_pow, Nat.add_mul_div_right _ _ (by positivity), Nat.div_eq_of_lt hMBlt,
      Nat.zero_add, Nat.mod_eq_of_lt hElt]

/-! ## The dictionary's residual facts -/

theorem testBit_mkD_lo (MB MBx m p l : ℕ) (hp : p < m) (hl : l < 511) :
    (mkD MB MBx m p).testBit l = (E1S.dig 512 MB p).testBit l := by
  have hb : Nat.blt p m = true := Nat.blt_eq.mpr hp
  show (Bool.rec (Nat.land (Nat.shiftRight MBx (Nat.mul 512 (Nat.sub p m))) M511)
    (Nat.land (Nat.shiftRight MB (Nat.mul 512 p)) M511) (Nat.blt p m) : ℕ).testBit l = _
  rw [hb]
  show (Nat.land (Nat.shiftRight MB (Nat.mul 512 p)) M511).testBit l = _
  rw [E1S.testBit_dig 512 MB p l (by omega), show Nat.land (Nat.shiftRight MB (Nat.mul 512 p)) M511 = (MB >>> (512 * p)) &&& M511
    from rfl, Nat.testBit_and, Nat.testBit_shiftRight, R3RT.m511_bit]
  simp [hl]

theorem testBit_mkD_hi (MB MBx m p l : ℕ) (hp : m ≤ p) (hl : l < 511) :
    (mkD MB MBx m p).testBit l = (E1S.dig 512 MBx (p - m)).testBit l := by
  have hb : Nat.blt p m = false := by cases h : Nat.blt p m; rfl; exact absurd (Nat.blt_eq.mp h) (by omega)
  show (Bool.rec (Nat.land (Nat.shiftRight MBx (Nat.mul 512 (Nat.sub p m))) M511)
    (Nat.land (Nat.shiftRight MB (Nat.mul 512 p)) M511) (Nat.blt p m) : ℕ).testBit l = _
  rw [hb]
  show (Nat.land (Nat.shiftRight MBx (Nat.mul 512 (Nat.sub p m))) M511).testBit l = _
  rw [E1S.testBit_dig 512 MBx (p - m) l (by omega),
    show Nat.land (Nat.shiftRight MBx (Nat.mul 512 (Nat.sub p m))) M511 = (MBx >>> (512 * (p - m))) &&& M511 from rfl,
    Nat.testBit_and, Nat.testBit_shiftRight, R3RT.m511_bit]
  simp [hl]

theorem mkD_lt (MB MBx m p : ℕ) : mkD MB MBx m p < 2 ^ 511 := by
  show (Bool.rec (Nat.land (Nat.shiftRight MBx (Nat.mul 512 (Nat.sub p m))) M511)
    (Nat.land (Nat.shiftRight MB (Nat.mul 512 p)) M511) (Nat.blt p m) : ℕ) < _
  cases Nat.blt p m
  · exact land_M511_lt _ _ m511_lt
  · exact land_M511_lt _ _ m511_lt

/-- a row of a record that passes `blocks` (`L5O.rows_ok`) meets every decomposition below the node in at most its residual many
labels above `last` -/
theorem row_above {Ω : Dec22 → Prop} {S last : ℕ} (hS : S >>> last = 1) (hS511 : S < 2 ^ 511) (A : Dec22) (hΩ : Ω A)
    (hA : Below A S last) (R r : ℕ) (hR : RowOKU Ω (R % 2 ^ 511) (L5.pcnt 512 (R &&& S) + r)) (mask : ℕ) (hmask : ∀ l, l < 511 → mask.testBit l = R.testBit l) :
    ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ mask.testBit l = true)).card ≤ r := by
  have hb : ∀ l, S.testBit l = true → l ≤ last := by
    intro l hl
    by_contra hc; push Not at hc
    rw [shr_one_bit hS l (by omega)] at hl; simp at hl; omega
  have := L5O.row_count (O := R3RT.SpecO.LO123) A hΩ S last R _ hS511 hb hA hR ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ mask.testBit l = true))
    (by
      intro l hl
      simp only [Finset.mem_filter, Finset.mem_range] at hl
      obtain ⟨hl5, hll, hAl, hml⟩ := hl
      refine ⟨hAl, by rw [← hmask l hl5]; exact hml, ?_⟩
      rw [shr_one_bit hS l (by omega)]; simp; omega)
  omega

/-- the slots of a two-class fold (`L1` rows in slots `0 ..`, then the `L2` rows): masks and `cap - r` fields -/
theorem pack2_slot {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} (tab : ℕ → ℕ) (hT : TabOKO O Ω tab) (L2 L1 : List ℕ) (r2 r1 : ℕ) (i : ℕ) (hi : i < L1.length + L2.length) :
    E1S.dig 512 ((0 * 2 ^ (512 * L2.length) + L5O.PK tab L2) * 2 ^ (512 * L1.length) + L5O.PK tab L1) i =
      (if i < L1.length then tab (L1.reverse.getD i 0) else tab (L2.reverse.getD (i - L1.length) 0)) % 2 ^ 511 ∧
    E1S.dig 8 ((0 * 2 ^ (8 * L2.length) + L5O.QK tab r2 L2) * 2 ^ (8 * L1.length) + L5O.QK tab r1 L1) i =
      (if i < L1.length then L5O.capT tab (L1.reverse.getD i 0) - r1 else L5O.capT tab (L2.reverse.getD (i - L1.length) 0) - r2) := by
  set F : ℕ → ℕ := fun s => (if s < L1.length then tab (L1.reverse.getD s 0) else tab (L2.reverse.getD (s - L1.length) 0)) % 2 ^ 511
    with hF
  set G : ℕ → ℕ := fun s => if s < L1.length then L5O.capT tab (L1.reverse.getD s 0) - r1
    else L5O.capT tab (L2.reverse.getD (s - L1.length) 0) - r2 with hG
  have hFlt : ∀ s < L1.length + L2.length, F s < 2 ^ 512 := fun s _ => lt_trans (Nat.mod_lt _ (by positivity)) (by norm_num)
  have hGlt : ∀ s < L1.length + L2.length, G s < 2 ^ 8 := by
    intro s _; simp only [hG]
    split
    · have h : L5O.capT tab (L1.reverse.getD s 0) < 256 := (hT (L1.reverse.getD s 0)).1
      exact lt_of_le_of_lt (Nat.sub_le _ _) (lt_of_lt_of_le h (by norm_num))
    · have h : L5O.capT tab (L2.reverse.getD (s - L1.length) 0) < 256 := (hT (L2.reverse.getD (s - L1.length) 0)).1
      exact lt_of_le_of_lt (Nat.sub_le _ _) (lt_of_lt_of_le h (by norm_num))
  have hM : (0 * 2 ^ (512 * L2.length) + L5O.PK tab L2) * 2 ^ (512 * L1.length) + L5O.PK tab L1 = E1S.pk 512 F (L1.length + L2.length) := by
    rw [L5.pk_split]
    have e1 : E1S.pk 512 F L1.length = L5O.PK tab L1 :=
      E1S.pk_congr 512 _ _ _ (fun s hs => by simp only [hF, if_pos hs])
    have e2 : E1S.pk 512 (fun i => F (L1.length + i)) L2.length = L5O.PK tab L2 :=
      E1S.pk_congr 512 _ _ _ (fun s hs => by simp only [hF, if_neg (show ¬ L1.length + s < L1.length by omega),
        show L1.length + s - L1.length = s by omega])
    rw [e1, e2]; ring
  have hE : (0 * 2 ^ (8 * L2.length) + L5O.QK tab r2 L2) * 2 ^ (8 * L1.length) + L5O.QK tab r1 L1 = E1S.pk 8 G (L1.length + L2.length) := by
    rw [L5.pk_split]
    have e1 : E1S.pk 8 G L1.length = L5O.QK tab r1 L1 :=
      E1S.pk_congr 8 _ _ _ (fun s hs => by simp only [hG, if_pos hs])
    have e2 : E1S.pk 8 (fun i => G (L1.length + i)) L2.length = L5O.QK tab r2 L2 :=
      E1S.pk_congr 8 _ _ _ (fun s hs => by simp only [hG, if_neg (show ¬ L1.length + s < L1.length by omega),
        show L1.length + s - L1.length = s by omega])
    rw [e1, e2]; ring
  rw [hM, hE, E1S.dig_pk 512 F _ hFlt i hi, E1S.dig_pk 8 G _ hGlt i hi]
  exact ⟨rfl, rfl⟩

/-! ## The batch -/

theorem top_of_node5 {S D N U dP c2 h suf rec : ℕ} {ks : List ℕ} {k : ℕ → ℕ → ℕ → ℕ → Bool}
    (h5 : node5 S D N U dP c2 h suf rec ks k = true) :
    ((S ||| 2 ^ ((rec >>> 8) % 512)) >>> ((rec >>> 8) % 512)) = 1 ∧ (rec >>> 8) % 512 < 511 := by
  rw [L5O.node5_eq] at h5
  simp only [Bool.and_eq_true] at h5
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨hl, hS⟩, _⟩, _⟩, _⟩, _⟩, _⟩, _⟩, _⟩ := h5
  have hl' := Nat.blt_eq.mp hl
  replace hS := Nat.eq_of_beq_eq_true hS
  rw [L5O.n5last_eq] at hl' hS
  refine ⟨?_, hl'⟩
  set l := (rec >>> 8) % 512
  have hS' : S >>> l = 0 := hS
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.testBit_shiftRight, Nat.testBit_or, Nat.testBit_two_pow]
  have hSi : S.testBit (l + i) = false := by
    have := congrArg (fun x => x.testBit i) hS'
    simp only [Nat.testBit_shiftRight, Nat.zero_testBit] at this; exact this
  rw [hSi, K2.testBit_one']
  rcases Nat.eq_zero_or_pos i with rfl | hi
  · simp
  · have : l ≠ l + i := by omega
    simp [this]

-- `KD.batchX_sound` is in `KD.XBatchO`: the instance of the order-generic `batchXO'_sound` at `LO123` without extension.

end KD
