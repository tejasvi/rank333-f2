module
public import R22Port.U_d41d8cd98f00
public import GS.PhA1
/-! # Track A, part 2: ranges, groups, packing and popcount (`rangesOK`, `takeA`/`grpsOK`, `pk`, `pc32`, `offsL`)

* `rangesOK_spec`: consecutive ranges `(as[i], lo_i, hi_i)` covering `[pos, total)`;
* `grpsOK_spec`: the groups partition the part lists consecutively, group `i` has first factor `as[i]`, offset the sum of the
  earlier counts, field packs the windows of `PB1`, `PC1`, and its entries have first factor `as[i]`;
* `pk_eq`: `pk 32 L` is the stride-32 pack of `L` (fields `< 2^32`, length `≤ 2^24`);
* `pc32_eq`: `pc32 M = cntM M` for a stride-32 0/1 mask over 512 fields; `pc32_low`: with the bits below `32 X`, `rankM`. -/
@[expose] public section
namespace GS
open G G.A2 G.D2 Finset

/-! ## ranges -/

def rg (rs : List (ℕ × ℕ × ℕ)) (i : ℕ) : ℕ × ℕ × ℕ := rs.getD i (0, 0, 0)

theorem rangesOK_spec : ∀ (rs : List (ℕ × ℕ × ℕ)) (as : List ℕ) (pos total : ℕ), rangesOK rs as pos total = true →
    rs.length = as.length ∧ pos ≤ total ∧
    (∀ i < rs.length, (rg rs i).1 = as.getD i 0 ∧ pos ≤ (rg rs i).2.1 ∧ (rg rs i).2.1 ≤ (rg rs i).2.2 ∧ (rg rs i).2.2 ≤ total) ∧
    (∀ c, pos ≤ c → c < total → ∃ i < rs.length, (rg rs i).2.1 ≤ c ∧ c < (rg rs i).2.2) ∧
    (∀ i < rs.length, ∀ j < rs.length, i < j → (rg rs i).2.2 ≤ (rg rs j).2.1)
  | [], [], pos, total, h => by
    have : pos = total := Nat.eq_of_beq_eq_true h
    subst this
    refine ⟨rfl, le_rfl, by simp, ?_, by simp⟩
    intro c h1 h2; omega
  | (a, lo, hi) :: rs, b :: bs, pos, total, h => by
    have h' : (Nat.beq a b && Nat.beq lo pos && Nat.ble lo hi && rangesOK rs bs hi total) = true := h
    simp only [Bool.and_eq_true, Nat.ble_eq] at h'
    obtain ⟨⟨⟨hab, hlo⟩, hle⟩, hr⟩ := h'
    have hab' : a = b := Nat.eq_of_beq_eq_true hab
    have hlo' : lo = pos := Nat.eq_of_beq_eq_true hlo
    obtain ⟨hlen, hht, hrg, hcov, hord⟩ := rangesOK_spec rs bs hi total hr
    refine ⟨by simp [hlen], by omega, ?_, ?_, ?_⟩
    · intro i hi'
      rcases i with _ | i
      · simp only [rg, List.getD_cons_zero]; exact ⟨hab', by omega, hle, hht⟩
      · simp only [rg, List.getD_cons_succ] at *
        simp only [List.length_cons] at hi'
        obtain ⟨h1, h2, h3, h4⟩ := hrg i (by omega)
        exact ⟨h1, by omega, h3, h4⟩
    · intro c h1 h2
      by_cases hc : c < hi
      · exact ⟨0, by simp, by simp [rg]; omega, by simp [rg]; omega⟩
      · obtain ⟨i, hi', h3, h4⟩ := hcov c (by omega) h2
        exact ⟨i + 1, by simp; omega, by simpa [rg] using h3, by simpa [rg] using h4⟩
    · intro i hi' j hj hij
      rcases j with _ | j
      · omega
      · rcases i with _ | i
        · simp only [rg, List.getD_cons_zero, List.getD_cons_succ]
          simp only [List.length_cons] at hj
          exact (hrg j (by omega)).2.1
        · simp only [rg, List.getD_cons_succ]
          simp only [List.length_cons] at hi' hj
          exact hord i (by omega) j (by omega) (by omega)
  | [], _ :: _, _, _, h => by simp [rangesOK] at h
  | _ :: _, [], _, _, h => by simp [rangesOK] at h

