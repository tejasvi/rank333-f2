module
public import R22Port.U_d41d8cd98f00
public import GS.PhA7
/-! # Track A, part 8: rank 1 (`checkR1`): `R1Data` (without the slices) and `R1Complete` -/
@[expose] public section
namespace GS
open G G.A2 G.LS G.Acc G.V2 G.D2 Finset

theorem mem_ofRank {r skip a : ℕ} : a ∈ ofRank r skip ↔ a < 512 ∧ rk a = r ∧ a ≠ skip ∧ a ≠ 0 := by
  unfold ofRank
  simp only [List.mem_filter, List.mem_range, Bool.and_eq_true, Bool.not_eq_true']
  constructor
  · rintro ⟨h1, ⟨h2, h3⟩, h4⟩
    refine ⟨h1, Nat.eq_of_beq_eq_true h2, fun e => ?_, fun e => ?_⟩
    · rw [e, Nat.beq_refl] at h3; exact absurd h3 (by simp)
    · rw [e] at h4; exact absurd h4 (by decide)
  · rintro ⟨h1, h2, h3, h4⟩
    refine ⟨h1, ⟨by rw [h2]; exact Nat.beq_refl r, ?_⟩, ?_⟩
    · cases hb : Nat.beq a skip
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true hb) h3
    · cases hb : Nat.beq a 0
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true hb) h4

theorem ofRank_nodup (r skip : ℕ) : (ofRank r skip).Nodup := (List.nodup_range).filter _

theorem ofRank_length (r skip : ℕ) : (ofRank r skip).length ≤ 512 := by
  unfold ofRank; exact (List.length_filter_le _ _).trans (by simp)

theorem cntM_le (M : ℕ) (hM : MOK M) : cntM M ≤ 512 := by
  rw [cntM_eq512 M hM]; exact (Finset.card_filter_le _ _).trans (by simp)

/-- the length of a rank-1 part list -/
theorem groups_length (mask : ℕ → ℕ → ℕ) (nW : ℕ) : ∀ (as es rest : List ℕ), groups mask nW as es = some rest →
    es.length = rest.length + ∑ a ∈ as.toFinset, 0 + (as.map fun a => ∑ i ∈ range nW, cntM (mask a (0 + i))).sum
  | [], es, rest, h => by
    have : es = rest := by simpa [groups] using h
    subst this; simp
  | a :: as, es, rest, h => by
    have h' : (match groupsW mask a nW 0 es with
      | none => none
      | some es' => groups mask nW as es') = some rest := h
    cases hg : groupsW mask a nW 0 es with
    | none => rw [hg] at h'; simp at h'
    | some es' =>
      rw [hg] at h'; simp only at h'
      obtain ⟨pre, hes, hlen, _⟩ := groupsW_spec mask a nW 0 es es' hg
      have := groups_length mask nW as es' rest h'
      rw [hes, List.length_append, hlen, this]
      simp only [Finset.sum_const_zero, List.map_cons, List.sum_cons]
      ring

theorem groups_length_le (mask : ℕ → ℕ → ℕ) (nW : ℕ) (hm : ∀ a i, MOK (mask a i)) (as es : List ℕ)
    (h : groups mask nW as es = some []) : es.length ≤ as.length * (nW * 512) := by
  rw [groups_length mask nW as es [] h]
  rw [List.length_nil, Finset.sum_const_zero, Nat.zero_add, Nat.zero_add]
  have hb : ∀ x ∈ as.map (fun a => ∑ i ∈ range nW, cntM (mask a (0 + i))), x ≤ nW * 512 := by
    intro x hx
    obtain ⟨a, _, rfl⟩ := List.mem_map.mp hx
    calc ∑ i ∈ range nW, cntM (mask a (0 + i)) ≤ ∑ i ∈ range nW, 512 := Finset.sum_le_sum (fun i _ => cntM_le _ (hm _ _))
      _ = nW * 512 := by simp
  have := List.sum_le_card_nsmul _ _ hb
  rw [List.length_map, smul_eq_mul] at this
  exact this

/-- the partial sums partition `[0, total)` -/
theorem gsum_mono (gs : List Grp) (f : Grp → ℕ) {i j : ℕ} (h : i ≤ j) : gsum gs f i ≤ gsum gs f j := by
  unfold gsum; exact Finset.sum_le_sum_of_subset (Finset.range_subset_range.mpr h)

