module
public import R22Port.U_85f53a18da81
public import NNP.Item
public import NN.ItemN
public import NNP.Tab
/-! # NNP.ItemN: an accepted item is a certified segment with its key's interface (`SegRefH` form)

**`itemR3_sound`**: if `NN.itemR3 S rowE lo hi dead key b` accepts, the segment `g` of the decoded tree (`segOf`, from the data
alone) has exactly the key's interface — root, `lo`, external children, ranges — and under the facts `H` it is certified:
`H → SegOKO O C g`.  `H` must give the static facts (cap-1 / cap-2 / hyperplane tables, the kinds tables, the row interface's
rows), the X tier's refinement (`hXT`, discharged by `NNP.xBridge` at `LO123`), the type facts, and the dead-child checker's
soundness.

Also here: the item table built from the row interface is well formed and valid (`tabWF_entries`, `tabOK_entries`), and the
DFS lists of external children and ranges are the tree's sets (`extL_mem`, `rngL_mem`). -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Finset Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-! ## The item table -/

theorem tabOfEntries_rows_size (ids ents : Array ℕ) : (tabOfEntries ids ents).rows.size = 8 * ids.size := by
  simp [tabOfEntries]

theorem tabOfEntries_row (ids ents : Array ℕ) (j : ℕ) (hj : j < 8 * ids.size) :
    (tabOfEntries ids ents).rows.getD j 0 =
      ((ents.getD (j / 8) 0 >>> (64 * (j % 8))) % (if j % 8 = 7 then 2 ^ 63 else 2 ^ 64)).toUInt64 := by
  unfold tabOfEntries
  simp only []
  rw [getD_range_map, if_pos hj]

theorem tabWF_entries (ids ents : Array ℕ) (hsz : ents.size = ids.size)
    (hids : ids.all (fun i => decide (i < 2 ^ 32)) = true)
    (hcaps : (tabOfEntries ids ents).caps.all (fun c => decide (c < 256)) = true) : TabWF (tabOfEntries ids ents) := by
  have hcs : (tabOfEntries ids ents).caps.size = ids.size := by simp [tabOfEntries, hsz]
  refine ⟨by rw [tabOfEntries_rows_size, hcs], ?_, ?_, by simp [tabOfEntries, hsz], ?_⟩
  · intro i
    by_cases hi : 8 * i + 7 < 8 * ids.size
    · rw [tabOfEntries_row _ _ _ hi, if_pos (by omega), Nat.toUInt64_eq, UInt64.toNat_ofNat',
        Nat.mod_eq_of_lt (lt_of_lt_of_le (Nat.mod_lt _ (by norm_num)) (by norm_num))]
      exact Nat.mod_lt _ (by norm_num)
    · rw [getD_ge _ _ _ (by rw [tabOfEntries_rows_size]; omega)]; simp
  · intro i
    by_cases hi : i < (tabOfEntries ids ents).caps.size
    · rw [getD_lt _ _ _ hi]
      rw [Array.all_eq_true] at hcaps
      have := hcaps i hi; simpa using this
    · rw [getD_ge _ _ _ (by omega)]; norm_num
  · intro i
    have hid : (tabOfEntries ids ents).ids = ids := rfl
    rw [hid]
    by_cases hi : i < ids.size
    · rw [getD_lt _ _ _ hi]
      rw [Array.all_eq_true] at hids
      have := hids i hi; simpa using this
    · rw [getD_ge _ _ _ (by omega)]; norm_num

