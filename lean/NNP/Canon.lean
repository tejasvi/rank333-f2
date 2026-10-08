module
public import R22Port.U_d41d8cd98f00
public import NNP.Kinds
public import C3.Act
/-! # NNP.Canon: soundness of the native CANON check

`canonN ks S u g` accepts when `g = (t, P, Q)` has `P`, `Q` invertible (table `gl`) and the label set `I = g(T)` of the image of
`T = S ∪ {u}` is lex-smaller than `T` in label order: the least label `m ∈ I \ T` is below 511 and `T ∩ [0, m) ⊆ I`.  Then
`C3.LexLt O.key (Tc.image g) Tc` for the codes `Tc` of `T` (keys are labels + 1, hypothesis `hkey`), and by
`C3.not_canon_of_prefix` no canonical decomposition has `Tc` as a key prefix, i.e. none continues the node with child `u`
(**`canonN_sound`**). -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Finset Classical BC4 BC5 RootSound
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-! ## Native pieces -/

theorem actNN_eq (t : Bool) (P Q v : ℕ) : actNN t P Q v = C3.actN t P Q v := rfl

/-- a `foldr` choosing the first element with a property returns the default or such an element -/
theorem foldr_first (p : ℕ → Bool) (d : ℕ) : ∀ (L : List ℕ),
    L.foldr (fun l acc => if p l then l else acc) d = d ∨
      (L.foldr (fun l acc => if p l then l else acc) d ∈ L ∧ p (L.foldr (fun l acc => if p l then l else acc) d) = true)
  | [] => Or.inl rfl
  | a :: L => by
    simp only [List.foldr_cons]
    split
    · rename_i h; exact Or.inr ⟨List.mem_cons_self, h⟩
    · rcases foldr_first p d L with h | ⟨h1, h2⟩
      · exact Or.inl h
      · exact Or.inr ⟨List.mem_cons_of_mem _ h1, h2⟩

theorem lowL_spec (m : Array UInt64) (h : lowL m < 512) : bit8 m (lowL m) = true := by
  unfold lowL at h ⊢
  rcases foldr_first (fun l => bit8 m l) 512 (List.range 512) with h1 | ⟨_, h2⟩
  · rw [h1] at h; omega
  · exact h2

/-- the bits of the image set -/
theorem imgL_bit (ks : KStatics) (t : Bool) (P Q : ℕ) (T : Array UInt64) (hinv : ∀ c, c < 512 → ks.inv.getD c 511 ≤ 511)
    (m : ℕ) :
    (natL (imgL ks t P Q T) 0 8).testBit m = true →
      ∃ l, l < 511 ∧ bit8 T l = true ∧ ks.inv.getD (actNN t P Q (ks.vec.getD l 0)) 511 = m := by
  unfold imgL
  suffices H : ∀ (L : List ℕ) (I : Array UInt64), (∀ l ∈ L, l < 511) →
      (natL (L.foldl (fun I l => if bit8 T l then setBit8 I (ks.inv.getD (actNN t P Q (ks.vec.getD l 0)) 511) else I) I)
        0 8).testBit m = true →
      (natL I 0 8).testBit m = true ∨ ∃ l ∈ L, bit8 T l = true ∧ ks.inv.getD (actNN t P Q (ks.vec.getD l 0)) 511 = m by
    intro hb
    rcases H (List.range 511) _ (fun l hl => List.mem_range.mp hl) hb with h | ⟨l, hl, h1, h2⟩
    · rw [natL_zero8, Nat.zero_testBit] at h; exact absurd h (by decide)
    · exact ⟨l, List.mem_range.mp hl, h1, h2⟩
  intro L
  induction L with
  | nil => intro I _ h; exact Or.inl h
  | cons a L ih =>
    intro I hL h
    simp only [List.foldl_cons] at h
    split at h
    · rename_i hT
      rcases ih _ (fun l hl => hL l (List.mem_cons_of_mem _ hl)) h with h1 | ⟨l, hl, h2, h3⟩
      · rw [setBit8_view' _ _ (by have := hinv (actNN t P Q (ks.vec.getD a 0)) (C3.actN_lt _ _ _ _); omega), Nat.testBit_or,
          Nat.testBit_two_pow] at h1
        simp only [Bool.or_eq_true, decide_eq_true_eq] at h1
        rcases h1 with h1 | h1
        · exact Or.inl h1
        · exact Or.inr ⟨a, List.mem_cons_self, hT, h1⟩
      · exact Or.inr ⟨l, List.mem_cons_of_mem _ hl, h2, h3⟩
    · rcases ih _ (fun l hl => hL l (List.mem_cons_of_mem _ hl)) h with h1 | ⟨l, hl, h2, h3⟩
      · exact Or.inl h1
      · exact Or.inr ⟨l, List.mem_cons_of_mem _ hl, h2, h3⟩

