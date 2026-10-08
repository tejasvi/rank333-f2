module
public import R22Port.U_d41d8cd98f00
public import K2.XAgg
/-! # A leaner X-step: the complement matrix (kill2, DESIGN 27.14)

The X-step of `K2.xstep` spends most of its kernel time on operations over the whole window matrix. Three of them can go:
* the tree keeps the **complement** `NA` of the matrix (window bits of `A` flipped), so `Y·REP ∖ A` is one `land`;
* with the guard bits clear, the per-row decrement `acc ∧ ((acc ∨ GRD) − REP)` is `acc ∧ (acc + LOWS)`;
* the guard bits sit at `S·i + S − 1`, and `2^(S−1) ≡ 1 (mod 2^(S−1) − 1)`, so the gather needs no shift.

`xstepL_eq`: on the same data the two steps are equal. `checkXT2L` / `childL3L` are the hybrid tree and child checks on the
complement; `childL3L_imp` reduces them to `checkXT2` / `childL3`, so `childL3L_sound_label` follows from
`childL3_sound_label`. An in-branch also checks that its pick lies in the window (`1 <<< v < TOP`). -/
@[expose] public section
namespace K2
open MisF Finset

/-- `j` lowest-bit removals per row when the guard bits are clear (kernel form) -/
def remL (P LOWS j : ℕ) : ℕ := Nat.rec (motive := fun _ => ℕ) P (fun _ acc => Nat.land acc (Nat.add acc LOWS)) j

/-- the X-step on the complement matrix `NA` -/
def xstepL (NA REP GRD LOWS MODM cand H d : ℕ) : ℕ :=
  Nat.land cand (Nat.mod (Nat.land (Nat.add (remL (Nat.land (Nat.mul (Nat.land cand H) REP) NA) LOWS (Nat.sub d 1)) LOWS) GRD)
    MODM)

theorem remstep_eq (S n P REP GRD LOWS : ℕ) (hS : 1 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hP : P < 2 ^ (S * n)) (hd : ∀ i < n, dig S P i < 2 ^ (S - 1)) :
    (P ||| GRD) - REP = P + LOWS := by
  have hpow := two_pow_S S hS
  have hhalf : 1 ≤ 2 ^ (S - 1) := Nat.one_le_two_pow
  have hGlt : GRD < 2 ^ (S * n) := by rw [hGRD]; exact pk_lt _ _ _ (fun i _ => by omega)
  have hOlt : P ||| GRD < 2 ^ (S * n) := Nat.or_lt_two_pow hP hGlt
  have hOd : ∀ i < n, dig S (P ||| GRD) i = dig S P i + 2 ^ (S - 1) := by
    intro i hi
    rw [dig_lor, hGRD, dig_pk _ _ _ (fun j _ => by omega) i hi, lor_two_pow_of_lt (hd i hi)]
  have hO : P ||| GRD = pk S (fun i => dig S P i + 2 ^ (S - 1)) n := by
    rw [← pk_dig S (P ||| GRD) n hOlt]; exact pk_congr _ _ _ _ hOd
  have hPL : P + LOWS = pk S (fun i => dig S P i + (2 ^ (S - 1) - 1)) n := by
    rw [hL, pk_add, pk_dig S P n hP]
  have hsum : P + LOWS + REP = P ||| GRD := by
    rw [hPL, hREP, ← pk_add, hO]; apply pk_congr; intro i _; omega
  omega

theorem remL_eq (S n P REP GRD LOWS : ℕ) (hS : 1 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hP : P < 2 ^ (S * n)) (hd : ∀ i < n, dig S P i < 2 ^ (S - 1)) :
    ∀ j, remL P LOWS j = remR P GRD REP j := by
  intro j
  induction j with
  | zero => rfl
  | succ j ih =>
    obtain ⟨h1, _, h3⟩ := remR_spec S n P REP GRD hS hREP hGRD hP hd j
    change remL P LOWS j &&& (remL P LOWS j + LOWS) = remR P GRD REP j &&& ((remR P GRD REP j ||| GRD) - REP)
    rw [ih, remstep_eq S n _ REP GRD LOWS hS hREP hGRD hL h1 h3]

