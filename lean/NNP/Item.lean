module
public import R22Port.U_b2c7c2ae34bb
public import NNP.Canon
public import NNP.Root
public import NNP.Node0
public import NN.Item
/-! # NNP.Item: soundness of the per-node check of an item (`NN.nodeFn`)

**`nodeFn_sound`**: `NodeSound O C (FInvO O Ω) (nodeFn S lo hi ids lm tab)`.  An accepted OPEN node has a valid child frame
(`nodeStep2_sound`), and every child in its accounted mask is dead for the case `C`:
* dead labels of `D'` (the frame), T/C kills (`nodeStep2_sound`), X children (hypothesis `hXT`, the X tier's refinement
  composed with `KD.xpartC_sound`, discharged in `NNP.XBridge`), the suffix break (`sufMask_sound`): dead for `Ω ⊇ C`;
* PREFF (`preffN_sound`), TYPE (`tyN_sound`, given `KD.TypeFacts`): dead for every decomposition;
* DOOM (`doomN_sound`): dead in the window `CaseK lo hi ⊇ C`;
* CANON (`canonN_sound`): dead for canonical decompositions.
Static premises: the cap-2 / hyperplane tables (`C2OK`, `HOK`), the item table (`TabOK`, `TabWF`), the kinds tables
(`KStatOK`, `gl`, the order's keys and ranks). -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Finset Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-- the invariant of item frames: a valid frame -/
def FInvO (O : LabelOrder) (Ω : R3RT.Spec.Dec22 → Prop) (fr : Frame) : Prop :=
  FrameOK O Ω (natL fr.S 0 8) (natL fr.D 0 8) (natL fr.N 0 4096) (natU fr.U) fr.d

/-! ## Masks -/

theorem setBit8_big (S : Array UInt64) (l : ℕ) (hl : 512 ≤ l) : natL (setBit8 S l) 0 8 = natL S 0 8 := by
  unfold setBit8
  rw [natL_range_map, natL_eq_natF]
  apply natF_congr; intro k hk
  rw [if_neg (by omega), Nat.zero_add]

theorem setBit8_bit (S : Array UInt64) (l u : ℕ) (hu : u < 512) :
    (natL (setBit8 S l) 0 8).testBit u = ((natL S 0 8).testBit u || decide (u = l)) := by
  by_cases hl : l < 512
  · rw [setBit8_view' S l hl, Nat.testBit_or, Nat.testBit_two_pow]
    congr 1; exact decide_eq_decide.mpr ⟨Eq.symm, Eq.symm⟩
  · rw [setBit8_big S l (by omega), decide_eq_false (by omega), Bool.or_false]

theorem foldl_setBit8 {α : Type} (f : α → ℕ) (u : ℕ) (hu : u < 512) : ∀ (L : List α) (a : Array UInt64),
    (natL (L.foldl (fun a x => setBit8 a (f x)) a) 0 8).testBit u = true ↔
      ((natL a 0 8).testBit u = true ∨ ∃ x ∈ L, f x = u)
  | [], a => by simp
  | x :: L, a => by
    rw [List.foldl_cons, foldl_setBit8 f u hu L, setBit8_bit _ _ _ hu]
    simp only [Bool.or_eq_true, decide_eq_true_eq, List.mem_cons]
    constructor
    · rintro ((h | h) | ⟨y, hy, hyu⟩)
      · exact Or.inl h
      · exact Or.inr ⟨x, Or.inl rfl, h.symm⟩
      · exact Or.inr ⟨y, Or.inr hy, hyu⟩
    · rintro (h | ⟨y, hy | hy, hyu⟩)
      · exact Or.inl (Or.inl h)
      · subst hy; exact Or.inl (Or.inr hyu.symm)
      · exact Or.inr ⟨y, hy, hyu⟩

theorem afoldl_setBit8 {α : Type} (f : α → ℕ) (u : ℕ) (hu : u < 512) (L : Array α) (a : Array UInt64) :
    (natL (L.foldl (fun a x => setBit8 a (f x)) a) 0 8).testBit u = true ↔
      ((natL a 0 8).testBit u = true ∨ ∃ x ∈ L, f x = u) := by
  rw [← Array.foldl_toList, foldl_setBit8 f u hu]
  simp only [Array.mem_toList_iff]

theorem afoldl_setBit8' (u : ℕ) (hu : u < 512) (L : Array ℕ) (a : Array UInt64) :
    (natL (L.foldl setBit8 a) 0 8).testBit u = true ↔ ((natL a 0 8).testBit u = true ∨ u ∈ L) := by
  have := afoldl_setBit8 id u hu L a
  simp only [id] at this
  rw [this]
  constructor
  · rintro (h | ⟨x, hx, rfl⟩)
    · exact Or.inl h
    · exact Or.inr hx
  · rintro (h | h)
    · exact Or.inl h
    · exact Or.inr ⟨u, h, rfl⟩

theorem or8_view (a b : Array UInt64) :
    natL ((Array.range 8).map fun k => a.getD k 0 ||| b.getD k 0) 0 8 = natL a 0 8 ||| natL b 0 8 := by
  rw [natL_range_map]
  apply Nat.eq_of_testBit_eq; intro i
  rw [natF_testBit, Nat.testBit_or, natL_testBit, natL_testBit, tb_or, getElem!_eq_getD', getElem!_eq_getD',
    Nat.zero_add]
  cases decide (i < 64 * 8) <;> simp

theorem copy8_view (a : Array UInt64) : natL ((Array.range 8).map fun q => a.getD q 0) 0 8 = natL a 0 8 := by
  rw [natL_range_map, natL_eq_natF]; apply natF_congr; intro k _; rw [Nat.zero_add]

/-- the sources of an accounted child -/
theorem accAll_bit (fr : Frame) (lab : ℕ) (kills : Array Kill) (xk : Array ℕ) (r : R3.RNode) (u : ℕ) (hu : u < 512)
    (h : (natL (accAll fr lab kills xk r) 0 8).testBit u = true) :
    (natL fr.D 0 8).testBit u = true ∨ (∃ k ∈ kills, k.u = u) ∨ u ∈ xk ∨ (∃ p ∈ r.preff, p.1 = u) ∨ u ∈ r.doom ∨
      u ∈ r.typ ∨ (∃ c ∈ r.canon, c.1 = u) ∨ (natL (sufMask fr.D lab (21 - fr.d)) 0 8).testBit u = true := by
  unfold accAll accL1 at h
  simp only [] at h
  rw [or8_view, Nat.testBit_or, Bool.or_eq_true] at h
  rcases h with h | h
  · rw [afoldl_setBit8 (fun c : ℕ × ℕ × ℕ => c.1) u hu] at h
    rcases h with h | h
    swap
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))))
    rw [afoldl_setBit8' u hu] at h
    rcases h with h | hy
    swap
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hy)))))
    rw [afoldl_setBit8' u hu] at h
    rcases h with h | hy
    swap
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hy))))
    rw [afoldl_setBit8 (fun p : ℕ × ℕ => p.1) u hu] at h
    rcases h with h | h
    swap
    · exact Or.inr (Or.inr (Or.inr (Or.inl h)))
    rw [afoldl_setBit8' u hu] at h
    rcases h with h | hy
    swap
    · exact Or.inr (Or.inr (Or.inl hy))
    rw [afoldl_setBit8 (fun k : Kill => k.u) u hu, copy8_view] at h
    rcases h with h | h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr h))))))

