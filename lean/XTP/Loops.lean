module
public import R22Port.U_916eba87bd44
public import Mathlib
public import XTP.W8
public import XT.Check
/-! # XTP.Loops: the native loops over set bits, and the row arrays they update

* `get!_set!`, `get!_modify`, `get!_replicate`: array reads after updates;
* `stepL_bit` / `xstepN_bit`: an X-step keeps exactly the candidates `l` with `d + |Y ∧ rows[l]| ≤ |Y|`;
* `scatL_get` / `scat_get` / `scatRows_bit`: scattering rows over their own labels;
* `setBaseL_get`, `addC2L_get`: the base rows of a child and the static part of an in-branch;
* `orHolding_bit`: the OR of the rows holding a label. -/
@[expose] public section
namespace XTP
open XT

/-! ## Arrays -/

theorem get!_set! {α : Type} [Inhabited α] (rs : Array α) (i : ℕ) (v : α) (j : ℕ) :
    (rs.set! i v)[j]! = if i = j ∧ i < rs.size then v else rs[j]! := by
  rw [Array.set!_eq_setIfInBounds, Array.getElem!_eq_getD, Array.getElem!_eq_getD, Array.getD_eq_getD_getElem?,
    Array.getD_eq_getD_getElem?, Array.getElem?_setIfInBounds]
  by_cases hij : i = j
  · subst hij; by_cases hi : i < rs.size <;> simp [hi]
  · simp [hij]

theorem get!_modify {α : Type} [Inhabited α] (rs : Array α) (i : ℕ) (f : α → α) (j : ℕ) :
    (rs.modify i f)[j]! = if i = j ∧ i < rs.size then f rs[j]! else rs[j]! := by
  rw [Array.getElem!_eq_getD, Array.getElem!_eq_getD, Array.getD_eq_getD_getElem?, Array.getD_eq_getD_getElem?,
    Array.getElem?_modify]
  by_cases hij : i = j
  · subst hij
    by_cases hi : i < rs.size
    · simp [hi, Array.getElem?_eq_getElem hi]
    · simp [hi, Array.getElem?_eq_none (Nat.le_of_not_lt hi)]
  · simp [hij]

theorem get!_replicate {α : Type} [Inhabited α] (n : ℕ) (v : α) (j : ℕ) :
    (Array.replicate n v)[j]! = if j < n then v else default := by
  rw [Array.getElem!_eq_getD, Array.getD_eq_getD_getElem?]
  by_cases hj : j < n
  · simp [hj]
  · rw [Array.getElem?_eq_none (by simp; omega)]; simp [hj]

/-! ## Set bits of a word -/

/-- the induction principle of the bit loops -/
theorem word_induction {P : UInt64 → Prop} (h0 : P 0) (hs : ∀ x, x ≠ 0 → P (x &&& (x - 1)) → P x) : ∀ x, P x := by
  intro x
  induction x using WellFounded.induction (r := fun a b : UInt64 => a.toNat < b.toNat)
    (hwf := (measure (fun a : UInt64 => a.toNat)).wf) with
  | h x ih =>
    by_cases hx : x = 0
    · subst hx; exact h0
    · exact hs x hx (ih _ (andPred_lt x hx))

theorem testBit_zero64 (j : ℕ) : (0 : UInt64).toNat.testBit j = false := by simp