/-- gathering the guard bits without the shift -/
theorem gather0 (S n : ℕ) (g : ℕ → ℕ) (hg : ∀ i < n, g i ≤ 1) (hS : n + 2 ≤ S) :
    pk S (fun i => g i * 2 ^ (S - 1)) n % (2 ^ (S - 1) - 1) = pk 1 g n := by
  have h1 : pk S (fun i => g i * 2 ^ (S - 1)) n = 2 ^ (S - 1) * pk S g n := by
    rw [← pk_mul]; apply pk_congr; intro i _; ring
  have hlt : pk 1 g n < 2 ^ (S - 1) - 1 := by
    have := pk_lt 1 g n (fun i hi => by have := hg i hi; simp; omega)
    simp only [Nat.one_mul] at this
    have h2 : 2 ^ n < 2 ^ (S - 1) := Nat.pow_lt_pow_right (by norm_num) (by omega)
    omega
  have hm : 2 ^ (S - 1) ≡ 1 [MOD 2 ^ (S - 1) - 1] := by
    have : 1 ≤ 2 ^ (S - 1) := Nat.one_le_two_pow
    rw [Nat.ModEq]; conv_lhs => rw [show 2 ^ (S - 1) = (2 ^ (S - 1) - 1) + 1 by omega]
    simp [Nat.add_mod_left]
  have hmod : 2 ^ (S - 1) * pk S g n ≡ pk 1 g n [MOD 2 ^ (S - 1) - 1] := by
    exact (Nat.ModEq.mul_right (pk S g n) hm).trans
      (show 1 * pk S g n ≡ pk 1 g n [MOD 2 ^ (S - 1) - 1] by rw [Nat.one_mul]; exact pk_modEq S (by omega) g n)
  rw [h1]; unfold Nat.ModEq at hmod; rw [hmod, Nat.mod_eq_of_lt hlt]

