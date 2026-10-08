module
public import R22Port.U_d41d8cd98f00
public import OC.Mat
/-! # Soundness of the orbit-completeness checkers

* `chkW3_sound`, `chkW2_sound`: an accepted witness gives the group elements of `OrbitComplete3` / `OrbitComplete2`;
* `chkUV_sound`, `chkCs_sound`, `chkCs0_sound`, `uvlU_sound`, `hnChk_sound`: the loops;
* `act3_comp`, `act2_comp`: the actions compose in `h` (`h ↦ h h0` on the left, `B ↦ B h0⁻¹`, `C ↦ h0 C` on the right);
* `oc3_of`, `oc2_of`: from the per-representative facts to `OrbitComplete3 d` (`d ∈ {1, 2}`) and `OrbitComplete2`. -/
@[expose] public section
namespace OC
open G

/-! ## small list checks -/

theorem stEqB_eq {s r : State} (h : stEqB s r = true) : s = r := by
  obtain ⟨a, B, C, U, V⟩ := s
  obtain ⟨a', B', C', U', V'⟩ := r
  simp only [stEqB, Bool.and_eq_true, Nat.beq_eq] at h
  obtain ⟨⟨⟨⟨hB, hC⟩, hU⟩, hV⟩, ha⟩ := h
  subst hB hC hU hV ha
  rfl

theorem memSt_mem {s : State} : ∀ {L : List State}, memSt s L = true → s ∈ L
  | [], h => by simp [memSt] at h
  | r :: rs, h => by
    simp only [memSt, Bool.or_eq_true] at h
    rcases h with h | h
    · rw [stEqB_eq h]; exact List.mem_cons_self
    · exact List.mem_cons_of_mem _ (memSt_mem h)

theorem memN_mem {x : ℕ} : ∀ {L : List ℕ}, memN x L = true → x ∈ L
  | [], h => by simp [memN] at h
  | y :: ys, h => by
    simp only [memN, Bool.or_eq_true, Nat.beq_eq] at h
    rcases h with h | h
    · rw [h]; exact List.mem_cons_self
    · exact List.mem_cons_of_mem _ (memN_mem h)

theorem memP_mem {U V : ℕ} : ∀ {L : List (ℕ × ℕ)}, memP U V L = true → (U, V) ∈ L
  | [], h => by simp [memP] at h
  | p :: ps, h => by
    simp only [memP, Bool.or_eq_true, Bool.and_eq_true, Nat.beq_eq] at h
    rcases h with ⟨h1, h2⟩ | h
    · have : p = (U, V) := Prod.ext h1 h2
      rw [this]; exact List.mem_cons_self
    · exact List.mem_cons_of_mem _ (memP_mem h)

/-! ## `invD` for `d ∈ {1, 2}` (kernel check over all pairs) -/

theorem invDchk_1 : invDchk 1 = true := by decide +kernel
theorem invDchk_2 : invDchk 2 = true := by decide +kernel

theorem invD_unique {d γ x : ℕ} (hd : d = 1 ∨ d = 2) (hγ : γ < 2 ^ (d * d)) (hx : x < 2 ^ (d * d))
    (h : mulD d γ x = ID d) : invD d γ = x := by
  have hc : invDchk d = true := by rcases hd with rfl | rfl; exacts [invDchk_1, invDchk_2]
  unfold invDchk at hc
  rw [List.all_eq_true] at hc
  have h1 := hc γ (List.mem_range.mpr hγ)
  rw [List.all_eq_true] at h1
  have h2 := h1 x (List.mem_range.mpr hx)
  simp only [h, Nat.beq_refl, Bool.not_true, Bool.false_or, Nat.beq_eq] at h2
  exact h2

/-! ## witnesses -/