/-- the X-step on one word: bit `j` of the result -/
theorem stepL_bit (rows : Array W8) (Y : W8) (ny d base : ℕ) : ∀ (x acc : UInt64) (j : ℕ),
    (stepL rows Y ny d base x acc).toNat.testBit j =
      (acc.toNat.testBit j || (x.toNat.testBit j && decide (d + Y.andPop rows[base + j]! ≤ ny))) := by
  intro x
  induction x using word_induction with
  | h0 => intro acc j; rw [stepL]; simp
  | hs x hx ih =>
    intro acc j
    rw [stepL, dif_neg hx, ih]
    obtain ⟨hk, hxk, _, hy, hb⟩ := lowIdx_spec x hx
    set k := (lowIdx x).toNat with hkdef
    rw [hy]
    by_cases hjk : j = k
    · subst hjk
      split
      · rw [UInt64.toNat_or, Nat.testBit_or, hb, Nat.testBit_two_pow_self]
        simp_all
      · simp_all
    · have hne : ∀ (a : UInt64), (if d + Y.andPop rows[base + k]! ≤ ny then acc ||| (x ^^^ (x &&& (x - 1))) else acc).toNat.testBit j =
          acc.toNat.testBit j := by
        intro _
        split
        · rw [UInt64.toNat_or, Nat.testBit_or, hb, Nat.testBit_two_pow]; simp [Ne.symm hjk]
        · rfl
      rw [hne acc]
      simp [hjk]

theorem limb_xstepN (rows : Array W8) (c H : W8) (d i : ℕ) (hi : i < 8) :
    (xstepN rows c H d).limb i = stepL rows (c.and H) (c.and H).pop d (64 * i) (c.limb i) 0 := by
  have hcases : i = 0 ∨ i = 1 ∨ i = 2 ∨ i = 3 ∨ i = 4 ∨ i = 5 ∨ i = 6 ∨ i = 7 := by omega
  rcases hcases with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> rfl

/-- **the native X-step**: bit `l` of the new candidates -/
theorem xstepN_bit (rows : Array W8) (c H : W8) (d l : ℕ) :
    (xstepN rows c H d).view.testBit l =
      (c.view.testBit l && decide (d + (c.and H).andPop rows[l]! ≤ (c.and H).pop)) := by
  rw [W8.testBit_view, W8.testBit_view]
  by_cases hl : l < 512
  · simp only [hl, decide_true, Bool.true_and]
    rw [limb_xstepN rows c H d (l / 64) (by omega), stepL_bit]
    simp only [testBit_zero64, Bool.false_or]
    rw [show 64 * (l / 64) + l % 64 = l by omega]
  · simp [hl]

/-! ## Scattering a row over labels -/

/-- the update of `scatL` -/
def updS (m : W8) (clr : Bool) (l : ℕ) (w : W8) : W8 := if clr then (w.or m).clrBit l else w.or m

theorem scatL_size (m : W8) (clr : Bool) (base : ℕ) : ∀ (x : UInt64) (rs : Array W8), (scatL m clr base x rs).size = rs.size := by
  intro x
  induction x using word_induction with
  | h0 => intro rs; rw [scatL]; simp
  | hs x hx ih => intro rs; rw [scatL, dif_neg hx, ih, Array.size_modify]

theorem scatL_get (m : W8) (clr : Bool) (base : ℕ) : ∀ (x : UInt64) (rs : Array W8) (l : ℕ),
    (scatL m clr base x rs)[l]! =
      if base ≤ l ∧ x.toNat.testBit (l - base) ∧ l < rs.size then updS m clr l rs[l]! else rs[l]! := by
  intro x
  induction x using word_induction with
  | h0 => intro rs l; rw [scatL]; simp
  | hs x hx ih =>
    intro rs l
    rw [scatL, dif_neg hx, ih, Array.size_modify]
    obtain ⟨hk, hxk, _, hy, _⟩ := lowIdx_spec x hx
    set k := (lowIdx x).toNat with hkdef
    rw [hy, get!_modify]
    by_cases hl : l = base + k
    · subst hl
      rw [if_neg (by simp)]
      by_cases hs : base + k < rs.size
      · simp [hs, hxk, updS, W8.orClr_eq]
      · simp [hs]
    · have hne : base + k ≠ l := Ne.symm hl
      simp only [hne, false_and, if_false]
      by_cases hb : base ≤ l
      · have : l - base ≠ k := by omega
        simp [hb, this]
      · simp [hb]

