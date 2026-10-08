module
public import R22Port.U_d41d8cd98f00
public import GS.PhB1
/-! # Track V, part 2: phase B completeness

`phaseB o okc okb 0 o.CH chs p0 = some p` collects as members (packs `p`, member list `M`, `PRep`) every vertex `(c, j)`
whose record has its bit in `okc` and whose B-part has its bit in `okb` (`phaseB_member`); a member's packed term is the
vertex's (`memTerm_of_mem`). -/
@[expose] public section
namespace GS.V
open G G.V2 G.D2 G.A2 G.Acc Finset

/-! ## member packs -/

def mY0 (o : Orb2) (M : List (ℕ × ℕ)) (k : ℕ) : ℕ := rYU0 (recG o (M.getD k (0, 0)).1)
def mY1 (o : Orb2) (M : List (ℕ × ℕ)) (k : ℕ) : ℕ := rYU1 (recG o (M.getD k (0, 0)).1)
def mX0 (o : Orb2) (M : List (ℕ × ℕ)) (k : ℕ) : ℕ :=
  get32 o.PB2X0 (rBstart (recG o (M.getD k (0, 0)).1) + (M.getD k (0, 0)).2)
def mX1 (o : Orb2) (M : List (ℕ × ℕ)) (k : ℕ) : ℕ :=
  get32 o.PB2X1 (rBstart (recG o (M.getD k (0, 0)).1) + (M.getD k (0, 0)).2)
def mA (o : Orb2) (M : List (ℕ × ℕ)) (k : ℕ) : ℕ := rA (recG o (M.getD k (0, 0)).1)

/-- the member packs `p` hold the fields of the member list `M` -/
structure PRep (o : Orb2) (M : List (ℕ × ℕ)) (p : Packs) : Prop where
  m : p.m = M.length
  Y0 : p.Y0 = pk32 (mY0 o M) M.length
  Y1 : p.Y1 = pk32 (mY1 o M) M.length
  X0 : p.X0 = pk32 (mX0 o M) M.length
  X1 : p.X1 = pk32 (mX1 o M) M.length
  A : p.A = pk32 (mA o M) M.length

theorem land_lt (x n : ℕ) : Nat.land x (2 ^ n - 1) < 2 ^ n := by
  rw [land_mask]; exact Nat.mod_lt _ (by positivity)

theorem rYU0_lt (r : ℕ) : rYU0 r < 2 ^ 32 := by
  unfold rYU0; rw [show (4294967295 : ℕ) = 2 ^ 32 - 1 by norm_num]; exact land_lt _ _
theorem rYU1_lt (r : ℕ) : rYU1 r < 2 ^ 32 := by
  unfold rYU1; rw [show (4294967295 : ℕ) = 2 ^ 32 - 1 by norm_num]; exact land_lt _ _
theorem rA_lt (r : ℕ) : rA r < 2 ^ 32 := by
  unfold rA
  have : Nat.land (Nat.shiftRight r 48) (2 ^ 16 - 1) < 2 ^ 16 := land_lt _ _
  exact lt_of_lt_of_le this (by norm_num)
theorem get32_lt (P k : ℕ) : get32 P k < 2 ^ 32 := by
  rw [get32_eq]; exact Nat.mod_lt _ (by positivity)

theorem PRep_nil (o : Orb2) : PRep o [] p0 := ⟨rfl, by simp [p0, pk32], by simp [p0, pk32], by simp [p0, pk32],
  by simp [p0, pk32], by simp [p0, pk32]⟩

theorem pk32_lt' (f : ℕ → ℕ) (n : ℕ) (hf : ∀ k, f k < 2 ^ 32) : pk32 f n < 2 ^ (32 * n) :=
  pk32_lt f n (fun k _ => hf k)

/-- appending one field to a pack -/
theorem pk32_snoc (f g : ℕ → ℕ) (n : ℕ) (hfg : ∀ k < n, g k = f k) :
    pk32 g (n + 1) = pk32 f n + g n * 2 ^ (32 * n) := by
  rw [pk32_succ]; congr 1
  unfold pk32; apply Finset.sum_congr rfl; intro k hk; rw [hfg k (Finset.mem_range.mp hk)]

