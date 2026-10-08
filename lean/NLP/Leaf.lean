module
public import R22Port.U_d41d8cd98f00
public import NLP.Sim
public import S7.Leaf7
public import S5.CheckC
/-! # NLP.Leaf: native leaf checks refine `BC7s.leafS`

* `cert_sim`: the native check of a certificate from a leaf header (first factors `tl`, domain `dom`, Lemma G needs) refines
  the kernel's `BC7s.checkS 64` from the packed header.
* `leafAt_sound`: `NL.leafAt d p = true → BC7s.leafS (sk p (natOfBytes d)) = true`, hence `S5.NoDecomp` of the record
  (`leafAt_noDecomp`, through `S7.leafS7_sound`).
* `leafCertW_sound`: the E1/E1G/E1P leaf hook. -/
@[expose] public section
namespace NL
open Nat S5

set_option maxRecDepth 20000

/-! ## The per-leaf `S` -/

theorem zipIdx_fold_bit (i : Nat) : ∀ (l : List Nat) (k acc s : Nat), k + l.length ≤ 63 →
    ((l.zipIdx k).foldl (fun acc (x : Nat × Nat) => cond (nbit x.1 i) (Nat.lor acc (pw x.2)) acc) acc).testBit s =
      (acc.testBit s || (decide (k ≤ s ∧ s < k + l.length) && (l.getD (s - k) 0).testBit i))
  | [], k, acc, s, _ => by simp
  | a :: as, k, acc, s, h => by
    have hl : (a :: as).length = as.length + 1 := rfl
    rw [List.zipIdx_cons, List.foldl_cons, zipIdx_fold_bit i as (k + 1) _ s (by rw [hl] at h; omega), hl]
    have hpk : pw k = 2 ^ k := pw_fact k (by rw [hl] at h; omega)
    have hacc : (cond (nbit a i) (Nat.lor acc (pw k)) acc).testBit s =
        (acc.testBit s || (a.testBit i && decide (k = s))) := by
      rw [nbit_eq]
      cases a.testBit i
      · simp
      · simp only [cond_true, Bool.true_and]; rw [Nat.lor_eq, Nat.testBit_or, hpk, Nat.testBit_two_pow]
    rw [hacc]
    by_cases hs : s = k
    · subst hs
      have d1 : decide (s + 1 ≤ s ∧ s < s + 1 + as.length) = false := by simp
      have d2 : decide (s ≤ s ∧ s < s + (as.length + 1)) = true := by simp
      rw [d1, d2, Nat.sub_self, List.getD_cons_zero]
      simp
    · have hks : decide (k = s) = false := by simp; omega
      rw [hks, Bool.and_false, Bool.or_false]
      by_cases hk : k + 1 ≤ s ∧ s < k + 1 + as.length
      · rw [decide_eq_true hk, decide_eq_true (show k ≤ s ∧ s < k + (as.length + 1) by omega),
          show s - k = (s - (k + 1)) + 1 by omega, List.getD_cons_succ]
      · rw [decide_eq_false hk, decide_eq_false (show ¬ (k ≤ s ∧ s < k + (as.length + 1)) by omega)]
        simp

theorem mkS_bit (tl : List Nat) (htl : tl.length ≤ 63) (k s : Nat) (hk : k < 9) :
    ((mkS tl).sl k).testBit s = (decide (s < tl.length) && (tl.getD s 0).testBit k) := by
  have h := fun i => zipIdx_fold_bit i tl 0 0 s (by omega)
  simp only [Nat.zero_testBit, Bool.false_or, Nat.zero_le, true_and, Nat.zero_add, Nat.sub_zero] at h
  unfold mkS
  interval_cases k <;> simp only [S9.sl] <;> exact h _

theorem toArray_getD (tl : List Nat) (t : Nat) : tl.toArray.getD t 0 = tl.getD t 0 := by
  simp only [Array.getD, List.getD, List.size_toArray, List.getElem_toArray]
  split
  · rename_i h; rw [List.getElem?_eq_getElem h]; rfl
  · rename_i h; rw [List.getElem?_eq_none (by omega)]; rfl