theorem chkW3_sound {d B C U V w : ℕ} (hd : d = 1 ∨ d = 2) (h : chkW3 d B C U V w = true) :
    ∃ g h γ, GL3 g ∧ GL3 h ∧ GLd d γ ∧ act3 d g h γ ⟨I3, B, C, U, V⟩ ∈ reps d := by
  unfold chkW3 at h
  simp only [Bool.and_eq_true, Nat.blt_eq, Nat.beq_eq] at h
  obtain ⟨⟨⟨⟨⟨hg, hh⟩, hγ⟩, hγi⟩, hγγ⟩, hm⟩ := h
  obtain ⟨hG, hgi⟩ := GL3_of hg
  obtain ⟨hH, hhi⟩ := GL3_of hh
  have hinv := invD_unique hd hγ hγi hγγ
  refine ⟨f9 w 0, f9 w 2, f9 w 4, hG, hH, ⟨hγ, by rw [hinv]; exact hγγ⟩, ?_⟩
  have e : act3 d (f9 w 0) (f9 w 2) (f9 w 4) ⟨I3, B, C, U, V⟩ =
      act3' d (f9 w 0) (f9 w 1) (f9 w 2) (f9 w 3) (f9 w 4) (f9 w 5) B C U V := by
    unfold act3 act3'
    rw [hgi, hhi, hinv]
  rw [e]
  exact memSt_mem hm

theorem chkW2_sound {B C w : ℕ} (h : chkW2 B C w = true) :
    ∃ P Q h, GL3 P ∧ GL3 Q ∧ GL3 h ∧ mul3 (mul3 P 17) (inv3 Q) = 17 ∧
      ∀ U V, act2 P Q h ⟨17, B, C, U, V⟩ ∈ reps0 := by
  unfold chkW2 at h
  simp only [Bool.and_eq_true, Nat.beq_eq] at h
  obtain ⟨⟨⟨⟨hP, hQ⟩, hh⟩, hfix⟩, hm⟩ := h
  obtain ⟨hP', hPi⟩ := GL3_of hP
  obtain ⟨hQ', hQi⟩ := GL3_of hQ
  obtain ⟨hh', hhi⟩ := GL3_of hh
  refine ⟨f9 w 0, f9 w 2, f9 w 4, hP', hQ', hh', by rw [hQi]; exact hfix, fun U V => ?_⟩
  have e : act2 (f9 w 0) (f9 w 2) (f9 w 4) ⟨17, B, C, U, V⟩ = act2' (f9 w 1) (f9 w 2) (f9 w 4) (f9 w 5) B C := by
    unfold act2 act2'
    rw [hPi, hhi]
  rw [e]
  exact memSt_mem hm

/-! ## loops -/

theorem chkUV_sound {d B C : ℕ} : ∀ {ps : List (ℕ × ℕ)} {ws : List ℕ}, chkUV d B C ps ws = true →
    ∀ p ∈ ps, ∃ w, chkW3 d B C p.1 p.2 w = true
  | [], [], _ => by simp
  | p :: ps, w :: ws, h => by
    simp only [chkUV, Bool.and_eq_true] at h
    intro q hq
    rcases List.mem_cons.mp hq with rfl | hq
    · exact ⟨w, h.1⟩
    · exact chkUV_sound h.2 q hq
  | [], _ :: _, h => by simp [chkUV] at h
  | _ :: _, [], h => by simp [chkUV] at h

theorem chkCs_sound {d B lo : ℕ} {L : ℕ → List (ℕ × ℕ)} : ∀ {c : ℕ} {wss : List (List ℕ)},
    chkCs d B L lo c wss = true →
      ∀ C, lo ≤ C → C < c → ∀ p ∈ L (Nat.xor (mul3 B C) 273), ∃ w, chkW3 d B C p.1 p.2 w = true
  | c, [], h => by
    simp only [chkCs, Nat.beq_eq] at h
    intro C h1 h2
    omega
  | c+1, ws :: wss, h => by
    simp only [chkCs, Bool.and_eq_true] at h
    intro C h1 h2
    rcases Nat.lt_succ_iff_lt_or_eq.mp h2 with h3 | h3
    · exact chkCs_sound h.2 C h1 h3
    · subst h3; exact chkUV_sound h.1
  | 0, _ :: _, h => by simp [chkCs] at h

