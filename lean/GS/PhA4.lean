module
public import R22Port.U_d41d8cd98f00
public import GS.PhA3
/-! # Track A, part 4: the vertex walks (`grpV`, `recV`) and the rank-2 C-entry walks (`cents2`, `us2`)

* `grpV_spec` / `recV_spec`: the vertex mask `vloc` has bit `off_V + rank of B in Bm_V` for every `B` of the validity mask of
  `V` (and no other bits than these and the initial ones);
* `cents2_spec` / `us2_spec`: every `C` of `cmaskF … U 2` has an entry; when its `vloc` is nonzero the record
  `mkRec bstart width a YU_0 YU_1 vloc` is appended; every appended record is of that form. -/
@[expose] public section
namespace GS
open G G.A2 G.LS G.Acc Finset

/-- the bit position of the vertex `B` in the vertex mask -/
def vpos (Bm off B : ℕ) : ℕ := off + pc32 (Nat.land Bm (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 B)) 1))

theorem testBit_lor_shl1 (acc k q : ℕ) :
    (Nat.lor acc (Nat.shiftLeft 1 k)).testBit q = (acc.testBit q || decide (q = k)) := by
  show (acc ||| (1 <<< k)).testBit q = _
  rw [Nat.testBit_or, Nat.shiftLeft_eq, Nat.one_mul, Nat.testBit_two_pow]
  by_cases h : q = k
  · subst h; simp
  · have : k ≠ q := fun e => h e.symm
    simp [h, this]