/-! ## groups of the rank-1 lists -/

theorem takeA_spec (a : ℕ) : ∀ (n : ℕ) (L L' : List ℕ), takeA a n L = some L' →
    L.length = n + L'.length ∧ (∀ j < n, eA (L.getD j 0) = a) ∧ ∀ j, L'.getD j 0 = L.getD (n + j) 0
  | 0, L, L', h => by
    have : L = L' := by simpa [takeA] using h
    subst this; simp
  | n + 1, e :: es, L', h => by
    have h' : cond (Nat.beq (eA e) a) (takeA a n es) none = some L' := h
    cases he : Nat.beq (eA e) a
    · rw [he] at h'; simp at h'
    · rw [he] at h'; simp only [cond_true] at h'
      obtain ⟨hl, hA, hg⟩ := takeA_spec a n es L' h'
      refine ⟨by simp [hl]; omega, ?_, ?_⟩
      · intro j hj
        rcases j with _ | j
        · simpa using Nat.eq_of_beq_eq_true he
        · simpa using hA j (by omega)
      · intro j; rw [hg j, show n + 1 + j = (n + j) + 1 by omega]; simp
  | n + 1, [], L', h => by simp [takeA] at h

def gsum (gs : List Grp) (f : Grp → ℕ) (i : ℕ) : ℕ := ∑ i' ∈ range i, f (gs.getD i' g0)