/-- **The lean X-step equals the X-step** when the window bits of `NA` are those of `A` flipped. -/
theorem xstepL_eq (A NA REP GRD LOWS MODM ALL S n cand H d : ℕ) (hS : n + 2 ≤ S) (hc : cand < 2 ^ n)
    (hREP : REP = pk S (fun _ => 1) n) (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n)
    (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n) (hM : MODM = 2 ^ (S - 1) - 1)
    (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hNA : NA &&& ALL = ALL ^^^ (A &&& ALL)) :
    xstepL NA REP GRD LOWS MODM cand H d = xstep A REP GRD LOWS MODM S cand H d := by
  have hS1 : 1 ≤ S := by omega
  set Y := cand &&& H with hYdef
  have hY : Y < 2 ^ n := lt_of_le_of_lt Nat.and_le_left hc
  have hYS : Y < 2 ^ (S - 1) := lt_of_lt_of_le hY (Nat.pow_le_pow_right (by norm_num) (by omega))
  have hYS2 : Y < 2 ^ S := lt_of_lt_of_le hYS (Nat.pow_le_pow_right (by norm_num) (by omega))
  have hR0 : Y * REP = pk S (fun _ => Y) n := by rw [hREP, ← pk_mul]; apply pk_congr; intro i _; ring
  have hR0lt : Y * REP < 2 ^ (S * n) := by rw [hR0]; exact pk_lt _ _ _ (fun _ _ => hYS2)
  have hR0d : ∀ i < n, dig S (Y * REP) i = Y := fun i hi => by rw [hR0]; exact dig_pk _ _ _ (fun _ _ => hYS2) i hi
  have hn2 : 2 ^ n - 1 < 2 ^ S := by
    have : 2 ^ n ≤ 2 ^ S := Nat.pow_le_pow_right (by norm_num) (by omega)
    have : 1 ≤ 2 ^ n := Nat.one_le_two_pow
    omega
  -- Y·REP lies inside ALL
  have hsub : (Y * REP) &&& ALL = Y * REP := by
    calc (Y * REP) &&& ALL = pk S (dig S ((Y * REP) &&& ALL)) n :=
          (pk_dig S _ n (lt_of_le_of_lt Nat.and_le_left hR0lt)).symm
      _ = pk S (dig S (Y * REP)) n := by
          apply pk_congr; intro i hi
          rw [dig_land, hR0d i hi, hALL, dig_pk _ _ _ (fun _ _ => hn2) i hi, Nat.and_two_pow_sub_one_eq_mod,
            Nat.mod_eq_of_lt hY]
      _ = Y * REP := pk_dig S _ n hR0lt
  -- on the complement, one `land` is `R0 ⊕ (R0 ∧ A)`
  have hRNA : (Y * REP) &&& NA = (Y * REP) ^^^ ((Y * REP) &&& A) := by
    apply Nat.eq_of_testBit_eq; intro j
    have hs := congrArg (fun x => Nat.testBit x j) hsub
    have hn := congrArg (fun x => Nat.testBit x j) hNA
    simp only [Nat.testBit_and, Nat.testBit_xor] at hs hn ⊢
    cases hR : (Y * REP).testBit j <;> cases hAl : ALL.testBit j <;> cases hNj : NA.testBit j <;>
      cases hAj : A.testBit j <;> simp_all
  set R := (Y * REP) ^^^ ((Y * REP) &&& A) with hRdef
  have hRd : ∀ i < n, dig S R i = Y ^^^ (Y &&& dig S A i) := by
    intro i hi; rw [hRdef, dig_xor, dig_land, hR0d i hi]
  have hRlt : R < 2 ^ (S * n) := xor_and_lt _ _ _ hR0lt
  have hRdl : ∀ i < n, dig S R i < 2 ^ (S - 1) := fun i hi => by rw [hRd i hi]; exact xor_and_lt _ _ _ hYS
  have hrem := remL_eq S n R REP GRD LOWS hS1 hREP hGRD hL hRlt hRdl (d - 1)
  obtain ⟨h1, _, h3⟩ := remR_spec S n R REP GRD hS1 hREP hGRD hRlt hRdl (d - 1)
  have hG := guard_pk S n _ LOWS GRD hS1 hL hGRD h1 h3
  set g := fun i => if dig S (remR R GRD REP (d - 1)) i = 0 then 0 else 1 with hgdef
  have hg : ∀ i < n, g i ≤ 1 := fun i _ => by simp only [hgdef]; split <;> omega
  unfold xstepL xstep
  rw [show Nat.land cand H = Y from rfl]
  change cand &&& (((remL ((Y * REP) &&& NA) LOWS (d - 1) + LOWS) &&& GRD) % MODM) =
    cand &&& ((((remR R GRD REP (d - 1) + LOWS) &&& GRD) >>> (S - 1)) % MODM)
  rw [hRNA, hrem, hG, hM, gather0 S n g hg hS, gather S n g hg hS]

theorem xstep_lt (A REP GRD LOWS MODM S cand H d n : ℕ) (hc : cand < 2 ^ n) :
    xstep A REP GRD LOWS MODM S cand H d < 2 ^ n := lt_of_le_of_lt Nat.and_le_left hc

theorem runSo_lt (A REP GRD LOWS MODM S o n : ℕ) :
    ∀ (sts : List (ℕ × ℕ)) (c : ℕ), c < 2 ^ n → runSo A REP GRD LOWS MODM S o sts c < 2 ^ n := by
  intro sts
  induction sts with
  | nil => intro c hc; exact hc
  | cons st sts ih => intro c hc; exact ih _ (xstep_lt A REP GRD LOWS MODM S c _ _ n hc)