theorem lor_shl_pk (f g : ℕ → ℕ) (n v : ℕ) (hf : ∀ k, f k < 2 ^ 32) (hfg : ∀ k < n, g k = f k) (hv : g n = v) :
    Nat.lor (pk32 f n) (Nat.shiftLeft v (Nat.mul 32 n)) = pk32 g (n + 1) := by
  rw [shl_eq, show Nat.mul 32 n = 32 * n from rfl, lor_mul_two_pow _ _ _ (pk32_lt' f n hf), pk32_snoc f g n hfg, hv]

theorem getD_snoc_lt (M : List (ℕ × ℕ)) (v : ℕ × ℕ) (k : ℕ) (hk : k < M.length) :
    (M ++ [v]).getD k (0, 0) = M.getD k (0, 0) := by
  rw [List.getD_eq_getElem?_getD, List.getD_eq_getElem?_getD, List.getElem?_append_left hk]

theorem getD_snoc_eq (M : List (ℕ × ℕ)) (v : ℕ × ℕ) : (M ++ [v]).getD M.length (0, 0) = v := by
  rw [List.getD_eq_getElem?_getD, List.getElem?_append_right (le_refl _)]; simp

theorem PRep_snoc {o : Orb2} {M : List (ℕ × ℕ)} {p : Packs} (h : PRep o M p) (c j : ℕ) :
    PRep o (M ++ [(c, j)]) ⟨Nat.lor p.Y0 (Nat.shiftLeft (rYU0 (recG o c)) (Nat.mul 32 p.m)),
      Nat.lor p.Y1 (Nat.shiftLeft (rYU1 (recG o c)) (Nat.mul 32 p.m)),
      Nat.lor p.X0 (Nat.shiftLeft (get32 o.PB2X0 (Nat.add (rBstart (recG o c)) j)) (Nat.mul 32 p.m)),
      Nat.lor p.X1 (Nat.shiftLeft (get32 o.PB2X1 (Nat.add (rBstart (recG o c)) j)) (Nat.mul 32 p.m)),
      Nat.lor p.A (Nat.shiftLeft (rA (recG o c)) (Nat.mul 32 p.m)), Nat.succ p.m⟩ := by
  have hl : (M ++ [(c, j)]).length = M.length + 1 := by simp
  refine ⟨by simp [h.m], ?_, ?_, ?_, ?_, ?_⟩ <;> simp only [hl] <;> rw [h.m]
  · rw [h.Y0]
    exact lor_shl_pk _ _ _ _ (fun k => rYU0_lt _)
      (fun k hk => by unfold mY0; rw [getD_snoc_lt M _ k hk]) (by unfold mY0; rw [getD_snoc_eq])
  · rw [h.Y1]
    exact lor_shl_pk _ _ _ _ (fun k => rYU1_lt _)
      (fun k hk => by unfold mY1; rw [getD_snoc_lt M _ k hk]) (by unfold mY1; rw [getD_snoc_eq])
  · rw [h.X0]
    exact lor_shl_pk _ _ _ _ (fun k => get32_lt _ _)
      (fun k hk => by unfold mX0; rw [getD_snoc_lt M _ k hk]) (by unfold mX0; rw [getD_snoc_eq]; rfl)
  · rw [h.X1]
    exact lor_shl_pk _ _ _ _ (fun k => get32_lt _ _)
      (fun k hk => by unfold mX1; rw [getD_snoc_lt M _ k hk]) (by unfold mX1; rw [getD_snoc_eq]; rfl)
  · rw [h.A]
    exact lor_shl_pk _ _ _ _ (fun k => rA_lt _)
      (fun k hk => by unfold mA; rw [getD_snoc_lt M _ k hk]) (by unfold mA; rw [getD_snoc_eq])

theorem addMembers_spec (o : Orb2) (c : ℕ) : ∀ (js : List ℕ) (M : List (ℕ × ℕ)) (p : Packs), PRep o M p →
    PRep o (M ++ js.map (fun j => (c, j))) (addMembers o (recG o c) js p)
  | [], M, p, h => by simpa using h
  | j :: js, M, p, h => by
    have h1 := PRep_snoc h c j
    have h2 := addMembers_spec o c js _ _ h1
    simpa [List.append_assoc] using h2

/-! ## one chunk -/

theorem inChunk_spec (o : Orb2) (okb ch ci : ℕ) (hch : ∀ off < 256, recOf ch off = recG o (256 * ci + off)) :
    ∀ (L : List (ℕ × List ℕ)) (w : ℕ) (p p' : Packs) (M : List (ℕ × ℕ)), w < 2 ^ 256 →
    inChunk o okb ch L w p = some p' → PRep o M p →
    ∃ M', PRep o M' p' ∧ (∀ v ∈ M, v ∈ M') ∧ ∀ off, w.testBit off = true → ∀ j,
      (Nat.land (rLoc (recOf ch off)) (win okb (rBstart (recOf ch off)) (rWidth (recOf ch off)))).testBit j = true →
      (256 * ci + off, j) ∈ M'
  | [], w, p, p', M, _, h, hM => by
    have h' : cond (Nat.beq w 0) (some p) none = some p' := h
    cases hw : Nat.beq w 0
    · rw [hw] at h'; simp at h'
    · rw [hw] at h'; simp only [cond_true, Option.some.injEq] at h'; subst h'
      have : w = 0 := Nat.eq_of_beq_eq_true hw
      subst this
      exact ⟨M, hM, fun v hv => hv, fun off hoff => by simp at hoff⟩
  | (off, js) :: rest, w, p, p', M, hw, h, hM => by
    have h' : cond (Nat.beq (bit w off) 1 && listChk1 js (Nat.land (rLoc (recOf ch off))
        (win okb (rBstart (recOf ch off)) (rWidth (recOf ch off)))))
        (inChunk o okb ch rest (Nat.xor w (Nat.shiftLeft 1 off)) (addMembers o (recOf ch off) js p)) none = some p' := h
    cases hc : (Nat.beq (bit w off) 1 && listChk1 js (Nat.land (rLoc (recOf ch off))
        (win okb (rBstart (recOf ch off)) (rWidth (recOf ch off)))))
    · rw [hc] at h'; simp at h'
    · rw [hc] at h'; simp only [cond_true] at h'
      rw [Bool.and_eq_true] at hc
      have hbit : w.testBit off = true := bit_eq_one.mp hc.1
      have hoff : off < 256 := by
        by_contra hge; push Not at hge
        rw [testBit_false_of_lt hw hge] at hbit; exact absurd hbit (by decide)
      obtain ⟨-, hjs⟩ := listChk1_spec js _ hc.2
      rw [hch off hoff] at h' hjs
      have hM1 := addMembers_spec o (256 * ci + off) js M p hM
      have hw' : Nat.xor w (Nat.shiftLeft 1 off) < 2 ^ 256 := by
        show w ^^^ (Nat.shiftLeft 1 off) < 2 ^ 256
        rw [shiftLeft_one]
        exact Nat.xor_lt_two_pow hw (Nat.pow_lt_pow_right (by norm_num) hoff)
      obtain ⟨M', hM', hsub, hcov⟩ := inChunk_spec o okb ch ci hch rest _ _ p' _ hw' h' hM1
      refine ⟨M', hM', fun v hv => hsub v (List.mem_append_left _ hv), fun off' hb j hj => ?_⟩
      by_cases he : off' = off
      · subst he
        rw [hch off' hoff] at hj
        apply hsub
        apply List.mem_append_right
        exact List.mem_map.mpr ⟨j, (hjs j).mp hj, rfl⟩
      · apply hcov off' _ j hj
        show (w ^^^ Nat.shiftLeft 1 off).testBit off' = true
        rw [shiftLeft_one, testBit_xor_two_pow, hb]; simp [he]

/-! ## the chunk walk -/

theorem phaseB_spec (o : Orb2) (okc okb : ℕ) : ∀ (chs : List ℕ) (ci : ℕ) (ccs : List (List (ℕ × List ℕ))) (p p' : Packs)
    (M : List (ℕ × ℕ)), (∀ i < chs.length, chs.getD i 0 = o.CH.getD (ci + i) 0) →
    phaseB o okc okb ci chs ccs p = some p' → PRep o M p →
    ∃ M', PRep o M' p' ∧ (∀ v ∈ M, v ∈ M') ∧ ∀ c, 256 * ci ≤ c → c < 256 * (ci + chs.length) → okc.testBit c = true →
      ∀ j, (Nat.land (rLoc (recG o c)) (win okb (rBstart (recG o c)) (rWidth (recG o c)))).testBit j = true → (c, j) ∈ M'
  | [], ci, ccs, p, p', M, _, h, hM => by
    cases ccs with
    | nil =>
      have : some p = some p' := h
      cases this
      exact ⟨M, hM, fun v hv => hv, fun c h1 h2 => by simp at h2; omega⟩
    | cons cc ccs' => exact absurd h (by simp [phaseB])
  | ch :: chs', ci, ccs, p, p', M, hchs, h, hM => by
    cases ccs with
    | nil => exact absurd h (by simp [phaseB])
    | cons cc ccs' =>
      have h' : (match inChunk o okb ch cc (win okc (Nat.mul 256 ci) 256) p with
        | none => none
        | some p1 => phaseB o okc okb (Nat.succ ci) chs' ccs' p1) = some p' := h
      cases hi : inChunk o okb ch cc (win okc (Nat.mul 256 ci) 256) p with
      | none => rw [hi] at h'; simp at h'
      | some p1 =>
        rw [hi] at h'
        have hch0 : ch = o.CH.getD ci 0 := by have := hchs 0 (by simp); simpa using this
        have hch : ∀ off < 256, recOf ch off = recG o (256 * ci + off) := by
          intro off hoff
          unfold recG
          rw [show (256 * ci + off) / 256 = ci by omega, show (256 * ci + off) % 256 = off by omega, hch0]
        have hwin : win okc (Nat.mul 256 ci) 256 < 2 ^ 256 := by rw [win_eq]; exact Nat.mod_lt _ (by positivity)
        obtain ⟨M1, hM1, hsub1, hcov1⟩ := inChunk_spec o okb ch ci hch cc _ p p1 M hwin hi hM
        have hchs' : ∀ i < chs'.length, chs'.getD i 0 = o.CH.getD (Nat.succ ci + i) 0 := by
          intro i hi'
          have := hchs (i + 1) (by simp; omega)
          simp only [List.getD_cons_succ] at this
          rw [this]; congr 1; omega
        obtain ⟨M2, hM2, hsub2, hcov2⟩ := phaseB_spec o okc okb chs' (Nat.succ ci) ccs' p1 p' M1 hchs' h' hM1
        refine ⟨M2, hM2, fun v hv => hsub2 v (hsub1 v hv), fun c h1 h2 hc j hj => ?_⟩
        by_cases hlo : c < 256 * (ci + 1)
        · apply hsub2
          have hoff : c - 256 * ci < 256 := by omega
          have hcc : 256 * ci + (c - 256 * ci) = c := by omega
          have := hcov1 (c - 256 * ci) (by
            rw [testBit_win]; simp only [hoff, decide_true, Bool.true_and]
            rw [show Nat.mul 256 ci + (c - 256 * ci) = c by show 256 * ci + (c - 256 * ci) = c; omega]; exact hc) j
          rw [hch _ hoff, hcc] at this
          exact this hj
        · exact hcov2 c (by omega) (by simp at h2 ⊢; omega) hc j hj