theorem grpsOK_spec (PB1 PC1 : ℕ) : ∀ (gs : List Grp) (as B1 C1 : List ℕ) (pb pc : ℕ), grpsOK PB1 PC1 gs as B1 C1 pb pc = true →
    gs.length = as.length ∧ B1.length = gsum gs Grp.nb gs.length ∧ C1.length = gsum gs Grp.nc gs.length ∧
    ∀ i < gs.length, (gs.getD i g0).a = as.getD i 0 ∧ (gs.getD i g0).lb = pb + gsum gs Grp.nb i ∧
      (gs.getD i g0).lc = pc + gsum gs Grp.nc i ∧
      (gs.getD i g0).PB = win PB1 (32 * (gs.getD i g0).lb) (32 * (gs.getD i g0).nb) ∧
      (gs.getD i g0).PC = win PC1 (32 * (gs.getD i g0).lc) (32 * (gs.getD i g0).nc) ∧
      (∀ j < (gs.getD i g0).nb, eA (B1.getD (gsum gs Grp.nb i + j) 0) = as.getD i 0) ∧
      (∀ j < (gs.getD i g0).nc, eA (C1.getD (gsum gs Grp.nc i + j) 0) = as.getD i 0)
  | [], [], B1, C1, pb, pc, h => by
    cases B1 with
    | nil => cases C1 with
      | nil => simp [gsum]
      | cons _ _ => simp [grpsOK] at h
    | cons _ _ => cases C1 <;> simp [grpsOK] at h
  | g :: gs, a :: as, B1, C1, pb, pc, h => by
    have h' : (Nat.beq g.a a && Nat.beq g.lb pb && Nat.beq g.lc pc &&
      Nat.beq g.PB (win PB1 (Nat.mul 32 pb) (Nat.mul 32 g.nb)) && Nat.beq g.PC (win PC1 (Nat.mul 32 pc) (Nat.mul 32 g.nc)) &&
      (match takeA a g.nb B1, takeA a g.nc C1 with
       | some B1', some C1' => grpsOK PB1 PC1 gs as B1' C1' (Nat.add pb g.nb) (Nat.add pc g.nc)
       | _, _ => false)) = true := by
      cases B1 <;> cases C1 <;> exact h
    simp only [Bool.and_eq_true] at h'
    obtain ⟨⟨⟨⟨⟨ha, hlb⟩, hlc⟩, hPB⟩, hPC⟩, hrest⟩ := h'
    have ha' : g.a = a := Nat.eq_of_beq_eq_true ha
    have hlb' : g.lb = pb := Nat.eq_of_beq_eq_true hlb
    have hlc' : g.lc = pc := Nat.eq_of_beq_eq_true hlc
    have hPB' : g.PB = win PB1 (32 * pb) (32 * g.nb) := Nat.eq_of_beq_eq_true hPB
    have hPC' : g.PC = win PC1 (32 * pc) (32 * g.nc) := Nat.eq_of_beq_eq_true hPC
    cases hB : takeA a g.nb B1 with
    | none => rw [hB] at hrest; simp at hrest
    | some B1' =>
      cases hC : takeA a g.nc C1 with
      | none => rw [hB, hC] at hrest; simp at hrest
      | some C1' =>
        rw [hB, hC] at hrest; simp only at hrest
        obtain ⟨hlB, hAB, hgB⟩ := takeA_spec a g.nb B1 B1' hB
        obtain ⟨hlC, hAC, hgC⟩ := takeA_spec a g.nc C1 C1' hC
        obtain ⟨hlen, hl1, hl2, hall⟩ := grpsOK_spec PB1 PC1 gs as B1' C1' _ _ hrest
        have hsB : ∀ i, gsum (g :: gs) Grp.nb (i + 1) = g.nb + gsum gs Grp.nb i := by
          intro i; unfold gsum; rw [Finset.sum_range_succ']; simp; ring
        have hsC : ∀ i, gsum (g :: gs) Grp.nc (i + 1) = g.nc + gsum gs Grp.nc i := by
          intro i; unfold gsum; rw [Finset.sum_range_succ']; simp; ring
        refine ⟨by simp [hlen], ?_, ?_, ?_⟩
        · simp only [List.length_cons]; rw [hsB, hlB, hl1]
        · simp only [List.length_cons]; rw [hsC, hlC, hl2]
        · intro i hi
          rcases i with _ | i
          · simp only [List.getD_cons_zero]
            refine ⟨ha', by simp [gsum, hlb'], by simp [gsum, hlc'], by rw [hPB', hlb'], by rw [hPC', hlc'], ?_, ?_⟩
            · intro j hj; simp only [gsum, Finset.range_zero, Finset.sum_empty, Nat.zero_add]; exact hAB j hj
            · intro j hj; simp only [gsum, Finset.range_zero, Finset.sum_empty, Nat.zero_add]; exact hAC j hj
          · simp only [List.getD_cons_succ]
            simp only [List.length_cons] at hi
            obtain ⟨h1, h2, h3, h4, h5, h6, h7⟩ := hall i (by omega)
            refine ⟨h1, ?_, ?_, h4, h5, ?_, ?_⟩
            · rw [h2, hsB]; show pb + g.nb + _ = _; omega
            · rw [h3, hsC]; show pc + g.nc + _ = _; omega
            · intro j hj; rw [hsB, Nat.add_assoc, ← hgB]; exact h6 j hj
            · intro j hj; rw [hsC, Nat.add_assoc, ← hgC]; exact h7 j hj
  | [], _ :: _, B1, C1, _, _, h => by cases B1 <;> cases C1 <;> simp [grpsOK] at h
  | _ :: _, [], B1, C1, _, _, h => by cases B1 <;> cases C1 <;> simp [grpsOK] at h

/-! ## `pk`: pairwise packing -/

theorem packPairs_len (w : ℕ) : ∀ L : List ℕ, (packPairs w L).length = (L.length + 1) / 2
  | [] => by simp [packPairs]
  | [_] => by simp [packPairs]
  | x :: y :: rest => by
    show (packPairs w rest).length + 1 = _
    rw [packPairs_len w rest]; simp; omega

theorem packPairs_get (w : ℕ) : ∀ (L : List ℕ), (∀ x ∈ L, x < 2 ^ w) → ∀ k,
    (packPairs w L).getD k 0 = L.getD (2 * k) 0 + L.getD (2 * k + 1) 0 * 2 ^ w
  | [], _, k => by simp [packPairs]
  | [x], _, k => by
    rcases k with _ | k
    · simp [packPairs]
    · simp [packPairs]
  | x :: y :: rest, hL, k => by
    show (Nat.lor x (Nat.shiftLeft y w) :: packPairs w rest).getD k 0 = _
    rcases k with _ | k
    · simp only [List.getD_cons_zero, Nat.mul_zero, Nat.zero_add, List.getD_cons_succ]
      have hx : x < 2 ^ w := hL x List.mem_cons_self
      show x ||| (y <<< w) = _
      rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hx, Nat.shiftLeft_eq]; ring
    · simp only [List.getD_cons_succ]
      rw [packPairs_get w rest (fun z hz => hL z (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ hz))) k]
      rw [show 2 * (k + 1) = 2 * k + 1 + 1 by ring]
      simp only [List.getD_cons_succ]

