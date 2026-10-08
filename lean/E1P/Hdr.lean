module
public import R22Port.U_d41d8cd98f00
public import E1P.Compose
/-! # Composition at scale: jobs by their start headers, job tables as functions

A search job's chain theorem is `JobOK C sl UB S` for its first block `S`.  `StartOK x ub S` reads only the first 1027 bits
of `S` (mode, depth, position, prefix, and in mode 1 the budgets), and so do `E1P.glue r S` and `E1P.glue0 r S`:
* `startOK_hdr`, `jobOK_hdr`, `glue_hdr`, `glue0_hdr`: `S` may be replaced by its header `S % 2 ^ 1027`.  A job can export
  `JobOK C sl UB H` with a header numeral `H` of at most 1027 bits, so a statement about many jobs never carries their
  block literals.
* `glueChkF`, `chain_sound_f`: `chain_sound_ext` / `glueChkX` with the jobs given as a function `Jf : ℕ → ℕ` with `nJ`
  entries (e.g. a binary-loaded header table: lookups cost O(log nJ), where a `List` costs O(nJ)).
* `jobOK_of_chain_f`: a chain whose frontier records are glued to jobs proves `JobOK` of its own first block (a split
  piece from its sub-jobs); `enum_of_chain_f`: a chain from the root proves the canonical-point statement (the canonical-point statement). -/
@[expose] public section
set_option maxRecDepth 20000
set_option exponentiation.threshold 1100
namespace E1PS
open Finset

theorem mod1027_div_mod (S k j : ℕ) (h : k + j ≤ 1027) : (S % 2 ^ 1027) / 2 ^ k % 2 ^ j = S / 2 ^ k % 2 ^ j :=
  mod_div_mod S 1027 k j h

theorem mod1027_mod2 (S : ℕ) : (S % 2 ^ 1027) % 2 = S % 2 := by
  have := mod1027_div_mod S 0 1 (by omega); simpa using this

/-- the start state of `S` is that of its header `S % 2 ^ 1027` -/
theorem startOK_hdr (x ub : ℕ → ℕ) (S : ℕ) : StartOK x ub (S % 2 ^ 1027) ↔ StartOK x ub S := by
  have ed : (S % 2 ^ 1027) / 2 % 2 ^ 5 = S / 2 % 2 ^ 5 := by
    have := mod1027_div_mod S 1 5 (by omega); simpa using this
  have hd : S / 2 % 2 ^ 5 < 32 := Nat.mod_lt _ (by norm_num)
  have epos : (S % 2 ^ 1027) / 2 ^ 6 % 2 ^ 8 = S / 2 ^ 6 % 2 ^ 8 := mod1027_div_mod S 6 8 (by omega)
  have epl : (S % 2 ^ 1027) / 2 ^ 14 % 2 ^ (8 * (S / 2 % 2 ^ 5)) = S / 2 ^ 14 % 2 ^ (8 * (S / 2 % 2 ^ 5)) :=
    mod1027_div_mod S 14 _ (by omega)
  have eb : ∀ l < 255, bud3 ((S % 2 ^ 1027) / 2 ^ (14 + 8 * (S / 2 % 2 ^ 5))) l = bud3 (S / 2 ^ (14 + 8 * (S / 2 % 2 ^ 5))) l := by
    intro l hl
    unfold bud3
    rw [Nat.div_div_eq_div_mul, Nat.div_div_eq_div_mul, ← pow_add, show (8 : ℕ) = 2 ^ 3 by norm_num,
      mod1027_div_mod S _ 3 (by omega)]
  unfold StartOK
  rw [ed, epos, epl, mod1027_mod2]
  by_cases hm : S % 2 = 1
  · rw [if_pos hm, if_pos hm]
    exact ⟨fun h => cmpl_congr x _ _ _ _ _ eb h, fun h => cmpl_congr x _ _ _ _ _ (fun l hl => (eb l hl).symm) h⟩
  · rw [if_neg hm, if_neg hm]

