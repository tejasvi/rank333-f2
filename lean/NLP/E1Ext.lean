module
public import R22Port.U_e3d31222c3d7
public import NLP.E1Hook
public import NLP.Split
public import NL.E1Ext
public import E1.ExtLeaf
/-! # NLP.E1Ext: the native checks of E1's external leaves refine `E1S.LeafND`

* `e1ExtSplitB_sound`: an accepted split batch refutes `C.EXT[k] … C.EXT[k+m-1]`: the main record of each item is E1's leaf record
  of its label sequence (`e1Hdr_rec`), and `nestLeaf_sound` refutes it (`E1S.leafND_of_split`).
* `e1ExtMonoB_sound`: the same for monolithic certificates (`leafCertW`, `E1S.leafND_of_leafS`).
* `e1Ext_hext`: the split batch over `[0, s)` and the monolithic batch over `[s, |EXT|)` give `E1`'s `hext`. -/
@[expose] public section
namespace NL
open Nat S5

set_option maxRecDepth 20000

/-! ## The terms of a label sequence -/

theorem termsN_length (VT : Nat) : ∀ R pl, (termsN VT R pl).length = R
  | 0, _ => rfl
  | R + 1, pl => by
    show (termOfN VT (Nat.land pl 127) :: termsN VT R (Nat.shiftRight pl 7)).length = R + 1
    rw [List.length_cons, termsN_length VT R]

theorem termsN_lt (VT : Nat) : ∀ R pl, ∀ x ∈ termsN VT R pl, x < 512
  | 0, _ => fun _ h => absurd h List.not_mem_nil
  | R + 1, pl => fun x hx => by
    change x ∈ termOfN VT (Nat.land pl 127) :: termsN VT R (Nat.shiftRight pl 7) at hx
    rcases List.mem_cons.mp hx with rfl | hx
    · unfold termOfN; exact lt_of_le_of_lt Nat.and_le_right (by norm_num)
    · exact termsN_lt VT R _ x hx

