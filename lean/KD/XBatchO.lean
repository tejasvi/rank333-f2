module
public import R22Port.U_d41d8cd98f00
public import KD.XBatch
public import L5.Node5O
/-! # KD.XBatchO: the composed batch checker over a label order, a universe, a frame predicate and a per-node extension

`KD.batchXO' np ext` is `KD.batchX'` (DESIGN 33, 36) with the deficit table's hyperplane masks from `np` and, in node5's
continuation next to the X part, a per-node extension `ext S' D' N' U' d' last e` on the child frame (the kinds records:
PREFF / DOOM / CANON / leaves, KD321's `ext321`).  **`batchXO'_sound`**, for any order `O` with `NpOK O np`, universe `Ω`, and
frame predicate `Fr` with node5's contract (`N5Contract`; `FrameOK` itself by `L5O.node5_spec`, KD321's `FrameOK0` with the
empty parent by `KD321.node5_spec0`): an accepted batch gives `BatchOKXO` — per node the T/C kills, every bulk-peel child dead,
a valid child frame and the extension accepted on it. -/
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
noncomputable section
namespace KD
open R3RT.Spec RootSound BC4 BC5 Classical
open R3RT (M511 foldR node5 mapL mkD)

/-! ## The checker -/

/-- **one OPEN node** from its parent frame `(S, D, N, U, dP)`: L1 v5's record on the rows fetched from the table, then, on the child
frame `node5` builds, the extras' `blocks`, the X part, and the continuation `k` -/
def nodeXO (np : ℕ → ℕ) (tab : ℕ → ℕ) (S D N U dP : ℕ) : NodeX → (ℕ → ℕ → ℕ → ℕ → Bool) → Bool
  | (c2, h, suf, hdr, r2, r1, r0, x2, x1, ks, nrows, aggs, XL, HP, DEFP, J, kids), k =>
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
                  xpartC np S' D' N' U' (Nat.succ dP) (Nat.land (Nat.shiftRight hdr 8) 511) (Nat.add c0' c1')
                    (Nat.add c0' (Nat.add c1' c2')) (Nat.add (Nat.add c0' (Nat.add c1' c2')) cx')
                    (mkD MB MBx (Nat.add c0' (Nat.add c1' c2'))) nrows aggs XL HP DEFP J kids &&
                  k S' D' N' U'))))))

def batchXO' {E : Type} (np : ℕ → ℕ) (ext : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → E → Bool) (tab : ℕ → ℕ) :
    List (ℕ × ℕ × ℕ × ℕ × ℕ) → List (NodeX × E) → Bool
  | _, [] => true
  | st, (x, e) :: rest =>
    match List.drop (Nat.land x.2.2.2.1 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      nodeXO np tab S D N U dP x (fun S' D' N' U' =>
        ext S' D' N' U' (Nat.succ dP) (Nat.land (Nat.shiftRight x.2.2.2.1 8) 511) e &&
        batchXO' np ext tab ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest)

/-- the node's T/C kills -/
def nodeKs (x : NodeX) : List ℕ := x.2.2.2.2.2.2.2.2.2.1

/-- what an accepted batch establishes over the order `O` and the universe `Ω`: per node, the T/C kills, every bulk-peel child
dead, a valid child frame, and the node's extension on it -/
def BatchOKXO {E : Type} (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) (ext : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → E → Bool) :
    List (ℕ × ℕ × ℕ × ℕ × ℕ) → List (NodeX × E) → Prop
  | _, [] => True
  | st, ((c2, h, _suf, hdr, _r2, _r1, _r0, _x2, _x1, ks, _nr, _ag, _XL, _HP, _DEFP, _J, kids), e) :: rest =>
    match st.drop (hdr % 256) with
    | [] => False
    | (S, _D, N, U, dP) :: _st' =>
      KillsOKO O Ω (S ||| 2 ^ ((hdr >>> 8) % 512)) ((hdr >>> 8) % 512) ks ∧
      (∀ c ∈ kids, ∀ A : Dec22, Ω A → ¬ R3RT.SpecO.Continues O A (S ||| 2 ^ ((hdr >>> 8) % 512)) ((hdr >>> 8) % 512) c.1) ∧
      ∃ D', FrameOKO O Ω (S ||| 2 ^ ((hdr >>> 8) % 512)) D' (N ||| c2) (U + h) (dP + 1) ∧
        ext (S ||| 2 ^ ((hdr >>> 8) % 512)) D' (N ||| c2) (U + h) (dP + 1) ((hdr >>> 8) % 512) e = true ∧
        BatchOKXO O Ω ext ((S ||| 2 ^ ((hdr >>> 8) % 512), D', N ||| c2, U + h, dP + 1) :: st.drop (hdr % 256)) rest


/-- node5's contract from the frames of `Fr` (revision 6a's `Node5Spec` with `FrameOK` replaced by `Fr`) -/
def N5Contract (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) (Fr : ℕ × ℕ × ℕ × ℕ × ℕ → Prop) : Prop :=
  ∀ (S D N U dP c2 h suf rec : ℕ) (ks : List ℕ) (k : ℕ → ℕ → ℕ → ℕ → Bool),
    Fr (S, D, N, U, dP) → C2OKO O Ω ((rec >>> 8) % 512) c2 → R3RT.SpecO.HOK O ((rec >>> 8) % 512) h →
    R3RT.SpecO.RecRowsOK O Ω rec → node5 S D N U dP c2 h suf rec ks k = true →
      ∃ D', FrameOKO O Ω (S ||| 2 ^ ((rec >>> 8) % 512)) D' (N ||| c2) (U + h) (dP + 1) ∧
        KillsOKO O Ω (S ||| 2 ^ ((rec >>> 8) % 512)) ((rec >>> 8) % 512) ks ∧
        k (S ||| 2 ^ ((rec >>> 8) % 512)) D' (N ||| c2) (U + h) = true

/-- the contract for valid frames (`L5O.node5_spec`) -/
theorem n5contract_frameOK (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) :
    N5Contract O Ω (fun f => FrameOKO O Ω f.1 f.2.1 f.2.2.1 f.2.2.2.1 f.2.2.2.2) :=
  fun S D N U dP c2 h suf rec ks k hF hC hH hR hn => L5O.node5_spec S D N U dP c2 h suf rec ks k hF hC hH hR hn

/-! ## Rows below the node -/

/-- a row of a record that passes `blocks` (`L5O.rows_ok`) meets every decomposition below the node in at most its residual many
labels above `last` -/
theorem row_aboveO {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {S last : ℕ} (hS : S >>> last = 1) (hS511 : S < 2 ^ 511) (A : Dec22) (hΩ : Ω A)
    (hA : R3RT.SpecO.Below O A S last) (R r : ℕ) (hR : RowOKO O Ω (R % 2 ^ 511) (L5.pcnt 512 (R &&& S) + r)) (mask : ℕ) (hmask : ∀ l, l < 511 → mask.testBit l = R.testBit l) :
    ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ mask.testBit l = true)).card ≤ r := by
  have hb : ∀ l, S.testBit l = true → l ≤ last := by
    intro l hl
    by_contra hc; push Not at hc
    rw [shr_one_bit hS l (by omega)] at hl; simp at hl; omega
  have := L5O.row_count (O := O) A hΩ S last R _ hS511 hb hA hR ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ mask.testBit l = true))
    (by
      intro l hl
      simp only [Finset.mem_filter, Finset.mem_range] at hl
      obtain ⟨hl5, hll, hAl, hml⟩ := hl
      refine ⟨hAl, by rw [← hmask l hl5]; exact hml, ?_⟩
      rw [shr_one_bit hS l (by omega)]; simp; omega)
  omega

/-! ## The batch -/

/-- **Soundness of the composed batch checker.** -/
theorem nodeXO_sound {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {np : ℕ → ℕ} {Fr : ℕ × ℕ × ℕ × ℕ × ℕ → Prop}
    (hnp : NpOK O np) (hN5 : N5Contract O Ω Fr) (tab : ℕ → ℕ) (hT : TabOKO O Ω tab) {S D N U dP : ℕ} (x : NodeX)
    (k : ℕ → ℕ → ℕ → ℕ → Bool) (hF : Fr (S, D, N, U, dP))
    (hx : C2OKO O Ω ((x.2.2.2.1 >>> 8) % 512) x.1 ∧ R3RT.SpecO.HOK O ((x.2.2.2.1 >>> 8) % 512) x.2.1)
    (hxf : (∀ ag ∈ nodeAggs x, C2OKO O Ω ag.1 ag.2.1) ∧ (∀ c ∈ nodeKids x, KidXOKO O Ω c))
    (hb : nodeXO np tab S D N U dP x k = true) :
    KillsOKO O Ω (S ||| 2 ^ ((x.2.2.2.1 >>> 8) % 512)) ((x.2.2.2.1 >>> 8) % 512) (nodeKs x) ∧
    (∀ c ∈ nodeKids x, ∀ A : Dec22, Ω A →
      ¬ R3RT.SpecO.Continues O A (S ||| 2 ^ ((x.2.2.2.1 >>> 8) % 512)) ((x.2.2.2.1 >>> 8) % 512) c.1) ∧
    (S ||| 2 ^ ((x.2.2.2.1 >>> 8) % 512)) >>> ((x.2.2.2.1 >>> 8) % 512) = 1 ∧ (x.2.2.2.1 >>> 8) % 512 < 511 ∧
    ∃ D', FrameOKO O Ω (S ||| 2 ^ ((x.2.2.2.1 >>> 8) % 512)) D' (N ||| x.1) (U + x.2.1) (dP + 1) ∧
      k (S ||| 2 ^ ((x.2.2.2.1 >>> 8) % 512)) D' (N ||| x.1) (U + x.2.1) = true := by
  obtain ⟨c2, h, suf, hdr, r2, r1, r0, x2, x1, ks, nrows, aggs, XL, HP, DEFP, J, kids⟩ := x
  simp only [nodeAggs, nodeKids, nodeKs] at hx hxf ⊢
  simp only [nodeXO] at hb
  have hcap : ∀ y, L5O.capT tab y < 256 := fun y => (hT y).1
  obtain ⟨b2, hk2, hb2⟩ := L5O.foldR_sem tab 2 _ r2 0 0 0 0 (fun y _ => hcap y) hb
  obtain ⟨b1, hk1, hb1⟩ := L5O.foldR_sem tab 1 _ r1 _ _ _ 0 (fun y _ => hcap y) hk2
  obtain ⟨b0, hk0, hb0⟩ := L5O.foldR_sem tab 0 _ r0 _ _ _ 0 (fun y _ => hcap y) hk1
  obtain ⟨bx2, hkx2, hbx2⟩ := L5O.foldR_sem tab 2 _ x2 0 0 b0 0 (fun y _ => hcap y) hk0
  obtain ⟨bx1, hkx1, hbx1⟩ := L5O.foldR_sem tab 1 _ x1 _ _ bx2 0 (fun y _ => hcap y) hkx2
  simp only [Bool.and_eq_true, Nat.beq_eq] at hkx1
  obtain ⟨⟨⟨⟨hbad, hc2'⟩, hc1'⟩, hc0'⟩, hn5⟩ := hkx1
  obtain ⟨hbx2z, hcapx1⟩ := hbx1 hbad
  obtain ⟨hb0z, hcapx2⟩ := hbx2 hbx2z
  obtain ⟨hb1z, _⟩ := hb0 hb0z
  obtain ⟨hb2z, hcap1⟩ := hb1 hb1z
  obtain ⟨_, hcap2⟩ := hb2 hb2z
  simp only [Nat.zero_add] at hc2' hc1' hc0' hn5
  have hn2 : r2.length = (hdr >>> 52) % 1024 := by rw [hc2', ← L5O.n5n2_eq]; rfl
  have hn1 : r1.length = (hdr >>> 32) % 1024 := by rw [hc1', ← L5O.n5n1_eq]; rfl
  have hnV : r0.length = (hdr >>> 22) % 1024 := by rw [hc0', ← L5O.n5nV_eq]; rfl
  have hm : Nat.add r0.length (Nat.add r1.length r2.length) = r0.length + r1.length + r2.length := by
    rw [L5.nadd_eq, L5.nadd_eq]; ring
  rw [hm] at hn5
  set MB := ((0 * 2 ^ (512 * r2.length) + L5O.PK tab r2) * 2 ^ (512 * r1.length) + L5O.PK tab r1) * 2 ^ (512 * r0.length) +
    L5O.PK tab r0 with hMB
  set E := ((0 * 2 ^ (8 * r2.length) + L5O.QK tab 2 r2) * 2 ^ (8 * r1.length) + L5O.QK tab 1 r1) * 2 ^ (8 * r0.length) +
    L5O.QK tab 0 r0 with hE
  set rec := Nat.lor (Nat.land hdr 18446744073709551615)
    (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 (r0.length + r1.length + r2.length)))) 64) with hrecdef
  have hrecok := L5O.rec_ok tab hT hdr r2 r1 r0 hn2 hn1 hnV hcap2 hcap1 MB E rfl rfl
  obtain ⟨hfMB, _, hfm, hfV, hf1⟩ := rec_fields tab hT hdr r2 r1 r0 hn2 hn1 hnV MB E rfl rfl
  have hMBlt : MB < 2 ^ (512 * (r0.length + r1.length + r2.length)) := by
    rw [hMB]; exact pack3_lt 512 _ _ _ _ _ _ (PK_lt tab r0) (PK_lt tab r1) (PK_lt tab r2)
  have hlo := L5O.rec_lo hdr MB E (r0.length + r1.length + r2.length) hMBlt
  have hlast : (rec >>> 8) % 512 = (hdr >>> 8) % 512 := L5O.low_field _ _ 8 9 hlo (by norm_num)
  have hn5r : node5 S D N U dP c2 h suf rec ks _ = true := hn5
  obtain ⟨hS1, hl511⟩ := top_of_node5 hn5r
  rw [hlast] at hS1 hl511
  obtain ⟨D', hF', hK, hk⟩ := hN5 S D N U dP c2 h suf rec ks _ hF (by rw [hlast]; exact hx.1)
    (by rw [hlast]; exact hx.2) hrecok hn5r
  rw [hlast] at hF' hK hk
  -- L1's own blocks check on its rows, and the depth bound
  have h5 := hn5r
  rw [L5O.node5_eq] at h5
  simp only [Bool.and_eq_true] at h5
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨_, _⟩, hd5⟩, _⟩, _⟩, _⟩, hblk⟩, _⟩, _⟩ := h5
  have hlast' : L5O.n5last rec = (hdr >>> 8) % 512 := by rw [L5O.n5last_eq, hlast]
  rw [hlast', show Nat.lor S (Nat.shiftLeft 1 ((hdr >>> 8) % 512)) = S ||| 2 ^ ((hdr >>> 8) % 512) by
    rw [L5.lor_eq, L5.shl_eq, Nat.one_shiftLeft]] at hblk
  have hdP : dP + 1 ≤ 31 := by
    have hd := Nat.eq_of_beq_eq_true hd5
    have : L5O.n5d rec < 32 := by rw [L5O.n5d_eq]; exact Nat.mod_lt _ (by norm_num)
    omega
  set S' := S ||| 2 ^ ((hdr >>> 8) % 512) with hS'def
  have hS'511 : S' < 2 ^ 511 := hF'.2.1
  have hpc : L5.pcnt 512 S' ≤ 127 := by
    have e := L5O.pcnt_and_eq S' S' hS'511
    rw [Nat.and_self] at e
    rw [e, show ((Finset.range 511).filter (fun l => S'.testBit l = true ∧ S'.testBit l = true)) =
      ((Finset.range 511).filter (fun l => S'.testBit l = true)) by ext l; simp, hF'.2.2.1]
    omega
  -- the continuation
  simp only [Bool.and_eq_true] at hk
  obtain ⟨⟨hblkx, hxp⟩, hkk⟩ := hk
  set last := (hdr >>> 8) % 512 with hlastdef
  have hlast8 : (hdr.shiftRight 8).land 511 = last := by
    rw [hlastdef, L5.land_eq, L5.shr_eq, show (511 : ℕ) = 2 ^ 9 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
  rw [hlast8] at hxp
  -- L1's rows: `rows_ok` on the node's record
  have hrows := L5O.rows_ok rec S' hS'511 hpc hrecok hblk
  rw [hfMB, hfm, hfV, hf1] at hrows
  -- the extras: their `blocks` and the two-class pack
  set MBx := (0 * 2 ^ (512 * x2.length) + L5O.PK tab x2) * 2 ^ (512 * x1.length) + L5O.PK tab x1 with hMBx
  set Ex := (0 * 2 ^ (8 * x2.length) + L5O.QK tab 2 x2) * 2 ^ (8 * x1.length) + L5O.QK tab 1 x1 with hEx

  have hblkx' : L1.blocks MBx Ex (Nat.mul S' L1.REP63) (Nat.div (Nat.add (x1.length + x2.length) 62) 63) = true := hblkx
  have hrowsx : ∀ q, q < x1.length + x2.length → RowOKO O Ω (E1S.dig 512 MBx q % 2 ^ 511)
      (L5.pcnt 512 (E1S.dig 512 MBx q &&& S') + (if q < x1.length then 1 else 2)) := by
    intro q hq
    have hb := L5.blocks_sound S' hS'511 hpc _ _ _ hblkx' q (by rw [L5.ndiv_eq, L5.nadd_eq]; omega)
    obtain ⟨hdm, hde⟩ := pack2_slot tab hT x2 x1 2 1 q hq
    rw [hdm]; rw [hde, hdm] at hb
    by_cases hq1 : q < x1.length
    · simp only [hq1, if_true] at hb ⊢
      have hc := hcapx1 _ (L5O.getD_rev_mem x1 q hq1)
      rw [Nat.mod_mod, ← hb, Nat.sub_add_cancel hc]
      exact (hT (x1.reverse.getD q 0)).2
    · simp only [hq1, if_false] at hb ⊢
      have hc := hcapx2 _ (L5O.getD_rev_mem x2 (q - x1.length) (by omega))
      rw [Nat.mod_mod, ← hb, Nat.sub_add_cancel hc]
      exact (hT (x2.reverse.getD (q - x1.length) 0)).2
  have hMBxlt : MBx < 2 ^ (512 * (x1.length + x2.length)) := by
    have := pack3_lt 512 _ _ _ _ _ _ (PK_lt tab []) (PK_lt tab x1) (PK_lt tab x2)
    rw [hMBx]; simpa [L5O.PK, E1S.pk] using this
  have hMBx' : MBx = (0 * 2 ^ (512 * x2.length) + L5O.PK tab x2) * 2 ^ (512 * x1.length) + L5O.PK tab x1 := rfl
  -- the shared dictionary's residual facts
  have hD : DictSemXO O Ω S' last (mkD (((0 * 2 ^ (512 * r2.length) + L5O.PK tab r2) * 2 ^ (512 * r1.length) + L5O.PK tab r1) *
        2 ^ (512 * r0.length) + L5O.PK tab r0)
      ((0 * 2 ^ (512 * x2.length) + L5O.PK tab x2) * 2 ^ (512 * x1.length) + L5O.PK tab x1)
      (r0.length + r1.length + r2.length))
      (rposB (r0.length.add r1.length) (r0.length + r1.length + r2.length)
        ((r0.length + r1.length + r2.length).add x1.length)) := by
    intro p A hΩ hA
    by_cases hpm : p < r0.length + r1.length + r2.length
    · have hr := hrows p (by simpa using hpm)
      refine le_trans (row_aboveO hS1 hS'511 A hΩ hA _ _ hr _ (fun l hl => testBit_mkD_lo _ _ _ p l hpm hl)) ?_
      unfold rposB; simp only [Nat.add_eq]
      split_ifs <;> omega
    · push Not at hpm
      set q := p - (r0.length + r1.length + r2.length) with hq
      by_cases hqn : q < x1.length + x2.length
      · have hr := hrowsx q hqn
        refine le_trans (row_aboveO hS1 hS'511 A hΩ hA _ _ hr _ (fun l hl => by
          rw [testBit_mkD_hi _ _ _ p l hpm hl])) ?_
        unfold rposB; simp only [Nat.add_eq]
        split_ifs <;> omega
      · -- past the extras: the slot is zero
        have hz : ∀ l, l < 511 → (mkD (((0 * 2 ^ (512 * r2.length) + L5O.PK tab r2) * 2 ^ (512 * r1.length) + L5O.PK tab r1) *
            2 ^ (512 * r0.length) + L5O.PK tab r0)
            ((0 * 2 ^ (512 * x2.length) + L5O.PK tab x2) * 2 ^ (512 * x1.length) + L5O.PK tab x1)
            (r0.length + r1.length + r2.length) p).testBit l = false := by
          intro l hl
          rw [testBit_mkD_hi _ _ _ p l hpm hl, E1S.testBit_dig 512 MBx q l (by omega)]
          apply Nat.testBit_lt_two_pow
          exact lt_of_lt_of_le hMBxlt (Nat.pow_le_pow_right (by norm_num) (by push Not at hqn; nlinarith))
        have : ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧
            (mkD (((0 * 2 ^ (512 * r2.length) + L5O.PK tab r2) * 2 ^ (512 * r1.length) + L5O.PK tab r1) *
            2 ^ (512 * r0.length) + L5O.PK tab r0)
            ((0 * 2 ^ (512 * x2.length) + L5O.PK tab x2) * 2 ^ (512 * x1.length) + L5O.PK tab x1)
            (r0.length + r1.length + r2.length) p).testBit l = true)).card = 0 := by
          rw [Finset.card_eq_zero, Finset.filter_eq_empty_iff]
          intro l hl ⟨_, _, h3⟩
          rw [hz l (Finset.mem_range.mp hl)] at h3; exact absurd h3 (by decide)
        omega
  exact ⟨hK, xpartC_soundO hF' hS1 hD (fun p => mkD_lt _ _ _ p) hxf.1 hxf.2 hnp hxp, hS1, hl511, D', hF', hkk⟩

/-- **Soundness of the composed batch checker over an order, a universe, a frame predicate and an extension** -/
theorem batchXO'_sound {E : Type} {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {np : ℕ → ℕ}
    {ext : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → E → Bool} {Fr : ℕ × ℕ × ℕ × ℕ × ℕ → Prop} (hnp : NpOK O np) (hN5 : N5Contract O Ω Fr)
    (hFr : ∀ S D N U d, FrameOKO O Ω S D N U d → Fr (S, D, N, U, d)) (tab : ℕ → ℕ) (hT : TabOKO O Ω tab) :
    ∀ (nodes : List (NodeX × E)) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)),
    (∀ f ∈ st, Fr f) →
    (∀ x ∈ nodes, C2OKO O Ω ((x.1.2.2.2.1 >>> 8) % 512) x.1.1 ∧ R3RT.SpecO.HOK O ((x.1.2.2.2.1 >>> 8) % 512) x.1.2.1) →
    (∀ x ∈ nodes, (∀ ag ∈ nodeAggs x.1, C2OKO O Ω ag.1 ag.2.1) ∧ (∀ c ∈ nodeKids x.1, KidXOKO O Ω c)) →
    batchXO' np ext tab st nodes = true → BatchOKXO O Ω ext st nodes := by
  intro nodes
  induction nodes with
  | nil => intro st _ _ _ _; simp [BatchOKXO]
  | cons xe rest ih =>
    intro st hst hnodes hfacts hb
    obtain ⟨x, e⟩ := xe
    have hx := hnodes (x, e) (List.mem_cons_self ..)
    have hxf := hfacts (x, e) (List.mem_cons_self ..)
    have hrest := fun y hy => hnodes y (List.mem_cons_of_mem _ hy)
    have hrestf := fun y hy => hfacts y (List.mem_cons_of_mem _ hy)
    obtain ⟨c2, h, suf, hdr, r2, r1, r0, x2, x1, ks, nrows, aggs, XL, HP, DEFP, J, kids⟩ := x
    have hpop : Nat.land hdr 255 = hdr % 256 := by
      rw [L5.land_eq, show (255 : ℕ) = 2 ^ 8 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
    have hlast8 : (hdr.shiftRight 8).land 511 = (hdr >>> 8) % 512 := by
      rw [L5.land_eq, L5.shr_eq, show (511 : ℕ) = 2 ^ 9 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
    simp only [batchXO'] at hb
    rw [hpop] at hb
    simp only [BatchOKXO]
    rcases hd : List.drop (hdr % 256) st with _ | ⟨⟨S, D, N, U, dP⟩, st'⟩
    · rw [hd] at hb; exact absurd hb (by simp)
    · rw [hd] at hb
      simp only at hb ⊢
      have hF : Fr (S, D, N, U, dP) :=
        hst (S, D, N, U, dP) (List.mem_of_mem_drop (i := hdr % 256) (a := (S, D, N, U, dP)) (by rw [hd]; simp))
      obtain ⟨hK, hkid, _, _, D', hF', hk⟩ := nodeXO_sound hnp hN5 tab hT _ _ hF hx hxf hb
      simp only [Bool.and_eq_true] at hk
      obtain ⟨hext, hrestb⟩ := hk
      refine ⟨hK, hkid, D', hF', ?_, ?_⟩
      · rw [hlast8] at hext; exact hext
      · apply ih _ _ hrest hrestf hrestb
        intro f hf
        rw [List.mem_cons] at hf
        rcases hf with rfl | hf
        · exact hFr _ _ _ _ _ hF'
        · rw [List.mem_cons] at hf
          rcases hf with rfl | hf
          · exact hF
          · exact hst f (List.mem_of_mem_drop (i := hdr % 256) (a := f) (by rw [hd]; exact List.mem_cons_of_mem _ hf))

end KD

namespace KD
open R3RT.Spec

def batchXO {E : Type} (np : ℕ → ℕ) (ext : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → E → Bool) (tab : ℕ → ℕ)
    (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)) (nodes : List (NodeX × E)) : Bool := batchXO' np ext tab st nodes

/-- **`batchXO`'s contract** -/
theorem batchXO_sound {E : Type} {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {np : ℕ → ℕ}
    {ext : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → E → Bool} {Fr : ℕ × ℕ × ℕ × ℕ × ℕ → Prop} (hnp : NpOK O np) (hN5 : N5Contract O Ω Fr)
    (hFr : ∀ S D N U d, FrameOKO O Ω S D N U d → Fr (S, D, N, U, d)) (tab : ℕ → ℕ) (hT : TabOKO O Ω tab)
    (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)) (nodes : List (NodeX × E)) (hst : ∀ f ∈ st, Fr f)
    (hnodes : ∀ x ∈ nodes, C2OKO O Ω ((x.1.2.2.2.1 >>> 8) % 512) x.1.1 ∧ R3RT.SpecO.HOK O ((x.1.2.2.2.1 >>> 8) % 512) x.1.2.1)
    (hfacts : ∀ x ∈ nodes, (∀ ag ∈ nodeAggs x.1, C2OKO O Ω ag.1 ag.2.1) ∧ (∀ c ∈ nodeKids x.1, KidXOKO O Ω c))
    (h : batchXO np ext tab st nodes = true) : BatchOKXO O Ω ext st nodes :=
  batchXO'_sound hnp hN5 hFr tab hT nodes st hst hnodes hfacts h

/-! ## `KD.batchX` is the instance at `LO123`, without extension -/

theorem batchX'_eq (tab : ℕ → ℕ) : ∀ (nodes : List NodeX) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)),
    batchX' tab st nodes = batchXO' R3RT.nperpL (fun _ _ _ _ _ _ (_ : Unit) => true) tab st (nodes.map (fun x => (x, ()))) := by
  intro nodes
  induction nodes with
  | nil => intro st; simp [batchX', batchXO']
  | cons x rest ih =>
    intro st
    obtain ⟨c2, h, suf, hdr, r2, r1, r0, x2, x1, ks, nrows, aggs, XL, HP, DEFP, J, kids⟩ := x
    dsimp only [List.map_cons, batchX', batchXO']
    rcases List.drop (Nat.land hdr 255) st with _ | ⟨⟨S, D, N, U, dP⟩, st'⟩
    · rfl
    · simp only [nodeXO, ih, Bool.and_true, Bool.true_and]

theorem batchOKX_of (Ω : Dec22 → Prop) : ∀ (nodes : List NodeX) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)),
    BatchOKXO R3RT.SpecO.LO123 Ω (fun _ _ _ _ _ _ (_ : Unit) => true) st (nodes.map (fun x => (x, ()))) → BatchOKX Ω st nodes := by
  intro nodes
  induction nodes with
  | nil => intro st _; simp [BatchOKX]
  | cons x rest ih =>
    intro st h
    obtain ⟨c2, h', suf, hdr, r2, r1, r0, x2, x1, ks, nrows, aggs, XL, HP, DEFP, J, kids⟩ := x
    simp only [List.map_cons, BatchOKXO] at h
    simp only [BatchOKX]
    rcases hd : List.drop (hdr % 256) st with _ | ⟨⟨S, D, N, U, dP⟩, st'⟩
    · rw [hd] at h; exact h
    · rw [hd] at h
      obtain ⟨hK, hkid, D', hF', _, hrest⟩ := h
      exact ⟨hK, hkid, D', hF', ih _ hrest⟩

/-- **`batchX`'s contract** (`LO123`, universe `Ω`): the instance of `batchXO'_sound` with the masks `nperpL`, valid frames, and
no extension -/
theorem batchX_sound {Ω : Dec22 → Prop} (tab : ℕ → ℕ) (hT : TabOKU Ω tab) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ))
    (nodes : List NodeX)
    (hst : ∀ f ∈ st, FrameOKU Ω f.1 f.2.1 f.2.2.1 f.2.2.2.1 f.2.2.2.2)
    (hnodes : ∀ x ∈ nodes, C2OKU Ω ((x.2.2.2.1 >>> 8) % 512) x.1 ∧
      R3RT.SpecO.HOK R3RT.SpecO.LO123 ((x.2.2.2.1 >>> 8) % 512) x.2.1)
    (hfacts : ∀ x ∈ nodes, (∀ ag ∈ nodeAggs x, C2OKU Ω ag.1 ag.2.1) ∧ (∀ c ∈ nodeKids x, KidXOK Ω c))
    (h : batchX tab st nodes = true) : BatchOKX Ω st nodes := by
  refine batchOKX_of Ω nodes st (batchXO'_sound npOK_123 (n5contract_frameOK _ Ω) (fun _ _ _ _ _ hf => hf) tab hT
    (nodes.map (fun x => (x, ()))) st hst ?_ ?_ ?_)
  · intro x hx; obtain ⟨y, hy, rfl⟩ := List.mem_map.mp hx; exact hnodes y hy
  · intro x hx; obtain ⟨y, hy, rfl⟩ := List.mem_map.mp hx; exact hfacts y hy
  · rw [← batchX'_eq]; exact h

end KD