/-- the native `hx` on the per-leaf `S` is the kernel's on `mkSSP` -/
theorem hx_eq (tl : List Nat) (T : Nat) (hn31 : tl.length ≤ 31) (htl : ∀ x ∈ tl, x < 512)
    (hT : ∀ t < tl.length, tl.getD t 0 = Nat.land (Nat.shiftRight T (Nat.mul 9 t)) 511) (X : Nat) (hX : X < 512) :
    hx (mkS tl) X = BC5.hx (BC5.mkSSP T tl.length) X := by
  have hS := S5.mkSSP_ok T tl.length (by omega)
  have hsl : ∀ k < 9, ∀ s, ((mkS tl).sl k).testBit s = (decide (s < tl.length) && (tl.getD s 0).testBit k) :=
    fun k hk s => mkS_bit tl (by omega) k s hk
  apply Nat.eq_of_testBit_eq; intro s
  by_cases hs : s < 32
  · rw [S5.hx_SS T tl.length X s _ hS hX hs]
    by_cases hsn : s < tl.length
    · have ha : tl.getD s 0 < 512 := by
        rw [List.getD_eq_getElem _ _ hsn]; exact htl _ (List.getElem_mem hsn)
      have haT : S5.aT T s = tl.getD s 0 := (hT s hsn).symm
      rw [haT, decide_eq_true hsn, Bool.true_and]
      apply S5.bf_inj
      rw [S5.par_eq _ (lt_of_le_of_lt Nat.and_le_left ha), S5.bf_xorBits]
      unfold hx
      simp only [Nat.testBit_xor, tb_cond0, nbit_eq, S5.bf_xor, S5.bf_and]
      have h0 := hsl 0 (by norm_num) s; have h1 := hsl 1 (by norm_num) s; have h2 := hsl 2 (by norm_num) s
      have h3 := hsl 3 (by norm_num) s; have h4 := hsl 4 (by norm_num) s; have h5 := hsl 5 (by norm_num) s
      have h6 := hsl 6 (by norm_num) s; have h7 := hsl 7 (by norm_num) s; have h8 := hsl 8 (by norm_num) s
      simp only [S9.sl] at h0 h1 h2 h3 h4 h5 h6 h7 h8
      rw [h0, h1, h2, h3, h4, h5, h6, h7, h8]
      simp only [decide_eq_true hsn, Bool.true_and, Finset.sum_range_succ, Finset.sum_range_zero, Nat.testBit_and,
        S5.bf_and]
      ring
    · rw [decide_eq_false hsn, Bool.false_and]
      unfold hx
      have hz : ∀ k < 9, ((mkS tl).sl k).testBit s = false := fun k hk => by rw [hsl k hk, decide_eq_false hsn]; rfl
      have h0 := hz 0 (by norm_num); have h1 := hz 1 (by norm_num); have h2 := hz 2 (by norm_num)
      have h3 := hz 3 (by norm_num); have h4 := hz 4 (by norm_num); have h5 := hz 5 (by norm_num)
      have h6 := hz 6 (by norm_num); have h7 := hz 7 (by norm_num); have h8 := hz 8 (by norm_num)
      simp only [S9.sl] at h0 h1 h2 h3 h4 h5 h6 h7 h8
      simp only [Nat.testBit_xor, tb_cond0, h0, h1, h2, h3, h4, h5, h6, h7, h8, Bool.and_false, Bool.xor_false]
  · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (S5.hx_lt _ _) (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    unfold hx
    have hz : ∀ k < 9, ((mkS tl).sl k).testBit s = false := fun k hk => by
      rw [hsl k hk, decide_eq_false (show ¬ s < tl.length by omega)]; rfl
    have h0 := hz 0 (by norm_num); have h1 := hz 1 (by norm_num); have h2 := hz 2 (by norm_num)
    have h3 := hz 3 (by norm_num); have h4 := hz 4 (by norm_num); have h5 := hz 5 (by norm_num)
    have h6 := hz 6 (by norm_num); have h7 := hz 7 (by norm_num); have h8 := hz 8 (by norm_num)
    simp only [S9.sl] at h0 h1 h2 h3 h4 h5 h6 h7 h8
    simp only [Nat.testBit_xor, tb_cond0, h0, h1, h2, h3, h4, h5, h6, h7, h8, Bool.and_false, Bool.xor_false]

theorem uok_mkS (tl : List Nat) (T : Nat) (hn31 : tl.length ≤ 31) (htl : ∀ x ∈ tl, x < 512)
    (hT : ∀ t < tl.length, tl.getD t 0 = Nat.land (Nat.shiftRight T (Nat.mul 9 t)) 511) :
    UOK (mkS tl) (BC5.mkSSP T tl.length) := by
  intro ACT X hX
  show pop32 (Nat.land (hx (mkS tl) X) ACT) = BC5.pop32 (Nat.land (BC5.hx (BC5.mkSSP T tl.length) X) ACT)
  rw [hx_eq tl T hn31 htl hT X hX]
  have hlt : Nat.land (BC5.hx (BC5.mkSSP T tl.length) X) ACT < 2 ^ 32 :=
    lt_of_le_of_lt Nat.and_le_left (S5.hx_lt _ _)
  generalize Nat.land (BC5.hx (BC5.mkSSP T tl.length) X) ACT = y at hlt ⊢
  show Nat.add (pop11 (Nat.land y 2047)) (Nat.add (pop11 (Nat.land (Nat.shiftRight y 11) 2047)) (pop11 (Nat.shiftRight y 22))) =
    Nat.add (BC5.pop11 (Nat.land y 2047)) (Nat.add (BC5.pop11 (Nat.land (Nat.shiftRight y 11) 2047))
      (BC5.pop11 (Nat.shiftRight y 22)))
  rw [pop11_fact (Nat.land y 2047) (lt_of_le_of_lt Nat.and_le_right (by norm_num)),
    pop11_fact (Nat.land (Nat.shiftRight y 11) 2047) (lt_of_le_of_lt Nat.and_le_right (by norm_num)),
    pop11_fact (Nat.shiftRight y 22) (by show y >>> 22 < 2048; rw [Nat.shiftRight_eq_div_pow]; omega)]

/-! ## The certificate check from a header -/

theorem pw_sub_one (n : Nat) (hn : n ≤ 31) : Nat.sub (pw n) 1 = Nat.pred (Nat.shiftLeft 1 n) := by
  rw [pw_fact n (by omega), Nat.shiftLeft_eq', Nat.one_shiftLeft]; rfl

theorem actOK_full (n : Nat) (hn : n ≤ 31) : ACTOK (Nat.sub (pw n) 1) n := by
  intro t ht
  rw [pw_fact n (by omega)] at ht
  change (2 ^ n - 1).testBit t = true at ht
  rw [Nat.testBit_two_pow_sub_one] at ht; simpa using ht

/-- **the native certificate check refines the kernel's from the packed header** -/
theorem cert_sim (d : ByteArray) (e : Nat) (tl : List Nat) (T need : Nat) (dom : M8) (q : Nat)
    (hn31 : tl.length ≤ 31) (htl : ∀ x ∈ tl, x < 512)
    (hT : ∀ t < tl.length, tl.getD t 0 = Nat.land (Nat.shiftRight T (Nat.mul 9 t)) 511)
    (h : (checkS ⟨d, e, tl.toArray, mkS tl, need, dom⟩ 64 (Nat.sub (pw tl.length) 1) [] [] q).1 = true) :
    (BC7s.checkS 64 T (BC5.mkSSP T tl.length) (Nat.pred (Nat.shiftLeft 1 tl.length)) need [] [] dom.toNat
      (win (natOfBytes d) e q)).1 = true := by
  have hL : LOK ⟨d, e, tl.toArray, mkS tl, need, dom⟩ T (BC5.mkSSP T tl.length) need dom.toNat tl.length :=
    { terms := fun t ht => by show tl.toArray.getD t 0 = _; rw [toArray_getD]; exact hT t ht
      tlt := fun t => by
        show tl.toArray.getD t 0 < 512
        rw [toArray_getD]
        by_cases ht : t < tl.length
        · rw [List.getD_eq_getElem _ _ ht]; exact htl _ (List.getElem_mem ht)
        · rw [List.getD_eq_default _ _ (by omega)]; norm_num
      n31 := hn31
      u := uok_mkS tl T hn31 htl hT
      need := rfl
      dom := rfl }
  have := checkS_sim _ T _ need dom.toNat tl.length hL 64 (Nat.sub (pw tl.length) 1) [] [] q (actOK_full _ hn31)
    (fun _ h => absurd h List.not_mem_nil) (fun _ h => absurd h List.not_mem_nil) h
  rw [← pw_sub_one _ hn31]
  simp only [List.map_nil] at this
  rw [this]

/-! ## The E1 leaf hook -/

theorem toList_lt_of_all (terms : Array Nat) (h : terms.toList.all (fun a => Nat.blt a 512) = true) :
    ∀ x ∈ terms.toList, x < 512 := by
  intro x hx
  have := List.all_eq_true.mp h x hx
  simpa using this

/-- **the leaf hook**: an accepted `leafCertW` is an accepted kernel check from the packed header -/
theorem leafCertW_sound (terms : Array Nat) (dom : M8) (B : ByteArray) (q e : Nat)
    (h : leafCertW terms dom B q e = true) :
    terms.size ≤ 31 ∧ (∀ x ∈ terms.toList, x < 512) ∧
      (BC7s.checkS 64 (BC5.packT terms.toList) (BC5.mkSSP (BC5.packT terms.toList) terms.size)
        (Nat.pred (Nat.shiftLeft 1 terms.size)) 0 [] [] dom.toNat (win (natOfBytes B) e q)).1 = true := by
  unfold leafCertW at h
  simp only [Bool.and_eq_true, Nat.ble_eq] at h
  obtain ⟨⟨h1, h2⟩, h3⟩ := h
  have hl := toList_lt_of_all terms h2
  have hsz : terms.toList.length = terms.size := Array.length_toList
  refine ⟨h1, hl, ?_⟩
  have hT : ∀ t < terms.toList.length, terms.toList.getD t 0 =
      Nat.land (Nat.shiftRight (BC5.packT terms.toList) (Nat.mul 9 t)) 511 := fun t _ =>
    (S5.aT_packT terms.toList hl t).symm
  have hc := cert_sim B e terms.toList (BC5.packT terms.toList) 0 dom q (by omega) hl hT
  rw [hsz] at hc
  apply hc
  rw [Array.toArray_toList]; exact h3

/-! ## The leaf record of a header -/

/-- the leaf record with `n` terms packed in `T`, domain mask `DOM` (mode 01, Lemma G off), certificate `cert`: the shape of
`E1.leafRec`, `E1G.leafRec`, `E1P.leafRec` -/
def leafForm (n T DOM cert : Nat) : Nat :=
  Nat.lor n (Nat.lor (Nat.shiftLeft T 6) (Nat.shiftLeft (Nat.lor 1 (Nat.lor (Nat.shiftLeft DOM 2) (Nat.shiftLeft cert 514)))
    (Nat.add 6 (Nat.mul 9 n))))

theorem or_shift (a b k : Nat) (ha : a < 2 ^ k) : Nat.lor a (Nat.shiftLeft b k) = a + 2 ^ k * b := by
  rw [Nat.lor_eq, Nat.shiftLeft_eq', Nat.or_comm, ← Nat.shiftLeft_add_eq_or_of_lt ha, Nat.shiftLeft_eq, Nat.mul_comm,
    Nat.add_comm]

theorem rd_split (a b k : Nat) (ha : a < 2 ^ k) : BC5.rd k (a + 2 ^ k * b) = a := by
  rw [rd_eq', Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt ha]
theorem sk_split (a b k : Nat) (ha : a < 2 ^ k) : BC5.sk k (a + 2 ^ k * b) = b := by
  rw [sk_eq', Nat.shiftRight_eq_div_pow, Nat.add_mul_div_left _ _ (Nat.two_pow_pos k), Nat.div_eq_of_lt ha, Nat.zero_add]

theorem leafForm_eq (n T DOM cert : Nat) (hn : n < 2 ^ 6) (hT : T < 2 ^ (9 * n)) (hD : DOM < 2 ^ 512) :
    leafForm n T DOM cert = n + 2 ^ 6 * (T + 2 ^ (9 * n) * (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert))) := by
  unfold leafForm
  rw [show Nat.lor (Nat.shiftLeft DOM 2) (Nat.shiftLeft cert 514) = Nat.shiftLeft (DOM + 2 ^ 512 * cert) 2 by
      rw [← or_shift _ _ _ hD]; show (DOM <<< 2) ||| (cert <<< 514) = (DOM ||| (cert <<< 512)) <<< 2
      rw [Nat.shiftLeft_or_distrib, ← Nat.shiftLeft_add]]
  rw [or_shift 1 _ 2 (by norm_num)]
  rw [show Nat.lor (Nat.shiftLeft T 6) (Nat.shiftLeft (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert)) (Nat.add 6 (Nat.mul 9 n))) =
      Nat.shiftLeft (T + 2 ^ (9 * n) * (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert))) 6 by
      rw [← or_shift _ _ _ hT]
      show (T <<< 6) ||| (_ <<< (6 + 9 * n)) = (T ||| (_ <<< (9 * n))) <<< 6
      rw [Nat.shiftLeft_or_distrib, ← Nat.shiftLeft_add, Nat.add_comm (9 * n) 6]]
  rw [or_shift n _ 6 hn]

/-- **the kernel's leaf check of a header record** -/
theorem leafS_form (n T DOM cert : Nat) (hn : n ≤ 31) (hT : T < 2 ^ (9 * n)) (hD : DOM < 2 ^ 512) :
    BC7s.leafS (leafForm n T DOM cert) =
      (BC7s.checkS 64 T (BC5.mkSSP T n) (Nat.pred (Nat.shiftLeft 1 n)) 0 [] [] DOM cert).1 := by
  have hn6 : n < 2 ^ 6 := by omega
  rw [leafForm_eq n T DOM cert hn6 hT hD]
  have e1 : BC5.rd 6 (n + 2 ^ 6 * (T + 2 ^ (9 * n) * (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert)))) = n := rd_split _ _ _ hn6
  have e2 : BC5.sk 6 (n + 2 ^ 6 * (T + 2 ^ (9 * n) * (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert)))) =
      T + 2 ^ (9 * n) * (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert)) := sk_split _ _ _ hn6
  have e3 : BC5.rd (Nat.mul 9 n) (T + 2 ^ (9 * n) * (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert))) = T := rd_split _ _ _ hT
  have e4 : BC5.sk (Nat.add 6 (Nat.mul 9 n)) (n + 2 ^ 6 * (T + 2 ^ (9 * n) * (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert)))) =
      1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert) := by
    show BC5.sk (6 + 9 * n) _ = _
    rw [sk_eq', Nat.shiftRight_add, ← sk_eq', ← sk_eq', e2, sk_split _ _ _ hT]
  have e5 : BC5.rd 1 (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert)) = 1 := by
    rw [rd_eq']; omega
  have e6 : BC5.rd 512 (BC5.sk 2 (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert))) = DOM := by
    rw [sk_split _ _ _ (by norm_num), rd_split _ _ _ hD]
  have e7 : BC5.sk 514 (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert)) = cert := by
    rw [sk_eq', show (514 : Nat) = 2 + 512 from rfl, Nat.shiftRight_add, ← sk_eq', ← sk_eq',
      sk_split _ _ _ (by norm_num), sk_split _ _ _ hD]
  show (Nat.ble (BC5.rd 6 _) 31 && _) = _
  rw [e1, e4, e5]
  simp only [show Nat.beq 1 0 = false from rfl, Bool.and_false, Bool.false_and, Bool.false_or, cond_false]
  rw [e2, e3, e6, e7, Nat.ble_eq.mpr hn, Bool.true_and]

end NL
