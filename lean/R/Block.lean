module
public import R22Port.U_d41d8cd98f00
public import R.Node
/-! # Blocks: an accepted native block is an accepted kernel block

* `mkRTd_slot`: the kernel's divide-and-conquer row table holds slot `sl IX_j` at position `j < n` and `0` past it.
* `block_ref`: `E1N.block D B = true → E1P.block C sl UB UBR (natB B) = true`, given the per-IP relation and the slots'
  reversal property (which every `JobOK` hypothesis supplies through `SlotV`). -/
@[expose] public section
namespace E1NR
open E1N Finset E1PS

local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)

variable {D : IPD} {C : E1P.Ctx} {sl : ℕ → ℕ} {UB UBR : ℕ}

/-! ## The row table -/

theorem slot_split (A B c j : ℕ) (hA : A < 2 ^ (520 * c)) :
    (A ||| B <<< (520 * c)) / 2 ^ (520 * j) % 2 ^ 520 =
      if j < c then A / 2 ^ (520 * j) % 2 ^ 520 else B / 2 ^ (520 * (j - c)) % 2 ^ 520 := by
  rw [slots_or_eq A B c hA]
  by_cases hj : j < c
  · rw [if_pos hj]
    obtain ⟨r, hr⟩ : ∃ r, c = j + 1 + r := ⟨c - (j + 1), by omega⟩
    have e : 2 ^ (520 * c) * B = 2 ^ (520 * j) * (2 ^ 520 * (2 ^ (520 * r) * B)) := by
      rw [hr, show 520 * (j + 1 + r) = 520 * j + 520 + 520 * r by ring, pow_add, pow_add]; ring
    rw [e, Nat.add_mul_div_left _ _ (by positivity), Nat.add_mul_mod_self_left]
  · rw [if_neg hj]
    obtain ⟨r, hr⟩ : ∃ r, j = c + r := ⟨j - c, by omega⟩
    rw [show j - c = r by omega, hr, show 520 * (c + r) = 520 * c + 520 * r by ring, pow_add, ← Nat.div_div_eq_div_mul,
      Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt hA, Nat.zero_add]

theorem rd19_eq (IX : ℕ) : E1P.rd 19 IX = IX % 2 ^ 19 := rd_eq 19 IX

theorem ble_false (a b : ℕ) (h : ¬ a ≤ b) : Nat.ble a b = false := by
  cases hb : Nat.ble a b
  · rfl
  · exact absurd (Nat.ble_eq.mp hb) h

theorem mkRTd_lt (hsl : ∀ i, sl i < 2 ^ 520) : ∀ h n IX, E1P.mkRTd sl h n IX < 2 ^ (520 * n) := by
  have hleaf : ∀ n IX, @Bool.rec (fun _ => ℕ) 0 (sl (E1P.rd 19 IX)) (Nat.beq n 1) < 2 ^ (520 * n) := by
    intro n IX
    cases hb : Nat.beq n 1
    · exact Nat.two_pow_pos _
    · have := Nat.eq_of_beq_eq_true hb; subst this; simpa using hsl _
  intro h
  induction h with
  | zero => intro n IX; exact hleaf n IX
  | succ h ih =>
    intro n IX
    show @Bool.rec (fun _ => ℕ)
        (Nat.lor (E1P.mkRTd sl h (Nat.shiftRight n 1) (E1P.rd (Nat.mul 19 (Nat.shiftRight n 1)) IX))
          (Nat.shiftLeft (E1P.mkRTd sl h (Nat.sub n (Nat.shiftRight n 1)) (E1P.sk (Nat.mul 19 (Nat.shiftRight n 1)) IX))
            (Nat.mul 520 (Nat.shiftRight n 1))))
        (@Bool.rec (fun _ => ℕ) 0 (sl (E1P.rd 19 IX)) (Nat.beq n 1)) (Nat.ble n 1) < 2 ^ (520 * n)
    cases Nat.ble n 1
    · have hc : Nat.shiftRight n 1 ≤ n := by show n >>> 1 ≤ n; rw [Nat.shiftRight_eq_div_pow]; exact Nat.div_le_self _ _
      have := slots_or_lt _ _ _ _ (ih (Nat.shiftRight n 1) (E1P.rd (Nat.mul 19 (Nat.shiftRight n 1)) IX))
        (ih (n - Nat.shiftRight n 1) (E1P.sk (Nat.mul 19 (Nat.shiftRight n 1)) IX))
      rwa [show Nat.shiftRight n 1 + (n - Nat.shiftRight n 1) = n by omega] at this
    · exact hleaf n IX

