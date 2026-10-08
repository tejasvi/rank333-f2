module
public import R22Port.U_d41d8cd98f00
public import R.Agree
/-! # Agreement, continued: prefixes, saturations, zeroing, fixings, canonicity, header records -/
@[expose] public section
namespace E1NR
open E1N Finset E1PS

variable {D : IPD} {C : E1P.Ctx} {sl : ℕ → ℕ} {UB UBR : ℕ} {K : Blk} {RTb H : ℕ}

/-! ## The packed prefix `pk 8 (af labs) labs.size` -/

theorem bit_eq (a k : ℕ) : ((a >>> k) &&& 1 == 1) = a.testBit k := by
  rw [Nat.testBit_eq_decide_div_mod_eq, Nat.shiftRight_eq_div_pow, show (1 : ℕ) = 2 ^ 1 - 1 by norm_num,
    Nat.and_two_pow_sub_one_eq_mod, pow_one]
  by_cases h : a / 2 ^ k % 2 = 1 <;> simp [h]

theorem pl_lt (labs : Array ℕ) (hl : LabOK labs) : pk 8 (af labs) labs.size < 2 ^ (8 * labs.size) :=
  pk_lt 8 _ _ (fun v hv => lt_trans (hl v hv) (by norm_num))

/-- the kernel's child prefix `pl ||| l <<< 8 d` is the prefix of `labs.push l` -/
theorem pl_push (labs : Array ℕ) (hl : LabOK labs) (l : ℕ) :
    Nat.lor (pk 8 (af labs) labs.size) (Nat.shiftLeft l (Nat.mul 8 labs.size)) = pk 8 (af (labs.push l)) (labs.push l).size := by
  rw [Array.size_push, pk_succ, af_push_size, pk_congr 8 (af (labs.push l)) (af labs) _ (fun v hv => af_push_lt _ _ _ hv)]
  rw [show Nat.lor (pk 8 (af labs) labs.size) (Nat.shiftLeft l (Nat.mul 8 labs.size)) =
    pk 8 (af labs) labs.size ||| l <<< (8 * labs.size) from rfl, Nat.lor_comm,
    ← Nat.shiftLeft_add_eq_or_of_lt (pl_lt labs hl), Nat.shiftLeft_eq]
  ring

