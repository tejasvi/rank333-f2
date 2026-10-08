module
public import R22Port.U_d41d8cd98f00
public import NLP.Leaf
/-! # NLP.LeafAt: the native standalone leaf record check refines `BC7s.leafS`

`leafAt_sound : NL.leafAt d p = true → BC7s.leafS (sk p (natOfBytes d)) = true`, and `leafAt_noDecomp`: the record has no
decomposition on its domain (`S7.leafS7_sound`). -/
@[expose] public section
namespace NL
open Nat S5

set_option maxRecDepth 20000

/-! ## Bounds and windows -/

theorem natOfList_lt : ∀ l : List UInt8, natOfList l < 2 ^ (8 * l.length)
  | [] => by simp [natOfList]
  | b :: bs => by
    have ih := natOfList_lt bs
    show b.toNat + 256 * natOfList bs < 2 ^ (8 * (bs.length + 1))
    rw [show 8 * (bs.length + 1) = 8 + 8 * bs.length by ring, Nat.pow_add]
    have hb := b.toNat_lt
    have : 256 * natOfList bs + 256 ≤ 2 ^ 8 * 2 ^ (8 * bs.length) := by
      rw [show (256 : Nat) = 2 ^ 8 by norm_num, ← Nat.mul_succ]; exact Nat.mul_le_mul_left _ ih
    omega

theorem natOfBytes_lt (d : ByteArray) : natOfBytes d < 2 ^ (8 * d.size) := by
  rw [natOfBytes_eq]
  have := natOfList_lt d.data.toList
  rwa [Array.length_toList] at this

