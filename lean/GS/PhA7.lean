module
public import R22Port.U_d41d8cd98f00
public import GS.PhA6
/-! # Track A, part 7: rank 3 (`cents3`, `us3`, `checkA3a`)

* `grpV_cover`/`recV_cover`: every vertex `(V, B)` of the validity masks is one of the listed pairs;
* `term3_eq`: `term3` is the packed rank-3 term of its fields;
* `checkA3a_facts`: the rank-3 vertices `v ∈ [v0, v1)` are packed rank-3 terms of first factor `a` (fields below `2^29`),
  the V3 field lists agree with them, and every valid rank-3 state of first factor `a` compatible with the anchor is one
  of them. -/
@[expose] public section
namespace GS
open G G.A2 G.LS G.Acc G.V2 Finset

theorem grpV_cover (V : ℕ) : ∀ (ps : List ℕ) (M Bm off acc : ℕ) (ps' : List ℕ) (acc' : ℕ),
    grpV V ps M Bm off acc = some (ps', acc') →
    ∀ B, M.testBit (32 * B) = true → ∃ p ∈ ps, Nat.land p 255 = V ∧ Nat.shiftRight p 8 = B
  | [], M, Bm, off, acc, ps', acc', h, B, hB => by
    have h' : cond (Nat.beq M 0) (some ([], acc)) none = some (ps', acc') := h
    cases hM : Nat.beq M 0
    · rw [hM] at h'; simp at h'
    · have : M = 0 := Nat.eq_of_beq_eq_true hM
      subst this; simp at hB
  | p :: ps, M, Bm, off, acc, ps', acc', h, B, hB => by
    have h' : cond (Nat.beq (Nat.land p 255) V)
      (cond (Nat.beq (bit M (Nat.mul 32 (Nat.shiftRight p 8))) 1)
         (grpV V ps (Nat.xor M (Nat.shiftLeft 1 (Nat.mul 32 (Nat.shiftRight p 8)))) Bm off
           (Nat.lor acc (Nat.shiftLeft 1 (Nat.add off (pc32 (Nat.land Bm (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 (Nat.shiftRight p 8))) 1)))))))
         none)
      (cond (Nat.beq M 0) (some (p :: ps, acc)) none) = some (ps', acc') := h
    cases hv : Nat.beq (Nat.land p 255) V
    · rw [hv] at h'; simp only [cond_false] at h'
      cases hM : Nat.beq M 0
      · rw [hM] at h'; simp at h'
      · have : M = 0 := Nat.eq_of_beq_eq_true hM
        subst this; simp at hB
    · rw [hv] at h'; simp only [cond_true] at h'
      cases hb : Nat.beq (bit M (Nat.mul 32 (Nat.shiftRight p 8))) 1
      · rw [hb] at h'; simp at h'
      · rw [hb] at h'; simp only [cond_true] at h'
        by_cases hBB : Nat.shiftRight p 8 = B
        · exact ⟨p, List.mem_cons_self, Nat.eq_of_beq_eq_true hv, hBB⟩
        · have hB' : (Nat.xor M (Nat.shiftLeft 1 (Nat.mul 32 (Nat.shiftRight p 8)))).testBit (32 * B) = true := by
            rw [testBit_xor_shl]
            have hne : ¬ (B = p >>> 8) := fun e => hBB (by rw [e]; rfl)
            simp [hB, hne]
          obtain ⟨p', hp', h1, h2⟩ := grpV_cover V ps _ Bm off _ ps' acc' h' B hB'
          exact ⟨p', List.mem_cons_of_mem _ hp', h1, h2⟩