/-- the stride-`w` pack of a list -/
def pkw (w : ℕ) (L : List ℕ) : ℕ := ∑ k ∈ range L.length, L.getD k 0 * 2 ^ (w * k)

theorem packAll_eq : ∀ (f w : ℕ) (L : List ℕ), (∀ x ∈ L, x < 2 ^ w) → L.length ≤ 2 ^ f →
    packAll w (f + 1) L = pkw w L
  | 0, w, L, hL, hlen => by
    match L, hlen with
    | [], _ => simp [packAll, pkw]
    | [x], _ => simp [packAll, pkw]
  | f + 1, w, L, hL, hlen => by
    match L, hL, hlen with
    | [], _, _ => simp [packAll, pkw]
    | [x], _, _ => simp [packAll, pkw]
    | x :: y :: rest, hL, hlen =>
      show packAll (Nat.mul 2 w) (f + 1) (packPairs w (x :: y :: rest)) = _
      have hP : ∀ z ∈ packPairs w (x :: y :: rest), z < 2 ^ (Nat.mul 2 w) := by
        intro z hz
        obtain ⟨k, hk, rfl⟩ : ∃ k < (packPairs w (x :: y :: rest)).length, (packPairs w (x :: y :: rest)).getD k 0 = z := by
          obtain ⟨k, hk, hget⟩ := List.getElem_of_mem hz
          exact ⟨k, hk, by rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hk]; simpa using hget⟩
        rw [packPairs_get w _ hL k]
        have h1 : (x :: y :: rest).getD (2 * k) 0 < 2 ^ w := by
          by_cases hh : 2 * k < (x :: y :: rest).length
          · exact hL _ (getD_mem hh)
          · rw [List.getD_eq_default _ _ (Nat.le_of_not_lt hh)]; exact Nat.two_pow_pos w
        have h2 : (x :: y :: rest).getD (2 * k + 1) 0 < 2 ^ w := by
          by_cases hh : 2 * k + 1 < (x :: y :: rest).length
          · exact hL _ (getD_mem hh)
          · rw [List.getD_eq_default _ _ (Nat.le_of_not_lt hh)]; exact Nat.two_pow_pos w
        have : 2 ^ (Nat.mul 2 w) = 2 ^ w * 2 ^ w := by rw [show Nat.mul 2 w = w + w from Nat.two_mul w, pow_add]
        rw [this]
        calc (x :: y :: rest).getD (2 * k) 0 + (x :: y :: rest).getD (2 * k + 1) 0 * 2 ^ w
            < 2 ^ w + (x :: y :: rest).getD (2 * k + 1) 0 * 2 ^ w := by omega
          _ ≤ 2 ^ w + (2 ^ w - 1) * 2 ^ w := by
              apply Nat.add_le_add_left; exact Nat.mul_le_mul_right _ (by omega)
          _ = 2 ^ w * 2 ^ w := by
              obtain ⟨q, hq⟩ : ∃ q, 2 ^ w = q + 1 := ⟨2 ^ w - 1, by have := Nat.two_pow_pos w; omega⟩
              rw [hq, Nat.add_sub_cancel]; ring
      have hPlen : (packPairs w (x :: y :: rest)).length ≤ 2 ^ f := by
        rw [packPairs_len]; rw [pow_succ] at hlen; omega
      rw [packAll_eq f (Nat.mul 2 w) _ hP hPlen]
      unfold pkw
      rw [packPairs_len]
      simp only [packPairs_get w _ hL]
      -- regroup Σ_k (L[2k] + L[2k+1] 2^w) 2^(2wk) = Σ_j L[j] 2^(wj)
      set L := x :: y :: rest with hLdef
      have hsplit : ∀ n, ∑ j ∈ range (2 * n), L.getD j 0 * 2 ^ (w * j) =
          ∑ k ∈ range n, (L.getD (2 * k) 0 + L.getD (2 * k + 1) 0 * 2 ^ w) * 2 ^ (Nat.mul 2 w * k) := by
        intro n
        induction n with
        | zero => simp
        | succ n ih =>
          rw [show 2 * (n + 1) = 2 * n + 1 + 1 by ring, Finset.sum_range_succ, Finset.sum_range_succ, ih,
            Finset.sum_range_succ]
          have e1 : 2 ^ (w * (2 * n + 1)) = 2 ^ w * 2 ^ (Nat.mul 2 w * n) := by
            rw [← pow_add]; congr 1; show _ = w + 2 * w * n; ring
          have e2 : 2 ^ (w * (2 * n)) = 2 ^ (Nat.mul 2 w * n) := by congr 1; show _ = 2 * w * n; ring
          rw [e1, e2]; ring
      have hzero : ∀ j, L.length ≤ j → L.getD j 0 = 0 := fun j hj => List.getD_eq_default _ _ hj
      rw [← hsplit]
      -- the sum up to 2 * ⌈n/2⌉ equals the sum up to n (the extra term is 0)
      rcases Nat.even_or_odd L.length with ⟨m, hm⟩ | ⟨m, hm⟩
      · rw [show (L.length + 1) / 2 = m by omega, show 2 * m = L.length by omega]
      · rw [show (L.length + 1) / 2 = m + 1 by omega, show 2 * (m + 1) = L.length + 1 by omega, Finset.sum_range_succ,
          hzero L.length le_rfl, Nat.zero_mul, Nat.add_zero]

