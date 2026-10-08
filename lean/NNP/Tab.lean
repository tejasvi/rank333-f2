module
public import R22Port.U_b137c0030f76
public import NNP.Dict
public import NN.Batch
/-! # NNP.Tab: the native per-job table check gives `TabOK` (through the spec's `TableSpec`)

`tabOK_of_check`: if `NN.tabCheck tab rowE` accepts, then for every order `O`, universe `Ω`, class bounds `lb` with
`TableSpec O Ω rowE lb` (revision 5: `L5.table_spec` for `rowE3eD`) and `ClassFactsC Ω lb`, the table's view has valid rows
(`TabOK O Ω (tabV tab)`) and the shape facts `TabWF tab`. The chunked form `tabOKQ` is built from the view (`chunkV`). -/
@[expose] public section
set_option maxHeartbeats 1000000
set_option exponentiation.threshold 1024
namespace NNP
open NN

theorem rec_of_all (f : ℕ → Bool) : ∀ n, (∀ j < n, f j = true) →
    Nat.rec (motive := fun _ => Bool) true (fun j b => b && f j) n = true := by
  intro n
  induction n with
  | zero => intro _; rfl
  | succ n ih =>
    intro h
    show (Nat.rec (motive := fun _ => Bool) true (fun j b => b && f j) n && f n) = true
    rw [Bool.and_eq_true]
    exact ⟨ih (fun j hj => h j (by omega)), h n (by omega)⟩

theorem tabOKQ_of (rowE chunk : ℕ → ℕ) (CH N nch : ℕ)
    (h : ∀ q < nch, ∀ j < CH, N ≤ CH * q + j ∨
      rowE (((chunk q >>> (552 * j)) % 2 ^ 552) >>> 520) = ((chunk q >>> (552 * j)) % 2 ^ 552) % 2 ^ 520) :
    R3RT.tabOKQ rowE chunk CH N nch = true := by
  have hM552 : R3RT.M552Q = 2 ^ 552 - 1 := by decide +kernel
  have hM520 : R3RT.M520 = 2 ^ 520 - 1 := by decide +kernel
  unfold R3RT.tabOKQ
  apply rec_of_all; intro q hq
  apply rec_of_all; intro j hj
  rcases h q hq j hj with h1 | h1
  · simp only [Bool.or_eq_true]; left; exact Nat.ble_eq.mpr (by rw [L5.nadd_eq, L5.nmul_eq]; exact h1)
  · simp only [Bool.or_eq_true]; right
    rw [Nat.beq_eq, hM552, hM520, L5.land_eq, L5.land_eq, L5.shr_eq, L5.shr_eq, L5.nmul_eq,
      Nat.and_two_pow_sub_one_eq_mod, Nat.and_two_pow_sub_one_eq_mod]
    exact h1

/-- the 64-entry chunks of a table's view -/
def chunkV (tab : Tab) (q : ℕ) : ℕ := E1S.pk 552 (fun j => tabV tab (64 * q + j)) 64

theorem rowT_zero_of (tab : Tab) (hW : TabWF tab) (i : ℕ) (hi : tab.caps.size ≤ i) : rowT tab i = 0 := by
  unfold rowT; rw [if_neg (by rw [hW.rows]; omega)]

theorem tabV_zero_of (tab : Tab) (hW : TabWF tab) (i : ℕ) (hi : tab.caps.size ≤ i) : tabV tab i = 0 := by
  unfold tabV capOf
  rw [rowT_zero_of tab hW i hi, getD_ge _ _ _ hi, getD_ge _ _ _ (by rw [hW.ids]; exact hi)]
  simp

theorem low_lt (tab : Tab) (hW : TabWF tab) (i : ℕ) : rowT tab i + capOf tab i * 2 ^ 511 < 2 ^ 520 := by
  have h1 := rowT_lt tab hW i
  have h2 : capOf tab i < 256 := hW.caps i
  calc rowT tab i + capOf tab i * 2 ^ 511 < 2 ^ 511 + 255 * 2 ^ 511 := by
        have : capOf tab i * 2 ^ 511 ≤ 255 * 2 ^ 511 := Nat.mul_le_mul_right _ (by omega)
        omega
    _ ≤ 2 ^ 520 := by norm_num

