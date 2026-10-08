module
public import R22Port.U_d41d8cd98f00
public import KD321.Kinds
public import KD321.C3T
/-! # KD321.Canon: CANON records over a label order (L3's witnesses with the order's key table)

The order's key is L3's `keyT LT` for a label table `LT` (`LabO O LT`: `O.key = keyT LT`, `labT LT (O.vec l) = l + 1`, `LT`
injective on codes).  For `--rord 321`: `LT = Top321.LABT321`, key `Top321.labK321` (`labO321`).
* `canonBindT LT Sc o k S`: the L3 node record at field `o` of `Sc` has the prefix `S` as its points (label bitset `S <<< 1`).
* **`canon_child_deadO`**: a checked witness at a bound node kills its child for every canonical decomposition.
* `canonNode LT Sc S`: one L3 node record at field 0, bound to `S` and checked (`C3T.nodeOK`); `canonKids LT Sc` is the label
  mask of its witnesses' children.  **`canonNode_sound`**: every child in the mask is dead for canonical decompositions. -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD321
open RootSound R3RT R3RT.SpecO BC4 BC5 Finset Classical

/-- the order's L3 key is the table `LT`'s -/
structure LabO (O : LabelOrder) (LT : ℕ) : Prop where
  key_eq : O.key = C3T.keyT LT
  lab_vec : ∀ l, l < 511 → C3T.labT LT (O.vec l) = l + 1
  inj : C3T.LabInj LT

/-- the L3 node record's points are the codes of the prefix labels -/
def canonBindT (LT Sc o k S : ℕ) : Bool := Nat.beq (C3T.lbits LT Sc (o + 1) k) (Nat.shiftLeft S 1)

section canon
variable {O : LabelOrder} {LT : ℕ}