theorem pk_eq (L : List ℕ) (hL : ∀ x ∈ L, x < 2 ^ 32) (hlen : L.length ≤ 2 ^ 24) : pk 32 L = pk32 (fun k => L.getD k 0) L.length := by
  unfold pk
  rw [show (25 : ℕ) = 24 + 1 from rfl, packAll_eq 24 32 L hL hlen]
  rfl

/-! ## `pc32` -/

theorem R512_eq : G.LS.R512 = rep32 512 := rfl

/-- the product of two packs is the pack of the convolution (no carries are claimed here) -/
theorem pk32_mul_pk32 (f g : ℕ → ℕ) (n m : ℕ) :
    pk32 f n * pk32 g m = pk32 (fun i => ∑ k ∈ range n, ∑ j ∈ range m, if k + j = i then f k * g j else 0) (n + m) := by
  calc pk32 f n * pk32 g m = ∑ k ∈ range n, ∑ j ∈ range m, f k * g j * 2 ^ (32 * (k + j)) := by
        unfold pk32; rw [Finset.sum_mul_sum]
        apply Finset.sum_congr rfl; intro k _; apply Finset.sum_congr rfl; intro j _
        rw [Nat.mul_add, pow_add]; ring
    _ = ∑ k ∈ range n, ∑ j ∈ range m, ∑ i ∈ range (n + m),
          if k + j = i then f k * g j * 2 ^ (32 * (k + j)) else 0 := by
        apply Finset.sum_congr rfl; intro k hk; apply Finset.sum_congr rfl; intro j hj
        rw [Finset.sum_ite_eq, if_pos (by simp only [mem_range] at hk hj ⊢; omega)]
    _ = ∑ k ∈ range n, ∑ i ∈ range (n + m), ∑ j ∈ range m,
          if k + j = i then f k * g j * 2 ^ (32 * (k + j)) else 0 := by
        apply Finset.sum_congr rfl; intro k _; exact Finset.sum_comm
    _ = ∑ i ∈ range (n + m), ∑ k ∈ range n, ∑ j ∈ range m,
          if k + j = i then f k * g j * 2 ^ (32 * (k + j)) else 0 := Finset.sum_comm
    _ = pk32 (fun i => ∑ k ∈ range n, ∑ j ∈ range m, if k + j = i then f k * g j else 0) (n + m) := by
        unfold pk32
        apply Finset.sum_congr rfl; intro i _
        rw [Finset.sum_mul]; apply Finset.sum_congr rfl; intro k _
        rw [Finset.sum_mul]; apply Finset.sum_congr rfl; intro j _
        split_ifs with h
        · rw [h]
        · simp