/-- past the end of the bytes the window is the plain stream -/
theorem win_full (d : ByteArray) (q : Nat) : win (natOfBytes d) (8 * d.size) q = BC5.sk q (natOfBytes d) := by
  apply Nat.eq_of_testBit_eq; intro i
  rw [win_bit, sk_eq', Nat.testBit_shiftRight]
  by_cases h : i < 8 * d.size - q
  · simp [h]
  · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (natOfBytes_lt d) (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    simp

/-! ## The terms -/

theorem rdList_getD (d : ByteArray) (e : Nat) : ∀ m q t, t < m → (rdList d e m q).1.getD t 0 = rdw d e (q + 9 * t) 9
  | 0, _, t, h => absurd h (by omega)
  | m + 1, q, t, h => by
    show (rdw d e q 9 :: (rdList d e m (q + 9)).1).getD t 0 = _
    cases t with
    | zero => simp
    | succ t =>
      rw [List.getD_cons_succ, rdList_getD d e m (q + 9) t (by omega)]
      congr 1; ring

theorem rdList_length (d : ByteArray) (e : Nat) : ∀ m q, (rdList d e m q).1.length = m
  | 0, _ => rfl
  | m + 1, q => by
    show (rdw d e q 9 :: (rdList d e m (q + 9)).1).length = m + 1
    rw [List.length_cons, rdList_length d e m (q + 9)]

/-- the kernel's `aT` of the record's packed terms is the native term -/
theorem aT_rec (N n t : Nat) (ht : t < n) :
    Nat.land (Nat.shiftRight (BC5.rd (Nat.mul 9 n) (BC5.sk 6 N)) (Nat.mul 9 t)) 511 = BC5.rd 9 (BC5.sk (6 + 9 * t) N) := by
  apply Nat.eq_of_testBit_eq; intro j
  show (((BC5.rd (9 * n) (BC5.sk 6 N)) >>> (9 * t)) &&& 511).testBit j = _
  rw [Nat.testBit_and, Nat.testBit_shiftRight, rd_bit, sk_eq', Nat.testBit_shiftRight, rd_bit, sk_eq',
    Nat.testBit_shiftRight, show (511 : Nat) = 2 ^ 9 - 1 by norm_num, Nat.testBit_two_pow_sub_one]
  by_cases hj : j < 9
  · simp [hj, show 9 * t + j < 9 * n by omega, show 6 + (9 * t + j) = 6 + 9 * t + j by omega]
  · simp [hj]

/-! ## Lemma G data -/

theorem rkSum_eq (ta : Array Nat) (T : Nat) (hlt : ∀ s, ta.getD s 0 < 512) :
    ∀ n, (∀ s < n, ta.getD s 0 = Nat.land (Nat.shiftRight T (Nat.mul 9 s)) 511) → rkSum ta n = BC6s.rkSum T n
  | 0, _ => rfl
  | n + 1, h => by
    show Nat.add (rkSum ta n) (rk3 (ta.getD n 0)) =
      Nat.add (BC6s.rkSum T n) (BC6s.rk3 (Nat.land (Nat.shiftRight T (Nat.mul 9 n)) 511))
    rw [rkSum_eq ta T hlt n (fun s hs => h s (by omega)), rk3_fact _ (hlt n), h n (by omega)]

theorem needP_eq (ta : Array Nat) (T D : Nat) (hlt : ∀ s, ta.getD s 0 < 512) :
    ∀ n, n ≤ 31 → (∀ s < n, ta.getD s 0 = Nat.land (Nat.shiftRight T (Nat.mul 9 s)) 511) → needP ta D n = BC6s.needP T n D
  | 0, _, _ => rfl
  | n + 1, hn, h => by
    show Nat.lor (needP ta D n) (Nat.mul (Nat.sub (rk3 (ta.getD n 0)) D) (pw (Nat.mul 2 n))) =
      Nat.lor (BC6s.needP T n D) (Nat.shiftLeft (Nat.sub (BC6s.rk3 (Nat.land (Nat.shiftRight T (Nat.mul 9 n)) 511)) D)
        (Nat.mul 2 n))
    rw [needP_eq ta T D hlt n (by omega) (fun s hs => h s (by omega)), rk3_fact _ (hlt n), h n (by omega),
      pw_fact _ (by show 2 * n < 63; omega), Nat.shiftLeft_eq', Nat.shiftLeft_eq]
    rfl

/-! ## The domain mask -/

theorem rd_add (a b x : Nat) : BC5.rd (a + b) x = BC5.rd a x + 2 ^ a * BC5.rd b (BC5.sk a x) := by
  apply Nat.eq_of_testBit_eq; intro i
  have hlt : BC5.rd a x < 2 ^ a := by rw [rd_eq']; exact Nat.mod_lt _ (Nat.two_pow_pos a)
  rw [Nat.add_comm (BC5.rd a x), Nat.testBit_two_pow_mul_add _ hlt, rd_bit, rd_bit, rd_bit, sk_eq', Nat.testBit_shiftRight]
  by_cases h : i < a
  · simp [h, show i < a + b by omega]
  · simp only [h, if_false]
    rw [show a + (i - a) = i by omega]
    by_cases h2 : i < a + b
    · simp [h2, show i - a < b by omega]
    · simp [h2, show ¬ (i - a < b) by omega]

theorem rdb8_lt (d : ByteArray) (q : Nat) : rdb d q 8 < 2 ^ 8 := by
  rw [rdb_eq d q 8 (by norm_num), rd_eq']; exact Nat.mod_lt _ (Nat.two_pow_pos 8)

theorem piece_toNat (v k : Nat) (hv : v < 2 ^ 8) (hk : k ≤ 56) :
    (v.toUInt64 <<< k.toUInt64).toNat = v * 2 ^ k := by
  rw [UInt64.toNat_shiftLeft]
  have h1 : v.toUInt64.toNat = v := by rw [Nat.toUInt64_eq, UInt64.toNat_ofNat']; exact Nat.mod_eq_of_lt (by omega)
  have h2 : k.toUInt64.toNat = k := by rw [Nat.toUInt64_eq, UInt64.toNat_ofNat']; exact Nat.mod_eq_of_lt (by omega)
  rw [h1, h2, Nat.mod_eq_of_lt (show k < 64 by omega), Nat.shiftLeft_eq]
  apply Nat.mod_eq_of_lt
  calc v * 2 ^ k < 2 ^ 8 * 2 ^ k := Nat.mul_lt_mul_of_pos_right hv (Nat.two_pow_pos k)
    _ = 2 ^ (8 + k) := by rw [Nat.pow_add]
    _ ≤ 2 ^ 64 := Nat.pow_le_pow_right (by norm_num) (by omega)

/-- **`rd64` reads 64 bits** -/
theorem rd64_toNat (d : ByteArray) (q : Nat) : (rd64 d q).toNat = BC5.rd 64 (BC5.sk q (natOfBytes d)) := by
  have hb := fun j => rdb8_lt d (q + j)
  have e0 : (rdb d q 8).toUInt64.toNat = rdb d q 8 := by
    rw [Nat.toUInt64_eq, UInt64.toNat_ofNat']; exact Nat.mod_eq_of_lt (by have := rdb8_lt d q; omega)
  unfold rd64
  have p := fun j k (hk : k ≤ 56) => piece_toNat (rdb d (q + j) 8) k (hb j) hk
  simp only [UInt64.toNat_or]
  rw [e0, show ((rdb d (q + 8) 8).toUInt64 <<< 8) = ((rdb d (q + 8) 8).toUInt64 <<< (8 : Nat).toUInt64) from rfl,
    show ((rdb d (q + 16) 8).toUInt64 <<< 16) = ((rdb d (q + 16) 8).toUInt64 <<< (16 : Nat).toUInt64) from rfl,
    show ((rdb d (q + 24) 8).toUInt64 <<< 24) = ((rdb d (q + 24) 8).toUInt64 <<< (24 : Nat).toUInt64) from rfl,
    show ((rdb d (q + 32) 8).toUInt64 <<< 32) = ((rdb d (q + 32) 8).toUInt64 <<< (32 : Nat).toUInt64) from rfl,
    show ((rdb d (q + 40) 8).toUInt64 <<< 40) = ((rdb d (q + 40) 8).toUInt64 <<< (40 : Nat).toUInt64) from rfl,
    show ((rdb d (q + 48) 8).toUInt64 <<< 48) = ((rdb d (q + 48) 8).toUInt64 <<< (48 : Nat).toUInt64) from rfl,
    show ((rdb d (q + 56) 8).toUInt64 <<< 56) = ((rdb d (q + 56) 8).toUInt64 <<< (56 : Nat).toUInt64) from rfl,
    p 8 8 (by norm_num), p 16 16 (by norm_num), p 24 24 (by norm_num), p 32 32 (by norm_num), p 40 40 (by norm_num),
    p 48 48 (by norm_num), p 56 56 (by norm_num)]
  have pc : ∀ o j, (rdb d (q + o) 8 * 2 ^ o).testBit j =
      (decide (o ≤ j ∧ j < o + 8) && (natOfBytes d).testBit (q + j)) := by
    intro o j
    rw [Nat.testBit_mul_two_pow, rdb_eq d _ 8 (by norm_num), rd_bit, sk_eq', Nat.testBit_shiftRight]
    by_cases h : o ≤ j ∧ j < o + 8
    · simp [h.1, show j - o < 8 by omega, show q + o + (j - o) = q + j by omega, h]
    · by_cases h1 : o ≤ j
      · simp [h1, show ¬ (j - o < 8) by omega, show ¬ (j < o + 8) by omega]
      · simp [h1, h]
  have p0 : ∀ j, (rdb d q 8).testBit j = (decide (j < 8) && (natOfBytes d).testBit (q + j)) := by
    intro j; rw [rdb_eq d q 8 (by norm_num), rd_bit, sk_eq', Nat.testBit_shiftRight]
  apply Nat.eq_of_testBit_eq; intro j
  rw [rd_bit, sk_eq', Nat.testBit_shiftRight]
  simp only [Nat.testBit_or, p0, pc]
  cases (natOfBytes d).testBit (q + j)
  · simp
  · simp only [Bool.and_true]
    apply Bool.eq_iff_iff.mpr
    simp only [Bool.or_eq_true, decide_eq_true_eq]
    omega

/-- **`rdM8` reads 512 bits** -/
theorem rdM8_toNat (d : ByteArray) (q : Nat) : (rdM8 d q).toNat = BC5.rd 512 (BC5.sk q (natOfBytes d)) := by
  unfold rdM8 M8.toNat
  simp only [rd64_toNat]
  have sk_add : ∀ a b, BC5.sk a (BC5.sk b (natOfBytes d)) = BC5.sk (b + a) (natOfBytes d) := fun a b => by
    rw [sk_eq', sk_eq', sk_eq', Nat.shiftRight_add]
  rw [show (512 : Nat) = 64 + (64 + (64 + (64 + (64 + (64 + (64 + 64)))))) from rfl, rd_add, rd_add, rd_add, rd_add,
    rd_add, rd_add, rd_add, sk_add, sk_add, sk_add, sk_add, sk_add, sk_add, sk_add]


/-! ## The leaf record -/

/-- an explicit domain mask inside the window is read by `rdM8` -/
theorem rd512_win (d : ByteArray) (e q : Nat) (hq : q + 512 ≤ e) :
    BC5.rd 512 (win (natOfBytes d) e q) = (rdM8 d q).toNat := by
  have hm : Nat.min 512 (e - q) = 512 := by unfold Nat.min; omega
  rw [rdM8_toNat]; unfold win; rw [rd_rd, hm]

/-- **an accepted native record in a window is an accepted kernel leaf record** -/
theorem leafAtW_sound (d : ByteArray) (p e : Nat) (h : leafAtW d p e = true) :
    BC7s.leafS (win (natOfBytes d) e p) = true := by
  have rw9 : ∀ q k, k ≤ 9 → BC5.rd k (win (natOfBytes d) e q) = rdw d e q k := fun q k hk =>
    (rdw_eq d e q k hk).symm
  have skw : ∀ a q, BC5.sk a (win (natOfBytes d) e q) = win (natOfBytes d) e (q + a) := fun a q => sk_win _ _ _ _
  -- the native header
  unfold leafAtW at h
  simp only [] at h
  set n := rdw d e p 6 with hn
  set tl := (rdList d e n (p + 6)).1 with htl
  have htlen : tl.length = n := rdList_length d e n (p + 6)
  have htlt : ∀ x ∈ tl, x < 512 := rdList_lt d e n (p + 6)
  have hta : ∀ s, tl.toArray.getD s 0 < 512 := fun s => by
    rw [toArray_getD]
    by_cases hs : s < tl.length
    · rw [List.getD_eq_getElem _ _ hs]; exact htlt _ (List.getElem_mem hs)
    · rw [List.getD_eq_default _ _ (by omega)]; norm_num
  -- the kernel's header
  unfold BC7s.leafS
  simp only []
  rw [rw9 p 6 (by norm_num), ← hn]
  set T := BC5.rd (Nat.mul 9 n) (BC5.sk 6 (win (natOfBytes d) e p)) with hT
  have hterms : ∀ t < tl.length, tl.getD t 0 = Nat.land (Nat.shiftRight T (Nat.mul 9 t)) 511 := by
    intro t ht
    rw [htlen] at ht
    rw [hT, aT_rec _ n t ht, skw, rdList_getD d e n (p + 6) t ht, rw9 _ 9 (le_refl _)]
    congr 1; ring
  have htaT : ∀ s < n, tl.toArray.getD s 0 = Nat.land (Nat.shiftRight T (Nat.mul 9 s)) 511 := fun s hs => by
    rw [toArray_getD]; exact hterms s (by omega)
  set p1 := p + 6 + 9 * n with hp1
  have hR1 : BC5.sk (Nat.add 6 (Nat.mul 9 n)) (win (natOfBytes d) e p) = win (natOfBytes d) e p1 := by
    rw [skw]; congr 1; show p + (6 + 9 * n) = p + 6 + 9 * n; ring
  rw [hR1, rw9 p1 1 (by norm_num), skw, rw9 (p1 + 1) 1 (by norm_num),
    ← rkSum_eq tl.toArray T hta n htaT, skw, skw]
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨hn31', hdw⟩, h⟩ := h
  have hn31 : n ≤ 31 := Nat.ble_eq.mp hn31'
  rw [Nat.ble_eq.mpr hn31, Bool.true_and]
  cases hA : ((rdw d e (p1 + 1) 1).beq 1 && (rdw d e p1 1).beq 0 && (rkSum tl.toArray n).blt 27)
  · rw [hA, Bool.false_or] at h
    rw [Bool.false_or]
    -- the kernel's arguments as the native ones
    rw [← needP_eq tl.toArray T _ hta n hn31 htaT]
    have hdom : (cond ((rdw d e p1 1).beq 0) BC4.ALLNZ (BC5.rd 512 (win (natOfBytes d) e (p1 + 2)))) =
        (cond ((rdw d e p1 1).beq 0) ALLNZ8 (rdM8 d (p1 + 2))).toNat := by
      cases hdm : (rdw d e p1 1).beq 0
      · rw [hdm, Bool.false_or] at hdw
        simp only [cond_false]
        exact rd512_win d e (p1 + 2) (by have := Nat.ble_eq.mp hdw; omega)
      · simp only [cond_true]; exact allnz_fact.symm
    have hS : (cond ((rdw d e p1 1).beq 0) (win (natOfBytes d) e (p1 + 2)) (win (natOfBytes d) e (p1 + 514))) =
        win (natOfBytes d) e (cond ((rdw d e p1 1).beq 0) (p1 + 2) (p1 + 514)) := by
      cases (rdw d e p1 1).beq 0 <;> rfl
    rw [hdom, hS]
    have hc := cert_sim d e tl T _ _ _ (by omega) htlt hterms (by rw [htlen]; exact h)
    rw [htlen] at hc
    exact hc
  · rfl

/-- **the record in the window has no decomposition on its domain** -/
theorem leafAtW_noDecomp (d : ByteArray) (p e : Nat) (h : leafAtW d p e = true) :
    S5.NoDecomp (S5.leafT (win (natOfBytes d) e p)) (S5.leafN (win (natOfBytes d) e p))
      (S6.leafDom6 (win (natOfBytes d) e p)) :=
  S7.leafS7_sound _ (leafAtW_sound d p e h)

/-- **an accepted native leaf record is an accepted kernel leaf record** -/
theorem leafAt_sound (d : ByteArray) (p : Nat) (h : leafAt d p = true) : BC7s.leafS (BC5.sk p (natOfBytes d)) = true := by
  rw [← win_full d p]; exact leafAtW_sound d p (8 * d.size) h

/-- **the record has no decomposition on its domain** -/
theorem leafAt_noDecomp (d : ByteArray) (p : Nat) (h : leafAt d p = true) :
    S5.NoDecomp (S5.leafT (BC5.sk p (natOfBytes d))) (S5.leafN (BC5.sk p (natOfBytes d)))
      (S6.leafDom6 (BC5.sk p (natOfBytes d))) :=
  S7.leafS7_sound _ (leafAt_sound d p h)

/-! ## The header fields of a record in a window (for binding a record to its node, e.g. `KD.leafBind`)

The native readers `rdw` / `rdList` (core, `NL.Basic`) give the kernel's `leafN`, `aT (leafT R) t` and `leafDom6`. -/

theorem leafN_win (d : ByteArray) (p e : Nat) : S5.leafN (win (natOfBytes d) e p) = rdw d e p 6 :=
  (rdw_eq d e p 6 (by norm_num)).symm

theorem aT_leafT_win (d : ByteArray) (p e t : Nat) (ht : t < rdw d e p 6) :
    S5.aT (S5.leafT (win (natOfBytes d) e p)) t = rdw d e (p + 6 + 9 * t) 9 := by
  show Nat.land (Nat.shiftRight (BC5.rd (Nat.mul 9 (BC5.rd 6 (win (natOfBytes d) e p))) (BC5.sk 6 (win (natOfBytes d) e p)))
    (Nat.mul 9 t)) 511 = _
  rw [← rdw_eq d e p 6 (by norm_num), aT_rec _ _ t ht, sk_win, ← rdw_eq d e _ 9 (le_refl _)]
  congr 1; ring

theorem aT_leafT_win' (d : ByteArray) (p e t : Nat) (ht : t < rdw d e p 6) :
    S5.aT (S5.leafT (win (natOfBytes d) e p)) t = (rdList d e (rdw d e p 6) (p + 6)).1.getD t 0 := by
  rw [aT_leafT_win d p e t ht, rdList_getD d e _ (p + 6) t ht]

theorem leafDom6_win (d : ByteArray) (p e : Nat) (h : rdw d e (p + 6 + 9 * rdw d e p 6) 1 = 0) :
    S6.leafDom6 (win (natOfBytes d) e p) = BC4.ALLNZ := by
  unfold S6.leafDom6
  rw [← rdw_eq d e p 6 (by norm_num), sk_win,
    show p + Nat.add 6 (Nat.mul 9 (rdw d e p 6)) = p + 6 + 9 * rdw d e p 6 by show p + (6 + 9 * _) = _; ring,
    ← rdw_eq d e _ 1 (by norm_num), h]
  rfl

/-- the whole bytes of a blob are the window `[0, 8 |b|)` -/
theorem win_blob (b : ByteArray) : win (natOfBytes b) (8 * b.size) 0 = natOfBytes b := by
  rw [win_full]; rfl

/-- **a blob holding exactly one record** -/
theorem leafAt_blob_sound (b : ByteArray) (h : leafAt b 0 = true) : BC7s.leafS (natOfBytes b) = true := by
  rw [← win_blob]; exact leafAtW_sound b 0 (8 * b.size) h

/-! ## Test batches -/

/-- the record offsets `allLeaves d fuel o` visits -/
def recOffsets (d : ByteArray) : Nat → Nat → List Nat
  | 0, _ => []
  | f + 1, o => if o + 4 ≤ d.size then o :: recOffsets d f (o + 4 + rdU32 d o) else []

theorem allLeaves_sound (d : ByteArray) : ∀ fuel o, allLeaves d fuel o = true →
    ∀ q ∈ recOffsets d fuel o, BC7s.leafS (BC5.sk (8 * (q + 4)) (natOfBytes d)) = true
  | 0, _, _ => fun _ h => absurd h List.not_mem_nil
  | f + 1, o, h => by
    intro q hq
    have e : allLeaves d (f + 1) o = cond (Nat.ble (o + 4) d.size) (leafAt d (8 * (o + 4)) &&
        allLeaves d f (o + 4 + rdU32 d o)) true := rfl
    rw [e] at h
    unfold recOffsets at hq
    by_cases hs : o + 4 ≤ d.size
    · rw [if_pos hs] at hq
      rw [Nat.ble_eq.mpr hs, cond_true, Bool.and_eq_true] at h
      rcases List.mem_cons.mp hq with rfl | hq
      · exact leafAt_sound d _ h.1
      · exact allLeaves_sound d f _ h.2 q hq
    · rw [if_neg hs] at hq; exact absurd hq List.not_mem_nil

end NL