/-! ## The native checks -/

theorem arr_all_mem {α : Type} (a : Array α) (p : α → Bool) (h : a.all p = true) : ∀ x ∈ a, p x = true := by
  intro x hx
  rw [Array.all_eq_true] at h
  obtain ⟨i, hi, rfl⟩ := Array.mem_iff_getElem.mp hx
  exact h i hi

theorem kindsOK_spec (ks : KStatics) (fr : Frame) (lab : ℕ) (c : Cfg) (r : R3.RNode) (h : kindsOK ks fr lab c r = true) :
    (∀ p ∈ r.preff, lab < p.1 ∧ p.1 < 511 ∧ preffN ks fr.U fr.d p.1 p.2 = true) ∧
    (∀ u ∈ r.doom, lab < u ∧ u < 511 ∧ doomN fr.S fr.D fr.d u c = true) ∧
    (∀ u ∈ r.typ, c.ty = true ∧ lab < u ∧ u < 511 ∧ tyN fr.S fr.d u = true) ∧
    (∀ c ∈ r.canon, lab < c.1 ∧ c.1 < 511 ∧ canonN ks fr.S c.1 c.2.2 = true) := by
  unfold kindsOK at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := h
  refine ⟨fun p hp => ?_, fun u hu => ?_, fun u hu => ?_, fun c' hc => ?_⟩
  · have := arr_all_mem _ _ h1 p hp; simp only [Bool.and_eq_true, decide_eq_true_eq] at this
    exact ⟨this.1.1, this.1.2, this.2⟩
  · have := arr_all_mem _ _ h2 u hu; simp only [Bool.and_eq_true, decide_eq_true_eq] at this
    exact ⟨this.1.1, this.1.2, this.2⟩
  · have := arr_all_mem _ _ h3 u hu; simp only [Bool.and_eq_true, decide_eq_true_eq] at this
    exact ⟨this.1.1.1, this.1.1.2, this.1.2, this.2⟩
  · have := arr_all_mem _ _ h4 c' hc; simp only [Bool.and_eq_true, decide_eq_true_eq] at this
    exact ⟨this.1.1, this.1.2, this.2⟩

