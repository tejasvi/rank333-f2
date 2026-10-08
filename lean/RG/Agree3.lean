module
public import R22Port.U_d41d8cd98f00
public import RG.Agree2
/-! # Agreement, continued: canonicity witnesses and header records -/
@[expose] public section
namespace E1NRG
open E1N Finset E1GS

variable {D : IPD} {C : E1G.Ctx} {sl : ℕ → ℕ} {UB UBR : ℕ} {K : Blk} {RTb H : ℕ}

/-! ## Canonicity -/

theorem imR_dig (gp : ℕ) (d : ℕ) : ∀ pl k, imR d pl gp k = ∑ i ∈ range d, (if gpf gp (dig 7 pl i) = k then 1 else 0) := by
  induction d with
  | zero => intro pl k; simp [imR]
  | succ d ih =>
    intro pl k
    rw [imR, ih, sum_range_succ']
    have e0 : dig 7 pl 0 = pl % 128 := by simp [dig]
    have e1 : ∀ i, dig 7 (pl / 128) i = dig 7 pl (i + 1) := by
      intro i; unfold dig; rw [Nat.div_div_eq_div_mul, show 128 * 2 ^ (7 * i) = 2 ^ (7 * (i + 1)) by ring]
    simp only [e0, e1]; ring

theorem imR_pl (gp : ℕ) (labs : Array ℕ) (hl : LabOK labs) (k : ℕ) :
    imR labs.size (pk 7 (af labs) labs.size) gp k = ∑ i ∈ range labs.size, (if gpf gp (af labs i) = k then 1 else 0) := by
  rw [imR_dig]
  apply Finset.sum_congr rfl; intro i hi
  rw [dig_pk 7 _ _ (fun v hv => lt_trans (hl v hv) (by norm_num)) i (mem_range.mp hi)]

theorem af_rep_size (n : ℕ) : (Array.replicate n 0).size = n := Array.size_replicate

/-- **Canonicity witnesses**: the native check implies the kernel's comparison of reversed packings -/
theorem canon_rel (hD : IPRel D C sl UB UBR) (labs : Array ℕ) (hl : LabOK labs) (l g : ℕ) (hl' : l < 127)
    (hg : g < 2048) (hs : labs.size ≤ 64) (h : E1N.canonOK D (labs.push l) g = true) :
    Nat.blt (Nat.add (VR (cnt labs)) (E1G.oner l))
      (E1G.imgR (C.GP g) (Nat.lor (pk 7 (af labs) labs.size) (Nat.shiftLeft l (Nat.mul 7 labs.size))) (Nat.succ labs.size))
      = true := by
  have hl2 := labOK_push labs hl l hl'
  rw [child_VR' labs l hl', pl_push labs hl l, show Nat.succ labs.size = (labs.push l).size by simp]
  generalize hL : labs.push l = L at hl2 h
  unfold E1N.canonOK at h
  rw [hD.nl] at h
  split at h
  · next a b ha hb =>
    obtain ⟨ha1, -, ha3⟩ := countGo_spec 127 id L _ 0 _ a ha
    obtain ⟨hb1, hb2, hb3⟩ := countGo_spec 127 _ L _ 0 _ b hb
    rw [af_rep_size] at ha1 ha3 hb1 hb3
    have himg : ∀ s < L.size, D.gp.getD (127 * g + af L s) 0 = gpf (C.GP g) (af L s) :=
      fun s hs => hD.gp g hg _ (hl2 s hs)
    have hbk : ∀ k < 127, af b k = imR L.size (pk 7 (af L) L.size) (C.GP g) k := by
      intro k hk
      rw [hb3 k hk, af_replicate, Nat.zero_add, imR_pl _ L hl2]
      apply Finset.sum_congr rfl; intro s hs
      simp only [Nat.zero_add]
      rw [himg s (mem_range.mp hs)]
    have hak : ∀ k < 127, af a k = cnt L k := by
      intro k hk; rw [ha3 k hk, af_replicate, Nat.zero_add]; unfold cnt
      apply Finset.sum_congr rfl; intro s _; simp
    have hq0 : ∀ k, 127 ≤ k → imR L.size (pk 7 (af L) L.size) (C.GP g) k = 0 := by
      intro k hk
      rw [imR_pl _ L hl2]
      apply Finset.sum_eq_zero; intro s hs
      have := hb2 s (mem_range.mp hs)
      simp only [Nat.zero_add] at this
      rw [himg s (mem_range.mp hs)] at this
      rw [if_neg (by omega)]
    rw [imgR_eq _ _ _ hq0, Nat.blt_eq]
    obtain ⟨j0, -, hj0, h1, h2⟩ := lexLt_spec a b 127 0 h
    have hLs : L.size ≤ 65 := by rw [← hL, Array.size_push]; omega
    have hcb : ∀ k < 127, cnt L k < 2 ^ 128 := fun k _ =>
      lt_of_le_of_lt (le_trans (cnt_le L k) hLs) (by norm_num)
    have hib : ∀ k < 127, imR L.size (pk 7 (af L) L.size) (C.GP g) k < 2 ^ 128 := by
      intro k hk
      rw [imR_pl _ L hl2]
      calc ∑ i ∈ range L.size, (if gpf (C.GP g) (af L i) = k then 1 else 0) ≤ ∑ i ∈ range L.size, 1 :=
            Finset.sum_le_sum (fun i _ => by split <;> omega)
        _ = L.size := by simp
        _ < 2 ^ 128 := lt_of_le_of_lt hLs (by norm_num)
    refine (VR_lt_iff _ _ hcb hib).mpr ⟨j0, by omega, fun j hj => ?_, ?_⟩
    · rw [← hak j (by omega), ← hbk j (by omega)]; exact h1 j (Nat.zero_le _) hj
    · rw [← hak j0 (by omega), ← hbk j0 (by omega)]; exact h2
  · exact absurd h (by simp)

/-! ## Header records -/

/-- a digit field of a window is a native read of the block -/
theorem win_digit (B : ByteArray) (p e s k : ℕ) :
    win B p e / 2 ^ s % 2 ^ k = natB B / 2 ^ (p + s) % 2 ^ (min k (e - (p + s))) := by
  unfold win
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow,
    Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow]
  by_cases h1 : i < k
  · by_cases h2 : i + s < e - p
    · have h3 : i < min k (e - (p + s)) := by omega
      simp [h1, h2, h3, show i + s + p = i + (p + s) by ring]
    · have h3 : ¬ i < min k (e - (p + s)) := by omega
      simp [h1, h2, h3]
  · have h3 : ¬ i < min k (e - (p + s)) := by omega
    simp [h1, h3]

/-- a window's `n` low `7`-bit digits read as `rdE` fields equal the labels: the window is their packing -/
theorem win_pk (B : ByteArray) (p e n : ℕ) (labs : Array ℕ) (hn : labs.size = n) (hl : LabOK labs)
    (h : ∀ s < n, E1N.rdE B (p + 7 * s) e 7 = af labs s) :
    E1G.rd (7 * n) (win B p e) = pk 7 (af labs) labs.size := by
  rw [rdl_win, hn]
  have hlt : win B p (min e (p + 7 * n)) < 2 ^ (7 * n) :=
    lt_of_lt_of_le (win_lt B p _) (Nat.pow_le_pow_right (by norm_num) (by omega))
  rw [← pk_dig 7 _ n hlt]
  apply pk_congr; intro s hs
  rw [← h s hs, rdE_eq B _ e 7 (by norm_num)]
  unfold dig
  rw [win_digit]
  congr 2
  omega

/-- **Header records**: the native comparison implies the kernel's `stEq` -/
theorem stEq_rel (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H) (idx d pos : ℕ) (labs u : Array ℕ)
    (hd : labs.size = d) (hl : LabOK labs) (hu : BudOK u) (h : E1N.stEqN D K idx d pos labs u = true) :
    E1G.stEq (E1G.rd 540 (E1G.sk (Nat.mul 540 idx) H)) d pos (pk 7 (af labs) labs.size) (V (af u)) = true := by
  unfold E1N.stEqN at h
  have hrw : D.rw = 540 := by unfold IPD.rw; rw [hD.lb, hD.nl]
  rw [hrw, hD.lb, hD.nl] at h
  simp only [Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨hidx, h5⟩, h8⟩, hlab⟩, hbud⟩ := h
  rw [hK.recd idx, if_pos hidx, stEq_named]
  set rs := K.hs + 540 * idx with hrs
  have e5 : E1G.rd 5 (win K.B rs (rs + 540)) = d := by rw [rd_win _ _ _ 5 (by norm_num)]; exact h5
  have e8 : E1G.rd 7 (E1G.sk 5 (win K.B rs (rs + 540))) = pos := by
    rw [sk_win, rd_win _ _ _ 7 (by norm_num)]; exact h8
  have epl : E1G.rd (Nat.mul 7 d) (E1G.sk 12 (win K.B rs (rs + 540))) = pk 7 (af labs) labs.size := by
    rw [sk_win, show Nat.mul 7 d = 7 * d from rfl]
    apply win_pk K.B (rs + 12) (rs + 540) d labs hd hl
    intro s hs
    have := recLabsGo_spec D K rs (rs + 540) labs d 0 hlab s hs
    rw [hD.lb, Nat.zero_add] at this
    rw [← this]
  have ebud : E1G.budU (E1G.sk (Nat.add 12 (Nat.mul 7 d)) (win K.B rs (rs + 540))) = V (af u) := by
    rw [budU_eq, sk_win]
    apply V_congr; intro x hx
    have := recBudGo_spec K (rs + 5 + 7 + 7 * d) (rs + 540) u 127 0 hbud x hx
    rw [Nat.zero_add] at this
    unfold bud3
    rw [← this, rdE_eq _ _ _ 3 (by norm_num), show (8 : ℕ) = 2 ^ 3 by norm_num, win_digit]
    congr 3 <;> simp only [Nat.add_eq, Nat.mul_eq] <;> omega
  rw [e5, e8, epl, ebud]
  simp

end E1NRG