theorem rowT_entries (ids ents : Array ℕ) (i : ℕ) (hi : i < ids.size) :
    rowT (tabOfEntries ids ents) i = ents.getD i 0 % 2 ^ 511 := by
  unfold rowT
  rw [if_pos (by rw [tabOfEntries_rows_size]; omega), natL_eq_natF]
  apply Nat.eq_of_testBit_eq; intro b
  rw [natF_testBit, Nat.testBit_mod_two_pow]
  by_cases hb : b < 512
  · rw [decide_eq_true (show b < 64 * 8 by omega), Bool.true_and,
      tabOfEntries_row _ _ _ (by omega), Nat.toUInt64_eq, UInt64.toNat_ofNat']
    have hq : (8 * i + b / 64) / 8 = i := by omega
    have hr : (8 * i + b / 64) % 8 = b / 64 := by omega
    rw [hq, hr]
    have hlt : ∀ m, m < 2 ^ 64 → m % 2 ^ 64 = m := fun m hm => Nat.mod_eq_of_lt hm
    split
    · rename_i h7
      rw [hlt _ (lt_of_lt_of_le (Nat.mod_lt _ (by norm_num)) (by norm_num)), Nat.testBit_mod_two_pow,
        Nat.testBit_shiftRight, show 64 * (b / 64) + b % 64 = b by omega]
      by_cases hb' : b < 511
      · rw [decide_eq_true (show b % 64 < 63 by omega), decide_eq_true hb']
      · rw [decide_eq_false (show ¬ b % 64 < 63 by omega), decide_eq_false hb']
    · rename_i h7
      rw [Nat.mod_mod, Nat.testBit_mod_two_pow, Nat.testBit_shiftRight, show 64 * (b / 64) + b % 64 = b by omega,
        decide_eq_true (show b % 64 < 64 from Nat.mod_lt _ (by norm_num)), decide_eq_true (show b < 511 by omega)]
  · rw [decide_eq_false (show ¬ b < 64 * 8 by omega), Bool.false_and, decide_eq_false (show ¬ b < 511 by omega),
      Bool.false_and]

theorem capOf_entries (ids ents : Array ℕ) (i : ℕ) (hsz : ents.size = ids.size) :
    capOf (tabOfEntries ids ents) i = (ents.getD i 0 >>> 511) % 512 := by
  unfold capOf tabOfEntries
  simp only []
  by_cases hi : i < ents.size
  · rw [getD_lt _ _ _ (by simpa using hi), getD_lt _ _ _ hi, Array.getElem_map]
  · rw [getD_ge _ _ _ (by simpa using hi), getD_ge _ _ _ (by omega)]; simp

/-- **the item table is valid** when every entry of the row interface is -/
theorem tabOK_entries (rowE : ℕ → ℕ) (ids : Array ℕ)
    (hrow : ∀ i, RowOK O Ω (rowE i % 2 ^ 511) ((rowE i >>> 511) % 512))
    (hW : TabWF (tabOfEntries ids (ids.map rowE))) : TabOK O Ω (tabV (tabOfEntries ids (ids.map rowE))) := by
  intro i
  rw [tabV_cap _ hW, tabV_row _ hW]
  refine ⟨hW.caps i, ?_⟩
  by_cases hi : i < ids.size
  · rw [rowT_entries _ _ _ hi, capOf_entries _ _ _ (by simp)]
    rw [getD_lt _ _ _ (by simpa using hi), Array.getElem_map]
    exact hrow _
  · have hsz : (tabOfEntries ids (ids.map rowE)).caps.size ≤ i := by simp [tabOfEntries]; omega
    rw [rowT_zero_of _ hW i hsz]
    unfold capOf; rw [getD_ge _ _ _ hsz]
    intro A _; simp [inMask]

/-! ## The interface lists -/

section
variable {NR DR : Type}

mutual
theorem extL_mem : ∀ (t : STree NR DR) (P : ℕ) (e : ℕ × ℕ), e ∈ extL P t ↔ e ∈ tExt P t
  | .node lab _ kids _, P, e => by simp only [extL, tExt]; exact extK_mem kids _ e
  | .dead _ _, P, e => by simp [extL, tExt]
  | .ext lab, P, e => by simp [extL, tExt]
theorem extK_mem : ∀ (ks : SKids NR DR) (P : ℕ) (e : ℕ × ℕ), e ∈ extK P ks ↔ e ∈ kExt P ks
  | .nil, P, e => by simp [extK, kExt]
  | .cons t ts, P, e => by
    simp only [extK, kExt, List.mem_append, Set.mem_union]
    rw [extL_mem t P e, extK_mem ts P e]
end

mutual
theorem rngL_mem : ∀ (t : STree NR DR) (P : ℕ) (p : (ℕ × ℕ) × ℕ), p ∈ rngL P t ↔ p ∈ tRng P t
  | .node lab _ kids rng, P, p => by
    simp only [rngL, tRng, List.mem_append, Set.mem_union]
    rw [rngK_mem kids _ p]
    cases rng with
    | none => simp
    | some l => simp [or_comm]
  | .dead _ _, P, p => by simp [rngL, tRng]
  | .ext lab, P, p => by simp [rngL, tRng]
theorem rngK_mem : ∀ (ks : SKids NR DR) (P : ℕ) (p : (ℕ × ℕ) × ℕ), p ∈ rngK P ks ↔ p ∈ kRng P ks
  | .nil, P, p => by simp [rngK, kRng]
  | .cons t ts, P, p => by
    simp only [rngK, kRng, List.mem_append, Set.mem_union]
    rw [rngL_mem t P p, rngK_mem ts P p]
end

theorem keyOK_spec (key P lo : ℕ) (t : STree NR DR) (h : keyOK key P lo t = true) :
    (R22N.SegI.ofKey key).root = (P ||| 2 ^ t.lab, t.lab) ∧ (R22N.SegI.ofKey key).lo = lo ∧
      (R22N.SegI.ofKey key).ext = extL P t ∧ (R22N.SegI.ofKey key).rng = rngL P t := by
  unfold keyOK at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  exact ⟨h.1.1.1, h.1.1.2, h.1.2, h.2⟩

end

/-! ## The item -/

/-- the static facts an item check relies on (`O`, `Ω` the frames' order and universe) -/
structure StatFacts (O : LabelOrder) (Ω : R3RT.Spec.Dec22 → Prop) (S : IStat) (rowE : ℕ → ℕ) (c : Cfg) : Prop where
  c1 : Conf1OK O Ω (natL S.st.conf1 0 4096)
  c2 : ∀ l, l < 511 → C2OK O Ω l (c2tV S.st l)
  h : ∀ l, l < 511 → HOK O l (hV S.st l)
  ks : KStatOK O S.ks
  gl : ∀ P, P < 512 → S.ks.gl.get! P = 1 → C3.isGL P = true
  key : ∀ l, l < 511 → O.key (O.vec l) = l + 1
  r1 : ∀ l, l < 511 → (O.rk l = 1 ↔ c.r1lo ≤ l ∧ l < c.r1hi)
  r1hi : c.r1hi ≤ 511
  ty : c.ty = true → (∀ l, l < 511 → O.rk l = rk123 l) ∧ KD.TypeFacts
  row : ∀ i, RowOK O Ω (rowE i % 2 ^ 511) ((rowE i >>> 511) % 512)

/-- **an accepted item is a certified segment with its key's interface** -/
theorem itemR3_sound {C : R3RT.Spec.Dec22 → Prop} (S : IStat) (rowE : ℕ → ℕ) (scan : Array UInt64 → Array ℕ) (c : Cfg)
    (dead : DeadChk) (key : ℕ) (b : ByteArray) (H : Prop)
    (hstat : H → StatFacts O Ω S rowE c)
    (hXT : H → ∀ (tab : Tab) (out : StepOut) (lab : ℕ) (xpn : ByteArray) (xs : Array (ℕ × ℕ × ℕ × ByteArray))
      (pos : Array ℕ),
      XT.checkR3 out.fr.S out.fr.D out.fr.N out.fr.U out.fr.d lab out.b1 out.m out.e1 (mkDict tab out.ids) S.c2W S.npW xpn xs
        pos = true →
      FrameOK O Ω (natL out.fr.S 0 8) (natL out.fr.D 0 8) (natL out.fr.N 0 4096) (natU out.fr.U) out.fr.d →
      natL out.fr.S 0 8 >>> lab = 1 →
      DictSemXO O Ω (natL out.fr.S 0 8) lab (dictRowV tab out.ids) (KD.rposB out.b1 out.m out.e1) →
      (∀ p, dictRowV tab out.ids p < 2 ^ 511) →
      ∀ u ∈ (xs.map (·.1)).toList, ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Continues O A (natL out.fr.S 0 8) lab u)
    (hdead : H → ∀ ids lm (tab : Tab), TabOK O Ω (tabV tab) → TabWF tab → DeadSound O C (FInv0 O Ω S.st) (dead ids lm tab))
    (hCΩ : ∀ A, C A → Ω A) (hCK : ∀ A, C A → CaseK c.lo c.hi A)
    (h : itemR3 S rowE scan c dead key b = true) :
    ∃ g : Seg, g.root = (R22N.SegI.ofKey key).root ∧ g.lo = (R22N.SegI.ofKey key).lo ∧
      g.ext = {e | e ∈ (R22N.SegI.ofKey key).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey key).rng} ∧ (H → SegOKO O C g) := by
  unfold itemR3 at h
  rcases hs : segParse b with _ | s
  · rw [hs] at h; exact absurd h (by simp)
  rw [hs] at h
  simp only [] at h
  rcases ht : (if s.kind == 3 then R3.decodeRange {} s.bytes s.pre.size s.pre.back! s.p else R3.decode {} s.bytes)
    with _ | t
  · rw [ht] at h; exact absurd h (by simp)
  rw [ht] at h
  simp only [] at h
  generalize (if s.kind == 0 && decide (s.pre.size ≥ 2) && t.isDead then scan (setBits #[0, 0, 0, 0, 0, 0, 0, 0] s.pre.pop.toList)
    else #[]) = extra at h
  generalize hids : sortDedup (citedT t #[] ++ s.wit ++ extra) = ids at h
  generalize hlb : (R22N.SegI.ofKey key).lo = lb at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨hinv, _⟩, hroot⟩, _⟩, hidsOK⟩, hcapsOK⟩, h⟩ := h
  split at h
  · exact absurd h (by simp)
  rename_i fr hfr0
  simp only [Bool.and_eq_true] at h
  obtain ⟨hkey, hchk⟩ := h
  obtain ⟨hkr, hkl, hke, hkrn⟩ := keyOK_spec key (natL fr.S 0 8) lb t hkey
  refine ⟨segOf (natL fr.S 0 8) lb t, hkr.symm, hkl.symm ▸ hlb.symm ▸ rfl, ?_, ?_, fun hH => ?_⟩
  · rw [hke]; ext e; exact (extL_mem t _ e).symm
  · rw [hkrn]; ext p; exact (rngL_mem t _ p).symm
  · obtain hst := hstat hH
    have hW := tabWF_entries ids (ids.map rowE) (by simp) hidsOK hcapsOK
    have hT := tabOK_entries rowE ids hst.row hW
    have hI : FInv0 O Ω S.st fr := by
      split at hfr0
      · exact Or.inr (rootFrame0_spec S.st s.D fr hfr0)
      · exact Or.inl (rootFrameN_ok S.st _ hT hW hst.c1 hst.c2 hst.h s.pre.pop _ _ fr hfr0).1
    exact chkItem_sound (nodeFn_sound S c ids (locMap ids) _ hT hW hst.c1 hst.c2 hst.h hst.ks hst.gl hinv hst.key hst.r1
      hst.r1hi hst.ty (hXT hH _) hCΩ hCK) (hdead hH ids (locMap ids) _ hT hW) fr lb t hI hroot hchk

end NNP