/-- word `i` of a mask at label `l`: bit `l - 64 i` of word `i` is the mask's bit `l` when `l / 64 = i`, else false -/
theorem limb_bit (w : W8) (i l : ℕ) (hi : i < 8) (hl : 64 * i ≤ l) :
    (w.limb i).toNat.testBit (l - 64 * i) = (decide (l / 64 = i) && w.view.testBit l) := by
  rw [W8.testBit_view]
  by_cases h : l / 64 = i
  · subst h
    simp only [decide_true, Bool.true_and, show l < 512 by omega]
    congr 1; omega
  · rw [testBit_toNat_lt _ _ (by omega)]; simp [h]

theorem scatWs_size (m : W8) (clr : Bool) (sel : W8) : ∀ (k i : ℕ) (rs : Array W8), 8 - i = k →
    (scatWs m clr sel i rs).size = rs.size := by
  intro k
  induction k with
  | zero => intro i rs hk; rw [scatWs, if_neg (by omega)]
  | succ k ih => intro i rs hk; rw [scatWs, if_pos (by omega), ih (i + 1) _ (by omega), scatL_size]

theorem scatWs_get (m : W8) (clr : Bool) (sel : W8) : ∀ (k i : ℕ) (rs : Array W8) (l : ℕ), 8 - i = k →
    (scatWs m clr sel i rs)[l]! = if i ≤ l / 64 ∧ sel.view.testBit l ∧ l < rs.size then updS m clr l rs[l]! else rs[l]! := by
  intro k
  induction k with
  | zero =>
    intro i rs l hk
    rw [scatWs, if_neg (by omega)]
    have : ¬ (i ≤ l / 64 ∧ sel.view.testBit l = true ∧ l < rs.size) := by
      rintro ⟨h1, h2, _⟩; rw [W8.testBit_view] at h2; simp at h2; omega
    rw [if_neg this]
  | succ k ih =>
    intro i rs l hk
    rw [scatWs, if_pos (by omega), ih (i + 1) _ l (by omega), scatL_size, scatL_get]
    by_cases hli : l / 64 = i
    · have h1 : ¬ (i + 1 ≤ l / 64) := by omega
      simp only [h1, false_and, if_false]
      rw [limb_bit sel i l (by omega) (by omega), decide_eq_true hli, Bool.true_and]
      simp only [show 64 * i ≤ l by omega, true_and, show i ≤ l / 64 by omega]
    · by_cases hlt : l / 64 < i
      · have h1 : ¬ (i + 1 ≤ l / 64) := by omega
        have h2 : ¬ (64 * i ≤ l) := by omega
        have h3 : ¬ (i ≤ l / 64) := by omega
        simp [h1, h2, h3]
      · have hge : i + 1 ≤ l / 64 := by omega
        have hb : (sel.limb i).toNat.testBit (l - 64 * i) = false := by
          rw [limb_bit sel i l (by omega) (by omega)]; simp [hli]
        simp only [hb, Bool.false_eq_true, false_and, and_false, if_false, hge, true_and, show i ≤ l / 64 by omega]

/-- `scat`: the eight words of the label mask `sel` -/
theorem scat_get (m : W8) (clr : Bool) (sel : W8) (rs : Array W8) (l : ℕ) :
    (scat m clr sel rs)[l]! = if sel.view.testBit l ∧ l < rs.size then updS m clr l rs[l]! else rs[l]! := by
  unfold scat; rw [scatWs_get m clr sel _ 0 rs l rfl]; simp

theorem scat_size (m : W8) (clr : Bool) (sel : W8) (rs : Array W8) : (scat m clr sel rs).size = rs.size :=
  scatWs_size m clr sel _ 0 rs rfl

/-! ## Scattering rows over their own labels -/

theorem scatRows_size (ms : Array W8) (sel : W8) (rs : Array W8) : (scatRows ms sel rs).size = rs.size := by
  unfold scatRows
  rw [← Array.foldl_toList]
  generalize ms.toList = L
  induction L generalizing rs with
  | nil => rfl
  | cons m L ih => simp only [List.foldl_cons]; rw [ih, scat_size]