theorem chkCs0_sound {B lo : ℕ} : ∀ {c : ℕ} {ws : List ℕ}, chkCs0 B lo c ws = true →
    ∀ C, lo ≤ C → C < c → cond17 (mul3 B C) = true → ∃ w, chkW2 B C w = true
  | c, [], h => by
    simp only [chkCs0, Nat.beq_eq] at h
    intro C h1 h2
    omega
  | c+1, w :: ws, h => by
    simp only [chkCs0, Bool.and_eq_true, Bool.or_eq_true, Bool.not_eq_true'] at h
    intro C h1 h2 hc
    rcases Nat.lt_succ_iff_lt_or_eq.mp h2 with h3 | h3
    · exact chkCs0_sound h.2 C h1 h3 hc
    · subst h3
      rcases h.1 with h4 | h4
      · rw [hc] at h4; exact absurd h4 (by decide)
      · exact ⟨w, h4⟩
  | 0, _ :: _, h => by simp [chkCs0] at h

theorem uvlV_sound {d U : ℕ} {L : ℕ → List (ℕ × ℕ)} : ∀ {n : ℕ}, uvlV d U L n = true →
    ∀ V < n, (U, V) ∈ L (dirtM d U V)
  | 0, _ => by intro V hV; omega
  | n+1, h => by
    simp only [uvlV, Bool.and_eq_true] at h
    intro V hV
    rcases Nat.lt_succ_iff_lt_or_eq.mp hV with h3 | h3
    · exact uvlV_sound h.2 V h3
    · subst h3; exact memP_mem h.1

theorem uvlU_sound {d : ℕ} {L : ℕ → List (ℕ × ℕ)} : ∀ {n : ℕ}, uvlU d L n = true →
    ∀ U < n, ∀ V < 2 ^ (d * 3), (U, V) ∈ L (dirtM d U V)
  | 0, _ => by intro U hU; omega
  | n+1, h => by
    simp only [uvlU, Bool.and_eq_true] at h
    intro U hU
    rcases Nat.lt_succ_iff_lt_or_eq.mp hU with h3 | h3
    · exact uvlU_sound h.2 U h3
    · subst h3; exact uvlV_sound h.1

theorem hnChk_sound : ∀ {n : ℕ} {es : List ℕ}, hnChk n es = true →
    ∀ b < n, ∃ B0 h0 h0i, mul3 B0 h0 = b ∧ inv3ok h0 h0i = true ∧ B0 ∈ BREPS
  | 0, [], _ => by intro b hb; omega
  | n+1, e :: es, h => by
    simp only [hnChk, Bool.and_eq_true, Nat.beq_eq] at h
    intro b hb
    rcases Nat.lt_succ_iff_lt_or_eq.mp hb with h3 | h3
    · exact hnChk_sound h.2 b h3
    · subst h3
      exact ⟨f9 e 0, f9 e 1, f9 e 2, h.1.1.1, h.1.1.2, memN_mem h.1.2⟩
  | 0, _ :: _, h => by simp [hnChk] at h
  | _+1, [], h => by simp [hnChk] at h

/-! ## composition in `h` -/

theorem act3_comp (d g h h0 γ B0 C U V : ℕ) (hh : GL3 h) (hh0 : GL3 h0) :
    act3 d g (mul3 h h0) γ ⟨I3, mul3 B0 h0, C, U, V⟩ = act3 d g h γ ⟨I3, B0, mul3 h0 C, U, V⟩ := by
  unfold act3
  simp only
  rw [compB g B0 h h0 hh hh0, mul3_assoc h h0 C]

theorem act2_comp (P Q h h0 B0 C U V U' V' : ℕ) (hh : GL3 h) (hh0 : GL3 h0) :
    act2 P Q (mul3 h h0) ⟨17, mul3 B0 h0, C, U, V⟩ = act2 P Q h ⟨17, B0, mul3 h0 C, U', V'⟩ := by
  unfold act2
  simp only
  rw [compB Q B0 h h0 hh hh0, mul3_assoc h h0 C]

/-! ## the orbit-completeness statements -/

/-- the column-space normalization table, as a statement -/
def HNOK : Prop := ∀ b < 512, ∃ B0 h0 h0i, mul3 B0 h0 = b ∧ inv3ok h0 h0i = true ∧ B0 ∈ BREPS

/-- the per-representative witness facts for invertible anchors -/
def Main3 (d : ℕ) (L : ℕ → List (ℕ × ℕ)) : Prop :=
  ∀ B0 ∈ BREPS, ∀ C < 512, ∀ p ∈ L (Nat.xor (mul3 B0 C) 273), ∃ w, chkW3 d B0 C p.1 p.2 w = true

/-- the per-representative witness facts for rank-2 anchors at `d = 0` -/
def Main0 : Prop := ∀ B0 ∈ BREPS, ∀ C < 512, cond17 (mul3 B0 C) = true → ∃ w, chkW2 B0 C w = true

theorem oc3_of (d : ℕ) (hd : d = 1 ∨ d = 2) (L : ℕ → List (ℕ × ℕ)) (hL : uvlU d L (2 ^ (d * 3)) = true)
    (hM : Main3 d L) (hH : HNOK) : OrbitComplete3 d := by
  intro s hsa hv
  obtain ⟨a, B, C, U, V⟩ := s
  simp only at hsa
  subst hsa
  obtain ⟨hB, hC, hU, hV, heq⟩ := valid273 hv
  obtain ⟨B0, h0, h0i, hB0, hinv, hmem⟩ := hH B hB
  obtain ⟨hh0, -⟩ := GL3_of hinv
  have hC' : mul3 B0 (mul3 h0 C) = mul3 B C := by rw [← mul3_assoc, hB0]
  have hN : Nat.xor (mul3 B0 (mul3 h0 C)) 273 = dirtM d U V := by
    rw [hC', heq]
    show (273 ^^^ dirtM d U V) ^^^ 273 = dirtM d U V
    rw [Nat.xor_comm 273, Nat.xor_assoc, Nat.xor_self, Nat.xor_zero]
  have hUV := uvlU_sound hL U hU V hV
  rw [← hN] at hUV
  obtain ⟨w, hw⟩ := hM B0 hmem (mul3 h0 C) (mul3_lt _ _) (U, V) hUV
  obtain ⟨g, h, γ, hg, hh, hγ, hr⟩ := chkW3_sound hd hw
  refine ⟨g, mul3 h h0, γ, hg, GL3_mul hh hh0, hγ, ?_⟩
  rw [← hB0, act3_comp d g h h0 γ B0 C U V hh hh0]
  exact hr

theorem oc2_of (hM : Main0) (hH : HNOK) : OrbitComplete2 := by
  intro s hsa hv
  obtain ⟨a, B, C, U, V⟩ := s
  simp only at hsa
  subst hsa
  obtain ⟨hB, hC, hU, hV, hc⟩ := valid17 hv
  obtain ⟨B0, h0, h0i, hB0, hinv, hmem⟩ := hH B hB
  obtain ⟨hh0, -⟩ := GL3_of hinv
  have hC' : mul3 B0 (mul3 h0 C) = mul3 B C := by rw [← mul3_assoc, hB0]
  rw [← hC'] at hc
  obtain ⟨w, hw⟩ := hM B0 hmem (mul3 h0 C) (mul3_lt _ _) hc
  obtain ⟨P, Q, h, hP, hQ, hh, hfix, hr⟩ := chkW2_sound hw
  refine ⟨P, Q, mul3 h h0, hP, hQ, GL3_mul hh hh0, hfix, ?_⟩
  rw [← hB0, act2_comp P Q h h0 B0 C U V 0 0 hh hh0]
  exact hr 0 0

/-! ## assembling `Main3` / `Main0` from chunk theorems -/

/-- the 16 representatives, in `BREPS` order -/
theorem allB {P : ℕ → Prop} (h0 : P 0) (h1 : P 1) (h8 : P 8) (h9 : P 9) (h10 : P 10) (h64 : P 64) (h65 : P 65)
    (h66 : P 66) (h72 : P 72) (h73 : P 73) (h74 : P 74) (h80 : P 80) (h81 : P 81) (h82 : P 82) (h83 : P 83)
    (h84 : P 84) : ∀ B0 ∈ BREPS, P B0 := by
  intro B0 hB
  simp only [BREPS, List.mem_cons, List.not_mem_nil, or_false] at hB
  rcases hB with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    assumption

/-- four chunks of 128 cover `[0, 512)` -/
theorem allC4 {P : ℕ → Prop} (h0 : ∀ C, 0 ≤ C → C < 128 → P C) (h1 : ∀ C, 128 ≤ C → C < 256 → P C)
    (h2 : ∀ C, 256 ≤ C → C < 384 → P C) (h3 : ∀ C, 384 ≤ C → C < 512 → P C) : ∀ C < 512, P C := by
  intro C hC
  by_cases a : C < 128
  · exact h0 C (Nat.zero_le _) a
  by_cases b : C < 256
  · exact h1 C (by omega) b
  by_cases c : C < 384
  · exact h2 C (by omega) c
  exact h3 C (by omega) hC

/-- one chunk covers `[0, 512)` -/
theorem allC1 {P : ℕ → Prop} (h0 : ∀ C, 0 ≤ C → C < 512 → P C) : ∀ C < 512, P C :=
  fun C hC => h0 C (Nat.zero_le _) hC

end OC