/-- slot `j` of the kernel's divide-and-conquer row table -/
theorem mkRTd_slot (hsl : ∀ i, sl i < 2 ^ 520) : ∀ h n IX, n ≤ 2 ^ h → ∀ j,
    E1P.mkRTd sl h n IX / 2 ^ (520 * j) % 2 ^ 520 = if j < n then sl (IX / 2 ^ (19 * j) % 2 ^ 19) else 0 := by
  have hleaf : ∀ n IX, n ≤ 1 → ∀ j, @Bool.rec (fun _ => ℕ) 0 (sl (E1P.rd 19 IX)) (Nat.beq n 1) / 2 ^ (520 * j) % 2 ^ 520 =
      if j < n then sl (IX / 2 ^ (19 * j) % 2 ^ 19) else 0 := by
    intro n IX hn j
    rcases (by omega : n = 0 ∨ n = 1) with rfl | rfl
    · rw [show Nat.beq 0 1 = false from rfl]; simp
    · rw [show Nat.beq 1 1 = true from rfl]
      dsimp only
      rcases Nat.eq_zero_or_pos j with rfl | hj
      · simp [rd19_eq, Nat.mod_eq_of_lt (hsl _)]
      · rw [if_neg (by omega), Nat.div_eq_of_lt (lt_of_lt_of_le (hsl _) (Nat.pow_le_pow_right (by norm_num) (by omega))),
          Nat.zero_mod]
  intro h
  induction h with
  | zero => intro n IX hn j; exact hleaf n IX (by simpa using hn) j
  | succ h ih =>
    intro n IX hn j
    show @Bool.rec (fun _ => ℕ)
        (Nat.lor (E1P.mkRTd sl h (Nat.shiftRight n 1) (E1P.rd (Nat.mul 19 (Nat.shiftRight n 1)) IX))
          (Nat.shiftLeft (E1P.mkRTd sl h (Nat.sub n (Nat.shiftRight n 1)) (E1P.sk (Nat.mul 19 (Nat.shiftRight n 1)) IX))
            (Nat.mul 520 (Nat.shiftRight n 1))))
        (@Bool.rec (fun _ => ℕ) 0 (sl (E1P.rd 19 IX)) (Nat.beq n 1)) (Nat.ble n 1) / 2 ^ (520 * j) % 2 ^ 520 = _
    by_cases hn1 : n ≤ 1
    · rw [show Nat.ble n 1 = true from Nat.ble_eq.mpr hn1]; exact hleaf n IX hn1 j
    · rw [ble_false n 1 hn1]
      dsimp only
      have hc : Nat.shiftRight n 1 = n / 2 := by show n >>> 1 = n / 2; rw [Nat.shiftRight_eq_div_pow, pow_one]
      rw [hc]
      have hn2 : n / 2 ≤ 2 ^ h := by rw [pow_succ] at hn; omega
      have hn3 : n - n / 2 ≤ 2 ^ h := by rw [pow_succ] at hn; omega
      rw [show Nat.lor (E1P.mkRTd sl h (n / 2) (E1P.rd (Nat.mul 19 (n / 2)) IX))
          (Nat.shiftLeft (E1P.mkRTd sl h (Nat.sub n (n / 2)) (E1P.sk (Nat.mul 19 (n / 2)) IX)) (Nat.mul 520 (n / 2))) =
          E1P.mkRTd sl h (n / 2) (E1P.rd (19 * (n / 2)) IX) ||| E1P.mkRTd sl h (n - n / 2) (E1P.sk (19 * (n / 2)) IX) <<<
            (520 * (n / 2)) from rfl, slot_split _ _ _ _ (mkRTd_lt hsl h _ _)]
      by_cases hj : j < n / 2
      · rw [if_pos hj, ih _ _ hn2 j, if_pos hj, if_pos (by omega), rd_eq]
        congr 1
        apply Nat.eq_of_testBit_eq; intro i
        rw [Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow,
          Nat.testBit_div_two_pow]
        by_cases hi : i < 19
        · have : i + 19 * j < 19 * (n / 2) := by omega
          simp [hi, this]
        · simp [hi]
      · rw [if_neg hj, ih _ _ hn3 (j - n / 2)]
        by_cases hj2 : j < n
        · rw [if_pos (by omega), if_pos hj2, sk_eq, Nat.div_div_eq_div_mul, ← pow_add,
            show 19 * (n / 2) + 19 * (j - n / 2) = 19 * j by omega]
        · rw [if_neg (by omega), if_neg hj2]