theorem foldl_scat_bit (sel : W8) (l j : ℕ) : ∀ (L : List W8) (rs : Array W8), l < rs.size →
    (rs[l]!).view.testBit l = false →
    (L.foldl (fun rs m => scat m true (m.and sel) rs) rs)[l]!.view.testBit j =
      ((rs[l]!.view.testBit j || decide (sel.view.testBit l ∧ ∃ m ∈ L, m.view.testBit l ∧ m.view.testBit j)) &&
        decide (j ≠ l)) := by
  intro L
  induction L with
  | nil =>
    intro rs _ hdiag
    simp only [List.foldl_nil, List.not_mem_nil, false_and, exists_false, and_false, decide_false, Bool.or_false]
    by_cases hjl : j = l
    · subst hjl; simp [hdiag]
    · simp [hjl]
  | cons m L ih =>
    intro rs hl hdiag
    simp only [List.foldl_cons]
    have hl' : l < (scat m true (m.and sel) rs).size := by rw [scat_size]; exact hl
    have hd' : (scat m true (m.and sel) rs)[l]!.view.testBit l = false := by
      rw [scat_get]
      split
      · simp [updS, W8.testBit_clrBit]
      · exact hdiag
    rw [ih _ hl' hd', scat_get]
    by_cases hm : (m.and sel).view.testBit l = true
    · rw [if_pos ⟨hm, hl⟩]
      simp only [updS, if_true, W8.testBit_clrBit, W8.testBit_or]
      rw [W8.testBit_and] at hm
      simp only [Bool.and_eq_true] at hm
      by_cases hjl : j = l
      · subst hjl; simp
      · simp only [hjl, ne_eq, not_false_eq_true, decide_true, Bool.and_true]
        by_cases hmj : m.view.testBit j = true
        · have : sel.view.testBit l = true ∧ ∃ m' ∈ m :: L, m'.view.testBit l = true ∧ m'.view.testBit j = true :=
            ⟨hm.2, m, List.mem_cons_self .., hm.1, hmj⟩
          simp [hmj, this, hm.1]
        · simp only [hmj, Bool.or_false]
          congr 1
          apply decide_eq_decide.mpr
          constructor
          · rintro ⟨hs, m', hm', h1, h2⟩; exact ⟨hs, m', List.mem_cons_of_mem _ hm', h1, h2⟩
          · rintro ⟨hs, m', hmem, h1, h2⟩
            rcases List.mem_cons.mp hmem with rfl | hm'
            · exact absurd h2 hmj
            · exact ⟨hs, m', hm', h1, h2⟩
    · rw [if_neg (fun h => hm h.1)]
      rw [W8.testBit_and] at hm
      congr 2
      apply decide_eq_decide.mpr
      constructor
      · rintro ⟨hs, m', hm', h1, h2⟩; exact ⟨hs, m', List.mem_cons_of_mem _ hm', h1, h2⟩
      · rintro ⟨hs, m', hmem, h1, h2⟩
        rcases List.mem_cons.mp hmem with rfl | hm'
        · simp [h1, hs] at hm
        · exact ⟨hs, m', hm', h1, h2⟩

/-- **scattering rows**: entry `l` gets every row of `ms` that holds `l` (when `l ∈ sel`), bit `l` cleared; entries without bit `l`
stay without it -/
theorem scatRows_bit (ms : Array W8) (sel : W8) (rs : Array W8) (l j : ℕ) (hl : l < rs.size)
    (hdiag : (rs[l]!).view.testBit l = false) :
    (scatRows ms sel rs)[l]!.view.testBit j =
      ((rs[l]!.view.testBit j || decide (sel.view.testBit l ∧ ∃ m ∈ ms.toList, m.view.testBit l ∧ m.view.testBit j)) &&
        decide (j ≠ l)) := by
  unfold scatRows
  rw [← Array.foldl_toList]
  exact foldl_scat_bit sel l j ms.toList rs hl hdiag