theorem recV_cover (d U r : ℕ) (parts : List ℕ) : ∀ (BmL offL : List ℕ) (V : ℕ) (ps : List ℕ) (acc vloc : ℕ),
    recV d U r parts BmL offL V ps acc = some vloc →
    ∀ i < BmL.length, ∀ B, (validB d U (V + i) r parts (Nat.mul r r) (BmL.getD i 0)).testBit (32 * B) = true →
      ∃ p ∈ ps, Nat.land p 255 = V + i ∧ Nat.shiftRight p 8 = B
  | [], [], V, ps, acc, vloc, h => by simp
  | Bm :: BmL, off :: offL, V, ps, acc, vloc, h => by
    have h' : (match grpV V ps (validB d U V r parts (Nat.mul r r) Bm) Bm off acc with
      | none => none
      | some (ps', acc') => recV d U r parts BmL offL (Nat.succ V) ps' acc') = some vloc := h
    cases hg : grpV V ps (validB d U V r parts (Nat.mul r r) Bm) Bm off acc with
    | none => rw [hg] at h'; simp at h'
    | some pa =>
      obtain ⟨ps', acc'⟩ := pa
      rw [hg] at h'; simp only at h'
      obtain ⟨⟨blk, hps, _⟩, _, _, _⟩ := grpV_spec V ps _ Bm off acc ps' acc' hg
      intro i hi B hB
      rcases i with _ | i
      · simp only [List.getD_cons_zero, Nat.add_zero] at hB ⊢
        exact grpV_cover V ps _ Bm off acc ps' acc' hg B hB
      · simp only [List.getD_cons_succ] at hB
        obtain ⟨p, hp, h1, h2⟩ := recV_cover d U r parts BmL offL (Nat.succ V) ps' acc' vloc h' i
          (by simp at hi; omega) B (by rw [show Nat.succ V + i = V + (i + 1) by omega]; exact hB)
        refine ⟨p, ?_, by rw [h1]; omega, h2⟩
        rw [hps]; exact List.mem_append_right _ hp
  | [], _ :: _, _, _, _, _, h => by simp [recV] at h
  | _ :: _, [], _, _, _, _, h => by simp [recV] at h

theorem term3_eq (d a B C U V : ℕ) : term3 d a B C U V = pkOf 3 (yuF d a C U) (xvF d a B V) a := by
  unfold term3 pkOf
  simp only [show List.range 3 = [0, 1, 2] from rfl, List.foldl_cons, List.foldl_nil, Nat.mul_zero, Nat.add_zero,
    Nat.shiftLeft_zero, Nat.zero_or, Nat.mul_one]
  show yuF d a C U 0 ||| ((yuF d a C U 1 <<< 32) ||| ((yuF d a C U 2 <<< 64) ||| ((xvF d a B V 0 <<< 96) |||
      ((xvF d a B V 1 <<< 128) ||| ((xvF d a B V 2 <<< 160) ||| ((3 <<< 192) ||| (a <<< 196))))))) = _
  simp only [Nat.or_assoc, Nat.or_left_comm]

/-- `push3` prepends the terms of the pairs, reversed -/
theorem push3_eq (d a C U : ℕ) : ∀ (ps vs : List ℕ),
    cents3.push3 d a C U ps vs = (ps.map fun p => term3 d a (Nat.shiftRight p 8) C U (Nat.land p 255)).reverse ++ vs
  | [], vs => rfl
  | p :: ps, vs => by
    show cents3.push3 d a C U ps (term3 d a (Nat.shiftRight p 8) C U (Nat.land p 255) :: vs) = _
    rw [push3_eq d a C U ps]; simp