/-- **phase B completeness**: every vertex with its record bit in `okc` and its B-part bit in `okb` is a member -/
theorem phaseB_member {o : Orb2} {PY0 PY1 nB2 nRec nV3 : ℕ} {v3 : Bool} (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 v3)
    {okc okb : ℕ} {chs : List (List (ℕ × List ℕ))} {p : Packs} (h : phaseB o okc okb 0 o.CH chs p0 = some p) :
    ∃ M, PRep o M p ∧ ∀ c j, Vert o nRec c j → okc.testBit c = true →
      okb.testBit (rBstart (recG o c) + j) = true → (c, j) ∈ M := by
  obtain ⟨M, hM, -, hcov⟩ := phaseB_spec o okc okb o.CH 0 chs p0 p [] (fun i _ => by simp) h (PRep_nil o)
  refine ⟨M, hM, fun c j hv hc hb => hcov c (by omega) ?_ hc j ?_⟩
  · rw [hF.CH]; have := hv.1; omega
  · have hw := (hF.recs c hv.1).2.2.2.2.2.1
    have hjw : j < rWidth (recG o c) := by
      by_contra hge; push Not at hge
      have := hv.2; rw [testBit_false_of_lt hw hge] at this; exact absurd this (by decide)
    show (rLoc (recG o c) &&& win okb (rBstart (recG o c)) (rWidth (recG o c))).testBit j = true
    rw [Nat.testBit_and, testBit_win, hv.2, hb]; simp [hjw]