theorem gsum_succ (gs : List Grp) (f : Grp → ℕ) (i : ℕ) : gsum gs f (i + 1) = gsum gs f i + f (gs.getD i g0) := by
  unfold gsum; rw [Finset.sum_range_succ]

theorem gsum_find (gs : List Grp) (f : Grp → ℕ) : ∀ (n b : ℕ), b < gsum gs f n →
    ∃ i < n, gsum gs f i ≤ b ∧ b < gsum gs f i + f (gs.getD i g0)
  | 0, b, h => by simp [gsum] at h
  | n + 1, b, h => by
    by_cases hb : b < gsum gs f n
    · obtain ⟨i, hi, h1, h2⟩ := gsum_find gs f n b hb
      exact ⟨i, by omega, h1, h2⟩
    · rw [gsum_succ] at h
      exact ⟨n, by omega, by omega, h⟩

/-- the unpacked `checkR1` -/
theorem checkR1_unpack {t0 d : ℕ} {r1 : R1} {PB1 PC1 : ℕ} {B1 C1 : List ℕ} (h : checkR1 t0 d r1 PB1 PC1 B1 C1 = true) :
    groups (fun a V => bmaskF t0 d a V 1) (2 ^ d) (ofRank 1 (fA t0)) B1 = some [] ∧
    groups (fun a U => cmaskF t0 d a U 1) (2 ^ d) (ofRank 1 (fA t0)) C1 = some [] ∧
    pk 32 (B1.map fun e => xvF d (eA e) (eX e) (eW e) 0) = PB1 ∧
    pk 32 (C1.map fun e => yuF d (eA e) (eX e) (eW e) 0) = PC1 ∧
    grpsOK PB1 PC1 r1.gs (ofRank 1 (fA t0)) B1 C1 0 0 = true ∧
    r1.AB = 2 ^ B1.length - 1 ∧ r1.AC = 2 ^ C1.length - 1 := by
  have e : Nat.shiftLeft 1 d = 2 ^ d := shiftLeft_one _
  unfold checkR1 at h
  rw [e] at h
  generalize ofRank 1 (fA t0) = as1 at h ⊢
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h6⟩, h7⟩ := h
  have h6' : r1.AB = Nat.sub (Nat.shiftLeft 1 B1.length) 1 := Nat.eq_of_beq_eq_true h6
  have h7' : r1.AC = Nat.sub (Nat.shiftLeft 1 C1.length) 1 := Nat.eq_of_beq_eq_true h7
  rw [shiftLeft_one] at h6' h7'
  refine ⟨?_, ?_, Nat.eq_of_beq_eq_true h2, Nat.eq_of_beq_eq_true h3, h4, h6', h7'⟩
  · revert h1
    cases groups (fun a V => bmaskF t0 d a V 1) (2 ^ d) as1 B1 with
    | none => simp
    | some l => cases l <;> cases groups (fun a U => cmaskF t0 d a U 1) (2 ^ d) as1 C1 <;> simp
  · revert h1
    cases groups (fun a V => bmaskF t0 d a V 1) (2 ^ d) as1 B1 with
    | none => simp
    | some l =>
      cases hc : groups (fun a U => cmaskF t0 d a U 1) (2 ^ d) as1 C1 with
      | none => cases l <;> simp
      | some l' => cases l <;> cases l' <;> simp