theorem cents3_spec (d a U : ℕ) (BmL offL : List ℕ) : ∀ (ces : List CEnt) (Cm : ℕ) (vs vs' : List ℕ),
    cents3 d a U BmL offL ces Cm vs = some vs' →
    (∃ new, vs' = new ++ vs ∧ ∀ x ∈ new, ∃ C ps vloc p, C < 512 ∧
      recV d U 3 (diagParts a C 3 9) BmL offL 0 ps 0 = some vloc ∧ p ∈ ps ∧
      x = term3 d a (Nat.shiftRight p 8) C U (Nat.land p 255)) ∧
    (∀ C, C < 512 → Cm.testBit (32 * C) = true → ∃ ps vloc, recV d U 3 (diagParts a C 3 9) BmL offL 0 ps 0 = some vloc ∧
      ∀ p ∈ ps, term3 d a (Nat.shiftRight p 8) C U (Nat.land p 255) ∈ vs')
  | [], Cm, vs, vs', h => by
    have h' : cond (Nat.beq Cm 0) (some vs) none = some vs' := h
    cases hC : Nat.beq Cm 0
    · rw [hC] at h'; simp at h'
    · rw [hC] at h'; simp only [cond_true, Option.some.injEq] at h'
      subst h'
      have : Cm = 0 := Nat.eq_of_beq_eq_true hC
      subst this
      exact ⟨⟨[], by simp, by simp⟩, by simp⟩
  | (ce, ps) :: rest, Cm, vs, vs', h => by
    have h' : cond (Nat.beq (bit Cm (Nat.mul 32 (Nat.land ce 511))) 1)
      (match recV d U 3 (diagParts a (Nat.land ce 511) 3 9) BmL offL 0 ps 0 with
       | none => none
       | some _ => cents3 d a U BmL offL rest (Nat.xor Cm (Nat.shiftLeft 1 (Nat.mul 32 (Nat.land ce 511))))
           (cents3.push3 d a (Nat.land ce 511) U ps vs))
      none = some vs' := h
    set C0 := Nat.land ce 511 with hC0
    have hC0lt : C0 < 512 := by rw [hC0]; exact lt_of_le_of_lt Nat.and_le_right (by norm_num)
    cases hb : Nat.beq (bit Cm (Nat.mul 32 C0)) 1
    · rw [hb] at h'; simp at h'
    · rw [hb] at h'; simp only [cond_true] at h'
      cases hr : recV d U 3 (diagParts a C0 3 9) BmL offL 0 ps 0 with
      | none => rw [hr] at h'; simp at h'
      | some vloc =>
        rw [hr] at h'; simp only at h'
        obtain ⟨⟨new, hnew, hnewf⟩, hall⟩ := cents3_spec d a U BmL offL rest _ _ vs' h'
        rw [push3_eq] at hnew
        refine ⟨⟨new ++ (ps.map fun p => term3 d a (Nat.shiftRight p 8) C0 U (Nat.land p 255)).reverse,
          by rw [hnew]; simp, ?_⟩, ?_⟩
        · intro x hx
          rcases List.mem_append.mp hx with h1 | h1
          · exact hnewf x h1
          · rw [List.mem_reverse, List.mem_map] at h1
            obtain ⟨p, hp, rfl⟩ := h1
            exact ⟨C0, ps, vloc, p, hC0lt, hr, hp, rfl⟩
        · intro C hC hCb
          by_cases hCC : C = C0
          · subst hCC
            refine ⟨ps, vloc, hr, fun p hp => ?_⟩
            rw [hnew]; apply List.mem_append_right; apply List.mem_append_left
            rw [List.mem_reverse, List.mem_map]; exact ⟨p, hp, rfl⟩
          · apply hall C hC
            rw [testBit_xor_shl]
            have : 32 * C ≠ 32 * C0 := by omega
            simp [hCb, this]

theorem us3_spec (t0 d a : ℕ) (BmL offL : List ℕ) : ∀ (U : ℕ) (css : List (List CEnt)) (vs vs' : List ℕ),
    us3 t0 d a BmL offL U css vs = some vs' →
    (∃ new, vs' = new ++ vs ∧ ∀ x ∈ new, ∃ U' C ps vloc p, C < 512 ∧
      recV d U' 3 (diagParts a C 3 9) BmL offL 0 ps 0 = some vloc ∧ p ∈ ps ∧
      x = term3 d a (Nat.shiftRight p 8) C U' (Nat.land p 255)) ∧
    (∀ i < css.length, ∀ C, C < 512 → (cmaskF t0 d a (U + i) 3).testBit (32 * C) = true →
      ∃ ps vloc, recV d (U + i) 3 (diagParts a C 3 9) BmL offL 0 ps 0 = some vloc ∧
        ∀ p ∈ ps, term3 d a (Nat.shiftRight p 8) C (U + i) (Nat.land p 255) ∈ vs')
  | U, [], vs, vs', h => by
    have : vs = vs' := by simpa [us3] using h
    subst this
    exact ⟨⟨[], by simp, by simp⟩, by simp⟩
  | U, cs :: css, vs, vs', h => by
    have h' : (match cents3 d a U BmL offL cs (cmaskF t0 d a U 3) vs with
      | none => none
      | some vs1 => us3 t0 d a BmL offL (Nat.succ U) css vs1) = some vs' := h
    cases hc : cents3 d a U BmL offL cs (cmaskF t0 d a U 3) vs with
    | none => rw [hc] at h'; simp at h'
    | some vs1 =>
      rw [hc] at h'; simp only at h'
      obtain ⟨⟨new1, hnew1, hf1⟩, hall1⟩ := cents3_spec d a U BmL offL cs _ vs vs1 hc
      obtain ⟨⟨new2, hnew2, hf2⟩, hall2⟩ := us3_spec t0 d a BmL offL (Nat.succ U) css vs1 vs' h'
      have hsh : ∀ i, Nat.succ U + i = U + (i + 1) := fun i => by omega
      refine ⟨⟨new2 ++ new1, by rw [hnew2, hnew1, List.append_assoc], ?_⟩, ?_⟩
      · intro x hx
        rcases List.mem_append.mp hx with h1 | h1
        · exact hf2 x h1
        · obtain ⟨C, ps, vloc, p, hC, hr, hp, rfl⟩ := hf1 x h1
          exact ⟨U, C, ps, vloc, p, hC, hr, hp, rfl⟩
      · intro i hi C hC hCb
        rcases i with _ | i
        · obtain ⟨ps, vloc, hr, hin⟩ := hall1 C hC (by simpa using hCb)
          refine ⟨ps, vloc, by simpa using hr, fun p hp => ?_⟩
          rw [hnew2]; exact List.mem_append_right _ (by simpa using hin p hp)
        · obtain ⟨ps, vloc, hr, hin⟩ := hall2 i (by simp at hi; omega) C hC (by rw [hsh]; exact hCb)
          rw [hsh] at hr hin
          exact ⟨ps, vloc, hr, hin⟩

/-- the unpacked `checkA3a` -/
theorem checkA3a_unpack {t0 d : ℕ} {o : Orb2} {a v0 v1 : ℕ} {css : List (List CEnt)}
    (h : checkA3a t0 d o a v0 v1 css = true) :
    css.length = 2 ^ (3 * d) ∧ ∃ vsR, us3 t0 d a (bmL t0 d a 3 (2 ^ (3 * d)) 0) (offsL (bmL t0 d a 3 (2 ^ (3 * d)) 0) 0)
      0 css [] = some vsR ∧ v0 + vsR.reverse.length = v1 ∧ cmpV3 o v0 vsR.reverse = true := by
  have e : Nat.shiftLeft 1 (Nat.mul 3 d) = 2 ^ (3 * d) := shiftLeft_one _
  unfold checkA3a at h
  rw [e] at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨h1, h2⟩ := h
  refine ⟨Nat.eq_of_beq_eq_true h1, ?_⟩
  revert h2
  cases hu : us3 t0 d a (bmL t0 d a 3 (2 ^ (3 * d)) 0) (offsL (bmL t0 d a 3 (2 ^ (3 * d)) 0) 0) 0 css [] with
  | none => simp
  | some vsR =>
    intro h2
    simp only [Bool.and_eq_true] at h2
    exact ⟨vsR, rfl, Nat.eq_of_beq_eq_true h2.1, h2.2⟩

/-- the facts of one rank-3 first factor -/
theorem checkA3a_facts {d : ℕ} {T0 : State} (hA : Anchor d T0) {o : Orb2} {a v0 v1 : ℕ} {css : List (List CEnt)}
    (hck : checkA3a (pkState d T0) d o a v0 v1 css = true) (ha : a < 512) :
    v0 ≤ v1 ∧
    (∀ v, v0 ≤ v → v < v1 →
      get32 o.V3Y0 v = fYU (v3term o v) 0 ∧ get32 o.V3Y1 v = fYU (v3term o v) 1 ∧ get32 o.V3Y2 v = fYU (v3term o v) 2 ∧
      get32 o.V3X0 v = fXV (v3term o v) 0 ∧ get32 o.V3X1 v = fXV (v3term o v) 1 ∧ get32 o.V3X2 v = fXV (v3term o v) 2 ∧
      get32 o.V3A v = fA (v3term o v) ∧ fR (v3term o v) = 3 ∧
      (∀ q < 3, fYU (v3term o v) q < 2 ^ 29 ∧ fXV (v3term o v) q < 2 ^ 29) ∧ fA (v3term o v) < 512) ∧
    (∀ s : State, Valid d s → Compat d T0 s → s.a = a → rk s.a = 3 →
      ∃ v, v0 ≤ v ∧ v < v1 ∧ v3term o v = pkState d s) := by
  obtain ⟨hcss, vsR, hus, hv1, hcmp⟩ := checkA3a_unpack hck
  set nU := 2 ^ (3 * d) with hnU
  set BmL := bmL (pkState d T0) d a 3 nU 0 with hBmL
  have hBmLlen : BmL.length = nU := bmL_length _ _ _ _ _ _
  have hm : ∀ i < BmL.length, MOK (BmL.getD i 0) := bmL_mok _ _ _ _ _
  obtain ⟨⟨new, hnew, hnewf⟩, hall⟩ := us3_spec _ d a BmL (offsL BmL 0) 0 css [] vsR hus
  rw [List.append_nil] at hnew
  -- every listed term is a packed rank-3 term of first factor `a`
  have hterm : ∀ x ∈ vsR, ∃ B C U V, B < 512 ∧ C < 512 ∧ x = term3 d a B C U V := by
    intro x hx
    rw [hnew] at hx
    obtain ⟨U', C, ps, vloc, p, hC, hr, hp, rfl⟩ := hnewf x hx
    obtain ⟨_, _, _, _, hps⟩ := recV_spec d U' 3 (diagParts a C 3 9) BmL (offsL BmL 0) 0 ps 0 vloc hr
    obtain ⟨i, hi, _, hB⟩ := hps p hp
    have hB' := validB_sub _ _ _ _ _ _ _ _ hB
    have := (hm i hi _ hB').2
    exact ⟨Nat.shiftRight p 8, C, U', Nat.land p 255, by omega, hC, rfl⟩
  have hpk : ∀ B C U V, B < 512 → C < 512 → PkOK 3 (yuF d a C U) (xvF d a B V) a := by
    intro B C U V hB hC
    exact ⟨le_rfl, fun q _ => yuF_lt d a C U q hA.hd hC (Rc_lt _ _), fun q _ => xvF_lt d a B V q hA.hd hB (Lc_lt _ _), ha⟩
  refine ⟨by omega, ?_, ?_⟩
  · intro v h1 h2
    have hi : v - v0 < vsR.reverse.length := by omega
    obtain ⟨hT, hY0, hY1, hY2, hX0, hX1, hX2, hAA⟩ := cmpV3_spec o v0 vsR.reverse hcmp (v - v0) hi
    rw [show v0 + (v - v0) = v by omega] at hT hY0 hY1 hY2 hX0 hX1 hX2 hAA
    rw [← hT] at hY0 hY1 hY2 hX0 hX1 hX2 hAA
    refine ⟨hY0, hY1, hY2, hX0, hX1, hX2, hAA, ?_⟩
    have hmem : vsR.reverse.getD (v - v0) 0 ∈ vsR := List.mem_reverse.mp (getD_mem hi)
    obtain ⟨B, C, U, V, hB, hC, hx⟩ := hterm _ hmem
    rw [hT, hx, term3_eq]
    have hok := hpk B C U V hB hC
    refine ⟨fR_pkOf hok, fun q hq => ⟨?_, ?_⟩, by rw [fA_pkOf hok]; exact ha⟩
    · rw [fYU_pkOf hok hq]; exact hok.yu_lt q hq
    · rw [fXV_pkOf hok hq]; exact hok.xv_lt q hq
  · intro s hv hc hsa hr3
    obtain ⟨_, hsa512, hsB, hsC, hsU, hsV, _⟩ := hv
    have hUlt : s.U < nU := by rw [hr3] at hsU; rw [hnU]; simpa [Nat.mul_comm] using hsU
    have hVlt : s.V < nU := by rw [hr3] at hsV; rw [hnU]; simpa [Nat.mul_comm] using hsV
    have hCm : (cmaskF (pkState d T0) d a (0 + s.U) 3).testBit (32 * s.C) = true := by
      have := cmaskF_of_compat hA hsC hc
      rw [hr3, hsa] at this; simpa using this
    obtain ⟨ps, vloc, hr, hin⟩ := hall s.U (by rw [hcss]; exact hUlt) s.C hsC hCm
    rw [Nat.zero_add] at hr hin
    have hBm : (BmL.getD s.V 0).testBit (32 * s.B) = true := by
      rw [hBmL, bmL_getD _ _ _ _ _ _ _ hVlt, Nat.zero_add]
      have := bmaskF_of_compat hA hsB hc
      rw [hr3, hsa] at this; exact this
    have hval : (validB d s.U (0 + s.V) 3 (diagParts a s.C 3 9) (Nat.mul 3 3) (BmL.getD s.V 0)).testBit (32 * s.B) = true := by
      have := validB_of_valid hA.hd hsB hsC ⟨by omega, hsa512, hsB, hsC, hsU, hsV, by assumption⟩ (BmL.getD s.V 0) hBm
      rw [hr3, hsa] at this
      simpa using this
    obtain ⟨p, hp, hpV, hpB⟩ := recV_cover d s.U 3 (diagParts a s.C 3 9) BmL (offsL BmL 0) 0 ps 0 vloc hr s.V
      (by rw [hBmLlen]; exact hVlt) s.B hval
    have hmemR := hin p hp
    rw [hpB, hpV, Nat.zero_add] at hmemR
    obtain ⟨i, hi, hget⟩ : ∃ i < vsR.reverse.length, vsR.reverse.getD i 0 = term3 d a s.B s.C s.U s.V := by
      obtain ⟨i, hi, hgi⟩ := List.getElem_of_mem (List.mem_reverse.mpr hmemR)
      exact ⟨i, hi, by rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi]; simpa using hgi⟩
    obtain ⟨hT, _⟩ := cmpV3_spec o v0 vsR.reverse hcmp i hi
    refine ⟨v0 + i, by omega, by omega, ?_⟩
    rw [hT, hget, term3_eq, pkState_eq, hr3, hsa]
    apply pkOf_congr
    intro q _
    exact ⟨by rw [← hsa]; exact yuF_state d s q hsC, by rw [← hsa]; exact xvF_state d s q hsB⟩

end GS

#print axioms GS.checkA3a_facts