theorem uOK_spec (U : ByteArray) (h : uOK U = true) : ∀ X, X < 512 → (U.get! X).toNat < 128 := by
  intro X hX
  have := (allN_iff _ _).mp h X hX
  simpa using this

theorem nodeStep2_lab (st : Statics) (tab : Tab) (fr : Frame) (nd : NodeRec2) (out : StepOut)
    (h : nodeStep2 st tab fr nd = some out) : nd.lab < 511 := by
  unfold nodeStep2 at h
  simp only [] at h
  split at h
  · exact absurd h (by simp)
  rename_i hhead
  simp only [Bool.not_eq_true', Bool.not_eq_false] at hhead
  exact (headOK2_spec fr nd hhead).1

/-! ## The node -/

/-- a child dead for the frame's universe is dead for the case -/
theorem dead_of_omega {C : R3RT.Spec.Dec22 → Prop} (hCΩ : ∀ A, C A → Ω A) {S last u : ℕ}
    (h : ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Continues O A S last u) : ChildDead O C S last u :=
  fun A _ hC => h A (hCΩ A hC)

/-- **soundness of the per-node check** -/
theorem nodeFn_sound {C : R3RT.Spec.Dec22 → Prop} (S : IStat) (c : Cfg) (ids lm : Array ℕ) (tab : Tab)
    (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab) (hc1 : Conf1OK O Ω (natL S.st.conf1 0 4096))
    (hC2 : ∀ l, l < 511 → C2OK O Ω l (c2tV S.st l)) (hH : ∀ l, l < 511 → HOK O l (hV S.st l))
    (hK : KStatOK O S.ks) (hgl : ∀ P, P < 512 → S.ks.gl.get! P = 1 → C3.isGL P = true)
    (hinv : invOK S.ks.vec S.ks.inv = true) (hkey : ∀ l, l < 511 → O.key (O.vec l) = l + 1)
    (hR1 : ∀ l, l < 511 → (O.rk l = 1 ↔ c.r1lo ≤ l ∧ l < c.r1hi)) (hr1hi : c.r1hi ≤ 511)
    (hTy : c.ty = true → (∀ l, l < 511 → O.rk l = rk123 l) ∧ KD.TypeFacts)
    (hXT : ∀ (out : StepOut) (lab : ℕ) (xpn : ByteArray) (xs : Array (ℕ × ℕ × ℕ × ByteArray)) (pos : Array ℕ),
      XT.checkR3 out.fr.S out.fr.D out.fr.N out.fr.U out.fr.d lab out.b1 out.m out.e1 (mkDict tab out.ids) S.c2W S.npW xpn xs
        pos = true →
      FrameOK O Ω (natL out.fr.S 0 8) (natL out.fr.D 0 8) (natL out.fr.N 0 4096) (natU out.fr.U) out.fr.d →
      natL out.fr.S 0 8 >>> lab = 1 →
      DictSemXO O Ω (natL out.fr.S 0 8) lab (dictRowV tab out.ids) (KD.rposB out.b1 out.m out.e1) →
      (∀ p, dictRowV tab out.ids p < 2 ^ 511) →
      ∀ u ∈ (xs.map (·.1)).toList, ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Continues O A (natL out.fr.S 0 8) lab u)
    (hCΩ : ∀ A, C A → Ω A) (hCK : ∀ A, C A → CaseK c.lo c.hi A) :
    NodeSound O C (FInv0 O Ω S.st) (nodeFn S c ids lm tab) := by
  intro fr lab r fr' acc hI h
  unfold nodeFn at h
  rcases hcv : conv ids lm tab r with _ | cn
  · rw [hcv] at h; exact absurd h (by simp)
  rw [hcv] at h
  simp only [] at h
  split at h
  · exact absurd h (by simp)
  rename_i hlab
  simp only [bne_iff_ne, ne_eq, Decidable.not_not] at hlab
  rcases hst : nodeStep2 S.st tab fr cn.nrec with _ | out
  · rw [hst] at h; exact absurd h (by simp)
  rw [hst] at h
  simp only [] at h
  rcases hxk : xKids S tab cn lab out with _ | xk
  · rw [hxk] at h; exact absurd h (by simp)
  rw [hxk] at h
  simp only [] at h
  split at h
  swap
  · exact absurd h (by simp)
  rename_i hchk
  simp only [Bool.and_eq_true] at hchk
  obtain ⟨hu, hkinds⟩ := hchk
  simp only [Option.some.injEq, Prod.mk.injEq] at h
  obtain ⟨rfl, rfl⟩ := h
  have hl511 := nodeStep2_lab S.st tab fr cn.nrec out hst
  rw [hlab] at hl511
  obtain ⟨hS', _, _, hd', hF', hkill, hpc, hSlt, _, hshr, hDS, hmk, _, _, _, _⟩ :=
    nodeStep2_ok S.st tab hT hW fr cn.nrec out hI hc1 (by rw [hlab]; exact hC2 lab hl511) (by rw [hlab]; exact hH lab hl511) hst
  rw [hlab] at hS' hkill hpc hSlt hshr hDS
  set S' := natL fr.S 0 8 ||| 2 ^ lab with hS'def
  refine ⟨Or.inl hF', hS', hSlt, hl511, hpc, ?_⟩
  -- coverage
  intro u hlu hu511 hacc
  have hU := uOK_spec _ hu
  have hcard := hF'.2.2.1
  have hd21 : out.fr.d ≤ 21 := by rw [hS'] at hcard; unfold pcard at hpc; omega
  have hshr' : natL out.fr.S 0 8 >>> lab = 1 := by rw [hS']; exact hshr
  have hS511 : natL out.fr.S 0 8 < 2 ^ 511 := hF'.2.1
  obtain ⟨kP, kD, kT, kC⟩ := kindsOK_spec S.ks out.fr lab c r hkinds
  rw [← hS']
  rcases accAll_bit out.fr lab cn.nrec.kills xk r u (by omega) hacc with h | ⟨k, hk, rfl⟩ | h | ⟨p, hp, rfl⟩ | h | h |
      ⟨c', hc, rfl⟩ | h
  · -- a dead label of the child frame
    refine dead_of_omega hCΩ (fun A hΩ hA => ?_)
    have hbel := NNP.KC.cont_belowO hshr' hA
    exact absurd (NNP.KC.cont_hasO hA) (by
      have := frame_notD' hF' hshr' hΩ hbel u hlu hu511
      intro hAu; rw [this hAu] at h; exact absurd h (by decide))
  · -- a T/C kill
    refine dead_of_omega hCΩ ?_
    rw [hS']; exact hkill k hk
  · -- an X child
    unfold xKids at hxk
    split at hxk
    · simp only [Option.some.injEq] at hxk; subst hxk; simp at h
    split at hxk
    · rename_i hxc
      simp only [Option.some.injEq] at hxk
      subst hxk
      refine dead_of_omega hCΩ ?_
      rw [hS'] at hF'
      exact hXT out lab cn.xpn cn.xk cn.pos hxc (by rw [hS']; exact hF') hshr' (by rw [hS']; exact hDS) hmk u
        (Array.mem_toList_iff.mpr h)
    · exact absurd hxk (by simp)
  · -- PREFF
    obtain ⟨_, _, hpr⟩ := kP p hp
    exact fun A _ _ => preffN_sound S.ks hK hF' hU hshr' hd21 hpr A
  · -- DOOM
    obtain ⟨_, _, hdm⟩ := kD u h
    exact fun A _ hC => doomN_sound c hR1 hr1hi hF' hshr' hd21 hdm A (hCΩ A hC) (hCK A hC)
  · -- TYPE
    obtain ⟨hon, _, _, hty⟩ := kT u h
    obtain ⟨hRk, hTF⟩ := hTy hon
    exact fun A _ _ => tyN_sound hRk hTF hF' hshr' hd21 hty A
  · -- CANON
    obtain ⟨_, _, hcn⟩ := kC c' hc
    exact fun A hcan _ => canonN_sound S.ks hK.vec hgl hinv hkey hshr' hS511 hcn A hcan
  · -- the suffix break
    exact dead_of_omega hCΩ (sufMask_sound hF' hshr' hd21 h)

end NNP
