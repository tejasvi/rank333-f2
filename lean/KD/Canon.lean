module
public import R22Port.U_d41d8cd98f00
public import KD.Kinds
/-! # KD.Canon: L3's canonicity witnesses in the node semantics, and the reduction to canonical decompositions

* `canonBind Sc o k S`: the L3 node record at field `o` of `Sc` (points `seq`, C3's 9-bit fields) is the frame's prefix: its label
  bitset `C3.lbits` (bit `labN x = label + 1`) is `S <<< 1`.  `seqF_bind`: then `seq` is the set of vectors of `S`'s labels.
* **`canon_child_dead`**: a checked witness (`C3.WitSem`, from `C3.nodeOK_sound` / `C3.batch_sound`) whose child point is `vecL u`
  kills child `u` of the bound node for every canonical decomposition: `ChildDead`-form.
* **`canon_reduction`**: if no canonical case-(II) decomposition exists, none exists (`C3.exists_canon_decomp`; `G` keeps
  distinctness, nonzero codes and ranks, hence the case).
* `nType_eq`: the spec's `nType` (ranks by `rkOf`) equals `KD.nType` (Mathlib's `Matrix.rank`), so `KD.CaseII ↔ Spec.CaseII`. -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical

/-! ## Labels in C3's order -/

theorem labN_vecL_tab : S5.allLT 511 (fun l => C3.labN (vecL l) == l + 1) = true := by decide +kernel

theorem labN_vecL (l : ℕ) (hl : l < 511) : C3.labN (vecL l) = l + 1 := by
  have := S5.allLT_spec labN_vecL_tab l hl; simpa using this

theorem labK_lt (x : ℕ) (hx : x < 512) : C3.labK x = C3.labN x := by
  unfold C3.labK; rw [Nat.mod_eq_of_lt hx, Nat.div_eq_of_lt hx]; simp

theorem labN_inj {x y : ℕ} (hx : x < 512) (hy : y < 512) (h : C3.labN x = C3.labN y) : x = y :=
  C3.labK_inj (by rw [labK_lt x hx, labK_lt y hy, h])

/-! ## Binding an L3 node record to the frame -/

/-- the L3 node record's points are the vectors of the prefix labels -/
def canonBind (Sc o k S : ℕ) : Bool := Nat.beq (C3.lbits Sc (o + 1) k) (Nat.shiftLeft S 1)