theorem grpV_spec (V : ℕ) : ∀ (ps : List ℕ) (M Bm off acc : ℕ) (ps' : List ℕ) (acc' : ℕ),
    grpV V ps M Bm off acc = some (ps', acc') →
    (∃ blk, ps = blk ++ ps' ∧ ∀ p ∈ blk, Nat.land p 255 = V ∧ M.testBit (32 * Nat.shiftRight p 8) = true) ∧
    (∀ B, M.testBit (32 * B) = true → acc'.testBit (vpos Bm off B) = true) ∧
    (∀ q, acc'.testBit q = true → acc.testBit q = true ∨ ∃ B, M.testBit (32 * B) = true ∧ q = vpos Bm off B) ∧
    (∀ q, acc.testBit q = true → acc'.testBit q = true)
  | [], M, Bm, off, acc, ps', acc', h => by
    have h' : cond (Nat.beq M 0) (some ([], acc)) none = some (ps', acc') := h
    cases hM : Nat.beq M 0
    · rw [hM] at h'; simp at h'
    · rw [hM] at h'; simp only [cond_true, Option.some.injEq, Prod.mk.injEq] at h'
      obtain ⟨rfl, rfl⟩ := h'
      have : M = 0 := Nat.eq_of_beq_eq_true hM
      subst this
      exact ⟨⟨[], by simp, by simp⟩, by simp, fun q hq => Or.inl hq, fun q hq => hq⟩
  | p :: ps, M, Bm, off, acc, ps', acc', h => by
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
      · rw [hM] at h'; simp only [cond_true, Option.some.injEq, Prod.mk.injEq] at h'
        obtain ⟨rfl, rfl⟩ := h'
        have : M = 0 := Nat.eq_of_beq_eq_true hM
        subst this
        exact ⟨⟨[], by simp, by simp⟩, by simp, fun q hq => Or.inl hq, fun q hq => hq⟩
    · rw [hv] at h'; simp only [cond_true] at h'
      have hV : Nat.land p 255 = V := Nat.eq_of_beq_eq_true hv
      cases hb : Nat.beq (bit M (Nat.mul 32 (Nat.shiftRight p 8))) 1
      · rw [hb] at h'; simp at h'
      · rw [hb] at h'; simp only [cond_true] at h'
        set B := Nat.shiftRight p 8 with hB
        have hset : M.testBit (32 * B) = true := bit_eq_one.mp hb
        obtain ⟨⟨blk, hps, hblk⟩, hall, hbits, hmono⟩ := grpV_spec V ps _ Bm off _ ps' acc' h'
        have hM' : ∀ j, (Nat.xor M (Nat.shiftLeft 1 (Nat.mul 32 B))).testBit j = xor (M.testBit j) (decide (j = 32 * B)) :=
          fun j => testBit_xor_shl M (32 * B) j
        have hacc1 : ∀ q, (Nat.lor acc (Nat.shiftLeft 1 (Nat.add off (pc32 (Nat.land Bm (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 B)) 1)))))).testBit q =
            (acc.testBit q || decide (q = vpos Bm off B)) := fun q => testBit_lor_shl1 _ _ q
        refine ⟨⟨p :: blk, by rw [hps]; rfl, ?_⟩, ?_, ?_, ?_⟩
        · intro p' hp'
          rcases List.mem_cons.mp hp' with rfl | h2
          · exact ⟨hV, hset⟩
          · obtain ⟨h1, h3⟩ := hblk p' h2
            refine ⟨h1, ?_⟩
            rw [hM'] at h3
            cases hq : M.testBit (32 * Nat.shiftRight p' 8)
            · rw [hq] at h3; simp only [Bool.false_xor, decide_eq_true_eq] at h3
              rw [h3] at hq; rw [hset] at hq; exact absurd hq (by simp)
            · rfl
        · intro B' hB'
          by_cases hBB : B' = B
          · subst hBB; apply hmono; rw [hacc1]; simp
          · apply hall
            rw [hM']; have : 32 * B' ≠ 32 * B := by omega
            simp [hB', this]
        · intro q hq
          rcases hbits q hq with h1 | ⟨B', hB', rfl⟩
          · rw [hacc1] at h1
            rcases Bool.or_eq_true_iff.mp h1 with h2 | h2
            · exact Or.inl h2
            · exact Or.inr ⟨B, hset, by simpa using h2⟩
          · rw [hM'] at hB'
            refine Or.inr ⟨B', ?_, rfl⟩
            by_cases hBB : 32 * B' = 32 * B
            · simp [hBB] at hB'; rw [hBB]; exact hset
            · simpa [hBB] using hB'
        · intro q hq; apply hmono; rw [hacc1]; simp [hq]

theorem recV_spec (d U r : ℕ) (parts : List ℕ) : ∀ (BmL offL : List ℕ) (V : ℕ) (ps : List ℕ) (acc vloc : ℕ),
    recV d U r parts BmL offL V ps acc = some vloc →
    BmL.length = offL.length ∧
    (∀ i < BmL.length, ∀ B, (validB d U (V + i) r parts (Nat.mul r r) (BmL.getD i 0)).testBit (32 * B) = true →
      vloc.testBit (vpos (BmL.getD i 0) (offL.getD i 0) B) = true) ∧
    (∀ q, vloc.testBit q = true → acc.testBit q = true ∨ ∃ i < BmL.length, ∃ B,
      (validB d U (V + i) r parts (Nat.mul r r) (BmL.getD i 0)).testBit (32 * B) = true ∧
      q = vpos (BmL.getD i 0) (offL.getD i 0) B) ∧
    (∀ q, acc.testBit q = true → vloc.testBit q = true) ∧
    (∀ p ∈ ps, ∃ i < BmL.length, Nat.land p 255 = V + i ∧
      (validB d U (V + i) r parts (Nat.mul r r) (BmL.getD i 0)).testBit (32 * Nat.shiftRight p 8) = true)
  | [], [], V, ps, acc, vloc, h => by
    have h' : cond ps.isEmpty (some acc) none = some vloc := h
    cases hps : ps.isEmpty
    · rw [hps] at h'; simp at h'
    · rw [hps] at h'; simp only [cond_true, Option.some.injEq] at h'
      subst h'
      have : ps = [] := List.isEmpty_iff.mp hps
      subst this
      exact ⟨rfl, by simp, fun q hq => Or.inl hq, fun q hq => hq, by simp⟩
  | Bm :: BmL, off :: offL, V, ps, acc, vloc, h => by
    have h' : (match grpV V ps (validB d U V r parts (Nat.mul r r) Bm) Bm off acc with
      | none => none
      | some (ps', acc') => recV d U r parts BmL offL (Nat.succ V) ps' acc') = some vloc := h
    cases hg : grpV V ps (validB d U V r parts (Nat.mul r r) Bm) Bm off acc with
    | none => rw [hg] at h'; simp at h'
    | some pa =>
      obtain ⟨ps', acc'⟩ := pa
      rw [hg] at h'; simp only at h'
      obtain ⟨⟨blk, hps, hblk⟩, hall, hbits, hmono⟩ := grpV_spec V ps _ Bm off acc ps' acc' hg
      obtain ⟨hlen, hall', hbits', hmono', hps'⟩ := recV_spec d U r parts BmL offL (Nat.succ V) ps' acc' vloc h'
      have hsh : ∀ i, Nat.succ V + i = V + (i + 1) := fun i => by omega
      refine ⟨by simp [hlen], ?_, ?_, ?_, ?_⟩
      · intro i hi B hB
        rcases i with _ | i
        · simp only [List.getD_cons_zero, Nat.add_zero] at hB ⊢
          exact hmono' _ (hall B hB)
        · simp only [List.getD_cons_succ] at hB ⊢
          exact hall' i (by simp at hi; omega) B (by rw [hsh]; exact hB)
      · intro q hq
        rcases hbits' q hq with h1 | ⟨i, hi, B, hB, rfl⟩
        · rcases hbits q h1 with h2 | ⟨B, hB, rfl⟩
          · exact Or.inl h2
          · exact Or.inr ⟨0, by simp, B, by simpa using hB, by simp⟩
        · exact Or.inr ⟨i + 1, by simp; omega, B, by rw [← hsh]; simpa using hB, by simp⟩
      · intro q hq; exact hmono' q (hmono q hq)
      · intro p hp
        rw [hps] at hp
        rcases List.mem_append.mp hp with h1 | h1
        · obtain ⟨hV, hB⟩ := hblk p h1
          exact ⟨0, by simp, by simpa using hV, by simpa using hB⟩
        · obtain ⟨i, hi, hV, hB⟩ := hps' p h1
          exact ⟨i + 1, by simp; omega, by rw [hV]; omega, by rw [← hsh]; simpa using hB⟩
  | [], _ :: _, _, _, _, _, h => by simp [recV] at h
  | _ :: _, [], _, _, _, _, h => by simp [recV] at h

/-! ## the C entries of rank 2 -/

/-- the record of a C entry -/
def mkRec (bstart width a y0 y1 vloc : ℕ) : ℕ :=
  Nat.lor bstart (Nat.lor (Nat.shiftLeft width 32) (Nat.lor (Nat.shiftLeft a 48) (Nat.lor (Nat.shiftLeft y0 64)
    (Nat.lor (Nat.shiftLeft y1 96) (Nat.shiftLeft vloc 128)))))

theorem cents2_spec (d a U bstart width : ℕ) (BmL offL : List ℕ) : ∀ (ces : List CEnt) (Cm : ℕ) (recs recs' : List ℕ),
    cents2 d a U bstart width BmL offL ces Cm recs = some recs' →
    (∃ new, recs' = new ++ recs ∧ ∀ x ∈ new, ∃ C ps vloc, C < 512 ∧
      recV d U 2 (diagParts a C 2 4) BmL offL 0 ps 0 = some vloc ∧
      x = mkRec bstart width a (yuF d a C U 0) (yuF d a C U 1) vloc) ∧
    (∀ C, C < 512 → Cm.testBit (32 * C) = true → ∃ ps vloc, recV d U 2 (diagParts a C 2 4) BmL offL 0 ps 0 = some vloc ∧
      (vloc ≠ 0 → mkRec bstart width a (yuF d a C U 0) (yuF d a C U 1) vloc ∈ recs'))
  | [], Cm, recs, recs', h => by
    have h' : cond (Nat.beq Cm 0) (some recs) none = some recs' := h
    cases hC : Nat.beq Cm 0
    · rw [hC] at h'; simp at h'
    · rw [hC] at h'; simp only [cond_true, Option.some.injEq] at h'
      subst h'
      have : Cm = 0 := Nat.eq_of_beq_eq_true hC
      subst this
      exact ⟨⟨[], by simp, by simp⟩, by simp⟩
  | (ce, ps) :: rest, Cm, recs, recs', h => by
    have h' : cond (Nat.beq (bit Cm (Nat.mul 32 (Nat.land ce 511))) 1)
      (match recV d U 2 (diagParts a (Nat.land ce 511) 2 4) BmL offL 0 ps 0 with
       | none => none
       | some vloc =>
         cond (Nat.beq (Nat.shiftRight ce 9) 1)
           (cents2 d a U bstart width BmL offL rest (Nat.xor Cm (Nat.shiftLeft 1 (Nat.mul 32 (Nat.land ce 511))))
             (mkRec bstart width a (yuF d a (Nat.land ce 511) U 0) (yuF d a (Nat.land ce 511) U 1) vloc :: recs))
           (cond (Nat.beq vloc 0) (cents2 d a U bstart width BmL offL rest
             (Nat.xor Cm (Nat.shiftLeft 1 (Nat.mul 32 (Nat.land ce 511)))) recs) none))
      none = some recs' := h
    set C0 := Nat.land ce 511 with hC0
    have hC0lt : C0 < 512 := by rw [hC0]; exact lt_of_le_of_lt Nat.and_le_right (by norm_num)
    cases hb : Nat.beq (bit Cm (Nat.mul 32 C0)) 1
    · rw [hb] at h'; simp at h'
    · rw [hb] at h'; simp only [cond_true] at h'
      have hset : Cm.testBit (32 * C0) = true := bit_eq_one.mp hb
      have hCm' : ∀ j, (Nat.xor Cm (Nat.shiftLeft 1 (Nat.mul 32 C0))).testBit j = xor (Cm.testBit j) (decide (j = 32 * C0)) :=
        fun j => testBit_xor_shl Cm (32 * C0) j
      cases hr : recV d U 2 (diagParts a C0 2 4) BmL offL 0 ps 0 with
      | none => rw [hr] at h'; simp at h'
      | some vloc =>
        rw [hr] at h'; simp only at h'
        have hother : ∀ C, C < 512 → C ≠ C0 → Cm.testBit (32 * C) = true →
            (Nat.xor Cm (Nat.shiftLeft 1 (Nat.mul 32 C0))).testBit (32 * C) = true := by
          intro C _ hne hC; rw [hCm']; have : 32 * C ≠ 32 * C0 := by omega
          simp [hC, this]
        cases hf : Nat.beq (Nat.shiftRight ce 9) 1
        · rw [hf] at h'; simp only [cond_false] at h'
          cases hz : Nat.beq vloc 0
          · rw [hz] at h'; simp at h'
          · rw [hz] at h'; simp only [cond_true] at h'
            have hv0 : vloc = 0 := Nat.eq_of_beq_eq_true hz
            obtain ⟨⟨new, hnew, hnewf⟩, hall⟩ := cents2_spec d a U bstart width BmL offL rest _ recs recs' h'
            refine ⟨⟨new, hnew, hnewf⟩, fun C hC hCb => ?_⟩
            by_cases hCC : C = C0
            · subst hCC; exact ⟨ps, vloc, hr, fun hne => absurd hv0 hne⟩
            · exact hall C hC (hother C hC hCC hCb)
        · rw [hf] at h'; simp only [cond_true] at h'
          obtain ⟨⟨new, hnew, hnewf⟩, hall⟩ := cents2_spec d a U bstart width BmL offL rest _ _ recs' h'
          refine ⟨⟨new ++ [mkRec bstart width a (yuF d a C0 U 0) (yuF d a C0 U 1) vloc], by rw [hnew]; simp, ?_⟩, ?_⟩
          · intro x hx
            rcases List.mem_append.mp hx with h1 | h1
            · exact hnewf x h1
            · rw [List.mem_singleton] at h1; exact ⟨C0, ps, vloc, hC0lt, hr, h1⟩
          · intro C hC hCb
            by_cases hCC : C = C0
            · subst hCC
              refine ⟨ps, vloc, hr, fun _ => ?_⟩
              rw [hnew]; simp
            · exact hall C hC (hother C hC hCC hCb)

theorem us2_spec (t0 d a bstart width : ℕ) (BmL offL : List ℕ) : ∀ (U : ℕ) (css : List (List CEnt)) (recs recs' : List ℕ),
    us2 t0 d a bstart width BmL offL U css recs = some recs' →
    (∃ new, recs' = new ++ recs ∧ ∀ x ∈ new, ∃ U' C ps vloc, C < 512 ∧
      recV d U' 2 (diagParts a C 2 4) BmL offL 0 ps 0 = some vloc ∧
      x = mkRec bstart width a (yuF d a C U' 0) (yuF d a C U' 1) vloc) ∧
    (∀ i < css.length, ∀ C, C < 512 → (cmaskF t0 d a (U + i) 2).testBit (32 * C) = true →
      ∃ ps vloc, recV d (U + i) 2 (diagParts a C 2 4) BmL offL 0 ps 0 = some vloc ∧
        (vloc ≠ 0 → mkRec bstart width a (yuF d a C (U + i) 0) (yuF d a C (U + i) 1) vloc ∈ recs'))
  | U, [], recs, recs', h => by
    have : recs = recs' := by simpa [us2] using h
    subst this
    exact ⟨⟨[], by simp, by simp⟩, by simp⟩
  | U, cs :: css, recs, recs', h => by
    have h' : (match cents2 d a U bstart width BmL offL cs (cmaskF t0 d a U 2) recs with
      | none => none
      | some recs1 => us2 t0 d a bstart width BmL offL (Nat.succ U) css recs1) = some recs' := h
    cases hc : cents2 d a U bstart width BmL offL cs (cmaskF t0 d a U 2) recs with
    | none => rw [hc] at h'; simp at h'
    | some recs1 =>
      rw [hc] at h'; simp only at h'
      obtain ⟨⟨new1, hnew1, hf1⟩, hall1⟩ := cents2_spec d a U bstart width BmL offL cs _ recs recs1 hc
      obtain ⟨⟨new2, hnew2, hf2⟩, hall2⟩ := us2_spec t0 d a bstart width BmL offL (Nat.succ U) css recs1 recs' h'
      have hsh : ∀ i, Nat.succ U + i = U + (i + 1) := fun i => by omega
      refine ⟨⟨new2 ++ new1, by rw [hnew2, hnew1, List.append_assoc], ?_⟩, ?_⟩
      · intro x hx
        rcases List.mem_append.mp hx with h1 | h1
        · exact hf2 x h1
        · obtain ⟨C, ps, vloc, hC, hr, rfl⟩ := hf1 x h1
          exact ⟨U, C, ps, vloc, hC, hr, rfl⟩
      · intro i hi C hC hCb
        rcases i with _ | i
        · obtain ⟨ps, vloc, hr, hin⟩ := hall1 C hC (by simpa using hCb)
          refine ⟨ps, vloc, by simpa using hr, fun hne => ?_⟩
          rw [hnew2]; exact List.mem_append_right _ (by simpa using hin hne)
        · obtain ⟨ps, vloc, hr, hin⟩ := hall2 i (by simp at hi; omega) C hC (by rw [hsh]; exact hCb)
          rw [hsh] at hr hin
          exact ⟨ps, vloc, hr, hin⟩

end GS

#print axioms GS.grpV_spec
#print axioms GS.recV_spec
#print axioms GS.cents2_spec
#print axioms GS.us2_spec