/-- the `leafRec` term loop reads the labels of any `pl` -/
theorem termsLoopN (VT : Nat) : ∀ (R acc i pl : Nat),
    Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat) (fun acc _ _ => acc)
      (fun _ ih acc i pl => ih (Nat.lor acc (Nat.shiftLeft (Nat.land (Nat.shiftRight VT (Nat.mul 9 (BC5.rd 7 pl))) 511)
        (Nat.mul 9 i))) (Nat.succ i) (BC5.sk 7 pl)) R acc i pl =
      Nat.lor acc (Nat.shiftLeft (BC5.packT (termsN VT R pl)) (Nat.mul 9 i))
  | 0, acc, i, pl => by simp [BC5.packT, termsN]
  | R + 1, acc, i, pl => by
    show Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat) _ _ R _ _ _ = _
    rw [termsLoopN VT R]
    have e1 : BC5.rd 7 pl = Nat.land pl 127 := rfl
    have e2 : BC5.sk 7 pl = Nat.shiftRight pl 7 := rfl
    rw [e1, e2]
    show Nat.lor (Nat.lor acc (Nat.shiftLeft (termOfN VT (Nat.land pl 127)) (Nat.mul 9 i)))
      (Nat.shiftLeft (BC5.packT (termsN VT R (Nat.shiftRight pl 7))) (Nat.mul 9 (Nat.succ i))) =
      Nat.lor acc (Nat.shiftLeft (Nat.lor (termOfN VT (Nat.land pl 127))
        (Nat.shiftLeft (BC5.packT (termsN VT R (Nat.shiftRight pl 7))) 9)) (Nat.mul 9 i))
    simp only [Nat.lor_eq, Nat.shiftLeft_eq', Nat.mul_eq, Nat.shiftLeft_or_distrib, ← Nat.shiftLeft_add, Nat.or_assoc]
    rw [show 9 + 9 * i = 9 * (i + 1) by ring]

theorem termsG_N (R VT pl : Nat) : termsG 7 R VT pl = BC5.packT (termsN VT R pl) := by
  unfold termsG
  rw [termsLoopN VT R 0 0 pl]
  simp [Nat.lor_eq, Nat.shiftLeft_eq']

/-- `E1.leafRec` in the native terms -/
theorem leafRec_N (R VT DOM pl cert : Nat) :
    E1.leafRec R VT DOM pl cert = leafForm R (BC5.packT (termsN VT R pl)) DOM cert := by
  have h : E1.leafRec R VT DOM pl cert = leafForm R (termsG 7 R VT pl) DOM cert := rfl
  rw [h, termsG_N]

/-! ## The header of a split leaf -/

theorem fieldsOK_rd (d : ByteArray) (e : Nat) : ∀ (ts : List Nat) (q : Nat), fieldsOK d e ts q = true →
    (∀ x ∈ ts, x < 512) → BC5.rd (9 * ts.length) (win (natOfBytes d) e q) = BC5.packT ts
  | [], q, _, _ => by simp [BC5.packT, rd_eq', Nat.mod_one]
  | t :: ts, q, h, hlt => by
    change (Nat.beq (rdw d e q 9) t && fieldsOK d e ts (q + 9)) = true at h
    rw [Bool.and_eq_true] at h
    have ht := Nat.eq_of_beq_eq_true h.1
    rw [rdw_eq d e q 9 (le_refl _)] at ht
    have ih := fieldsOK_rd d e ts (q + 9) h.2 (fun x hx => hlt x (List.mem_cons_of_mem _ hx))
    have t512 := hlt t List.mem_cons_self
    rw [List.length_cons, show 9 * (ts.length + 1) = 9 + 9 * ts.length by ring, rd_add, sk_win, ih, ht]
    show t + 2 ^ 9 * BC5.packT ts = Nat.lor t (Nat.shiftLeft (BC5.packT ts) 9)
    rw [or_shift t _ 9 (by norm_num; omega)]

theorem M8.eqb_eq (x y : M8) (h : M8.eqb x y = true) : x = y := by
  unfold M8.eqb at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨h0, h1⟩, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩ := h
  cases x; cases y; simp_all

theorem rd_sk (k x : Nat) : x = BC5.rd k x + 2 ^ k * BC5.sk k x := by
  rw [rd_eq', sk_eq', Nat.shiftRight_eq_div_pow]; exact (Nat.mod_add_div x (2 ^ k)).symm

theorem sk_sk (a b x : Nat) : BC5.sk a (BC5.sk b x) = BC5.sk (b + a) x := by
  rw [sk_eq', sk_eq', sk_eq', Nat.shiftRight_add]

/-- **an accepted E1 header is E1's leaf record of the label sequence** -/
theorem e1Hdr_rec (d : ByteArray) (R VT DOM pl : Nat) (hR : R < 64) (hD : DOM < 2 ^ 512)
    (h : e1Hdr d R VT (M8.ofNat DOM) pl = true) :
    natOfBytes d = E1.leafRec R VT DOM pl (natOfBytes d >>> (520 + 9 * R)) := by
  unfold e1Hdr at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨⟨hn, hts⟩, hdm⟩, hlg⟩, _⟩, hdom⟩ := h
  set N := natOfBytes d with hN
  have hw : ∀ q, win N (8 * d.size) q = BC5.sk q N := win_full d
  have rw9 : ∀ q k, k ≤ 9 → rdw d (8 * d.size) q k = BC5.rd k (BC5.sk q N) := fun q k hk => by
    rw [rdw_eq d _ q k hk, hw]
  -- the fields
  have fN : BC5.rd 6 N = R := by
    have := Nat.eq_of_beq_eq_true hn; rw [rw9 0 6 (by norm_num)] at this; exact this
  have fT : BC5.rd (9 * R) (BC5.sk 6 N) = BC5.packT (termsN VT R pl) := by
    have := fieldsOK_rd d _ _ 6 hts (termsN_lt VT R pl)
    rw [termsN_length, hw] at this; exact this
  have fdm : BC5.rd 1 (BC5.sk (6 + 9 * R) N) = 1 := by
    have := Nat.eq_of_beq_eq_true hdm; rw [rw9 _ 1 (by norm_num)] at this; exact this
  have flg : BC5.rd 1 (BC5.sk (7 + 9 * R) N) = 0 := by
    have := Nat.eq_of_beq_eq_true hlg; rw [rw9 _ 1 (by norm_num)] at this; exact this
  have fD : BC5.rd 512 (BC5.sk (8 + 9 * R) N) = DOM := by
    have := congrArg M8.toNat (M8.eqb_eq _ _ hdom)
    rw [rdM8_toNat, M8.ofNat_toNat_lt _ hD] at this; exact this
  -- the decomposition
  have hT : BC5.packT (termsN VT R pl) < 2 ^ (9 * R) := by
    have := packT_lt _ (termsN_lt VT R pl); rwa [termsN_length] at this
  rw [leafRec_N, leafForm_eq R _ DOM _ hR hT hD]
  have s6 : BC5.sk 6 N = BC5.packT (termsN VT R pl) + 2 ^ (9 * R) * BC5.sk (6 + 9 * R) N := by
    rw [rd_sk (9 * R) (BC5.sk 6 N), fT, sk_sk]
  have s69 : BC5.sk (6 + 9 * R) N = 1 + 2 * BC5.sk (7 + 9 * R) N := by
    rw [rd_sk 1 (BC5.sk (6 + 9 * R) N), fdm, sk_sk, show 6 + 9 * R + 1 = 7 + 9 * R by ring, pow_one]
  have s79 : BC5.sk (7 + 9 * R) N = 2 * BC5.sk (8 + 9 * R) N := by
    rw [rd_sk 1 (BC5.sk (7 + 9 * R) N), flg, sk_sk, show 7 + 9 * R + 1 = 8 + 9 * R by ring, pow_one, Nat.zero_add]
  have s89 : BC5.sk (8 + 9 * R) N = DOM + 2 ^ 512 * (N >>> (520 + 9 * R)) := by
    rw [rd_sk 512 (BC5.sk (8 + 9 * R) N), fD, sk_sk, show 8 + 9 * R + 512 = 520 + 9 * R by ring, sk_eq']
  conv_lhs => rw [rd_sk 6 N, fN, s6, s69, s79, s89]
  ring

/-! ## The batches -/

/-- **a split item** -/
theorem e1Split_leafND (C : E1.Ctx) (hR : C.R < 64) (hDOM : C.DOM < 2 ^ 512) (d : ByteArray)
    (recs : List (List Step × Nat × ByteArray × Nat × Nat)) (m0 pl : Nat)
    (hh : e1Hdr d C.R C.VT (M8.ofNat C.DOM) pl = true) (hs : nestLeaf d 0 recs m0 = true) : E1S.LeafND C pl := by
  have hnd := nestLeaf_sound d 0 recs m0 hs
  have h0 : BC5.sk 0 (natOfBytes d) = natOfBytes d := by rw [sk_eq', Nat.shiftRight_zero]
  rw [h0] at hnd
  exact E1S.leafND_of_split C hR hDOM pl (natOfBytes d) (e1Hdr_rec d C.R C.VT C.DOM pl hR hDOM hh) hnd

/-- **an accepted split batch refutes its external leaves** -/
theorem e1ExtSplitB_sound (C : E1.Ctx) (hR : C.R < 64) (hDOM : C.DOM < 2 ^ 512) (b : ByteArray) :
    ∀ m k o, e1ExtSplitB C.R C.VT (M8.ofNat C.DOM) C.EXT b m k o = true →
      ∀ j < m, E1S.LeafND C (C.EXT.getD (k + j) 0)
  | 0, _, _, _ => fun j hj => absurd hj (by omega)
  | m + 1, k, o, h => by
    intro j hj
    unfold e1ExtSplitB at h
    simp only [Bool.and_eq_true] at h
    obtain ⟨⟨hh, hs⟩, hr⟩ := h
    rcases j with _ | j
    · exact e1Split_leafND C hR hDOM _ _ _ _ hh hs
    · have := e1ExtSplitB_sound C hR hDOM b m (k + 1) _ hr j (by omega)
      rwa [show k + 1 + j = k + (j + 1) by ring] at this

/-- the hook for any terms list (the E1-shape record of `ts`) -/
theorem leafForm_hookT (R DOM : Nat) (ts : List Nat) (hlen : ts.length = R) (hD : DOM < 2 ^ 512) (B : ByteArray)
    (q e : Nat) (h : leafCertW ts.toArray (M8.ofNat DOM) B q e = true) :
    BC7.leafS (leafForm R (BC5.packT ts) DOM (win (natOfBytes B) e q)) = true := by
  obtain ⟨h1, h2, h3⟩ := leafCertW_sound _ _ _ _ _ h
  simp only [List.size_toArray, List.toList_toArray] at h1 h2 h3
  rw [M8.ofNat_toNat_lt _ hD, hlen] at h3
  rw [R7.leafS7_ref, leafS_form R _ DOM _ (by omega) _ hD]
  · exact h3
  · have := packT_lt ts h2
    rwa [hlen] at this

/-- **an accepted monolithic batch refutes its external leaves** -/
theorem e1ExtMonoB_sound (C : E1.Ctx) (hR : C.R < 64) (hDOM : C.DOM < 2 ^ 512) (b : ByteArray) :
    ∀ m k o, e1ExtMonoB C.R C.VT (M8.ofNat C.DOM) C.EXT b m k o = true →
      ∀ j < m, E1S.LeafND C (C.EXT.getD (k + j) 0)
  | 0, _, _, _ => fun j hj => absurd hj (by omega)
  | m + 1, k, o, h => by
    intro j hj
    unfold e1ExtMonoB at h
    simp only [Bool.and_eq_true] at h
    obtain ⟨hc, hr⟩ := h
    rcases j with _ | j
    · have hl := leafForm_hookT C.R C.DOM _ (termsN_length C.VT C.R _) hDOM b _ _ hc
      rw [← leafRec_N] at hl
      exact E1S.leafND_of_leafS C hR hDOM _ _ hl
    · have := e1ExtMonoB_sound C hR hDOM b m (k + 1) _ hr j (by omega)
      rwa [show k + 1 + j = k + (j + 1) by ring] at this

/-- consecutive chunks: `[k, k + m1)` and `[k + m1, k + m1 + m2)` give `[k, k + m1 + m2)` -/
theorem e1Ext_join (C : E1.Ctx) (k m1 m2 : Nat) (h1 : ∀ j < m1, E1S.LeafND C (C.EXT.getD (k + j) 0))
    (h2 : ∀ j < m2, E1S.LeafND C (C.EXT.getD (k + m1 + j) 0)) : ∀ j < m1 + m2, E1S.LeafND C (C.EXT.getD (k + j) 0) := by
  intro j hj
  by_cases hj1 : j < m1
  · exact h1 j hj1
  · have := h2 (j - m1) (by omega); rwa [show k + m1 + (j - m1) = k + j by omega] at this

/-- **E1's `hext`** from the split leaves `[0, s)` and the monolithic leaves `[s, |EXT|)` -/
theorem e1Ext_hext (C : E1.Ctx) (s : Nat) (hs : ∀ j < s, E1S.LeafND C (C.EXT.getD (0 + j) 0))
    (hm : ∀ j < C.EXT.length - s, E1S.LeafND C (C.EXT.getD (s + j) 0)) : ∀ pl ∈ C.EXT, E1S.LeafND C pl := by
  intro pl hpl
  obtain ⟨k, hk, rfl⟩ := List.getElem_of_mem hpl
  have hg : C.EXT.getD k 0 = C.EXT[k] := List.getD_eq_getElem _ _ hk
  by_cases hks : k < s
  · have := hs k hks; rwa [Nat.zero_add, hg] at this
  · have := hm (k - s) (by omega); rwa [show s + (k - s) = k by omega, hg] at this

end NL