theorem jobOK_hdr (C : E1P.Ctx) (sl : ℕ → ℕ) (UB S : ℕ) : JobOK C sl UB (S % 2 ^ 1027) ↔ JobOK C sl UB S := by
  unfold JobOK
  constructor
  · intro h x hg hsl hub hx hs; exact h x hg hsl hub hx ((startOK_hdr _ _ S).mpr hs)
  · intro h x hg hsl hub hx hs; exact h x hg hsl hub hx ((startOK_hdr _ _ S).mp hs)

theorem glue_hdr (r S : ℕ) : E1P.glue r (S % 2 ^ 1027) = E1P.glue r S := by
  rw [glue_named, glue_named]
  have hd : r % 2 ^ 5 < 32 := Nat.mod_lt _ (by norm_num)
  have e1 : E1P.rd 1 (S % 2 ^ 1027) = E1P.rd 1 S := by rw [rd_eq, rd_eq, show (2 : ℕ) ^ 1 = 2 by norm_num, mod1027_mod2]
  have e2 : E1P.rd (Nat.add 778 (Nat.mul 8 (E1P.rd 5 r))) (E1P.sk 1 (S % 2 ^ 1027)) =
      E1P.rd (Nat.add 778 (Nat.mul 8 (E1P.rd 5 r))) (E1P.sk 1 S) := by
    simp only [rd_eq, sk_eq, Nat.add_eq, Nat.mul_eq]
    exact mod1027_div_mod S 1 _ (by omega)
  rw [e1, e2]

theorem glue0_hdr (r S : ℕ) : E1P.glue0 r (S % 2 ^ 1027) = E1P.glue0 r S := by
  rw [glue0_named, glue0_named]
  have hd : r % 2 ^ 5 < 32 := Nat.mod_lt _ (by norm_num)
  have e1 : E1P.rd 1 (S % 2 ^ 1027) = E1P.rd 1 S := by rw [rd_eq, rd_eq, show (2 : ℕ) ^ 1 = 2 by norm_num, mod1027_mod2]
  have e2 : E1P.rd (Nat.add 13 (Nat.mul 8 (E1P.rd 5 r))) (E1P.sk 1 (S % 2 ^ 1027)) =
      E1P.rd (Nat.add 13 (Nat.mul 8 (E1P.rd 5 r))) (E1P.sk 1 S) := by
    simp only [rd_eq, sk_eq, Nat.add_eq, Nat.mul_eq]
    exact mod1027_div_mod S 1 _ (by omega)
  rw [e1, e2]

/-- a mode-0 block (a search job) starts at its prefix: its start state is that of `S % 2 ^ (14 + 8 d)` -/
theorem startOK_hdr0 (x ub : ℕ → ℕ) (S : ℕ) (h0 : S % 2 = 0) :
    StartOK x ub (S % 2 ^ (14 + 8 * (S / 2 % 2 ^ 5))) ↔ StartOK x ub S := by
  set W := 14 + 8 * (S / 2 % 2 ^ 5) with hW
  have ed : (S % 2 ^ W) / 2 % 2 ^ 5 = S / 2 % 2 ^ 5 := by
    have := mod_div_mod S W 1 5 (by omega); simpa using this
  have epos : (S % 2 ^ W) / 2 ^ 6 % 2 ^ 8 = S / 2 ^ 6 % 2 ^ 8 := mod_div_mod S W 6 8 (by omega)
  have epl : (S % 2 ^ W) / 2 ^ 14 % 2 ^ (8 * (S / 2 % 2 ^ 5)) = S / 2 ^ 14 % 2 ^ (8 * (S / 2 % 2 ^ 5)) :=
    mod_div_mod S W 14 _ (by omega)
  have em : (S % 2 ^ W) % 2 = S % 2 := by have := mod_div_mod S W 0 1 (by omega); simpa using this
  unfold StartOK
  rw [ed, epos, epl, em, if_neg (by omega), if_neg (by omega)]