theorem scatRows_get_of_not (ms : Array W8) (sel : W8) (rs : Array W8) (l : ℕ) (hl : sel.view.testBit l = false) :
    (scatRows ms sel rs)[l]! = rs[l]! := by
  unfold scatRows
  rw [← Array.foldl_toList]
  generalize ms.toList = L
  induction L generalizing rs with
  | nil => rfl
  | cons m L ih =>
    simp only [List.foldl_cons]; rw [ih, scat_get, if_neg]
    rw [W8.testBit_and, hl]; simp

/-! ## The child's base rows -/

/-- the base row the child setup writes for label `l` -/
def baseV (nc : NodeC) (kc : KidC) (l : ℕ) : W8 := ((nc.An[l]!).or kc.c2[l]!).clrBit l

theorem setBaseL_size (nc : NodeC) (kc : KidC) (base : ℕ) : ∀ (x : UInt64) (rs : Array W8),
    (setBaseL nc kc base x rs).size = rs.size := by
  intro x
  induction x using word_induction with
  | h0 => intro rs; rw [setBaseL]; simp
  | hs x hx ih => intro rs; rw [setBaseL, dif_neg hx, ih, Array.set!_eq_setIfInBounds, Array.size_setIfInBounds]

theorem setBaseL_get (nc : NodeC) (kc : KidC) (base : ℕ) : ∀ (x : UInt64) (rs : Array W8) (l : ℕ),
    (setBaseL nc kc base x rs)[l]! = if base ≤ l ∧ x.toNat.testBit (l - base) ∧ l < rs.size then baseV nc kc l else rs[l]! := by
  intro x
  induction x using word_induction with
  | h0 => intro rs l; rw [setBaseL]; simp
  | hs x hx ih =>
    intro rs l
    rw [setBaseL, dif_neg hx, ih, Array.set!_eq_setIfInBounds, Array.size_setIfInBounds, ← Array.set!_eq_setIfInBounds]
    obtain ⟨hk, hxk, _, hy, _⟩ := lowIdx_spec x hx
    set k := (lowIdx x).toNat with hkdef
    rw [hy, get!_set!]
    by_cases hl : l = base + k
    · subst hl
      rw [if_neg (by simp)]
      by_cases hs : base + k < rs.size
      · simp [hs, hxk, baseV, W8.orClr_eq]
      · simp [hs]
    · have hne : base + k ≠ l := Ne.symm hl
      simp only [hne, false_and, if_false]
      by_cases hb : base ≤ l
      · have : l - base ≠ k := by omega
        simp [hb, this]
      · simp [hb]

theorem setBaseWs_size (nc : NodeC) (kc : KidC) (Fu : W8) : ∀ (k i : ℕ) (rs : Array W8), 8 - i = k →
    (setBaseWs nc kc Fu i rs).size = rs.size := by
  intro k
  induction k with
  | zero => intro i rs hk; rw [setBaseWs, if_neg (by omega)]
  | succ k ih => intro i rs hk; rw [setBaseWs, if_pos (by omega), ih (i + 1) _ (by omega), setBaseL_size]