theorem sum_ite_add_eq (k i m x : ℕ) :
    (∑ j ∈ range m, if k + j = i then x else 0) = if k ≤ i ∧ i - k < m then x else 0 := by
  by_cases h : k ≤ i ∧ i - k < m
  · rw [if_pos h, Finset.sum_eq_single (i - k)]
    · rw [if_pos (by omega)]
    · intro j _ hj; rw [if_neg (by omega)]
    · intro hj; exact absurd (mem_range.mpr h.2) hj
  · rw [if_neg h]; apply Finset.sum_eq_zero; intro j hj; rw [if_neg]; intro e; apply h; simp at hj; omega

theorem testBit_ite01 (c : Bool) (j : ℕ) : (if c = true then (1 : ℕ) else 0).testBit j = (c && decide (j = 0)) := by
  cases c
  · simp
  · simp only [if_true, Bool.true_and]
    rcases j with _ | j
    · decide
    · rw [Nat.testBit_eq_false_of_lt]
      · simp
      · calc (1 : ℕ) < 2 := by norm_num
          _ ≤ 2 ^ (j + 1) := by
            calc (2 : ℕ) = 2 ^ 1 := by norm_num
              _ ≤ 2 ^ (j + 1) := Nat.pow_le_pow_right (by norm_num) (by omega)

/-- `pc32` reads field 511 of the product with `R512` -/
theorem pc32_fld (M : ℕ) : pc32 M = fld (M * rep32 512) 511 := by
  unfold pc32 fld
  show ((M * G.LS.R512) >>> (32 * 511)) &&& 4294967295 = _
  rw [R512_eq, show (4294967295 : ℕ) = 2 ^ 32 - 1 by norm_num, land_two_pow_sub_one, Nat.shiftRight_eq_div_pow]

/-- the values of a mask with bits only at `32 k`, `k < 512` -/
def MOK (M : ℕ) : Prop := ∀ p, M.testBit p = true → p % 32 = 0 ∧ p / 32 < 512

theorem cntM_eq512 (M : ℕ) (hM : MOK M) : cntM M = ((range 512).filter (fun k => M.testBit (32 * k) = true)).card := by
  unfold cntM rankM
  apply congrArg Finset.card
  ext k; simp only [mem_filter, mem_range]
  constructor
  · rintro ⟨_, hk⟩; refine ⟨?_, hk⟩; have := (hM _ hk).2; omega
  · rintro ⟨_, hk⟩; exact ⟨lt_of_testBit32 hk, hk⟩