theorem xor_compl (ALL X : ℕ) : (ALL ^^^ X) &&& ALL = ALL ^^^ (X &&& ALL) := by
  apply Nat.eq_of_testBit_eq; intro j
  simp only [Nat.testBit_and, Nat.testBit_xor]
  cases ALL.testBit j <;> simp

/-! ## Runs and trees on the complement -/

def runSoL (NA REP GRD LOWS MODM o : ℕ) (sts : List (ℕ × ℕ)) (c : ℕ) : ℕ :=
  List.rec (motive := fun _ => ℕ → ℕ) (fun c => c)
    (fun st _ ih c => ih (xstepL NA REP GRD LOWS MODM c (Nat.shiftRight st.1 o) st.2)) sts c

theorem runSoL_eq (A NA REP GRD LOWS MODM ALL S n o : ℕ) (hS : n + 2 ≤ S)
    (hREP : REP = pk S (fun _ => 1) n) (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n)
    (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n) (hM : MODM = 2 ^ (S - 1) - 1)
    (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hNA : NA &&& ALL = ALL ^^^ (A &&& ALL)) :
    ∀ (sts : List (ℕ × ℕ)) (c : ℕ), c < 2 ^ n →
      runSoL NA REP GRD LOWS MODM o sts c = runSo A REP GRD LOWS MODM S o sts c := by
  intro sts
  induction sts with
  | nil => intro c _; rfl
  | cons st sts ih =>
    intro c hc
    change runSoL NA REP GRD LOWS MODM o sts (xstepL NA REP GRD LOWS MODM c (st.1 >>> o) st.2) =
      runSo A REP GRD LOWS MODM S o sts (xstep A REP GRD LOWS MODM S c (st.1 >>> o) st.2)
    rw [xstepL_eq A NA REP GRD LOWS MODM ALL S n c _ _ hS hc hREP hGRD hL hM hALL hNA]
    exact ih _ (xstep_lt _ _ _ _ _ _ _ _ _ n hc)

/-- the branch on the complement: the pick lies in the window; the in-branch keeps the candidates the pick's row allows -/
def brkL (kl kr : ℕ → ℕ → Bool) (NA NA1 v S TOP c : ℕ) : Bool :=
  Nat.blt (Nat.shiftLeft 1 v) TOP && (kl NA1 (Nat.land c (rowA S NA v)) && kr NA (andn c (Nat.shiftLeft 1 v)))

/-- the hybrid tree check (`checkXT2`) on the complement matrix; the in-branch removes the aggregate's bits -/
noncomputable def checkXT2L (REP GRD LOWS MODM S TOP o : ℕ) (t : XT2) : ℕ → ℕ → Bool :=
  XT2.rec (motive := fun _ => ℕ → ℕ → Bool)
    (fun sts fin NA c => fewerB (Nat.land (runSoL NA REP GRD LOWS MODM o sts c) (Nat.shiftRight fin.1 o)) fin.2)
    (fun sts v B _ _ ihl ihr NA c =>
      brkL ihl ihr NA (andn NA (Nat.shiftRight B (Nat.add (Nat.mul S o) o))) v S TOP
        (runSoL NA REP GRD LOWS MODM o sts c))
    t

theorem dig_all (S n v : ℕ) (hS : n + 2 ≤ S) (hv : v < n) (ALL : ℕ) (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) :
    dig S ALL v = 2 ^ n - 1 := by
  have hn2 : 2 ^ n - 1 < 2 ^ S := by
    have : 2 ^ n ≤ 2 ^ S := Nat.pow_le_pow_right (by norm_num) (by omega)
    have : 1 ≤ 2 ^ n := Nat.one_le_two_pow
    omega
  rw [hALL]; exact dig_pk _ _ _ (fun _ _ => hn2) v hv