/-! ## Block headers -/

theorem af_ofFn (n : ℕ) (f : Fin n → ℕ) (i : ℕ) (h : i < n) : af (Array.ofFn f) i = f ⟨i, h⟩ := by
  simp [af, Array.getD_eq_getD_getElem?, h]

theorem af_ofFn_ge (n : ℕ) (f : Fin n → ℕ) (i : ℕ) (h : ¬ i < n) : af (Array.ofFn f) i = 0 := by
  simp [af, Array.getD_eq_getD_getElem?, h]

/-- bits at and past the block's end are zero: truncating a window there changes nothing -/
theorem win_trunc (B : ByteArray) (p x E : ℕ) (hE : 8 * B.size ≤ E) : win B p (min E x) = win B p x := by
  unfold win
  by_cases hx : x ≤ E
  · rw [min_eq_right hx]
  · rw [min_eq_left (by omega)]
    have hlt : natB B / 2 ^ p < 2 ^ (E - p) := by
      rw [Nat.div_lt_iff_lt_mul (by positivity), ← pow_add]
      exact lt_of_lt_of_le (natB_lt B) (Nat.pow_le_pow_right (by norm_num) (by omega))
    rw [Nat.mod_eq_of_lt hlt, Nat.mod_eq_of_lt (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))]

theorem win_empty (B : ByteArray) (p e : ℕ) (h : e ≤ p) : win B p e = 0 := by
  unfold win; rw [show e - p = 0 by omega, pow_zero, Nat.mod_one]

theorem leUbGo_spec (D : IPD) (m : Array ℕ) : ∀ n x, E1N.leUbGo D m n x = true → ∀ t < n, af m (x + t) ≤ af D.ub (x + t) := by
  intro n; induction n with
  | zero => intro x _ t ht; omega
  | succ n ih =>
    intro x h t ht
    rw [E1N.leUbGo, Bool.and_eq_true, decide_eq_true_eq] at h
    rcases t with _ | t
    · exact h.1
    · have := ih (x + 1) h.2 t (by omega); rwa [show x + 1 + t = x + (t + 1) by ring] at this

theorem rdE_E (B : ByteArray) (q E k : ℕ) (hE : 8 * B.size ≤ E) (hk : k ≤ 48) :
    E1N.rdE B q E k = natB B / 2 ^ q % 2 ^ k := by
  rw [rdE_eq B q E k hk]
  have hlt : natB B / 2 ^ q < 2 ^ (E - q) := by
    rw [Nat.div_lt_iff_lt_mul (by positivity), ← pow_add]
    exact lt_of_lt_of_le (natB_lt B) (Nat.pow_le_pow_right (by norm_num) (by omega))
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow]
  by_cases h1 : i < k
  · by_cases h2 : i < E - q
    · simp [h1, h2, lt_min_iff]
    · have : (natB B / 2 ^ q).testBit i = false :=
        Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))
      simp [h1, h2, this, lt_min_iff]
  · simp [h1, lt_min_iff]