theorem setBaseWs_get (nc : NodeC) (kc : KidC) (Fu : W8) : ∀ (k i : ℕ) (rs : Array W8) (l : ℕ), 8 - i = k →
    (setBaseWs nc kc Fu i rs)[l]! = if i ≤ l / 64 ∧ Fu.view.testBit l ∧ l < rs.size then baseV nc kc l else rs[l]! := by
  intro k
  induction k with
  | zero =>
    intro i rs l hk
    rw [setBaseWs, if_neg (by omega)]
    have : ¬ (i ≤ l / 64 ∧ Fu.view.testBit l = true ∧ l < rs.size) := by
      rintro ⟨h1, h2, _⟩; rw [W8.testBit_view] at h2; simp at h2; omega
    rw [if_neg this]
  | succ k ih =>
    intro i rs l hk
    rw [setBaseWs, if_pos (by omega), ih (i + 1) _ l (by omega), setBaseL_size, setBaseL_get]
    by_cases hli : l / 64 = i
    · have h1 : ¬ (i + 1 ≤ l / 64) := by omega
      simp only [h1, false_and, if_false]
      rw [limb_bit Fu i l (by omega) (by omega), decide_eq_true hli, Bool.true_and]
      simp only [show 64 * i ≤ l by omega, true_and, show i ≤ l / 64 by omega]
    · by_cases hlt : l / 64 < i
      · have h1 : ¬ (i + 1 ≤ l / 64) := by omega
        have h2 : ¬ (64 * i ≤ l) := by omega
        have h3 : ¬ (i ≤ l / 64) := by omega
        simp [h1, h2, h3]
      · have hge : i + 1 ≤ l / 64 := by omega
        have hb : (Fu.limb i).toNat.testBit (l - 64 * i) = false := by
          rw [limb_bit Fu i l (by omega) (by omega)]; simp [hli]
        simp only [hb, Bool.false_eq_true, false_and, and_false, if_false, hge, true_and, show i ≤ l / 64 by omega]

/-! ## The static part of an in-branch -/

/-- the update `addC2L` applies at label `l` -/
def c2upd (c2W : Array (Array W8)) (ag : AggC) (l : ℕ) (w : W8) : W8 := (w.or ((c2row c2W ag.x l).clrBit ag.x)).clrBit l

theorem addC2L_size (c2W : Array (Array W8)) (ag : AggC) (base : ℕ) : ∀ (x : UInt64) (rs : Array W8),
    (addC2L c2W ag base x rs).size = rs.size := by
  intro x
  induction x using word_induction with
  | h0 => intro rs; rw [addC2L]; simp
  | hs x hx ih =>
    intro rs; rw [addC2L, dif_neg hx, ih]
    split
    · rfl
    · rw [Array.size_modify]