/-- the in-branch candidates agree -/
theorem land_rowA_compl (A NA ALL S n v c : ℕ) (hS : n + 2 ≤ S) (hv : v < n) (hc : c < 2 ^ n)
    (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hNA : NA &&& ALL = ALL ^^^ (A &&& ALL)) :
    Nat.land c (rowA S NA v) = andn c (rowA S A v) := by
  rw [rowA_eq, rowA_eq]
  have hd := congrArg (fun x => dig S x v) hNA
  simp only [dig_land, dig_xor, dig_all S n v hS hv ALL hALL] at hd
  apply Nat.eq_of_testBit_eq; intro j
  rw [testBit_andn]
  change (c &&& dig S NA v).testBit j = _
  rw [Nat.testBit_and]
  by_cases hj : j < n
  · have hb := congrArg (fun x => Nat.testBit x j) hd
    simp only [Nat.testBit_and, Nat.testBit_xor, Nat.testBit_two_pow_sub_one, hj, decide_true, Bool.and_true,
      Bool.true_and] at hb
    rw [hb]; cases c.testBit j <;> cases (dig S A v).testBit j <;> rfl
  · push Not at hj
    rw [testBit_false_of_lt (lt_of_lt_of_le hc (Nat.pow_le_pow_right (by norm_num) hj))]; rfl

/-- the in-branch matrices stay complementary -/
theorem compl_inbranch (A NA ALL B' : ℕ) (hNA : NA &&& ALL = ALL ^^^ (A &&& ALL)) :
    andn NA B' &&& ALL = ALL ^^^ ((A ||| B') &&& ALL) := by
  apply Nat.eq_of_testBit_eq; intro j
  have hn := congrArg (fun x => Nat.testBit x j) hNA
  simp only [Nat.testBit_and, Nat.testBit_xor, Nat.testBit_or, testBit_andn] at hn ⊢
  cases hAl : ALL.testBit j <;> cases hNj : NA.testBit j <;> cases hAj : A.testBit j <;> cases hBj : B'.testBit j <;>
    simp_all