/-- a member's packed term is its vertex's -/
theorem memTerm_of_mem {o : Orb2} {M : List (ℕ × ℕ)} {p : Packs} (hM : PRep o M p) {c j : ℕ} (hmem : (c, j) ∈ M) :
    ∃ k < p.m, M.getD k (0, 0) = (c, j) ∧ memTerm p k = vt o c j := by
  obtain ⟨k, hk, he⟩ := List.mem_iff_getElem.mp hmem
  have hg : M.getD k (0, 0) = (c, j) := by rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hk]; simp [he]
  refine ⟨k, by rw [hM.m]; exact hk, hg, ?_⟩
  rw [memTerm_eq, vt, vTerm_eq, hM.Y0, hM.Y1, hM.X0, hM.X1, hM.A, get32_eq, get32_eq, get32_eq, get32_eq, get32_eq,
    fld_pk32 (mY0 o M) _ _ (fun _ _ => rYU0_lt _) hk, fld_pk32 (mY1 o M) _ _ (fun _ _ => rYU1_lt _) hk,
    fld_pk32 (mX0 o M) _ _ (fun _ _ => get32_lt _ _) hk, fld_pk32 (mX1 o M) _ _ (fun _ _ => get32_lt _ _) hk,
    fld_pk32 (mA o M) _ _ (fun _ _ => rA_lt _) hk]
  unfold mY0 mY1 mX0 mX1 mA; rw [hg]

/-- the member fields as fields of the member's term -/
theorem mem_fields {o : Orb2} {M : List (ℕ × ℕ)} {p : Packs} (hM : PRep o M p) (k : ℕ) (hk : k < p.m) :
    fld p.Y0 k = mY0 o M k ∧ fld p.Y1 k = mY1 o M k ∧ fld p.X0 k = mX0 o M k ∧ fld p.X1 k = mX1 o M k ∧
    fld p.A k = mA o M k := by
  rw [hM.m] at hk
  rw [hM.Y0, hM.Y1, hM.X0, hM.X1, hM.A, fld_pk32 (mY0 o M) _ _ (fun _ _ => rYU0_lt _) hk,
    fld_pk32 (mY1 o M) _ _ (fun _ _ => rYU1_lt _) hk,
    fld_pk32 (mX0 o M) _ _ (fun _ _ => get32_lt _ _) hk, fld_pk32 (mX1 o M) _ _ (fun _ _ => get32_lt _ _) hk,
    fld_pk32 (mA o M) _ _ (fun _ _ => rA_lt _) hk]
  exact ⟨rfl, rfl, rfl, rfl, rfl⟩

end GS.V

#print axioms GS.V.phaseB_member
#print axioms GS.V.memTerm_of_mem