/-- the rank-1 data of `checkR1` (all of `R1Data` but the slices) and rank-1 completeness -/
theorem checkR1_facts {d : ℕ} {T0 : State} (hA : Anchor d T0) {r1 : R1} {PB1 PC1 : ℕ} {B1 C1 : List ℕ}
    (hck : checkR1 (pkState d T0) d r1 PB1 PC1 B1 C1 = true) :
    r1.AB = 2 ^ B1.length - 1 ∧ r1.AC = 2 ^ C1.length - 1 ∧
    (∀ b < B1.length, fld PB1 b < 2 ^ 29) ∧ (∀ c < C1.length, fld PC1 c < 2 ^ 29) ∧
    (∀ gi < r1.gs.length, (grpAt r1 gi).lb + (grpAt r1 gi).nb ≤ B1.length ∧
      (grpAt r1 gi).lc + (grpAt r1 gi).nc ≤ C1.length ∧
      (grpAt r1 gi).PB = win PB1 (32 * (grpAt r1 gi).lb) (32 * (grpAt r1 gi).nb) ∧
      (grpAt r1 gi).PC = win PC1 (32 * (grpAt r1 gi).lc) (32 * (grpAt r1 gi).nc) ∧
      0 < (grpAt r1 gi).a ∧ (grpAt r1 gi).a < 512) ∧
    (∀ gi < r1.gs.length, ∀ gj < r1.gs.length, (grpAt r1 gi).a = (grpAt r1 gj).a → gi = gj) ∧
    (∀ gi < r1.gs.length, ∀ gj < r1.gs.length, gi ≠ gj → ∀ b, (grpAt r1 gi).lb ≤ b → b < (grpAt r1 gi).lb + (grpAt r1 gi).nb →
      ¬ ((grpAt r1 gj).lb ≤ b ∧ b < (grpAt r1 gj).lb + (grpAt r1 gj).nb)) ∧
    (∀ gi < r1.gs.length, ∀ gj < r1.gs.length, gi ≠ gj → ∀ c, (grpAt r1 gi).lc ≤ c → c < (grpAt r1 gi).lc + (grpAt r1 gi).nc →
      ¬ ((grpAt r1 gj).lc ≤ c ∧ c < (grpAt r1 gj).lc + (grpAt r1 gj).nc)) ∧
    R1Complete d T0 r1 PB1 PC1 := by
  obtain ⟨hgB, hgC, hpB, hpC, hgrp, hAB, hAC⟩ := checkR1_unpack hck
  set t0 := pkState d T0 with ht0
  set as1 := ofRank 1 (fA t0) with has1
  obtain ⟨hlen, hlB, hlC, hall⟩ := grpsOK_spec PB1 PC1 r1.gs as1 B1 C1 0 0 hgrp
  obtain ⟨preB, hesB, hentB, hmemB⟩ := groups_spec _ (2 ^ d) as1 B1 [] hgB
  obtain ⟨preC, hesC, hentC, hmemC⟩ := groups_spec _ (2 ^ d) as1 C1 [] hgC
  rw [List.append_nil] at hesB hesC
  -- entries have values below 512
  have hXB : ∀ e ∈ B1, eX e < 512 := by
    intro e he; rw [hesB] at he
    obtain ⟨_, i, _, _, hm⟩ := hentB e he
    have := (bmaskF_mok _ _ _ _ _ _ hm).2; omega
  have hXC : ∀ e ∈ C1, eX e < 512 := by
    intro e he; rw [hesC] at he
    obtain ⟨_, i, _, _, hm⟩ := hentC e he
    have := (cmaskF_mok _ _ _ _ _ _ hm).2; omega
  have hd4 : 2 ^ d ≤ 4 := by
    calc 2 ^ d ≤ 2 ^ 2 := Nat.pow_le_pow_right (by norm_num) hA.hd
      _ = 4 := by norm_num
  have hlenB : B1.length ≤ 2 ^ 24 := by
    have := groups_length_le _ (2 ^ d) (fun a i => bmaskF_mok _ _ _ _ _) as1 B1 hgB
    have h512 := ofRank_length 1 (fA t0)
    calc B1.length ≤ as1.length * (2 ^ d * 512) := this
      _ ≤ 512 * (4 * 512) := Nat.mul_le_mul h512 (Nat.mul_le_mul_right _ hd4)
      _ ≤ 2 ^ 24 := by norm_num
  have hlenC : C1.length ≤ 2 ^ 24 := by
    have := groups_length_le _ (2 ^ d) (fun a i => cmaskF_mok _ _ _ _ _) as1 C1 hgC
    have h512 := ofRank_length 1 (fA t0)
    calc C1.length ≤ as1.length * (2 ^ d * 512) := this
      _ ≤ 512 * (4 * 512) := Nat.mul_le_mul h512 (Nat.mul_le_mul_right _ hd4)
      _ ≤ 2 ^ 24 := by norm_num
  have hfB : ∀ e ∈ B1, xvF d (eA e) (eX e) (eW e) 0 < 2 ^ 29 := fun e he => xvF_lt _ _ _ _ _ hA.hd (hXB e he) (Lc_lt _ _)
  have hfC : ∀ e ∈ C1, yuF d (eA e) (eX e) (eW e) 0 < 2 ^ 29 := fun e he => yuF_lt _ _ _ _ _ hA.hd (hXC e he) (Rc_lt _ _)
  have hPB : ∀ b < B1.length, fld PB1 b = xvF d (eA (B1.getD b 0)) (eX (B1.getD b 0)) (eW (B1.getD b 0)) 0 := by
    intro b hb
    rw [← hpB, pk_eq _ (by intro x hx; rw [List.mem_map] at hx; obtain ⟨e, he, rfl⟩ := hx; exact lt_trans (hfB e he) (by norm_num))
      (by rw [List.length_map]; exact hlenB)]
    rw [fld_pk32 _ _ _ (fun k hk => ?_) (by rw [List.length_map]; exact hb)]
    · rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getD_eq_getElem?_getD]
      rw [List.getElem?_eq_getElem hb]; rfl
    · rw [List.length_map] at hk
      rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_eq_getElem hk]
      exact lt_trans (hfB _ (List.getElem_mem hk)) (by norm_num)
  have hPC : ∀ c < C1.length, fld PC1 c = yuF d (eA (C1.getD c 0)) (eX (C1.getD c 0)) (eW (C1.getD c 0)) 0 := by
    intro c hc
    rw [← hpC, pk_eq _ (by intro x hx; rw [List.mem_map] at hx; obtain ⟨e, he, rfl⟩ := hx; exact lt_trans (hfC e he) (by norm_num))
      (by rw [List.length_map]; exact hlenC)]
    rw [fld_pk32 _ _ _ (fun k hk => ?_) (by rw [List.length_map]; exact hc)]
    · rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getD_eq_getElem?_getD]
      rw [List.getElem?_eq_getElem hc]; rfl
    · rw [List.length_map] at hk
      rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_eq_getElem hk]
      exact lt_trans (hfC _ (List.getElem_mem hk)) (by norm_num)
  -- the groups' first factors are `as1`, pairwise distinct
  have hga : ∀ gi < r1.gs.length, (grpAt r1 gi).a = as1.getD gi 0 := fun gi hgi => (hall gi hgi).1
  have hgamem : ∀ gi < r1.gs.length, as1.getD gi 0 ∈ as1 := fun gi hgi => getD_mem (by rw [← hlen]; exact hgi)
  have hainj : ∀ gi < r1.gs.length, ∀ gj < r1.gs.length, (grpAt r1 gi).a = (grpAt r1 gj).a → gi = gj := by
    intro gi hgi gj hgj e
    rw [hga gi hgi, hga gj hgj] at e
    have hnd := ofRank_nodup 1 (fA t0)
    rw [List.getD_eq_getElem?_getD, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem (by rw [← hlen]; exact hgi),
      List.getElem?_eq_getElem (by rw [← hlen]; exact hgj)] at e
    simp only [Option.getD_some] at e
    exact (List.Nodup.getElem_inj_iff hnd).mp e
  refine ⟨hAB, hAC, fun b hb => by rw [hPB b hb]; exact hfB _ (getD_mem hb),
    fun c hc => by rw [hPC c hc]; exact hfC _ (getD_mem hc), ?_, hainj, ?_, ?_, ?_⟩
  · intro gi hgi
    obtain ⟨ha, hlb, hlc, hPBw, hPCw, _, _⟩ := hall gi hgi
    have hmem := mem_ofRank.mp (hgamem gi hgi)
    refine ⟨?_, ?_, hPBw, hPCw, ?_, ?_⟩
    · rw [hlb, Nat.zero_add, ← gsum_succ, hlB]; exact gsum_mono _ _ (by omega)
    · rw [hlc, Nat.zero_add, ← gsum_succ, hlC]; exact gsum_mono _ _ (by omega)
    · rw [ha]; exact Nat.pos_of_ne_zero hmem.2.2.2
    · rw [ha]; exact hmem.1
  · intro gi hgi gj hgj hne b h1 h2 ⟨h3, h4⟩
    obtain ⟨_, hlbi, _, _, _, _, _⟩ := hall gi hgi
    obtain ⟨_, hlbj, _, _, _, _, _⟩ := hall gj hgj
    rw [hlbi, Nat.zero_add] at h1 h2
    rw [hlbj, Nat.zero_add] at h3 h4
    rw [← gsum_succ] at h2 h4
    rcases Nat.lt_or_gt_of_ne hne with hlt | hlt
    · have := gsum_mono r1.gs Grp.nb (show gi + 1 ≤ gj by omega); omega
    · have := gsum_mono r1.gs Grp.nb (show gj + 1 ≤ gi by omega); omega
  · intro gi hgi gj hgj hne c h1 h2 ⟨h3, h4⟩
    obtain ⟨_, _, hlci, _, _, _, _⟩ := hall gi hgi
    obtain ⟨_, _, hlcj, _, _, _, _⟩ := hall gj hgj
    rw [hlci, Nat.zero_add] at h1 h2
    rw [hlcj, Nat.zero_add] at h3 h4
    rw [← gsum_succ] at h2 h4
    rcases Nat.lt_or_gt_of_ne hne with hlt | hlt
    · have := gsum_mono r1.gs Grp.nc (show gi + 1 ≤ gj by omega); omega
    · have := gsum_mono r1.gs Grp.nc (show gj + 1 ≤ gi by omega); omega
  · -- completeness
    intro s hv hc hr1
    obtain ⟨hpos, hsa, hsB, hsC, hsU, hsV, _⟩ := hv
    have hfA : fA t0 = T0.a := fA_pk hA.hd hA.ha
    have hmem : s.a ∈ as1 := by
      rw [has1, mem_ofRank]; exact ⟨hsa, hr1, by rw [hfA]; exact fun e => hc.1 e.symm, by omega⟩
    have hUlt : s.U < 2 ^ d := by rw [hr1, Nat.mul_one] at hsU; exact hsU
    have hVlt : s.V < 2 ^ d := by rw [hr1, Nat.mul_one] at hsV; exact hsV
    have hBm : (bmaskF t0 d s.a s.V 1).testBit (32 * s.B) = true := by
      have := bmaskF_of_compat hA hsB hc; rw [hr1] at this; exact this
    have hCm : (cmaskF t0 d s.a s.U 1).testBit (32 * s.C) = true := by
      have := cmaskF_of_compat hA hsC hc; rw [hr1] at this; exact this
    obtain ⟨eB, heB, heBA, heBW, heBX⟩ := hmemB s.a hmem s.V hVlt s.B hBm
    obtain ⟨eC, heC, heCA, heCW, heCX⟩ := hmemC s.a hmem s.U hUlt s.C hCm
    rw [← hesB] at heB
    rw [← hesC] at heC
    obtain ⟨b, hb, hgetB⟩ : ∃ b < B1.length, B1.getD b 0 = eB := by
      obtain ⟨b, hb, hg⟩ := List.getElem_of_mem heB
      exact ⟨b, hb, by rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hb]; simpa using hg⟩
    obtain ⟨c, hc', hgetC⟩ : ∃ c < C1.length, C1.getD c 0 = eC := by
      obtain ⟨c, hc', hg⟩ := List.getElem_of_mem heC
      exact ⟨c, hc', by rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hc']; simpa using hg⟩
    -- the groups of `b` and `c`
    obtain ⟨gi, hgi, hgi1, hgi2⟩ := gsum_find r1.gs Grp.nb r1.gs.length b (by rw [← hlB]; exact hb)
    obtain ⟨gj, hgj, hgj1, hgj2⟩ := gsum_find r1.gs Grp.nc r1.gs.length c (by rw [← hlC]; exact hc')
    obtain ⟨hai, hlbi, _, _, _, hentBi, _⟩ := hall gi hgi
    obtain ⟨haj, _, hlcj, _, _, _, hentCj⟩ := hall gj hgj
    have hbA := hentBi (b - gsum r1.gs Grp.nb gi) (by omega)
    rw [show gsum r1.gs Grp.nb gi + (b - gsum r1.gs Grp.nb gi) = b by omega, hgetB, heBA] at hbA
    have hcA := hentCj (c - gsum r1.gs Grp.nc gj) (by omega)
    rw [show gsum r1.gs Grp.nc gj + (c - gsum r1.gs Grp.nc gj) = c by omega, hgetC, heCA] at hcA
    have hgg : gi = gj := hainj gi hgi gj hgj (by rw [hai, haj, ← hbA, ← hcA])
    subst hgg
    obtain ⟨_, _, hlci, _, _, _, _⟩ := hall gi hgi
    refine ⟨gi, b, c, hgi, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
    · rw [hlbi, Nat.zero_add]; exact hgi1
    · rw [hlbi, Nat.zero_add]; exact hgi2
    · rw [hlci, Nat.zero_add]; exact hgj1
    · rw [hlci, Nat.zero_add]; exact hgj2
    · rw [hPB b hb, hgetB, heBA, heBW, heBX, xvF_state d s 0 hsB, fXV_pk (by omega) hA.hd hsa]
    · rw [hPC c hc', hgetC, heCA, heCW, heCX, yuF_state d s 0 hsC, fYU_pk (by omega) hA.hd hsa]
    · rw [hai, ← hbA]

end GS

#print axioms GS.checkR1_facts