/-- **The tree check on the complement implies the tree check.** -/
theorem checkXT2L_imp (REP GRD LOWS MODM ALL S TOP n o : ℕ) (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hTOP : TOP = 2 ^ n) :
    ∀ (t : XT2) (NA A c : ℕ), c < 2 ^ n → NA &&& ALL = ALL ^^^ (A &&& ALL) →
      checkXT2L REP GRD LOWS MODM S TOP o t NA c = true → checkXT2 REP GRD LOWS MODM S o t A c = true := by
  intro t
  induction t with
  | leaf sts fin =>
    intro NA A c hc hNA h
    change fewerB (Nat.land (runSoL NA REP GRD LOWS MODM o sts c) (fin.1 >>> o)) fin.2 = true at h
    change fewerB (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (fin.1 >>> o)) fin.2 = true
    rwa [← runSoL_eq A NA REP GRD LOWS MODM ALL S n o hS hREP hGRD hL hM hALL hNA sts c hc]
  | node sts v B l r ihl ihr =>
    intro NA A c hc hNA h
    have hre := runSoL_eq A NA REP GRD LOWS MODM ALL S n o hS hREP hGRD hL hM hALL hNA sts c hc
    set c' := runSo A REP GRD LOWS MODM S o sts c with hc'def
    have hc' : c' < 2 ^ n := runSo_lt A REP GRD LOWS MODM S o n sts c hc
    change brkL _ _ NA _ v S TOP (runSoL NA REP GRD LOWS MODM o sts c) = true at h
    rw [hre] at h
    change brk _ _ A _ v S c' = true
    unfold brkL at h; unfold brk
    rw [Bool.and_eq_true, Bool.and_eq_true] at h
    obtain ⟨hv, hl, hr⟩ := h
    have hvn : v < n := by
      have h2 : (1 <<< v) < 2 ^ n := by
        have := hv; rw [Nat.blt_eq] at this; rw [← hTOP]; exact this
      rw [Nat.one_shiftLeft] at h2
      by_contra hcon; push Not at hcon
      have := Nat.pow_le_pow_right (show 2 > 0 by norm_num) hcon
      omega
    rw [Bool.and_eq_true]
    refine ⟨?_, ?_⟩
    · rw [← land_rowA_compl A NA ALL S n v c' hS hvn hc' hALL hNA]
      exact ihl _ _ _ (lt_of_le_of_lt Nat.and_le_left hc') (compl_inbranch A NA ALL _ hNA) hl
    · exact ihr _ _ _ (andn_lt _ hc') hNA hr

/-- the hybrid child check on the complement: `NA = ALL ⊕ A` once per child -/
noncomputable def childL3L (REPm REP GRD LOWS MODM DIAG ALL S TOP o Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT2) : Bool :=
  allLt (Nat.shiftLeft TOP o) crows &&
  checkXT2L REP GRD LOWS MODM S TOP o t
    (Nat.xor ALL (clrD (addCl (Nat.lor (Nat.shiftRight Anode (Nat.add (Nat.mul S o) o))
      (Nat.shiftRight C2u (Nat.add (Nat.mul S o) o))) REPm REP (shiftL o crows)) DIAG))
    (Nat.land (Nat.shiftRight Fu o) (Nat.sub TOP 1))

theorem childL3L_imp (REPm REP GRD LOWS MODM DIAG ALL S TOP n o Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT2)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n)
    (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n) (hM : MODM = 2 ^ (S - 1) - 1)
    (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hTOP : TOP = 2 ^ n)
    (h : childL3L REPm REP GRD LOWS MODM DIAG ALL S TOP o Anode C2u Fu crows t = true) :
    childL3 REPm REP GRD LOWS MODM DIAG S TOP o Anode C2u Fu crows t = true := by
  change (allLt (Nat.shiftLeft TOP o) crows && checkXT2L REP GRD LOWS MODM S TOP o t _ _) = true at h
  change (allLt (Nat.shiftLeft TOP o) crows && checkXT2 REP GRD LOWS MODM S o t _ _) = true
  rw [Bool.and_eq_true] at h ⊢
  refine ⟨h.1, checkXT2L_imp REP GRD LOWS MODM ALL S TOP n o hS hREP hGRD hL hM hALL hTOP t _ _ _ ?_ ?_ h.2⟩
  · apply lt_of_le_of_lt Nat.and_le_right
    rw [hTOP]; exact Nat.sub_lt (Nat.two_pow_pos n) (by norm_num)
  · exact xor_compl ALL _

/-- **Soundness of the lean hybrid child check**, label coordinates (from `childL3_sound_label`). -/
theorem childL3L_sound_label (REPm REP GRD LOWS MODM DIAG ALL S TOP n o Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT2)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hREPm : REPm = pk (S - 1) (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n) (hTOP : TOP = 2 ^ n)
    (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hon : o + n ≤ S)
    (h : childL3L REPm REP GRD LOWS MODM DIAG ALL S TOP o Anode C2u Fu crows t = true)
    (L : Finset ℕ) (hLo : ∀ a ∈ L, o ≤ a ∧ a < o + n ∧ Fu.testBit a = true)
    (hA : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S Anode a).testBit b = false)
    (hC2 : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S C2u a).testBit b = false)
    (hrows : ∀ m ∈ crows, (L.filter (fun a => m.testBit a = true)).card ≤ 1)
    (hval : XTValidL2 S o L t) : False :=
  childL3_sound_label REPm REP GRD LOWS MODM DIAG S TOP n o Anode C2u Fu crows t hS hREP hREPm hGRD hL hM hDIAG hTOP hon
    (childL3L_imp REPm REP GRD LOWS MODM DIAG ALL S TOP n o Anode C2u Fu crows t hS hREP hGRD hL hM hALL hTOP h)
    L hLo hA hC2 hrows hval

end K2