theorem bD_rs (S : ℕ) : E1P.bD S = E1P.rd 5 (E1P.sk 1 S) := rfl
theorem bPl_rs (S : ℕ) : E1P.bPl S = E1P.rd (Nat.mul 8 (E1P.bD S)) (E1P.sk 14 S) := rfl
theorem bS1_rs (S : ℕ) : E1P.bS1 S = E1P.sk (Nat.add 14 (Nat.mul 8 (E1P.bD S))) S := rfl
theorem bS2_rs (S : ℕ) : E1P.bS2 S = sel (Nat.beq (E1P.rd 1 S) 1) (E1P.sk 765 (E1P.bS1 S)) (E1P.bS1 S) := rfl
theorem hdr_rs (S : ℕ) : E1P.hdr S =
    (E1P.rd 8 S, E1P.rd (Nat.mul 946 (E1P.rd 8 S)) (E1P.sk 8 S), E1P.sk (Nat.add 8 (Nat.mul 946 (E1P.rd 8 S))) S) := rfl
theorem mkRT_rs (sl : ℕ → ℕ) (k S : ℕ) :
    E1P.mkRT sl k S = (E1P.mkRTd sl 13 k (E1P.rd (Nat.mul 19 k) S), E1P.sk (Nat.mul 19 k) S) := rfl

/-! ## Blocks -/

