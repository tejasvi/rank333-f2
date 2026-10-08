module
public import R22Port.U_d41d8cd98f00
public import GS.PhD
/-! # Track D, part 3: the branch node and the main induction (`phaseD_sound`) -/
@[expose] public section
namespace GS.PD
open G G.V2 G.D2 G.A2 G.Acc Finset

/-! ## `compatP` is symmetric -/

theorem nat_beq_comm (a b : ℕ) : Nat.beq a b = Nat.beq b a := by
  by_cases h : a = b
  · subst h; rfl
  · have h1 : Nat.beq a b = false := by
      cases e : Nat.beq a b
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true e) h
    have h2 : Nat.beq b a = false := by
      cases e : Nat.beq b a
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true e).symm h
    rw [h1, h2]

theorem compatP_comm (t s : ℕ) : compatP t s = compatP s t := by
  unfold compatP
  rw [nat_beq_comm (fA t) (fA s)]
  cases compatP.cross t s (fR s) <;> cases compatP.cross s t (fR t) <;> simp

/-- the clique relation on candidates is symmetric -/
theorem CPt_symm (r1 : R1) (PB1 PC1 : ℕ) :
    Symmetric (fun x y : ℕ × ℕ × ℕ => CP (term1 r1 PB1 PC1 x) (term1 r1 PB1 PC1 y)) := by
  intro x y h; unfold CP at h ⊢; rw [compatP_comm]; exact h

theorem CP_irrefl (t : ℕ) : ¬ CP t t := by
  unfold CP compatP
  rw [Nat.beq_refl]; simp

/-! ## the branch node -/

theorem br_unfold (r1 : R1) (f need okb okc gi : ℕ) (obs ocs : List ℕ) (jss : List (List ℕ)) (cout : CoreCert)
    (cins : List CoreCert) (h : coreOKf r1 (f + 1) need okb okc (.br gi obs ocs jss cout cins) = true) :
    listChk1 obs (win okb (r1.gs.getD gi g0).lb (r1.gs.getD gi g0).nb) = true ∧
    listChk1 ocs (win okc (r1.gs.getD gi g0).lc (r1.gs.getD gi g0).nc) = true ∧
    ∃ xs, candT (r1.gs.getD gi g0).PB (packC (r1.gs.getD gi g0).PC ocs 0 0).1 (rep32 (packC (r1.gs.getD gi g0).PC ocs 0 0).2)
        (r1.gs.getD gi g0).a obs jss [] = some xs ∧
      coreOKf r1 f need (Nat.xor okb (Nat.shiftLeft (win okb (r1.gs.getD gi g0).lb (r1.gs.getD gi g0).nb)
        (r1.gs.getD gi g0).lb)) okc cout = true ∧ xs.length = cins.length ∧
      (xs.reverse.zip cins).all (fun xc => coreOKf r1 f (Nat.pred need) (Nat.land okb (okB r1 xc.1))
        (Nat.land okc (okC r1 xc.1)) xc.2) = true := by
  simp only [coreOKf] at h
  cases hch : (listChk1 obs (win okb (r1.gs.getD gi g0).lb (r1.gs.getD gi g0).nb) &&
      listChk1 ocs (win okc (r1.gs.getD gi g0).lc (r1.gs.getD gi g0).nc))
  · rw [hch] at h; simp at h
  · rw [hch] at h
    rw [Bool.and_eq_true] at hch
    refine ⟨hch.1, hch.2, ?_⟩
    simp only [cond_true] at h
    revert h
    cases hP : packC (r1.gs.getD gi g0).PC ocs 0 0 with
    | mk P n =>
      intro h
      simp only at h
      cases hC : candT (r1.gs.getD gi g0).PB P (rep32 n) (r1.gs.getD gi g0).a obs jss [] with
      | none => rw [hC] at h; simp at h
      | some xs =>
        rw [hC] at h
        simp only [Bool.and_eq_true] at h
        obtain ⟨⟨h1, h2⟩, h3⟩ := h
        exact ⟨xs, by simpa using hC, h1, Nat.eq_of_beq_eq_true h2, h3⟩

/-- the out branch's B mask: bits outside the group's range are kept -/
theorem testBit_out (okb lb nb b : ℕ) (hb : ¬ (lb ≤ b ∧ b < lb + nb)) :
    (Nat.xor okb (Nat.shiftLeft (win okb lb nb) lb)).testBit b = okb.testBit b := by
  show (okb ^^^ (win okb lb nb <<< lb)).testBit b = _
  rw [Nat.testBit_xor, Nat.testBit_shiftLeft, testBit_win]
  by_cases h1 : lb ≤ b
  · have h2 : ¬ (b - lb < nb) := by omega
    simp [h1, h2]
  · simp [h1]