theorem lexLtN_spec (I T : Array UInt64) (h : lexLtN I T = true) :
    ∃ m, m < 511 ∧ (natL I 0 8).testBit m = true ∧ (natL T 0 8).testBit m = false ∧
      ∀ l, l < m → (natL T 0 8).testBit l = true → (natL I 0 8).testBit l = true := by
  unfold lexLtN at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨hm, hsub⟩ := h
  set Dm := (Array.range 8).map fun k => I.getD k 0 &&& ~~~(T.getD k 0) with hDm
  set m := lowL Dm with hmdef
  have hbit := lowL_spec Dm (by omega)
  rw [← hmdef, bit8_eq _ _ (by omega), hDm, natL_range_map, natF_testBit, decide_eq_true (show m < 64 * 8 by omega),
    Bool.true_and, tb_and, tb_not, decide_eq_true (Nat.mod_lt _ (by norm_num)), Bool.true_and] at hbit
  simp only [Bool.and_eq_true, Bool.not_eq_true'] at hbit
  have hIT : ∀ (a : Array UInt64) (l : ℕ), l < 512 → (natL a 0 8).testBit l = (a.getD (l / 64) 0).toNat.testBit (l % 64) := by
    intro a l hl
    rw [natL_testBit, decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, getElem!_eq_getD', Nat.zero_add]
  refine ⟨m, hm, by rw [hIT I m (by omega)]; exact hbit.1, by rw [hIT T m (by omega)]; exact hbit.2, ?_⟩
  intro l hl hTl
  have hk := (allN_iff _ _).mp hsub (l / 64) (by omega)
  simp only [beq_iff_eq] at hk
  have hb := congrArg (fun x : UInt64 => x.toNat.testBit (l % 64)) hk
  simp only [] at hb
  have hj : l % 64 < 64 := Nat.mod_lt _ (by norm_num)
  rw [tb_and, tb_and, tb_not, tb_not, fromW_bit _ _ _ hj, show 64 * (l / 64) + l % 64 = l by omega,
    decide_eq_true hj, decide_eq_false (show ¬ m ≤ l by omega), ← hIT T l (by omega), hTl] at hb
  rw [hIT I l (by omega)]
  cases h' : (I.getD (l / 64) 0).toNat.testBit (l % 64)
  · rw [h'] at hb; simp at hb
  · rfl

/-! ## Soundness -/

/-- **a CANON record kills its child for every canonical decomposition** -/
theorem canonN_sound (ks : KStatics) (hvec : ∀ l, l < 511 → ks.vec.getD l 0 = O.vec l)
    (hgl : ∀ P, P < 512 → ks.gl.get! P = 1 → C3.isGL P = true) (hinv : invOK ks.vec ks.inv = true)
    (hkey : ∀ l, l < 511 → O.key (O.vec l) = l + 1) {S : Array UInt64} {last u g : ℕ}
    (hS : natL S 0 8 >>> last = 1) (hS511 : natL S 0 8 < 2 ^ 511) (h : canonN ks S u g = true) :
    ∀ A : R3RT.Spec.Dec22, Canon O A → ¬ Continues O A (natL S 0 8) last u := by
  intro A hcan hA
  have hlu : last < u := hA.1
  have hu : u < 511 := hA.2.1
  unfold canonN at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨hP, hQ⟩, hlex⟩ := h
  set t := g >>> 18
  set P := (g >>> 9) % 512 with hPdef
  set Q := g % 512 with hQdef
  have hPgl := hgl P (Nat.mod_lt _ (by norm_num)) hP
  have hQgl := hgl Q (Nat.mod_lt _ (by norm_num)) hQ
  set T := setBit8 S u with hTdef
  have hTv : natL T 0 8 = natL S 0 8 ||| 2 ^ u := setBit8_view' S u (by omega)
  -- the inverse table
  have hinv' := (allN_iff _ _).mp hinv
  have hinv0 : ks.inv.getD 0 511 = 511 := by
    have := hinv' 0 (by norm_num)
    rw [if_pos (by rfl)] at this
    exact beq_iff_eq.mp this
  have hinvc : ∀ c, 0 < c → c < 512 → ks.inv.getD c 511 < 511 ∧ ks.vec.getD (ks.inv.getD c 511) 0 = c := by
    intro c hc0 hc
    have := hinv' c hc
    rw [if_neg (by simp; omega)] at this
    simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at this
    exact this
  have hinvle : ∀ c, c < 512 → ks.inv.getD c 511 ≤ 511 := by
    intro c hc
    by_cases hc0 : c = 0
    · subst hc0; omega
    · have := (hinvc c (by omega) hc).1; omega
  obtain ⟨m, hm511, hIm, hTm, hsub⟩ := lexLtN_spec _ _ hlex
  set I := imgL ks (t != 0) P Q T with hIdef
  set g := C3.actN (t != 0) P Q with hgdef
  have hg : g ∈ C3.Gset := ⟨t != 0, P, Q, hPgl, hQgl, rfl⟩
  set Tc := ((range 511).filter (fun l => (natL T 0 8).testBit l = true)).image O.vec with hTc
  -- every image label is the code image of a label of T
  have himg : ∀ l', l' < 511 → (natL I 0 8).testBit l' = true → O.vec l' ∈ Tc.image g := by
    intro l' hl' hb
    obtain ⟨l, hl, hTl, hil⟩ := imgL_bit ks (t != 0) P Q T hinvle l' hb
    have hc512 : actNN (t != 0) P Q (ks.vec.getD l 0) < 512 := C3.actN_lt _ _ _ _
    have hc0 : actNN (t != 0) P Q (ks.vec.getD l 0) ≠ 0 := by
      intro h0; rw [h0, hinv0] at hil; omega
    obtain ⟨_, hvc⟩ := hinvc _ (Nat.pos_of_ne_zero hc0) hc512
    rw [hil, hvec l' hl'] at hvc
    rw [mem_image]
    refine ⟨O.vec l, ?_, ?_⟩
    · rw [mem_image]; exact ⟨l, by simp only [mem_filter, mem_range]; exact ⟨hl, by rw [← bit8_eq _ _ (by omega)]; exact hTl⟩, rfl⟩
    · rw [hvc, actNN_eq, hvec l hl]
  have hlex' : C3.LexLt O.key (Tc.image g) Tc := by
    refine ⟨O.vec m, himg m hm511 hIm, ?_, ?_⟩
    · intro hmT
      rw [mem_image] at hmT
      obtain ⟨l, hl, hle⟩ := hmT
      simp only [mem_filter, mem_range] at hl
      have := O.vec_inj l m hl.1 hm511 hle
      subst this; rw [hl.2] at hTm; exact absurd hTm (by decide)
    · intro x hx hkx
      rw [mem_image] at hx
      obtain ⟨l, hl, rfl⟩ := hx
      simp only [mem_filter, mem_range] at hl
      rw [hkey l hl.1, hkey m hm511] at hkx
      exact himg l hl.1 (hsub l (by omega) hl.2)
  -- the decomposition's labels up to `u` are `T`
  have hbits : ∀ l, (natL S 0 8).testBit l = true → l ≤ last := by
    intro l hl; by_contra hc
    rw [KD.shr_one_bit hS l (by omega)] at hl; simp at hl; omega
  apply C3.not_canon_of_prefix O.key hg hlex' (Finset.univ.image A.av) hcan (u + 2)
  ext x
  constructor
  · intro hx
    obtain ⟨hx1, hk⟩ := Finset.mem_filter.mp hx
    obtain ⟨s, _, hsx⟩ := Finset.mem_image.mp hx1
    subst hsx
    obtain ⟨hls, hvs⟩ := NNP.KC.labO_spec O A s
    rw [← hvs, hkey _ hls] at hk
    have hHas : Has O A (NNP.KC.labO O A s) := (NNP.KC.has_iffO O A _).2 ⟨s, rfl⟩
    have hb := (hA.2.2 _ hls (by omega)).1 hHas
    refine Finset.mem_image.mpr ⟨NNP.KC.labO O A s, Finset.mem_filter.mpr ⟨Finset.mem_range.mpr hls, ?_⟩, hvs⟩
    rw [hTv]; exact hb
  · intro hx
    obtain ⟨l, hl, hlx⟩ := Finset.mem_image.mp hx
    subst hlx
    obtain ⟨hl5', hTl⟩ := Finset.mem_filter.mp hl
    have hl5 := Finset.mem_range.mp hl5'
    rw [hTv, Nat.testBit_or, Nat.testBit_two_pow, Bool.or_eq_true, decide_eq_true_eq] at hTl
    have hlu' : l ≤ u := by
      rcases hTl with h1 | h1
      · have := hbits l h1; omega
      · omega
    have hHas := (hA.2.2 l hl5 hlu').2 (by rw [Nat.testBit_or, Nat.testBit_two_pow]; rcases hTl with h1 | h1 <;> simp [h1])
    obtain ⟨_, s, hs⟩ := hHas
    exact Finset.mem_filter.mpr ⟨Finset.mem_image.mpr ⟨s, Finset.mem_univ _, hs⟩, by rw [hkey l hl5]; omega⟩

end NNP