theorem block_ref (hD : IPRel D C sl UB UBR)
    (hrev : ∀ i < 2 ^ 19, ∀ t < 255, (smr (sl i)).testBit t = (smask (sl i)).testBit (254 - t))
    (B : ByteArray) (h : E1N.block D B = true) : E1P.block C sl UB UBR (natB B) = true := by
  have hrw : D.rw = 946 := by unfold IPD.rw; rw [hD.lb, hD.nl]
  unfold E1N.block at h
  rw [hD.lb, hD.nl, hD.sib, hD.R, hrw, hD.mw] at h
  dsimp only at h
  generalize hE : 8 * B.size = E at h
  have hEle : 8 * B.size ≤ E := by omega
  generalize hdv : E1N.rdE B 1 E 5 = d at h
  generalize hlabs : (Array.ofFn (n := d) fun i => E1N.rdE B (6 + 8 + 8 * i.1) E 8) = labs at h
  have hls : labs.size = d := by rw [← hlabs, Array.size_ofFn]
  have hlab_i : ∀ s < d, af labs s = E1N.rdE B (6 + 8 + 8 * s) E 8 := by
    intro s hs; rw [← hlabs, af_ofFn _ _ s hs]
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨hok, hall⟩, hdR⟩, h⟩ := h
  have hl : LabOK labs := by
    intro r hr
    have := (Array.all_eq_true.mp hall) r hr
    simpa [af, Array.getD_eq_getD_getElem?, hr] using this
  have hd32 : d < 32 := by
    rw [← hdv, rdE_eq _ _ _ 5 (by norm_num)]
    exact lt_of_lt_of_le (Nat.mod_lt _ (by positivity)) (Nat.pow_le_pow_right (by norm_num) (min_le_left _ _))
  -- the kernel's header fields
  rw [← win_full B E hEle, block_eq]
  have hbD : E1P.bD (win B 0 E) = d := by
    rw [bD_rs, sk_win, Nat.zero_add, rd_win _ _ _ 5 (by norm_num), hdv]
  have hpos : E1P.rd 8 (E1P.sk 6 (win B 0 E)) = E1N.rdE B 6 E 8 := by
    rw [sk_win, Nat.zero_add, rd_win _ _ _ 8 (by norm_num)]
  have hbPl : E1P.bPl (win B 0 E) = pk 8 (af labs) labs.size := by
    rw [bPl_rs, hbD, sk_win, Nat.zero_add, show Nat.mul 8 d = 8 * d from rfl]
    exact win_pk B 14 E d labs hls hl (fun s hs => by rw [hlab_i s hs])
  have hlab0 : ∀ l, 255 ≤ l → multR labs.size (pk 8 (af labs) labs.size) l = 0 := by
    intro l hl255
    rw [multR_pl labs hl l]; unfold cnt
    exact Finset.sum_eq_zero (fun r hr => by rw [if_neg (by have := hl r (Finset.mem_range.mp hr); omega)])
  have hmv : E1P.mvOf (E1P.bD (win B 0 E)) (E1P.bPl (win B 0 E)) = (V (cnt labs), VR (cnt labs)) := by
    rw [hbD, hbPl, ← hls, mvOf_eq _ _ hlab0]
    have : multR labs.size (pk 8 (af labs) labs.size) = cnt labs := funext (multR_pl labs hl)
    rw [this]
  have hS1 : E1P.bS1 (win B 0 E) = win B (14 + 8 * d) E := by
    rw [bS1_rs, hbD, sk_win, Nat.zero_add]; rfl
  have hml : E1N.rdE B 0 E 1 < 2 := by
    rw [rdE_eq _ _ _ 1 (by norm_num)]
    exact lt_of_lt_of_le (Nat.mod_lt _ (by positivity)) (Nat.pow_le_pow_right (by norm_num) (min_le_left _ _))
  have hmk : E1P.rd 1 (win B 0 E) = E1N.rdE B 0 E 1 := rd_win _ _ _ 1 (by norm_num)
  generalize hmv' : E1N.rdE B 0 E 1 = mode at h hml hmk
  have hS2 : E1P.bS2 (win B 0 E) = win B (if (mode == 1) = true then 6 + 8 + 8 * d + 3 * 255 else 6 + 8 + 8 * d) E := by
    rw [bS2_rs, hmk, hS1]
    rcases (by omega : mode = 0 ∨ mode = 1) with rfl | rfl
    · rw [selCF (Nat.beq 0 1) rfl, if_neg (by decide)]
    · rw [selC (Nat.beq 1 1) rfl, sk_win, if_pos (by rfl)]
  generalize hs2v : (if (mode == 1) = true then 6 + 8 + 8 * d + 3 * 255 else 6 + 8 + 8 * d) = s2 at h hS2
  have hH : (E1P.hdr (E1P.bS2 (win B 0 E))).2.1 = win B (s2 + 8) (s2 + 8 + 946 * E1N.rdE B s2 E 8) := by
    rw [hS2, hdr_rs]
    show E1P.rd (Nat.mul 946 (E1P.rd 8 (win B s2 E))) (E1P.sk 8 (win B s2 E)) = _
    rw [rd_win _ _ _ 8 (by norm_num), sk_win, rdl_win, win_trunc B _ _ E hEle, show Nat.mul 946 (E1N.rdE B s2 E 8) =
      946 * E1N.rdE B s2 E 8 from rfl]
  have hS3 : (E1P.hdr (E1P.bS2 (win B 0 E))).2.2 = win B (s2 + 8 + 946 * E1N.rdE B s2 E 8) E := by
    rw [hS2, hdr_rs]
    show E1P.sk (Nat.add 8 (Nat.mul 946 (E1P.rd 8 (win B s2 E)))) (win B s2 E) = _
    rw [rd_win _ _ _ 8 (by norm_num), sk_win, show s2 + Nat.add 8 (Nat.mul 946 (E1N.rdE B s2 E 8)) =
      s2 + 8 + 946 * E1N.rdE B s2 E 8 by simp only [Nat.add_eq, Nat.mul_eq]; ring]
  generalize hndv : E1N.rdE B s2 E 8 = nd at h hH hS3
  have hRT1 : (E1P.bRT sl (win B 0 E)).1 = E1P.mkRTd sl 13 (E1N.rdE B (s2 + 8 + 946 * nd) E 12)
      (win B (s2 + 8 + 946 * nd + 12) (s2 + 8 + 946 * nd + 12 + 19 * E1N.rdE B (s2 + 8 + 946 * nd) E 12)) := by
    rw [bRT_eq, hS3, mkRT_rs, rd_win _ _ _ 12 (by norm_num), sk_win, rdl_win, win_trunc B _ _ E hEle,
      show Nat.mul 19 (E1N.rdE B (s2 + 8 + 946 * nd) E 12) = 19 * E1N.rdE B (s2 + 8 + 946 * nd) E 12 from rfl]
  have hRT2 : (E1P.bRT sl (win B 0 E)).2 = win B (s2 + 8 + 946 * nd + 12 + 19 * E1N.rdE B (s2 + 8 + 946 * nd) E 12) E := by
    rw [bRT_eq, hS3, mkRT_rs, rd_win _ _ _ 12 (by norm_num), sk_win, sk_win,
      show Nat.mul 19 (E1N.rdE B (s2 + 8 + 946 * nd) E 12) = 19 * E1N.rdE B (s2 + 8 + 946 * nd) E 12 from rfl]
  have hk12 : E1N.rdE B (s2 + 8 + 946 * nd) E 12 < 2 ^ 12 := by
    rw [rdE_eq _ _ _ 12 (by norm_num)]
    exact lt_of_lt_of_le (Nat.mod_lt _ (by positivity)) (Nat.pow_le_pow_right (by norm_num) (min_le_left _ _))
  generalize hkv : E1N.rdE B (s2 + 8 + 946 * nd) E 12 = k at h hRT1 hRT2 hk12
  generalize hixv : (Array.ofFn (n := k) fun j => E1N.rdE B (s2 + 8 + 946 * nd + 12 + 19 * j.1) E 19) = ix at h
  have hixs : ix.size = k := by rw [← hixv, Array.size_ofFn]
  have hix_j : ∀ j < k, ix.getD j 0 = E1N.rdE B (s2 + 8 + 946 * nd + 12 + 19 * j) E 19 := by
    intro j hj; rw [← hixv]; exact af_ofFn _ _ j hj
  -- the block relation
  have hK : BlkRel D sl ⟨B, ix, s2 + 8, nd⟩ (E1P.bRT sl (win B 0 E)).1 (E1P.hdr (E1P.bS2 (win B 0 E))).2.1 := by
    refine ⟨fun j hj => ?_, fun j => ?_, fun idx => ?_⟩
    · dsimp only at hj ⊢
      rw [hix_j j (by omega), rdE_eq _ _ _ 19 (by norm_num)]
      exact lt_of_lt_of_le (Nat.mod_lt _ (by positivity)) (Nat.pow_le_pow_right (by norm_num) (min_le_left _ _))
    · dsimp only
      rw [hRT1, mkRTd_slot hD.sl_lt 13 k _ (by omega) j, hixs]
      by_cases hj : j < k
      · rw [if_pos hj, if_pos hj, hix_j j hj, win_digit, rdE_E B _ E 19 hEle (by norm_num),
          show s2 + 8 + 946 * nd + 12 + 19 * k - (s2 + 8 + 946 * nd + 12 + 19 * j) = 19 * (k - j) by omega,
          min_eq_left (by omega : 19 ≤ 19 * (k - j))]
      · rw [if_neg hj, if_neg hj]
    · dsimp only
      rw [hH, sk_win, show Nat.mul 946 idx = 946 * idx from rfl, rdl_win]
      by_cases hidx : idx < nd
      · rw [if_pos hidx, min_eq_right (by omega)]
      · rw [if_neg hidx, win_empty B _ _ (by omega)]
  generalize hRTb : (E1P.bRT sl (win B 0 E)).1 = RTb at hK hRT1
  generalize hHv : (E1P.hdr (E1P.bS2 (win B 0 E))).2.1 = Hh at hK hH
  have hpk : ∀ (u : Array ℕ) (s5 : ℕ), BudOK u → E1N.node D ⟨B, ix, s2 + 8, nd⟩ 24 d (E1N.rdE B 6 E 8) labs u s5 E = true →
      E1P.bSat sl UB UBR (win B 0 E) = (true, V (af u), VR (af u), win B s5 E) →
      Bool.rec false (Bool.rec false (E1P.node C RTb Hh 24 (E1P.bD (win B 0 E)) (E1P.rd 8 (E1P.sk 6 (win B 0 E)))
        (E1P.bPl (win B 0 E)) (E1P.mvOf (E1P.bD (win B 0 E)) (E1P.bPl (win B 0 E))).1
        (E1P.mvOf (E1P.bD (win B 0 E)) (E1P.bPl (win B 0 E))).2 (E1P.bSat sl UB UBR (win B 0 E)).2.1
        (E1P.bSat sl UB UBR (win B 0 E)).2.2.1 (E1P.bSat sl UB UBR (win B 0 E)).2.2.2)
        (Nat.ble (E1P.bD (win B 0 E)) C.R)) (E1P.bSat sl UB UBR (win B 0 E)).1 = true := by
    intro u s5 hu hn hsat
    generalize hs3 : E1P.bSat sl UB UBR (win B 0 E) = sat3 at hsat
    have f1 : sat3.1 = true := by rw [hsat]
    have f2 : sat3.2.1 = V (af u) := by rw [hsat]
    have f3 : sat3.2.2.1 = VR (af u) := by rw [hsat]
    have f4 : sat3.2.2.2 = win B s5 E := by rw [hsat]
    rw [f1, f2, f3, f4, hmv, hbD, hpos, hbPl, andC true rfl, andC _ (Nat.ble_eq.mpr hdR),
      show ((V (cnt labs), VR (cnt labs)) : ℕ × ℕ).1 = V (cnt labs) from rfl,
      show ((V (cnt labs), VR (cnt labs)) : ℕ × ℕ).2 = VR (cnt labs) from rfl]
    have := node_ref hD hK hrev 24 d (E1N.rdE B 6 E 8) labs u s5 E hls (by omega) (by omega) hl hu hn
    unfold KNode at this
    rw [hls] at this ⊢
    exact this
  rcases (by omega : mode = 0 ∨ mode = 1) with rfl | rfl
  · -- mode 0: label caps minus the prefix, then the start saturations
    rw [if_neg (by decide)] at h
    generalize hsU : E1N.startU D labs = so at h
    rcases so with _ | u0
    · exact absurd h (by simp)
    dsimp only at h
    unfold E1N.startU at hsU
    rw [hD.nl] at hsU
    generalize hcg : E1N.countGo 255 id labs labs.size 0 (Array.replicate 255 0) = cg at hsU
    rcases cg with _ | m
    · exact absurd hsU (by simp)
    dsimp only at hsU
    obtain ⟨hm1, -, hm3⟩ := countGo_spec 255 id labs _ 0 _ m hcg
    rw [Array.size_replicate] at hm1 hm3
    have hmc : ∀ x < 255, af m x = cnt labs x := by
      intro x hx; rw [hm3 x hx, af_replicate, Nat.zero_add]; unfold cnt
      apply Finset.sum_congr rfl; intro s _; simp
    split at hsU
    · next hle =>
      simp only [Option.some.injEq] at hsU
      have hle' := leUbGo_spec D m 255 0 hle
      have hu0 : ∀ x < 255, af u0 x = E1P.fld UB x - cnt labs x := by
        intro x hx; rw [← hsU, af_ofFn _ _ x hx]
        show af D.ub x - af m x = _
        rw [hD.ub x hx, hmc x hx]
      have hcle : ∀ x < 255, cnt labs x ≤ E1P.fld UB x := by
        intro x hx; have := hle' x hx; rw [Nat.zero_add, hmc x hx, hD.ub x hx] at this; exact this
      have hbud0 : BudOK u0 := ⟨by rw [← hsU, Array.size_ofFn], fun x hx => by
        rw [hu0 x hx]; exact le_trans (Nat.sub_le _ _) (hD.ub_le x hx)⟩
      have hUF : Nat.sub UB (V (cnt labs)) = V (af u0) := by
        rw [show Nat.sub UB (V (cnt labs)) = UB - V (cnt labs) from rfl, hD.UB_eq, V_sub _ _ hcle]
        apply V_congr; intro x hx; rw [hu0 x hx]
      have hUFR : Nat.sub UBR (VR (cnt labs)) = VR (af u0) := by
        rw [show Nat.sub UBR (VR (cnt labs)) = UBR - VR (cnt labs) from rfl, hD.UBR_eq, VR_sub _ _ hcle]
        apply VR_congr; intro x hx; rw [hu0 x hx]
      generalize hnv : E1N.rdE B (s2 + 8 + 946 * nd + 12 + 19 * k) E 8 = n at h
      generalize hsg : E1N.satsGo D ⟨B, ix, s2 + 8, nd⟩ labs E n (s2 + 8 + 946 * nd + 12 + 19 * k + 8)
        (Array.replicate 8 0) = sg at h
      rcases sg with _ | U
      · exact absurd h (by simp)
      dsimp only at h
      apply hpk _ _ (budOK_zero hD u0 U hbud0) h
      rw [bSat_eq, hmk, selC (Nat.beq 0 0) rfl, bUF_eq, bUFR_eq, hmk, selCF (Nat.beq 0 1) rfl, selCF (Nat.beq 0 1) rfl,
        hmv, show ((V (cnt labs), VR (cnt labs)) : ℕ × ℕ).1 = V (cnt labs) from rfl,
        show ((V (cnt labs), VR (cnt labs)) : ℕ × ℕ).2 = VR (cnt labs) from rfl, hUF, hUFR, hRTb, hRT2,
        rd_win _ _ _ 8 (by norm_num), hnv, sk_win]
      exact sats_child hD hK hrev labs hl (by omega) u0 hbud0 E n _ U (by rw [hD.mw]; exact hsg)
    · exact absurd hsU (by simp)
  · -- mode 1: the recorded budgets
    rw [if_pos (by rfl)] at h
    have hbud : BudOK (Array.ofFn (n := 255) fun x => E1N.rdE B (6 + 8 + 8 * d + 3 * x.1) E 3) := by
      refine ⟨Array.size_ofFn, fun x hx => ?_⟩
      rw [af_ofFn _ _ x hx, rdE_eq _ _ _ 3 (by norm_num)]
      exact le_trans (le_of_lt (lt_of_lt_of_le (Nat.mod_lt _ (by positivity))
        (Nat.pow_le_pow_right (by norm_num) (min_le_left _ _)))) (by norm_num)
    apply hpk _ _ hbud h
    have hb3 : V (bud3 (win B (14 + 8 * d) E)) = V (af (Array.ofFn (n := 255) fun x => E1N.rdE B (6 + 8 + 8 * d + 3 * x.1) E 3)) := by
      apply V_congr; intro x hx
      have e8 : ∀ y : ℕ, y % 8 = y % 2 ^ 3 := fun y => by norm_num
      rw [af_ofFn _ _ x hx, bud3, e8, win_digit, show 14 + 8 * d + 3 * x = 6 + 8 + 8 * d + 3 * x by ring,
        ← rdE_eq B _ E 3 (by norm_num), rdE_E B _ E 3 hEle (by norm_num)]
    have hb3R : VR (bud3 (win B (14 + 8 * d) E)) = VR (af (Array.ofFn (n := 255) fun x => E1N.rdE B (6 + 8 + 8 * d + 3 * x.1) E 3)) := by
      apply VR_congr; intro x hx
      have := congrArg (fun v => E1P.fld v x) hb3
      simp only at this
      rw [fld_V _ (fun l _ => lt_trans (bud3_lt _ _) (by norm_num)) x hx,
        fld_V _ (fun l hl => lt_of_le_of_lt (hbud.2 l hl) (by norm_num)) x hx] at this
      exact this
    rw [bSat_eq, hmk, selCF (Nat.beq 1 0) rfl, bUF_eq, bUFR_eq, hmk, selC (Nat.beq 1 1) rfl, selC (Nat.beq 1 1) rfl, hS1,
      budU_eq, budUR_eq, hb3, hb3R, hRT2]

end E1NR