/-- a pair of the zip of the reversed enumeration with the certificates -/
theorem zip_all {α β : Type} (xs : List α) (cins : List β) (p : α × β → Bool) (hlen : xs.length = cins.length)
    (h : (xs.reverse.zip cins).all p = true) (t : α) (ht : t ∈ xs) : ∃ c ∈ cins, p (t, c) = true := by
  have ht' : t ∈ xs.reverse := List.mem_reverse.mpr ht
  obtain ⟨i, hi, e⟩ := List.getElem_of_mem ht'
  have hi2 : i < cins.length := by rw [List.length_reverse] at hi; omega
  refine ⟨cins[i], List.getElem_mem hi2, ?_⟩
  have hz : (xs.reverse[i], cins[i]) ∈ xs.reverse.zip cins := by
    have hiz : i < (xs.reverse.zip cins).length := by simp [List.length_zip]; omega
    have := List.getElem_mem hiz
    rwa [List.getElem_zip] at this
  rw [List.all_eq_true] at h
  have := h _ hz
  rwa [e] at this

/-! ## the main induction -/

theorem sound_f (r1 : R1) (PB1 PC1 nB nC : ℕ) (hD : R1Data r1 PB1 PC1 nB nC) :
    ∀ (f need okb okc : ℕ) (cert : CoreCert), coreOKf r1 f need okb okc cert = true →
      NoClique r1 PB1 PC1 need okb okc
  | 0, need, okb, okc, cert, h => by simp [coreOKf] at h
  | f + 1, need, okb, okc, .cnt cs, h => by
    simp only [coreOKf] at h
    cases hc : cntOK okb okc r1.gs cs 0 with
    | none => rw [hc] at h; simp at h
    | some n =>
      rw [hc] at h
      exact cnt_sound hD hc (Nat.blt_eq.mp h)
  | f + 1, need, okb, okc, .col cs cols, h => by
    simp only [coreOKf] at h
    cases hc : colOK okb okc r1.gs cs cols empty16 with
    | none => rw [hc] at h; simp at h
    | some cl =>
      rw [hc] at h
      simp only [Bool.and_eq_true] at h
      obtain ⟨⟨h1, hok⟩, hdrop⟩ := h
      exact col_sound' hD hc hok hdrop (Nat.ble_eq.mp h1)
  | f + 1, need, okb, okc, .br gi obs ocs jss cout cins, h => by
    obtain ⟨hobs, hocs, xs, hxs, hout, hlen, hins⟩ := br_unfold r1 f need okb okc gi obs ocs jss cout cins h
    rintro ⟨L, hlenL, hcand, hpw⟩
    have hnodup : L.Nodup := by
      rw [List.Nodup]
      exact List.Pairwise.imp (fun {x y} h e => by subst e; exact CP_irrefl _ h) hpw
    by_cases hmem : ∃ x0 ∈ L, x0.1 = gi
    · -- a clique member in the branch group: the rest is a clique of the ins certificate of that member
      obtain ⟨⟨g0i, b0, c0⟩, hx0, hgi⟩ := hmem
      simp only at hgi
      subst hgi
      have hc0 := hcand _ hx0
      obtain ⟨hg, hb1, hb2, hc1, hc2, hokb, hokc, hpar⟩ := hc0
      simp only at hg hb1 hb2 hc1 hc2 hokb hokc hpar
      obtain ⟨-, -, hPB, hPC, -, -⟩ := grp_data hD hg
      simp only [grpAt] at hb1 hb2 hc1 hc2 hPB hPC
      have hbL := listed_of obs okb _ _ b0 hobs hb1 hb2 hokb
      have hcL := listed_of ocs okc _ _ c0 hocs hc1 hc2 hokc
      obtain ⟨i, hi, hie⟩ := idx_of_mem hcL
      have e1 : (r1.gs.getD g0i g0).lb + (b0 - (r1.gs.getD g0i g0).lb) = b0 := by omega
      have e2 : (r1.gs.getD g0i g0).lc + (c0 - (r1.gs.getD g0i g0).lc) = c0 := by omega
      have hfP : fld (packC (r1.gs.getD g0i g0).PC ocs 0 0).1 i = fld PC1 c0 := by
        rw [packC_fld _ ocs i hi, hie, hPC _ (by omega), e2]
      have hfB : get32 (r1.gs.getD g0i g0).PB (b0 - (r1.gs.getD g0i g0).lb) = fld PB1 b0 := by
        rw [hPB _ (by omega), e1]
      have hbit : (swarPar (packC (r1.gs.getD g0i g0).PC ocs 0 0).1 (rep32 (packC (r1.gs.getD g0i g0).PC ocs 0 0).2)
          (get32 (r1.gs.getD g0i g0).PB (b0 - (r1.gs.getD g0i g0).lb))).testBit (32 * i) = true := by
        rw [packC_snd]
        apply (swar_bit _ _ _ i (get32_lt _ _) hi).mpr
        rw [hfP, hfB]; exact (par32_one_iff _).mp hpar
      have ht0 := (candT_mem _ _ _ _ obs jss [] xs hxs).2 _ hbL i hbit
      rw [get32_eq, hfP, hfB] at ht0
      -- `ht0 : term1 x0 ∈ xs`
      have ht0' : term1 r1 PB1 PC1 (g0i, b0, c0) ∈ xs := ht0
      obtain ⟨c, hcmem, hcok⟩ := zip_all xs cins _ hlen hins _ ht0'
      have hIH := sound_f r1 PB1 PC1 nB nC hD f (Nat.pred need) _ _ c hcok
      apply hIH
      refine ⟨L.erase (g0i, b0, c0), ?_, ?_, ?_⟩
      · rw [List.length_erase_of_mem hx0, hlenL]; rfl
      · intro y hy
        rw [List.Nodup.mem_erase_iff hnodup] at hy
        obtain ⟨hne, hyL⟩ := hy
        have hcy := hcand y hyL
        have hCP : CP (term1 r1 PB1 PC1 (g0i, b0, c0)) (term1 r1 PB1 PC1 y) :=
          List.Pairwise.forall (CPt_symm r1 PB1 PC1) hpw hx0 hyL (Ne.symm hne)
        obtain ⟨-, hq1, hq2⟩ := (CP_term1 hD (hcand _ hx0) hcy).mp hCP
        obtain ⟨hgy, hby1, hby2, hcy1, hcy2, hokby, hokcy, hpary⟩ := hcy
        obtain ⟨-, -, hB0, hC0, ha0⟩ := cand_bounds hD (hcand _ hx0)
        obtain ⟨hby, hcy', -, -, -⟩ := cand_bounds hD (hcand y hyL)
        simp only at hB0 hC0 ha0
        refine ⟨hgy, hby1, hby2, hcy1, hcy2, ?_, ?_, hpary⟩
        · show (okb &&& okB r1 (term1 r1 PB1 PC1 (g0i, b0, c0))).testBit y.2.1 = true
          rw [Nat.testBit_and, hokby, testBit_okB r1 PB1 PC1 nB nC hD, fR_term1 hD (hcand _ hx0)]
          simp only [Bool.true_and, Bool.and_eq_true, decide_eq_true_eq]
          refine ⟨hby, fun q hq => ?_⟩
          have hq0 : q = 0 := by omega
          subst hq0
          unfold term1
          rw [fYU_mk _ _ _ hC0]
          exact (par32_zero_iff _).mp hq1
        · show (okc &&& okC r1 (term1 r1 PB1 PC1 (g0i, b0, c0))).testBit y.2.2 = true
          rw [Nat.testBit_and, hokcy, testBit_okC r1 PB1 PC1 nB nC hD, fR_term1 hD (hcand _ hx0)]
          simp only [Bool.true_and, Bool.and_eq_true, decide_eq_true_eq]
          refine ⟨hcy', fun q hq => ?_⟩
          have hq0 : q = 0 := by omega
          subst hq0
          unfold term1
          rw [fXV_mk _ _ _ hC0 hB0, parZ_and_comm]
          exact (par32_zero_iff _).mp hq2
      · exact hpw.sublist (List.erase_sublist)
    · -- no clique member in the branch group: the clique survives the out branch
      push Not at hmem
      have hIH := sound_f r1 PB1 PC1 nB nC hD f need _ okc cout hout
      apply hIH
      refine ⟨L, hlenL, fun y hy => ?_, hpw⟩
      obtain ⟨hgy, hby1, hby2, hcy1, hcy2, hokby, hokcy, hpary⟩ := hcand y hy
      refine ⟨hgy, hby1, hby2, hcy1, hcy2, ?_, hokcy, hpary⟩
      rw [testBit_out]
      · exact hokby
      · intro hin
        have hne := hmem y hy
        by_cases hgi : gi < r1.gs.length
        · exact hD.disjB y.1 hgy gi hgi hne y.2.1 hby1 hby2 hin
        · have : r1.gs.getD gi g0 = g0 := by
            rw [List.getD_eq_getElem?_getD, List.getElem?_eq_none (by omega)]; rfl
          rw [this] at hin
          simp [g0] at hin

/-- **phase D is sound** (the guarded D2 of md5 48bab26f…) -/
theorem phaseD_sound (r1 : R1) (PB1 PC1 nB nC : ℕ) (hD : R1Data r1 PB1 PC1 nB nC) (need okb okc : ℕ) (cert : CoreCert)
    (h : coreOK r1 need okb okc cert = true) : NoClique r1 PB1 PC1 need okb okc :=
  sound_f r1 PB1 PC1 nB nC hD 64 need okb okc cert h

end GS.PD

namespace GS

/-- **the statement of track D** (`GS/Spec.lean`) -/
theorem phaseDThm : PhaseDThm := fun r1 PB1 PC1 nB nC hD need okb okc cert h =>
  GS.PD.phaseD_sound r1 PB1 PC1 nB nC hD need okb okc cert h

end GS

#print axioms GS.PD.phaseD_sound
#print axioms GS.phaseDThm