/-- **popcount**: for a stride-32 0/1 mask over 512 fields, `pc32 M` is the number of its values -/
theorem pc32_eq (M : ℕ) (hM : MOK M) : pc32 M = cntM M := by
  set b : ℕ → ℕ := fun k => if M.testBit (32 * k) = true then 1 else 0 with hb
  have hb1 : ∀ k, b k ≤ 1 := fun k => by simp only [hb]; split <;> norm_num
  have hb2 : ∀ k, b k < 2 ^ 32 := fun k => lt_of_le_of_lt (hb1 k) (by norm_num)
  have hMb : M = pk32 b 512 := by
    apply Nat.eq_of_testBit_eq; intro p
    rw [testBit_pk32 b 512 p (fun k _ => hb2 k)]
    simp only [hb, testBit_ite01]
    by_cases hp : M.testBit p = true
    · obtain ⟨h1, h2⟩ := hM p hp
      have e : 32 * (p / 32) = p := by omega
      rw [e, hp]; simp [h1, h2]
    · rw [Bool.not_eq_true] at hp
      rw [hp]
      by_cases h1 : p % 32 = 0
      · have e : 32 * (p / 32) = p := by omega
        rw [e, hp]; simp
      · simp [h1]
  have hprod : M * rep32 512 = pk32 (fun i => ∑ k ∈ range 512, if k ≤ i ∧ i - k < 512 then b k else 0) 1024 := by
    rw [hMb, rep32_pk, pk32_mul_pk32]
    unfold pk32
    apply Finset.sum_congr rfl; intro i _
    apply congrArg (· * 2 ^ (32 * i))
    apply Finset.sum_congr rfl; intro k _
    rw [sum_ite_add_eq k i 512 (b k * 1), Nat.mul_one]
  have hc : ∀ i, (∑ k ∈ range 512, if k ≤ i ∧ i - k < 512 then b k else 0) < 2 ^ 32 := by
    intro i
    calc (∑ k ∈ range 512, if k ≤ i ∧ i - k < 512 then b k else 0) ≤ ∑ k ∈ range 512, 1 := by
          apply Finset.sum_le_sum; intro k _; split
          · exact hb1 k
          · exact Nat.zero_le _
      _ < 2 ^ 32 := by simp
  rw [pc32_fld, hprod, fld_pk32 _ 1024 511 (fun i _ => hc i) (by norm_num), cntM_eq512 M hM]
  have : (∑ k ∈ range 512, if k ≤ 511 ∧ 511 - k < 512 then b k else 0) = ∑ k ∈ range 512, b k := by
    apply Finset.sum_congr rfl; intro k hk; simp only [mem_range] at hk; rw [if_pos (by omega)]
  rw [this, Finset.card_filter]

/-- the popcount of the values below `X` is the rank -/
theorem pc32_low (M X : ℕ) (hM : MOK M) :
    pc32 (Nat.land M (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 X)) 1)) = rankM M X := by
  have e : Nat.land M (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 X)) 1) = M &&& (2 ^ (32 * X) - 1) := by
    rw [← shiftLeft_one]; rfl
  have hb : ∀ p, (M &&& (2 ^ (32 * X) - 1)).testBit p = (M.testBit p && decide (p < 32 * X)) := by
    intro p; rw [Nat.testBit_and, Nat.testBit_two_pow_sub_one]
  rw [e, pc32_eq _ (fun p hp => hM p (by rw [hb] at hp; simp only [Bool.and_eq_true] at hp; exact hp.1))]
  unfold cntM rankM
  apply congrArg Finset.card
  ext k; simp only [mem_filter, mem_range, hb, Bool.and_eq_true, decide_eq_true_eq]
  constructor
  · rintro ⟨_, h1, h2⟩; exact ⟨by omega, h1⟩
  · rintro ⟨h1, h2⟩
    refine ⟨?_, h2, by omega⟩
    have := lt_of_testBit32 (M := M &&& (2 ^ (32 * X) - 1)) (X := k) (by rw [hb]; simp [h2]; omega)
    exact this

end GS

#print axioms GS.rangesOK_spec
#print axioms GS.grpsOK_spec
#print axioms GS.pk_eq
#print axioms GS.pc32_eq
#print axioms GS.pc32_low