theorem seqF_bind {Sc o k S : ℕ} (hS511 : S < 2 ^ 511) (hb : canonBind Sc o k S = true) (x : ℕ) :
    x ∈ C3.seqF Sc o k ↔ ∃ l, l < 511 ∧ S.testBit l = true ∧ x = vecL l := by
  have hb' : C3.lbits Sc (o + 1) k = S <<< 1 := Nat.eq_of_beq_eq_true hb
  have hT := fun b => (C3.testBit_Tb (S := Sc) (o := o) (k := k) (b := b))
  have hl511 : ∀ l, S.testBit l = true → l < 511 := by
    intro l hl; by_contra hc; push Not at hc
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hS511 (Nat.pow_le_pow_right (by norm_num) hc))] at hl
    exact absurd hl (by decide)
  constructor
  · intro hx
    have hxl := C3.seqF_lt hx
    have h1 := (hT (C3.labN x)).2 ⟨x, hx, rfl⟩
    rw [hb', Nat.testBit_shiftLeft] at h1
    simp only [Bool.and_eq_true, decide_eq_true_eq] at h1
    obtain ⟨hge, hbit⟩ := h1
    refine ⟨C3.labN x - 1, hl511 _ hbit, hbit, ?_⟩
    apply labN_inj hxl (vecL_lt _)
    rw [labN_vecL _ (hl511 _ hbit)]; omega
  · rintro ⟨l, hl, hbit, rfl⟩
    have h1 : (C3.lbits Sc (o + 1) k).testBit (l + 1) = true := by
      rw [hb', Nat.testBit_shiftLeft]; simp [hbit]
    obtain ⟨y, hy, hyl⟩ := (hT (l + 1)).1 h1
    rw [← labN_vecL l hl] at hyl
    rw [← labN_inj (C3.seqF_lt hy) (vecL_lt l) hyl]; exact hy

/-- **CANON records.**  A checked witness at a bound node kills its child for every canonical decomposition. -/
theorem canon_child_dead {Sc o k w S last u : ℕ} (hW : C3.WitSem Sc o k w) (hb : canonBind Sc o k S = true)
    (hu : C3.fld9 Sc w = vecL u) (hS : S >>> last = 1) (hS511 : S < 2 ^ 511) :
    ∀ A : Dec22, A.Canon → ¬ Continues A S last u := by
  intro A hcan hA
  have hlu : last < u := hA.1
  have hu5 : u < 511 := hA.2.1
  have hS0 : ∀ l, last < l → S.testBit l = false := by
    intro l hl; rw [shr_one_bit hS l (by omega)]; simp; omega
  apply C3.witSem_prune hW (Finset.univ.image A.av) hcan (u + 2)
  ext x
  simp only [Finset.mem_filter, Finset.mem_image, Finset.mem_univ, true_and, Finset.mem_insert, hu]
  rw [seqF_bind hS511 hb x]
  constructor
  · rintro ⟨⟨s, rfl⟩, hk⟩
    obtain ⟨hls, hvs⟩ := labT_spec A s
    rw [← hvs, labK_lt _ (vecL_lt _), labN_vecL _ hls] at hk
    have hHas : A.Has (labT A s) := (has_iff A _).2 ⟨s, rfl⟩
    rcases (cont_le hS hA (labT A s) (by omega)).1 hHas with h1 | h1
    · right; exact ⟨labT A s, hls, h1, hvs.symm⟩
    · left; rw [← hvs, h1]
  · rintro (h1 | ⟨l, hl, hbit, rfl⟩)
    · obtain ⟨_, s, hs⟩ := cont_has hA
      refine ⟨⟨s, by rw [hs, h1]⟩, ?_⟩
      rw [h1, labK_lt _ (vecL_lt _), labN_vecL _ hu5]; omega
    · have hll : l ≤ last := by
        by_contra hc; push Not at hc; rw [hS0 l hc] at hbit; exact absurd hbit (by decide)
      obtain ⟨_, s, hs⟩ := (cont_le hS hA l (by omega)).2 (Or.inl hbit)
      refine ⟨⟨s, hs⟩, ?_⟩
      rw [labK_lt _ (vecL_lt _), labN_vecL _ hl]; omega

/-! ## Ranks: the spec's `rkOf` and Mathlib's rank -/

theorem rkOf_tab : S5.allLT 512 (fun v => rkOf v == BC6s.rk3 v) = true := by decide +kernel

theorem rkOf_rank (v : ℕ) (hv : v < 512) : rkOf v = (toM3 v).rank := by
  rw [← S6.rk3_rank v hv]; have := S5.allLT_spec rkOf_tab v hv; simpa using this

theorem nType_eq (A : Dec22) (r : ℕ) : R3RT.Spec.nType A r = KD.nType A r := by
  unfold R3RT.Spec.nType KD.nType
  apply congrArg Finset.card; ext s; simp only [Finset.mem_filter, Finset.mem_univ, true_and]
  rw [rkOf_rank _ (A.lt s)]

theorem caseII_iff (A : Dec22) : R3RT.Spec.CaseII A ↔ KD.CaseII A := by
  unfold R3RT.Spec.CaseII KD.CaseII; rw [nType_eq]

/-! ## The reduction to canonical decompositions -/

/-- **L3's top-level step.**  If no canonical case-(II) decomposition exists, no case-(II) decomposition exists. -/
theorem canon_reduction (h : ∀ A : Dec22, A.Canon → R3RT.Spec.CaseII A → False) :
    ∀ A : Dec22, R3RT.Spec.CaseII A → False := by
  intro A hII
  obtain ⟨t, P, Q, hP, hQ, ⟨b', c', hd'⟩, hcan⟩ := C3.exists_canon_decomp A.av A.lt A.b A.c A.dec
  let A' : Dec22 :=
    { av := fun s => C3.actN t P Q (A.av s), b := b', c := c'
      lt := fun s => C3.actN_lt t P Q (A.av s)
      ne := fun s h0 => A.ne s (C3.actN_inj hP hQ (A.lt s) (by norm_num) (by rw [h0, C3.actN_zero]))
      inj := fun s s' h => A.inj (C3.actN_inj hP hQ (A.lt s) (A.lt s') h)
      dec := hd' }
  apply h A' hcan
  rw [caseII_iff] at hII ⊢
  unfold KD.CaseII KD.nType at hII ⊢
  refine le_trans hII (le_of_eq ?_)
  apply congrArg Finset.card; ext s; simp only [Finset.mem_filter, Finset.mem_univ, true_and]
  show (toM3 (A.av s)).rank = 1 ↔ (toM3 (C3.actN t P Q (A.av s))).rank = 1
  rw [C3.rank_actN hP hQ]

end KD