theorem jobOK_hdr0 (C : E1P.Ctx) (sl : ℕ → ℕ) (UB S : ℕ) (h0 : S % 2 = 0) :
    JobOK C sl UB (S % 2 ^ (14 + 8 * (S / 2 % 2 ^ 5))) ↔ JobOK C sl UB S := by
  unfold JobOK
  constructor
  · intro h x hg hsl hub hx hs; exact h x hg hsl hub hx ((startOK_hdr0 _ _ S h0).mpr hs)
  · intro h x hg hsl hub hx hs; exact h x hg hsl hub hx ((startOK_hdr0 _ _ S h0).mp hs)

/-! ## Jobs as a function -/

/-- record `j` of block `i` is glued to `w`: a later block of the chain (`w < |Ss|`) or job `w - |Ss|` of `Jf` -/
noncomputable def glue1F (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (i j w : ℕ) : Bool :=
  cond (Nat.blt w Ss.length) (glue1 Ss i j w)
    (Nat.blt (w - Ss.length) nJ &&
      (E1P.glue (recOf (Ss.getD i 0) j) (Jf (w - Ss.length)) || E1P.glue0 (recOf (Ss.getD i 0) j) (Jf (w - Ss.length))))

/-- the glue check with the witnesses as a function `Wf i j` (e.g. binary-loaded tables; a `List` literal of tens of
thousands of witnesses is too deep to elaborate) -/
noncomputable def glueChkW (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (Wf : ℕ → ℕ → ℕ) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i b => b &&
    Nat.rec (motive := fun _ => Bool) true (fun j c => c && glue1F Ss nJ Jf i j (Wf i j))
      (E1P.rd 8 (E1P.bS2 (Ss.getD i 0)))) Ss.length

noncomputable def glueChkF (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (W : List (List ℕ)) : Bool :=
  glueChkW Ss nJ Jf (fun i j => (W.getD i []).getD j 0)

theorem glueChkW_spec (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (Wf : ℕ → ℕ → ℕ) (h : glueChkW Ss nJ Jf Wf = true) :
    ∀ i < Ss.length, ∀ j < E1P.rd 8 (E1P.bS2 (Ss.getD i 0)),
      (∃ i', i < i' ∧ i' < Ss.length ∧ (E1P.glue (recOf (Ss.getD i 0) j) (Ss.getD i' 0) = true ∨
        E1P.glue0 (recOf (Ss.getD i 0) j) (Ss.getD i' 0) = true)) ∨
      (∃ k < nJ, E1P.glue (recOf (Ss.getD i 0) j) (Jf k) = true ∨ E1P.glue0 (recOf (Ss.getD i 0) j) (Jf k) = true) := by
  have hrows : ∀ i < Ss.length, Nat.rec (motive := fun _ => Bool) true
      (fun j c => c && glue1F Ss nJ Jf i j (Wf i j)) (E1P.rd 8 (E1P.bS2 (Ss.getD i 0))) = true := by
    unfold glueChkW at h
    generalize Ss.length = L at h
    intro i hi
    induction L with
    | zero => omega
    | succ L ih =>
      have h' := h
      simp only [Bool.and_eq_true] at h'
      rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | rfl
      · exact ih h'.1 hlt
      · exact h'.2
  intro i hi j hj
  have hr := hrows i hi
  generalize E1P.rd 8 (E1P.bS2 (Ss.getD i 0)) = K at hr hj
  induction K with
  | zero => omega
  | succ K ih =>
    have h' := hr
    simp only [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hj with hlt | rfl
    · exact ih h'.1 hlt
    · have hw := h'.2
      unfold glue1F at hw
      generalize Wf i j = w at hw
      cases hb : Nat.blt w Ss.length
      · rw [hb, cond_false] at hw
        simp only [Bool.and_eq_true, Bool.or_eq_true, Nat.blt_eq] at hw
        exact Or.inr ⟨w - Ss.length, hw.1, hw.2⟩
      · rw [hb, cond_true] at hw
        exact Or.inl ⟨w, glue1_spec Ss i j w hw⟩

theorem glueChkF_spec (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (W : List (List ℕ)) (h : glueChkF Ss nJ Jf W = true) :
    ∀ i < Ss.length, ∀ j < E1P.rd 8 (E1P.bS2 (Ss.getD i 0)),
      (∃ i', i < i' ∧ i' < Ss.length ∧ (E1P.glue (recOf (Ss.getD i 0) j) (Ss.getD i' 0) = true ∨
        E1P.glue0 (recOf (Ss.getD i 0) j) (Ss.getD i' 0) = true)) ∨
      (∃ k < nJ, E1P.glue (recOf (Ss.getD i 0) j) (Jf k) = true ∨ E1P.glue0 (recOf (Ss.getD i 0) j) (Jf k) = true) :=
  glueChkW_spec Ss nJ Jf _ h

/-- `chain_sound_ext` with the jobs as a function -/
theorem chain_sound_f (C : E1P.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (ub x : ℕ → ℕ) (hg : Glob C x)
    (hsl : ∀ i < 2 ^ 19, SlotV x (sl i)) (hUB : UB = V ub) (hUBR : UBR = VR ub) (hubb : ∀ l < 255, ub l ≤ 2 ^ 32)
    (hxub : ∀ l < 255, x l ≤ ub l) (hx : ∃ l < 255, 0 < x l) (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ)
    (hJ : ∀ k < nJ, ¬ StartOK x ub (Jf k))
    (hblk : ∀ i < Ss.length, E1P.block C sl UB UBR (Ss.getD i 0) = true) (Wf : ℕ → ℕ → ℕ)
    (hgl : glueChkW Ss nJ Jf Wf = true) :
    ∀ i < Ss.length, ¬ StartOK x ub (Ss.getD i 0) := by
  have hglue := glueChkW_spec Ss nJ Jf Wf hgl
  suffices hk : ∀ k, ∀ i < Ss.length, Ss.length - i ≤ k → ¬ StartOK x ub (Ss.getD i 0) from
    fun i hi => hk Ss.length i hi (by omega)
  intro k
  induction k with
  | zero => intro i hi hk; omega
  | succ k ih =>
    intro i hi hk hs
    obtain ⟨j, hj⟩ := block_sound C sl UB UBR ub x hg hsl hUB hUBR hubb hxub _ (hblk i hi) hs
    by_cases hjn : j < E1P.rd 8 (E1P.bS2 (Ss.getD i 0))
    · rcases hglue i hi j hjn with ⟨i', hii', hi', hgl⟩ | ⟨k', hk', hgl⟩
      · rcases hgl with hgl | hgl
        · exact ih i' hi' (by omega) (glue_start x ub _ _ hgl hj)
        · exact ih i' hi' (by omega) (glue0_start x ub hxub _ _ hgl hj)
      · rcases hgl with hgl | hgl
        · exact hJ k' hk' (glue_start x ub _ _ hgl hj)
        · exact hJ k' hk' (glue0_start x ub hxub _ _ hgl hj)
    · rw [hdr_rec _ j (by omega)] at hj
      exact recV_zero x hx hj

/-- **A chain glued to jobs proves `JobOK` of its own first block** (e.g. a split piece, from its sub-jobs). -/
theorem jobOK_of_chain_w (C : E1P.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (hUB : UB = V (fun l => E1P.fld UB l))
    (hUBR : UBR = VR (fun l => E1P.fld UB l)) (hubb : ∀ l < 255, E1P.fld UB l ≤ 2 ^ 32)
    (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (Wf : ℕ → ℕ → ℕ) (hne : 0 < Ss.length)
    (hblk : ∀ i < Ss.length, E1P.block C sl UB UBR (Ss.getD i 0) = true) (hgl : glueChkW Ss nJ Jf Wf = true)
    (hjobs : ∀ k < nJ, JobOK C sl UB (Jf k)) : JobOK C sl UB (Ss.getD 0 0) :=
  fun x hg hsl hxub hx => chain_sound_f C sl UB UBR (fun l => E1P.fld UB l) x hg hsl hUB hUBR hubb hxub hx Ss nJ Jf
    (fun k hk => hjobs k hk x hg hsl hxub hx) hblk Wf hgl 0 hne

theorem jobOK_of_chain_f (C : E1P.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (hUB : UB = V (fun l => E1P.fld UB l))
    (hUBR : UBR = VR (fun l => E1P.fld UB l)) (hubb : ∀ l < 255, E1P.fld UB l ≤ 2 ^ 32)
    (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (W : List (List ℕ)) (hne : 0 < Ss.length)
    (hblk : ∀ i < Ss.length, E1P.block C sl UB UBR (Ss.getD i 0) = true) (hgl : glueChkF Ss nJ Jf W = true)
    (hjobs : ∀ k < nJ, JobOK C sl UB (Jf k)) : JobOK C sl UB (Ss.getD 0 0) :=
  jobOK_of_chain_w C sl UB UBR hUB hUBR hubb Ss nJ Jf _ hne hblk hgl hjobs

/-- **A chain from the root, glued to jobs, proves the canonical-point statement** (the canonical-point statement). -/
theorem enum_of_chain_w (C : E1P.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (hUB : UB = V (fun l => E1P.fld UB l))
    (hUBR : UBR = VR (fun l => E1P.fld UB l)) (hubb : ∀ l < 255, E1P.fld UB l ≤ 2 ^ 32)
    (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (Wf : ℕ → ℕ → ℕ) (hne : 0 < Ss.length) (hroot : Ss.getD 0 0 % 2 ^ 14 = 0)
    (hblk : ∀ i < Ss.length, E1P.block C sl UB UBR (Ss.getD i 0) = true) (hgl : glueChkW Ss nJ Jf Wf = true)
    (hjobs : ∀ k < nJ, JobOK C sl UB (Jf k)) :
    ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 19, SlotV x (sl i)) → (∀ l < 255, x l ≤ E1P.fld UB l) →
      (∃ l < 255, 0 < x l) → False := by
  intro x hg hsl hxub hx
  apply jobOK_of_chain_w C sl UB UBR hUB hUBR hubb Ss nJ Jf Wf hne hblk hgl hjobs x hg hsl hxub hx
  have h0 : Ss.getD 0 0 % 2 = 0 := by
    have := Nat.mod_mod_of_dvd (Ss.getD 0 0) (show 2 ∣ 2 ^ 14 by norm_num); rw [hroot] at this; omega
  have hd0 : Ss.getD 0 0 / 2 % 2 ^ 5 = 0 := by
    have a := mod_div_mod (Ss.getD 0 0) 14 1 5 (by omega)
    rw [hroot] at a; simpa using a.symm
  have hp0 : Ss.getD 0 0 / 2 ^ 6 % 2 ^ 8 = 0 := by
    have a := mod_div_mod (Ss.getD 0 0) 14 6 8 (by omega)
    rw [hroot] at a; simpa using a.symm
  unfold StartOK
  rw [hd0, hp0, if_neg (by omega)]
  refine ⟨fun l => by simp [multR], fun l hl => by omega, fun l _ => by simp [multR], fun l hl => ?_⟩
  simp only [multR, Nat.zero_add, Nat.sub_zero]
  exact hxub l hl

theorem enum_of_chain_f (C : E1P.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (hUB : UB = V (fun l => E1P.fld UB l))
    (hUBR : UBR = VR (fun l => E1P.fld UB l)) (hubb : ∀ l < 255, E1P.fld UB l ≤ 2 ^ 32)
    (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (W : List (List ℕ)) (hne : 0 < Ss.length) (hroot : Ss.getD 0 0 % 2 ^ 14 = 0)
    (hblk : ∀ i < Ss.length, E1P.block C sl UB UBR (Ss.getD i 0) = true) (hgl : glueChkF Ss nJ Jf W = true)
    (hjobs : ∀ k < nJ, JobOK C sl UB (Jf k)) :
    ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 19, SlotV x (sl i)) → (∀ l < 255, x l ≤ E1P.fld UB l) →
      (∃ l < 255, 0 < x l) → False :=
  enum_of_chain_w C sl UB UBR hUB hUBR hubb Ss nJ Jf _ hne hroot hblk hgl hjobs

end E1PS