theorem tabV_lt (tab : Tab) (hW : TabWF tab) (i : ℕ) : tabV tab i < 2 ^ 552 := by
  have h1 := low_lt tab hW i
  have h2 : tab.ids.getD i 0 < 2 ^ 32 := hW.idlt i
  unfold tabV
  calc rowT tab i + capOf tab i * 2 ^ 511 + tab.ids.getD i 0 * 2 ^ 520
      < 2 ^ 520 + tab.ids.getD i 0 * 2 ^ 520 := by omega
    _ = (tab.ids.getD i 0 + 1) * 2 ^ 520 := by ring
    _ ≤ 2 ^ 32 * 2 ^ 520 := Nat.mul_le_mul_right _ (by omega)
    _ = 2 ^ 552 := by rw [← pow_add]

theorem tabV_hi (tab : Tab) (hW : TabWF tab) (i : ℕ) : tabV tab i >>> 520 = tab.ids.getD i 0 := by
  unfold tabV
  rw [Nat.shiftRight_eq_div_pow, Nat.add_mul_div_right _ _ (by positivity), Nat.div_eq_of_lt (low_lt tab hW i),
    Nat.zero_add]

theorem tabV_lo (tab : Tab) (hW : TabWF tab) (i : ℕ) : tabV tab i % 2 ^ 520 = rowT tab i + capOf tab i * 2 ^ 511 := by
  unfold tabV
  rw [Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt (low_lt tab hW i)]

/-- the shape facts from the check -/
theorem tabWF_of_check (tab : Tab) (rowE : ℕ → ℕ) (h : tabCheck tab rowE = true) : TabWF tab := by
  unfold tabCheck at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨hr, hid⟩, hall⟩ := h
  have hent := (allN_iff _ _).mp hall
  refine ⟨hr, fun i => ?_, fun i => ?_, hid, fun i => ?_⟩
  · by_cases hi : i < tab.caps.size
    · have := hent i hi; simp only [Bool.and_eq_true, decide_eq_true_eq] at this; exact this.1.1.1
    · rw [getD_ge _ _ _ (by omega)]; simp
  · by_cases hi : i < tab.caps.size
    · have := hent i hi; simp only [Bool.and_eq_true, decide_eq_true_eq] at this; exact this.1.1.2
    · rw [getD_ge _ _ _ (by omega)]; norm_num
  · by_cases hi : i < tab.caps.size
    · have := hent i hi; simp only [Bool.and_eq_true, decide_eq_true_eq] at this; exact this.1.2
    · rw [getD_ge _ _ _ (by omega)]; norm_num

/-- **the native per-job table check gives `TabOK`** -/
theorem tabOK_of_check {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop} (rowE lb : ℕ → ℕ)
    (hTS : R3RT.SpecO.TableSpec O Ω rowE lb) (hcls : R3RT.SpecO.ClassFactsC Ω lb) (tab : Tab)
    (h : tabCheck tab rowE = true) : R3RT.SpecO.TabOK O Ω (tabV tab) ∧ TabWF tab := by
  have hW := tabWF_of_check tab rowE h
  refine ⟨?_, hW⟩
  have hent : ∀ i < tab.caps.size, rowE (tab.ids.getD i 0) = rowT tab i + capOf tab i * 2 ^ 511 := by
    unfold tabCheck at h
    simp only [Bool.and_eq_true, beq_iff_eq] at h
    intro i hi
    have := (allN_iff _ _).mp h.2 i hi
    simp only [Bool.and_eq_true, beq_iff_eq] at this
    rw [this.2]; unfold rowT capOf; rw [if_pos (by rw [hW.rows]; omega)]
  have hdig : ∀ q j, j < 64 → (chunkV tab q >>> (552 * j)) % 2 ^ 552 = tabV tab (64 * q + j) := by
    intro q j hj
    rw [Nat.shiftRight_eq_div_pow]
    exact E1S.dig_pk 552 _ 64 (fun v _ => tabV_lt tab hW _) j hj
  apply hTS (chunkV tab) (tabV tab) tab.caps.size ((tab.caps.size + 63) / 64)
  · intro i
    rw [hdig (i / 64) (i % 64) (Nat.mod_lt _ (by norm_num)), show 64 * (i / 64) + i % 64 = i by omega]
  · intro q hq
    unfold chunkV E1S.pk
    apply Finset.sum_eq_zero; intro j hj
    have hj64 := Finset.mem_range.mp hj
    show tabV tab (64 * q + j) * 2 ^ (552 * j) = 0
    rw [tabV_zero_of tab hW (64 * q + j) (by omega), Nat.zero_mul]
  · intro i hi; exact tabV_zero_of tab hW i hi
  · exact hcls
  · apply tabOKQ_of; intro q hq j hj
    rw [hdig q j hj]
    by_cases hin : tab.caps.size ≤ 64 * q + j
    · left; exact hin
    · right; rw [tabV_hi tab hW, tabV_lo tab hW]; exact hent _ (by omega)

end NNP
