module
public import R22Port.U_d41d8cd98f00
public import E1G.Sem2
/-! # Weak duality and the multiplicity order

* `wd_bound`: `∑ t m + SC (∑ x - ∑ m) + (t_{l0} - SC)(x_{l0} - m_{l0}) ≤ ∑ t x + ∑_{l ≥ pos} u_l (SC - t_l)` for every `x`
  extending `m` by labels `≥ pos` within the budgets `u` (`SC = 2^30`, truncated subtraction).
* `VR_lt_iff`: reversed packings compare by the first differing label.
* `prefix_lex`: if a prefix `p` of `x` has an image `q` (inside the image `Q` of `x`, same size) that is larger at the first
  difference, then so is `Q` against `x`.
* `imgR_eq`: the checker's image of a packed prefix. -/
@[expose] public section
set_option maxRecDepth 20000
namespace E1GS
open Finset
set_option exponentiation.threshold 600

/-! ## Weak duality -/

theorem wd_term (t x m u : ℕ) (hmx : m ≤ x) (hu : x ≤ m + u) (free : Bool) (hfix : free = false → x = m) :
    t * m + 2 ^ 30 * (x - m) + (t - 2 ^ 30) * (x - m) ≤ t * x + (if free then u * (2 ^ 30 - t) else 0) := by
  obtain ⟨y, rfl⟩ : ∃ y, x = m + y := ⟨x - m, by omega⟩
  rw [show m + y - m = y by omega]
  cases free
  · have : y = 0 := by have := hfix rfl; omega
    subst this; simp
  · simp only [if_true]
    by_cases ht : 2 ^ 30 ≤ t
    · have e : (t - 2 ^ 30) * y + 2 ^ 30 * y = t * y := by rw [← Nat.add_mul, Nat.sub_add_cancel ht]
      nlinarith
    · have e : t - 2 ^ 30 = 0 := by omega
      rw [e, zero_mul, Nat.add_zero]
      have hy : y ≤ u := by omega
      have h1 : (2 ^ 30 - t) * y ≤ u * (2 ^ 30 - t) := by rw [mul_comm]; exact Nat.mul_le_mul_right _ hy
      have h2 : 2 ^ 30 * y = t * y + (2 ^ 30 - t) * y := by rw [← Nat.add_mul, Nat.add_sub_cancel' (by omega)]
      nlinarith

theorem wd_bound (x m u t : ℕ → ℕ) (pos l0 : ℕ) (hl0 : l0 < 127)
    (hmx : ∀ l < 127, m l ≤ x l) (hpos : ∀ l < pos, x l = m l) (hu : ∀ l < 127, x l ≤ m l + u l) :
    ∑ l ∈ range 127, t l * m l + 2 ^ 30 * (∑ l ∈ range 127, x l - ∑ l ∈ range 127, m l) + (t l0 - 2 ^ 30) * (x l0 - m l0)
      ≤ ∑ l ∈ range 127, t l * x l + ∑ l ∈ range 127, (if pos ≤ l then u l * (2 ^ 30 - t l) else 0) := by
  rw [← Finset.sum_tsub_distrib _ (fun l hl => hmx l (Finset.mem_range.mp hl)), Finset.mul_sum, ← Finset.sum_add_distrib,
    ← Finset.sum_add_distrib]
  have hterm : ∀ l ∈ range 127, t l * m l + 2 ^ 30 * (x l - m l) + (if l = l0 then (t l - 2 ^ 30) * (x l - m l) else 0)
      ≤ t l * x l + (if pos ≤ l then u l * (2 ^ 30 - t l) else 0) := by
    intro l hl; rw [Finset.mem_range] at hl
    have h := wd_term (t l) (x l) (m l) (u l) (hmx l hl) (hu l hl) (decide (pos ≤ l)) (fun hf => hpos l (by simpa using hf))
    simp only [decide_eq_true_eq] at h
    split
    · exact h
    · omega
  have := Finset.sum_le_sum hterm
  rw [Finset.sum_add_distrib, Finset.sum_ite_eq' (range 127) l0, if_pos (Finset.mem_range.mpr hl0)] at this
  exact this

/-! ## The order of reversed packings -/

theorem pk_lt_iff (B : ℕ) (a b : ℕ → ℕ) (L : ℕ) (ha : ∀ v < L, a v < 2 ^ B) (hb : ∀ v < L, b v < 2 ^ B) :
    pk B a L < pk B b L ↔ ∃ k < L, (∀ i, k < i → i < L → a i = b i) ∧ a k < b k := by
  induction L with
  | zero => simp [pk]
  | succ L ih =>
    have ih' := ih (fun v hv => ha v (by omega)) (fun v hv => hb v (by omega))
    rw [pk_succ, pk_succ]
    have hla := pk_lt B a L (fun v hv => ha v (by omega))
    have hlb := pk_lt B b L (fun v hv => hb v (by omega))
    constructor
    · intro h
      rcases lt_trichotomy (a L) (b L) with hab | hab | hab
      · exact ⟨L, by omega, fun i h1 h2 => by omega, hab⟩
      · rw [hab] at h
        obtain ⟨k, hk, h1, h2⟩ := ih'.mp (by omega)
        refine ⟨k, by omega, fun i hi1 hi2 => ?_, h2⟩
        rcases (by omega : i < L ∨ i = L) with hi | hi
        · exact h1 i hi1 hi
        · rw [hi]; exact hab
      · exfalso
        have : (b L + 1) * 2 ^ (B * L) ≤ a L * 2 ^ (B * L) := Nat.mul_le_mul_right _ hab
        nlinarith
    · rintro ⟨k, hk, h1, h2⟩
      rcases (by omega : k < L ∨ k = L) with hkL | hkL
      · have hL : a L = b L := h1 L hkL (by omega)
        have := ih'.mpr ⟨k, hkL, fun i hi1 hi2 => h1 i hi1 (by omega), h2⟩
        rw [hL]; omega
      · subst hkL
        have : (a k + 1) * 2 ^ (B * k) ≤ b k * 2 ^ (B * k) := Nat.mul_le_mul_right _ h2
        nlinarith

theorem VR_lt_iff (a b : ℕ → ℕ) (ha : ∀ l < 127, a l < 2 ^ 128) (hb : ∀ l < 127, b l < 2 ^ 128) :
    VR a < VR b ↔ ∃ j0 < 127, (∀ j < j0, a j = b j) ∧ a j0 < b j0 := by
  rw [show VR a = pk 128 (fun j => a (126 - j)) 127 from rfl, show VR b = pk 128 (fun j => b (126 - j)) 127 from rfl,
    pk_lt_iff 128 _ _ 127 (fun v _ => ha _ (by omega)) (fun v _ => hb _ (by omega))]
  constructor
  · rintro ⟨k, hk, h1, h2⟩
    refine ⟨126 - k, by omega, fun j hj => ?_, h2⟩
    have := h1 (126 - j) (by omega) (by omega)
    rwa [show 126 - (126 - j) = j by omega] at this
  · rintro ⟨j0, hj0, h1, h2⟩
    refine ⟨126 - j0, by omega, fun i hi1 hi2 => h1 _ (by omega), by rwa [show 126 - (126 - j0) = j0 by omega]⟩

/-- **Prefix lemma.** `p` is the prefix of `x` up to label `ls`; its image `q` lies inside the image `Q` of `x` and has the
same size.  If `q` beats `p` at their first difference, `Q` beats `x` at theirs. -/
theorem prefix_lex (p x q Q : ℕ → ℕ) (ls : ℕ) (hls : ls < 127)
    (hpx : ∀ j < ls, p j = x j) (hpl : p ls ≤ x ls) (hp0 : ∀ j, ls < j → j < 127 → p j = 0)
    (hqQ : ∀ k < 127, q k ≤ Q k) (hsum : ∑ k ∈ range 127, q k = ∑ k ∈ range 127, p k)
    (hlt : ∃ j0 < 127, (∀ j < j0, p j = q j) ∧ p j0 < q j0) :
    ∃ j1 < 127, (∀ j < j1, x j = Q j) ∧ x j1 < Q j1 := by
  obtain ⟨j0, hj0, h1, h2⟩ := hlt
  -- the first difference is below `ls`
  have hj0ls : j0 < ls := by
    by_contra hc
    have hsplitq : ∑ k ∈ range (j0 + 1), q k ≤ ∑ k ∈ range 127, q k :=
      Finset.sum_le_sum_of_subset (Finset.range_subset_range.mpr (by omega))
    have hsplitp : ∑ k ∈ range 127, p k = ∑ k ∈ range (j0 + 1), p k := by
      rw [← Finset.sum_range_add_sum_Ico _ (show j0 + 1 ≤ 127 by omega)]
      have : ∑ k ∈ Finset.Ico (j0 + 1) 127, p k = 0 := by
        apply Finset.sum_eq_zero; intro k hk; rw [Finset.mem_Ico] at hk; exact hp0 k (by omega) (by omega)
      rw [this, Nat.add_zero]
    have hlow : ∑ k ∈ range j0, q k = ∑ k ∈ range j0, p k := by
      apply Finset.sum_congr rfl; intro k hk; rw [Finset.mem_range] at hk; exact (h1 k hk).symm
    rw [Finset.sum_range_succ q j0, hlow] at hsplitq
    rw [Finset.sum_range_succ p j0] at hsplitp
    omega
  -- the first difference of `x` and `Q` is at or below `j0`, in `Q`'s favour
  have hle : ∀ j ≤ j0, x j ≤ Q j := by
    intro j hj
    rcases (by omega : j < j0 ∨ j = j0) with h | h
    · rw [← hpx j (by omega), h1 j h]; exact hqQ j (by omega)
    · subst h; rw [← hpx j hj0ls]; exact le_trans (le_of_lt h2) (hqQ j (by omega))
  have hex : ∃ j, j ≤ j0 ∧ x j ≠ Q j := ⟨j0, le_rfl, by
    have := hqQ j0 hj0; rw [← hpx j0 hj0ls] at *; omega⟩
  classical
  let j1 := Nat.find hex
  have hj1 : j1 ≤ j0 ∧ x j1 ≠ Q j1 := Nat.find_spec hex
  have hmin : ∀ j < j1, x j = Q j := by
    intro j hj
    by_contra hne
    exact Nat.find_min hex hj ⟨by omega, hne⟩
  exact ⟨j1, by omega, hmin, lt_of_le_of_ne (hle j1 hj1.1) hj1.2⟩

/-! ## Images of packed prefixes -/

/-- the label image of `l` under the permutation `gp` (`[7]` fields) -/
def gpf (gp l : ℕ) : ℕ := gp / 2 ^ (7 * l) % 128

/-- multiplicity of `k` among the images of the `d` labels of `pl` -/
def imR : ℕ → ℕ → ℕ → ℕ → ℕ
  | 0, _, _, _ => 0
  | d + 1, pl, gp, k => (if gpf gp (pl % 128) = k then 1 else 0) + imR d (pl / 128) gp k

theorem imR_eq_sum (gp : ℕ) (d : ℕ) : ∀ pl k, imR d pl gp k = ∑ l ∈ range 128, (if gpf gp l = k then multR d pl l else 0) := by
  induction d with
  | zero => intro pl k; simp [imR, multR]
  | succ d ih =>
    intro pl k
    simp only [imR, multR]
    rw [ih (pl / 128) k]
    have hlt : pl % 128 < 128 := Nat.mod_lt _ (by norm_num)
    rw [show ∑ l ∈ range 128, (if gpf gp l = k then (if pl % 128 = l then 1 else 0) + multR d (pl / 128) l else 0) =
      ∑ l ∈ range 128, (if l = pl % 128 then (if gpf gp l = k then 1 else 0) else 0) +
        ∑ l ∈ range 128, (if gpf gp l = k then multR d (pl / 128) l else 0) by
      rw [← Finset.sum_add_distrib]; apply Finset.sum_congr rfl; intro l _
      split_ifs <;> omega]
    rw [Finset.sum_ite_eq' (range 128) (pl % 128), if_pos (Finset.mem_range.mpr hlt)]

theorem imgR_gen (gp : ℕ) (d : ℕ) : ∀ acc pl, (∀ k, 127 ≤ k → imR d pl gp k = 0) →
    (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ) (fun acc _ => acc)
      (fun _ ih acc pl => ih (Nat.add acc (E1G.oner (Nat.land (Nat.shiftRight gp (Nat.mul 7 (E1G.rd 7 pl))) 127))) (E1G.sk 7 pl)) d acc pl)
      = acc + VR (imR d pl gp) := by
  induction d with
  | zero => intro acc pl _; simp [imR, VR_zero]
  | succ d ih =>
    intro acc pl hk
    have h0 : gpf gp (pl % 128) < 127 := by
      by_contra hc
      have := hk (gpf gp (pl % 128)) (by omega)
      simp [imR] at this
    have hk' : ∀ k, 127 ≤ k → imR d (pl / 128) gp k = 0 := by
      intro k hk1; have := hk k hk1; simp only [imR] at this; omega
    have e1 : Nat.land (Nat.shiftRight gp (Nat.mul 7 (E1G.rd 7 pl))) 127 = gpf gp (pl % 128) := by
      rw [rd_eq]
      show (gp >>> (7 * (pl % 2 ^ 7))) &&& (2 ^ 7 - 1) = _
      rw [Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow]; rfl
    have hstep : (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ) (fun acc _ => acc)
        (fun _ ih acc pl => ih (Nat.add acc (E1G.oner (Nat.land (Nat.shiftRight gp (Nat.mul 7 (E1G.rd 7 pl))) 127))) (E1G.sk 7 pl))
          (d + 1) acc pl) =
        (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ) (fun acc _ => acc)
        (fun _ ih acc pl => ih (Nat.add acc (E1G.oner (Nat.land (Nat.shiftRight gp (Nat.mul 7 (E1G.rd 7 pl))) 127))) (E1G.sk 7 pl))
          d (acc + E1G.oner (gpf gp (pl % 128))) (pl / 128)) := by
      show (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ) (fun acc _ => acc)
        (fun _ ih acc pl => ih (Nat.add acc (E1G.oner (Nat.land (Nat.shiftRight gp (Nat.mul 7 (E1G.rd 7 pl))) 127))) (E1G.sk 7 pl))
          d (Nat.add acc (E1G.oner (Nat.land (Nat.shiftRight gp (Nat.mul 7 (E1G.rd 7 pl))) 127))) (E1G.sk 7 pl)) = _
      rw [e1, sk_eq, show (2 : ℕ) ^ 7 = 128 by norm_num]; rfl
    rw [hstep, ih _ _ hk', oner_VR _ h0, Nat.add_assoc, VR_add]
    refine congrArg (acc + ·) (VR_congr _ _ (fun k _ => ?_))
    show (if k = gpf gp (pl % 128) then 1 else 0) + imR d (pl / 128) gp k =
      (if gpf gp (pl % 128) = k then 1 else 0) + imR d (pl / 128) gp k
    by_cases h : k = gpf gp (pl % 128)
    · rw [if_pos h, if_pos h.symm]
    · rw [if_neg h, if_neg (Ne.symm h)]

theorem imgR_eq (gp d pl : ℕ) (hk : ∀ k, 127 ≤ k → imR d pl gp k = 0) : E1G.imgR gp pl d = VR (imR d pl gp) := by
  have := imgR_gen gp d 0 pl hk
  rw [Nat.zero_add] at this
  exact this

end E1GS