theorem multR_dig (d : ℕ) : ∀ pl l, multR d pl l = ∑ i ∈ range d, (if dig 8 pl i = l then 1 else 0) := by
  induction d with
  | zero => intro pl l; simp [multR]
  | succ d ih =>
    intro pl l
    rw [multR, ih, sum_range_succ']
    have e0 : dig 8 pl 0 = pl % 256 := by simp [dig]
    have e1 : ∀ i, dig 8 (pl / 256) i = dig 8 pl (i + 1) := by
      intro i; unfold dig; rw [Nat.div_div_eq_div_mul, show 256 * 2 ^ (8 * i) = 2 ^ (8 * (i + 1)) by ring]
    simp only [e0, e1]; ring

/-- the kernel's multiplicities of the packed prefix -/
theorem multR_pl (labs : Array ℕ) (hl : LabOK labs) (l : ℕ) : multR labs.size (pk 8 (af labs) labs.size) l = cnt labs l := by
  rw [multR_dig]; unfold cnt
  apply Finset.sum_congr rfl; intro i hi
  rw [dig_pk 8 _ _ (fun v hv => lt_trans (hl v hv) (by norm_num)) i (mem_range.mp hi)]

theorem labOK_push (labs : Array ℕ) (hl : LabOK labs) (l : ℕ) (hl' : l < 255) : LabOK (labs.push l) := by
  intro r hr; rw [Array.size_push] at hr; rw [af_push]
  split
  · exact hl r (by assumption)
  · split
    · exact hl'
    · omega

/-- the kernel's child multiplicities -/
theorem child_V' (labs : Array ℕ) (l : ℕ) (hl : l < 255) :
    Nat.add (V (cnt labs)) (E1P.one l) = V (cnt (labs.push l)) := by
  rw [one_V l hl, show Nat.add (V (cnt labs)) (V fun j => if j = l then 1 else 0) =
    V (cnt labs) + V (fun j => if j = l then 1 else 0) from rfl, V_add]
  apply V_congr; intro j _; rw [cnt_push]; by_cases h : j = l
  · subst h; simp
  · simp [h, Ne.symm h]

theorem child_VR' (labs : Array ℕ) (l : ℕ) (hl : l < 255) :
    Nat.add (VR (cnt labs)) (E1P.oner l) = VR (cnt (labs.push l)) := by
  rw [oner_VR l hl, show Nat.add (VR (cnt labs)) (VR fun j => if j = l then 1 else 0) =
    VR (cnt labs) + VR (fun j => if j = l then 1 else 0) from rfl, VR_add]
  apply VR_congr; intro j _; rw [cnt_push]; by_cases h : j = l
  · subst h; simp
  · simp [h, Ne.symm h]

/-! ## Budgets -/

/-- budgets: `nl` entries, each at most `2^32` -/
def BudOK (u : Array ℕ) : Prop := u.size = 255 ∧ ∀ x < 255, af u x ≤ 2 ^ 32

/-- a child's budgets before saturation: `u l - 1` -/
theorem child_U (u : Array ℕ) (hu : BudOK u) (l : ℕ) (hl : l < 255) (h1 : 1 ≤ af u l) :
    Nat.sub (V (af u)) (E1P.one l) = V (af (u.set! l (af u l - 1))) ∧
    Nat.sub (VR (af u)) (E1P.oner l) = VR (af (u.set! l (af u l - 1))) := by
  have hsub : ∀ j < 255, (fun j => if j = l then 1 else 0) j ≤ af u j := by
    intro j _; dsimp only; split
    · next h => subst h; exact h1
    · exact Nat.zero_le _
  constructor
  · rw [one_V l hl, show Nat.sub (V (af u)) (V fun j => if j = l then 1 else 0) =
      V (af u) - V (fun j => if j = l then 1 else 0) from rfl, V_sub _ _ hsub]
    apply V_congr; intro j hj; rw [af_set]
    by_cases h : l = j
    · subst h; simp [hu.1, hl]
    · simp [h, Ne.symm h]
  · rw [oner_VR l hl, show Nat.sub (VR (af u)) (VR fun j => if j = l then 1 else 0) =
      VR (af u) - VR (fun j => if j = l then 1 else 0) from rfl, VR_sub _ _ hsub]
    apply VR_congr; intro j hj; rw [af_set]
    by_cases h : l = j
    · subst h; simp [hu.1, hl]
    · simp [h, Ne.symm h]

theorem budOK_set (u : Array ℕ) (hu : BudOK u) (l v : ℕ) (hv : v ≤ af u l) : BudOK (u.set! l v) := by
  refine ⟨by rw [size_set]; exact hu.1, fun x hx => ?_⟩
  rw [af_set]; split
  · next h => rw [h.1] at hv; exact le_trans hv (hu.2 x hx)
  · exact hu.2 x hx

/-! ## Saturations -/

theorem wbit_or (hD : IPRel D C sl UB UBR) (i : ℕ) (U : Array ℕ) (hU : U.size = 8) (x : ℕ) (hx : x < 255) :
    wbit (E1N.orRowGo D i D.mw 0 U) x = (wbit U x || E1N.sbit D i x) := by
  unfold wbit E1N.sbit
  rw [orRowGo_af, if_pos ⟨Nat.zero_le _, by rw [hD.mw]; omega, by rw [hU]; omega⟩, bit_eq, bit_eq, bit_eq,
    Nat.testBit_or]

theorem orRowGo_size' (D : IPD) (i : ℕ) (U : Array ℕ) : (E1N.orRowGo D i D.mw 0 U).size = U.size := orRowGo_size D i _ _ _

/-- the saturation loop: the kernel's `(ok, ∪ masks, ∪ reversed masks, rest)` against the native union `U` -/
theorem sats_rel (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H)
    (hrev : ∀ i < 2 ^ 19, ∀ t < 255, (smr (sl i)).testBit t = (smask (sl i)).testBit (254 - t))
    (labs : Array ℕ) (hl : LabOK labs) (hs : labs.size ≤ 64) (e : ℕ) :
    ∀ n q M MR (U U' : Array ℕ), E1N.satsGo D K labs e n q U = some U' → U.size = 8 → M < 2 ^ 255 → MR < 2 ^ 255 →
      (∀ x < 255, M.testBit x = wbit U x) → (∀ t < 255, MR.testBit t = M.testBit (254 - t)) →
      (satsMF RTb (V (cnt labs)) n true M MR (win K.B q e)).1 = true ∧
      (satsMF RTb (V (cnt labs)) n true M MR (win K.B q e)).2.2.2 = win K.B (q + 12 * n) e ∧
      (satsMF RTb (V (cnt labs)) n true M MR (win K.B q e)).2.1 < 2 ^ 255 ∧
      (satsMF RTb (V (cnt labs)) n true M MR (win K.B q e)).2.2.1 < 2 ^ 255 ∧
      (∀ x < 255, (satsMF RTb (V (cnt labs)) n true M MR (win K.B q e)).2.1.testBit x = wbit U' x) ∧
      (∀ t < 255, (satsMF RTb (V (cnt labs)) n true M MR (win K.B q e)).2.2.1.testBit t =
        (satsMF RTb (V (cnt labs)) n true M MR (win K.B q e)).2.1.testBit (254 - t)) ∧ U'.size = 8 := by
  intro n
  induction n with
  | zero =>
    intro q M MR U U' h hU hM hMR hMU hR
    simp only [E1N.satsGo, Option.some.injEq] at h; subst h
    exact ⟨rfl, by simp [satsMF], hM, hMR, hMU, hR, hU⟩
  | succ n ih =>
    intro q M MR U U' h hU hM hMR hMU hR
    rw [satsMF_succ]
    have hj : E1P.rd 12 (win K.B q e) = E1N.rdE K.B q e 12 := rd_win K.B q e 12 (by norm_num)
    have hS : E1P.sk 12 (win K.B q e) = win K.B (q + 12) e := sk_win K.B q e 12
    rw [hj, hS]
    rw [E1N.satsGo] at h
    generalize hjv : E1N.rdE K.B q e 12 = j at h
    by_cases hc : E1N.msumL D labs (E1N.gix D K j) = E1N.scap D (E1N.gix D K j)
    · rw [if_pos (by simp [hc])] at h
      have hok : @Bool.rec (fun _ => Bool) false (Nat.beq (E1P.fsum (Nat.land (V (cnt labs))
          (E1P.fmask (E1P.rmask RTb j)))) (E1P.rcap RTb j)) true = true := by
        rw [fsum_rel hD hK labs hl (le_trans hs (by norm_num)) j, rcap_rel hD hK j, hc]
        simp
      rw [hok]
      have hU1 : (E1N.orRowGo D (E1N.gix D K j) D.mw 0 U).size = 8 := by rw [orRowGo_size']; exact hU
      have := ih (q + 12) (M ||| E1P.rmask RTb j) (MR ||| E1P.rmaskr RTb j) _ U' h hU1
        (Nat.or_lt_two_pow hM (rmask_lt j)) (Nat.or_lt_two_pow hMR (rmaskr_lt j))
        (fun x hx => by rw [Nat.testBit_or, hMU x hx, rmask_rel hD hK j x hx, wbit_or hD _ U hU x hx])
        (fun t ht => by rw [Nat.testBit_or, Nat.testBit_or, hR t ht, rmaskr_rev hK hrev j t ht])
      rw [show q + 12 + 12 * n = q + 12 * (n + 1) by ring] at this
      exact this
    · rw [if_neg (by simp [hc])] at h; exact absurd h (by simp)

/-- zeroing the budgets of the union -/
theorem satsZ_rel (hD : IPRel D C sl UB UBR) (u : Array ℕ) (hu : BudOK u) (M MR : ℕ) (U : Array ℕ) (hM : M < 2 ^ 255)
    (hMR : MR < 2 ^ 255) (hMU : ∀ x < 255, M.testBit x = wbit U x) (hR : ∀ t < 255, MR.testBit t = M.testBit (254 - t)) :
    Nat.land (V (af u)) (Nat.xor ECTP.FMALL (E1P.fmask M)) = V (af (E1N.zeroU D u U)) ∧
    Nat.land (VR (af u)) (Nat.xor ECTP.FMALL (E1P.fmask MR)) = VR (af (E1N.zeroU D u U)) := by
  have hub : ∀ l < 255, af u l < 2 ^ 256 := fun l hl => lt_of_le_of_lt (hu.2 l hl) (by norm_num)
  have hz : ∀ l < 255, af (E1N.zeroU D u U) l = if M.testBit l then 0 else af u l := by
    intro l hl; rw [zeroU_af D u U l (by rw [hD.nl]; exact hl) (by rw [hu.1, hD.nl]), hMU l hl]
  constructor
  · rw [land_nfmask (af u) M hub hM]; apply V_congr; intro l hl; rw [hz l hl]
  · rw [land_nfmask_R (af u) M MR hub hM hMR hR]; apply VR_congr; intro l hl; rw [hz l hl]

theorem budOK_zero (hD : IPRel D C sl UB UBR) (u U : Array ℕ) (hu : BudOK u) : BudOK (E1N.zeroU D u U) := by
  refine ⟨by rw [zeroU_size]; exact hu.1, fun x hx => ?_⟩
  rw [zeroU_af D u U x (by rw [hD.nl]; exact hx) (by rw [hu.1, hD.nl])]
  split
  · exact Nat.zero_le _
  · exact hu.2 x hx

/-! ## Fixings -/

theorem fixes_rel (hD : IPRel D C sl UB UBR) (e gap : ℕ) (du : Dual) (hdu : DuOK du) (hk : du.is.size ≤ 64) :
    ∀ n q (u u' : Array ℕ), BudOK u → E1N.fixesGo D K e gap du n q u = some u' →
      fixesF (V (tf D du)) gap n true (V (af u)) (VR (af u)) (win K.B q e) =
        (true, V (af u'), VR (af u'), win K.B (q + 11 * n) e) ∧ BudOK u' := by
  have htb : ∀ l, tf D du l < 2 ^ 256 := fun l =>
    lt_of_le_of_lt (tf_le du hdu l) (lt_of_le_of_lt (Nat.mul_le_mul_right _ hk) (by norm_num))
  intro n
  induction n with
  | zero => intro q u u' hu h; simp only [E1N.fixesGo, Option.some.injEq] at h; subst h; exact ⟨by simp [fixesF], hu⟩
  | succ n ih =>
    intro q u u' hu h
    rw [fixesF_succ]
    have hl0 : E1P.rd 8 (win K.B q e) = E1N.rdE K.B q e 8 := rd_win K.B q e 8 (by norm_num)
    have hnu : E1P.rd 3 (E1P.sk 8 (win K.B q e)) = E1N.rdE K.B (q + 8) e 3 := by
      rw [sk_win]; exact rd_win K.B (q + 8) e 3 (by norm_num)
    have hS : E1P.sk 11 (win K.B q e) = win K.B (q + 11) e := sk_win K.B q e 11
    rw [hl0, hnu, hS]
    rw [E1N.fixesGo, hD.lb] at h
    simp only [hD.nl] at h
    generalize hlv : E1N.rdE K.B q e 8 = l0 at h
    generalize hnv : E1N.rdE K.B (q + 8) e 3 = nu at h
    split at h
    · next hc =>
      simp only [Bool.and_eq_true, decide_eq_true_eq] at hc
      obtain ⟨⟨⟨hl0lt, c1⟩, c2⟩, c3⟩ := hc
      change nu + 1 ≤ af u l0 at c2
      rw [tAt_eq] at c1 c3
      have ub : ∀ l < 255, af u l < 2 ^ 256 := fun l hl => lt_of_le_of_lt (hu.2 l hl) (by norm_num)
      have eT : E1P.fld (V (tf D du)) l0 = tf D du l0 := fld_V _ (fun l _ => htb l) l0 hl0lt
      have eU : E1P.fld (V (af u)) l0 = af u l0 := fld_V _ ub l0 hl0lt
      rw [eT, eU]
      have hok : @Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false
          (Nat.ble (gap + 1) ((nu + 1) * (tf D du l0 - 2 ^ 30))) (Nat.ble (nu + 1) (af u l0)))
          (Nat.ble (2 ^ 30 + 1) (tf D du l0))) true = true := by
        simp only [E1N.SC] at c1 c3
        have : Nat.ble (2 ^ 30 + 1) (tf D du l0) = true := Nat.ble_eq.mpr (by norm_num at c1 ⊢; omega)
        rw [this]
        have : Nat.ble (nu + 1) (af u l0) = true := Nat.ble_eq.mpr c2
        rw [this]
        exact Nat.ble_eq.mpr (by norm_num at c3 ⊢; omega)
      rw [hok]
      have hsub : ∀ j < 255, (fun j => if j = l0 then 1 else 0) j * (af u l0 - nu) ≤ af u j := by
        intro j _; dsimp only; split
        · next h' => subst h'; omega
        · simp
      have eV : V (af u) - (af u l0 - nu) * E1P.one l0 = V (af (u.set! l0 nu)) := by
        rw [one_V l0 hl0lt, mul_comm, V_mul, V_sub _ _ hsub]
        apply V_congr; intro j _; rw [af_set]
        by_cases h' : l0 = j
        · subst h'; simp [hu.1, hl0lt]; omega
        · simp [h', Ne.symm h']
      have eVR : VR (af u) - (af u l0 - nu) * E1P.oner l0 = VR (af (u.set! l0 nu)) := by
        rw [oner_VR l0 hl0lt, mul_comm, VR_mul, VR_sub _ _ hsub]
        apply VR_congr; intro j _; rw [af_set]
        by_cases h' : l0 = j
        · subst h'; simp [hu.1, hl0lt]; omega
        · simp [h', Ne.symm h']
      rw [eV, eVR]
      obtain ⟨h1, h2⟩ := ih (q + 11) (u.set! l0 nu) u' (budOK_set u hu l0 nu (by omega)) h
      rw [show q + 11 + 11 * n = q + 11 * (n + 1) by ring] at h1
      exact ⟨h1, h2⟩
    · exact absurd h (by simp)

end E1NR