theorem seqF_bindO (hO : LabO O LT) {Sc o k S : ℕ} (hS511 : S < 2 ^ 511) (hb : canonBindT LT Sc o k S = true) (x : ℕ) :
    x ∈ C3.seqF Sc o k ↔ ∃ l, l < 511 ∧ S.testBit l = true ∧ x = O.vec l := by
  have hb' : C3T.lbits LT Sc (o + 1) k = S <<< 1 := Nat.eq_of_beq_eq_true hb
  have hl511 : ∀ l, S.testBit l = true → l < 511 := by
    intro l hl; by_contra hc; push Not at hc
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hS511 (Nat.pow_le_pow_right (by norm_num) hc))] at hl
    exact absurd hl (by decide)
  constructor
  · intro hx
    have hxl := C3.seqF_lt hx
    have h1 := (C3T.testBit_Tb (LT := LT) (S := Sc) (o := o) (k := k) (b := C3T.labT LT x)).2 ⟨x, hx, rfl⟩
    rw [hb', Nat.testBit_shiftLeft] at h1
    simp only [Bool.and_eq_true, decide_eq_true_eq] at h1
    obtain ⟨hge, hbit⟩ := h1
    refine ⟨C3T.labT LT x - 1, hl511 _ hbit, hbit, ?_⟩
    apply hO.inj _ _ hxl (O.vec_lt _ (hl511 _ hbit))
    rw [hO.lab_vec _ (hl511 _ hbit)]; omega
  · rintro ⟨l, hl, hbit, rfl⟩
    have h1 : (C3T.lbits LT Sc (o + 1) k).testBit (l + 1) = true := by
      rw [hb', Nat.testBit_shiftLeft]; simp [hbit]
    obtain ⟨y, hy, hyl⟩ := (C3T.testBit_Tb (LT := LT)).1 h1
    rw [← hO.lab_vec l hl] at hyl
    rw [← hO.inj _ _ (C3.seqF_lt hy) (O.vec_lt l hl) hyl]; exact hy

/-- **CANON records.**  A checked witness at a bound node kills its child for every canonical decomposition. -/
theorem canon_child_deadO (hO : LabO O LT) {Sc o k w S last u : ℕ} (hW : C3T.WitSem LT Sc o k w)
    (hb : canonBindT LT Sc o k S = true) (hu : C3.fld9 Sc w = O.vec u) (hS : S >>> last = 1) (hS511 : S < 2 ^ 511) :
    ∀ A : Spec.Dec22, Canon O A → ¬ Continues O A S last u := by
  intro A hcan hA
  have hlu : last < u := hA.1
  have hu5 : u < 511 := hA.2.1
  have hS0 : ∀ l, last < l → S.testBit l = false := by
    intro l hl; rw [KD.shr_one_bit hS l (by omega)]; simp; omega
  have hcan' : C3.Canon (C3T.keyT LT) C3.Gset (univ.image A.av) := by
    have h := hcan; unfold Canon at h; rw [hO.key_eq] at h; exact h
  apply C3T.witSem_prune hW (univ.image A.av) hcan' (u + 2)
  ext x
  simp only [mem_filter, mem_image, mem_univ, true_and, mem_insert, hu]
  rw [seqF_bindO hO hS511 hb x]
  constructor
  · rintro ⟨⟨s, rfl⟩, hk⟩
    obtain ⟨hls, hvs⟩ := labTO_spec O A s
    rw [← hvs, C3T.keyT_lt (O.vec_lt _ hls), hO.lab_vec _ hls] at hk
    have hHas : Has O A (labTO O A s) := (has_iffO O A _).2 ⟨s, rfl⟩
    rcases (cont_leO O hA (labTO O A s) (by omega)).1 hHas with h1 | h1
    · right; exact ⟨labTO O A s, hls, h1, hvs.symm⟩
    · left; rw [← hvs, h1]
  · rintro (h1 | ⟨l, hl, hbit, rfl⟩)
    · obtain ⟨_, s, hs⟩ := cont_hasO O hA
      refine ⟨⟨s, by rw [hs, h1]⟩, ?_⟩
      rw [h1, C3T.keyT_lt (O.vec_lt _ hu5), hO.lab_vec _ hu5]; omega
    · have hll : l ≤ last := by
        by_contra hc; push Not at hc; rw [hS0 l hc] at hbit; exact absurd hbit (by decide)
      obtain ⟨_, s, hs⟩ := (cont_leO O hA l (by omega)).2 (Or.inl hbit)
      refine ⟨⟨s, hs⟩, ?_⟩
      rw [C3T.keyT_lt (O.vec_lt _ hl), hO.lab_vec _ hl]; omega

end canon

/-! ## One L3 node record per OPEN node -/

/-- label mask of the children of `n` witnesses from field `w` (bit `labT - 1`; nothing for a code with label 0) -/
def kidsT (LT S : ℕ) : ℕ → ℕ → ℕ :=
  Nat.rec (motive := fun _ => ℕ → ℕ) (fun _ => 0)
    (fun _ ih w => Nat.lor (Nat.shiftRight (Nat.shiftLeft 1 (C3T.labT LT (C3.fld9 S w))) 1) (ih (C3.wnext S w)))

/-- the L3 node record at field 0 of `Sc`, bound to the prefix `S` and checked -/
def canonNode (LT Sc S : ℕ) : Bool := canonBindT LT Sc 0 (C3.fld9 Sc 0) S && C3T.nodeOK LT Sc 0

/-- the children its witnesses kill (label mask) -/
def canonKids (LT Sc : ℕ) : ℕ :=
  kidsT LT Sc (C3.fld9 Sc (C3.fld9 Sc 0 + 2 + 3 * C3.fld9 Sc (C3.fld9 Sc 0 + 1)))
    (C3.fld9 Sc 0 + 3 + 3 * C3.fld9 Sc (C3.fld9 Sc 0 + 1))

theorem testBit_kid (m b : ℕ) : (Nat.shiftRight (Nat.shiftLeft 1 m) 1).testBit b = true ↔ m = b + 1 := by
  rw [show Nat.shiftRight (Nat.shiftLeft 1 m) 1 = (1 <<< m) >>> 1 from rfl, Nat.testBit_shiftRight, Nat.one_shiftLeft,
    Nat.testBit_two_pow]
  simp only [decide_eq_true_eq]; omega

theorem kidsT_sem {LT S o k : ℕ} : ∀ n w, C3T.WSem LT S o k n w → ∀ b, (kidsT LT S n w).testBit b = true →
    ∃ w', C3T.WitSem LT S o k w' ∧ C3T.labT LT (C3.fld9 S w') = b + 1 := by
  intro n
  induction n with
  | zero => intro w _ b h; simp [kidsT] at h
  | succ n ih =>
    intro w hW b h
    obtain ⟨hw, hrest⟩ := hW
    have h' : (Nat.lor (Nat.shiftRight (Nat.shiftLeft 1 (C3T.labT LT (C3.fld9 S w))) 1) (kidsT LT S n (C3.wnext S w))).testBit b
        = true := h
    rw [show ∀ x y : ℕ, Nat.lor x y = x ||| y from fun _ _ => rfl, Nat.testBit_or, Bool.or_eq_true] at h'
    rcases h' with h1 | h1
    · exact ⟨w, hw, (testBit_kid _ _).1 h1⟩
    · exact ih _ hrest b h1

/-- **CANON per node.**  An accepted node record kills every child of its mask for canonical decompositions. -/
theorem canonNode_sound {O : LabelOrder} {LT : ℕ} (hO : LabO O LT) {Sc S last : ℕ} (hS : S >>> last = 1)
    (hS511 : S < 2 ^ 511) (h : canonNode LT Sc S = true) :
    ∀ u, (canonKids LT Sc).testBit u = true → ∀ A : Spec.Dec22, Canon O A → ¬ Continues O A S last u := by
  intro u hu A hcan hA
  have hu5 : u < 511 := hA.2.1
  unfold canonNode at h
  rw [Bool.and_eq_true] at h
  obtain ⟨hb, hn⟩ := h
  have hsem := C3T.nodeOK_sound hO.inj hn
  unfold C3T.NodeSem at hsem
  simp only [Nat.zero_add] at hsem
  obtain ⟨w', hw', hlab⟩ := kidsT_sem _ _ hsem u hu
  have hcode : C3.fld9 Sc w' = O.vec u := by
    apply hO.inj _ _ (C3.fld9_lt _ _) (O.vec_lt u hu5)
    rw [hlab, hO.lab_vec u hu5]
  exact canon_child_deadO hO hw' hb hcode hS hS511 A hcan hA

/-! ## `--rord 321` -/

theorem labO321 : LabO Top321.O Top321.LABT321 where
  key_eq := rfl
  lab_vec := fun l hl => Top321.lab_spec l hl
  inj := fun _ _ hu hv h => labN321_inj hu hv h

end KD321