theorem addC2L_get (c2W : Array (Array W8)) (ag : AggC) (base : ℕ) : ∀ (x : UInt64) (rs : Array W8) (l : ℕ),
    (addC2L c2W ag base x rs)[l]! =
      if base ≤ l ∧ x.toNat.testBit (l - base) ∧ l < rs.size ∧ l ≠ ag.x then c2upd c2W ag l rs[l]! else rs[l]! := by
  intro x
  induction x using word_induction with
  | h0 => intro rs l; rw [addC2L]; simp
  | hs x hx ih =>
    intro rs l
    obtain ⟨hk, hxk, _, hy, _⟩ := lowIdx_spec x hx
    set k := (lowIdx x).toNat with hkdef
    rw [addC2L, dif_neg hx]
    have hsz : (if base + k = ag.x then rs else rs.modify (base + k)
        (fun w => w.orClr2 (c2row c2W ag.x (base + k)) ag.x (base + k))).size = rs.size := by
      split
      · rfl
      · rw [Array.size_modify]
    rw [ih, hsz, hy]
    by_cases hl : l = base + k
    · subst hl
      rw [if_neg (by simp)]
      by_cases hx' : base + k = ag.x
      · rw [if_pos hx']; simp [hx']
      · rw [if_neg hx', get!_modify]
        by_cases hs : base + k < rs.size
        · rw [if_pos ⟨rfl, hs⟩, if_pos ⟨by omega, by simpa using hxk, hs, hx'⟩]; exact W8.orClr2_eq _ _ _ _
        · rw [if_neg (fun h => hs h.2), if_neg (fun h => hs h.2.2.1)]
    · have hne : base + k ≠ l := Ne.symm hl
      have hget : (if base + k = ag.x then rs else rs.modify (base + k)
          (fun w => w.orClr2 (c2row c2W ag.x (base + k)) ag.x (base + k)))[l]! = rs[l]! := by
        split
        · rfl
        · rw [get!_modify]; simp [hne]
      rw [hget]
      by_cases hb : base ≤ l
      · have : l - base ≠ k := by omega
        simp [hb, this]
      · simp [hb]

theorem addC2Ws_size (c2W : Array (Array W8)) (ag : AggC) (cin : W8) : ∀ (k i : ℕ) (rs : Array W8), 8 - i = k →
    (addC2Ws c2W ag cin i rs).size = rs.size := by
  intro k
  induction k with
  | zero => intro i rs hk; rw [addC2Ws, if_neg (by omega)]
  | succ k ih => intro i rs hk; rw [addC2Ws, if_pos (by omega), ih (i + 1) _ (by omega), addC2L_size]

theorem addC2Ws_get (c2W : Array (Array W8)) (ag : AggC) (cin : W8) : ∀ (k i : ℕ) (rs : Array W8) (l : ℕ), 8 - i = k →
    (addC2Ws c2W ag cin i rs)[l]! =
      if i ≤ l / 64 ∧ cin.view.testBit l ∧ l < rs.size ∧ l ≠ ag.x then c2upd c2W ag l rs[l]! else rs[l]! := by
  intro k
  induction k with
  | zero =>
    intro i rs l hk
    rw [addC2Ws, if_neg (by omega)]
    have : ¬ (i ≤ l / 64 ∧ cin.view.testBit l = true ∧ l < rs.size ∧ l ≠ ag.x) := by
      rintro ⟨h1, h2, _⟩; rw [W8.testBit_view] at h2; simp at h2; omega
    rw [if_neg this]
  | succ k ih =>
    intro i rs l hk
    rw [addC2Ws, if_pos (by omega), ih (i + 1) _ l (by omega), addC2L_size, addC2L_get]
    by_cases hli : l / 64 = i
    · have h1 : ¬ (i + 1 ≤ l / 64) := by omega
      simp only [h1, false_and, if_false]
      rw [limb_bit cin i l (by omega) (by omega), decide_eq_true hli, Bool.true_and]
      simp only [show 64 * i ≤ l by omega, true_and, show i ≤ l / 64 by omega]
    · by_cases hlt : l / 64 < i
      · have h1 : ¬ (i + 1 ≤ l / 64) := by omega
        have h2 : ¬ (64 * i ≤ l) := by omega
        have h3 : ¬ (i ≤ l / 64) := by omega
        simp [h1, h2, h3]
      · have hge : i + 1 ≤ l / 64 := by omega
        have hb : (cin.limb i).toNat.testBit (l - 64 * i) = false := by
          rw [limb_bit cin i l (by omega) (by omega)]; simp [hli]
        simp only [hb, Bool.false_eq_true, false_and, and_false, if_false, hge, true_and, show i ≤ l / 64 by omega]

/-! ## The OR of the rows holding a label -/

theorem orHolding_bit (cl : Array W8) (l : ℕ) : ∀ (k i : ℕ) (a0 a1 a2 a3 a4 a5 a6 a7 : UInt64) (j : ℕ), cl.size - i = k →
    ((orHolding cl l i a0 a1 a2 a3 a4 a5 a6 a7).view.testBit j = true ↔
      ((⟨a0, a1, a2, a3, a4, a5, a6, a7⟩ : W8).view.testBit j = true ∨
        ∃ i', i ≤ i' ∧ i' < cl.size ∧ cl[i']!.view.testBit l = true ∧ cl[i']!.view.testBit j = true)) := by
  intro k
  induction k with
  | zero =>
    intro i a0 a1 a2 a3 a4 a5 a6 a7 j hk
    rw [orHolding, dif_neg (by omega)]
    constructor
    · intro h; left; exact h
    · rintro (h | ⟨i', h1, h2, _⟩)
      · exact h
      · omega
  | succ k ih =>
    intro i a0 a1 a2 a3 a4 a5 a6 a7 j hk
    have hi : i < cl.size := by omega
    have hk' : cl.size - (i + 1) = k := by omega
    rw [orHolding, dif_pos hi]
    have hget : cl[i] = cl[i]! := (getElem!_pos cl i hi).symm
    rw [hget]
    have hsplit : (∃ i', i ≤ i' ∧ i' < cl.size ∧ cl[i']!.view.testBit l = true ∧ cl[i']!.view.testBit j = true) ↔
        ((cl[i]!.view.testBit l = true ∧ cl[i]!.view.testBit j = true) ∨
          ∃ i', i + 1 ≤ i' ∧ i' < cl.size ∧ cl[i']!.view.testBit l = true ∧ cl[i']!.view.testBit j = true) := by
      constructor
      · rintro ⟨i', h1, h2, h3, h4⟩
        rcases Nat.eq_or_lt_of_le h1 with rfl | h1
        · left; exact ⟨h3, h4⟩
        · right; exact ⟨i', h1, h2, h3, h4⟩
      · rintro (⟨h3, h4⟩ | ⟨i', h1, h2, h3, h4⟩)
        · exact ⟨i, le_refl _, hi, h3, h4⟩
        · exact ⟨i', by omega, h2, h3, h4⟩
    rw [hsplit]
    by_cases hb : cl[i]!.view.testBit l = true
    · have hb' : cl[i]!.testBit l = true := by rw [W8.testBit_eq]; exact hb
      rw [if_pos hb', ih (i + 1) _ _ _ _ _ _ _ _ j hk']
      have hv : (⟨a0 ||| cl[i]!.a0, a1 ||| cl[i]!.a1, a2 ||| cl[i]!.a2, a3 ||| cl[i]!.a3, a4 ||| cl[i]!.a4, a5 ||| cl[i]!.a5,
          a6 ||| cl[i]!.a6, a7 ||| cl[i]!.a7⟩ : W8) = (⟨a0, a1, a2, a3, a4, a5, a6, a7⟩ : W8).or cl[i]! := rfl
      rw [hv, W8.testBit_or, Bool.or_eq_true]
      constructor
      · rintro ((h | h) | h)
        · exact Or.inl h
        · exact Or.inr (Or.inl ⟨hb, h⟩)
        · exact Or.inr (Or.inr h)
      · rintro (h | ⟨_, h⟩ | h)
        · exact Or.inl (Or.inl h)
        · exact Or.inl (Or.inr h)
        · exact Or.inr h
    · have hb' : ¬ cl[i]!.testBit l = true := by rw [W8.testBit_eq]; exact hb
      rw [if_neg hb', ih (i + 1) _ _ _ _ _ _ _ _ j hk']
      constructor
      · rintro (h | h)
        · exact Or.inl h
        · exact Or.inr (Or.inr h)
      · rintro (h | ⟨h1, _⟩ | h)
        · exact Or.inl h
        · exact absurd h1 hb
        · exact Or.inr h

theorem orHoldingW_bit (cl : Array W8) (l : ℕ) (w : W8) (j : ℕ) :
    ((orHoldingW cl l w).view.testBit j = true ↔
      (w.view.testBit j = true ∨ ∃ m ∈ cl.toList, m.view.testBit l = true ∧ m.view.testBit j = true)) := by
  unfold orHoldingW
  rw [orHolding_bit cl l _ 0 _ _ _ _ _ _ _ _ j rfl]
  apply or_congr Iff.rfl
  constructor
  · rintro ⟨i', _, h2, h3, h4⟩
    refine ⟨cl[i']!, ?_, h3, h4⟩
    rw [Array.getElem!_eq_getD, Array.getD, dif_pos h2]; exact Array.getElem_mem_toList h2
  · rintro ⟨m, hm, h3, h4⟩
    obtain ⟨i', h2, rfl⟩ := Array.getElem_of_mem (Array.mem_def.mpr hm)
    refine ⟨i', Nat.zero_le _, h2, ?_, ?_⟩ <;> rwa [Array.getElem!_eq_getD, Array.getD, dif_pos h2]

end XTP
