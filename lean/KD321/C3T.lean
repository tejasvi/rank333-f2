module
public import R22Port.U_d41d8cd98f00
public import C3.Check
/-! # KD321.C3T: L3's canonicity-witness checker with the label table as a parameter

`C3/Check.lean` (r22/lean/canon) with `C3.labN = fld9 LABT` replaced by `labT LT = fld9 LT` for a label table `LT` (9-bit
fields, code `v ↦` label `+ 1`), and L3's key `C3.labK` by `keyT LT v = labT LT (v % 512) + 512 * (v / 512)`.  The checker
(`nodeOK`, `batchOK`) and the record format are C3's; the soundness proofs are C3's with one hypothesis, `LabInj LT`: the table
is injective on codes `< 512`.  For `LT = C3.LABT` this is C3 itself; for `LT = Top321.LABT321` the key is `Top321.labK321`
(`--rord 321`, `KD321.Canon`).

* `WitSem LT S o k w`: some `g ∈ C3.Gset` makes `T = seq ∪ {fld9 S w}` lex-smaller in the order of `keyT LT`;
* **`nodeOK_sound`**, **`batch_sound`**: accepted records give `WitSem` for every witness;
* **`witSem_prune`**: no `keyT LT`-canonical set has `T` as a key-prefix. -/
@[expose] public section
namespace KD321.C3T
open RootSound C3

variable (LT : Nat)

/-- the label (`+ 1`) of a code in the table `LT` -/
def labT (v : Nat) : Nat := fld9 LT v
/-- the key of the table: L3's `labK` form -/
def keyT (v : Nat) : Nat := labT LT (v % 512) + 512 * (v / 512)

/-- the table is injective on codes -/
def LabInj : Prop := ∀ u v, u < 512 → v < 512 → labT LT u = labT LT v → u = v

/-! ## Checker (C3's, with `labT LT`) -/

def lbits (S o k : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0 (fun i acc => Nat.lor acc (Nat.shiftLeft 1 (labT LT (fld9 S (Nat.add o i))))) k

def ibits (f : Nat → Nat) (S o k : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0 (fun i acc => Nat.lor acc (Nat.shiftLeft 1 (labT LT (f (fld9 S (Nat.add o i)))))) k

def stabOK (S o k Tb r : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i acc =>
    acc && (isGL (fld9 S (Nat.add (Nat.add (Nat.add o k) 3) (Nat.mul 3 i))) &&
      isGL (fld9 S (Nat.add (Nat.add (Nat.add o k) 4) (Nat.mul 3 i))) &&
      Nat.beq (ibits LT (stG S o k i) S (Nat.add o 1) k) Tb)) r

def wit1 (S Tb w : Nat) : Bool :=
  let T1 := Nat.lor Tb (Nat.shiftLeft 1 (labT LT (fld9 S w)))
  let g := gF (fld9 S (Nat.add w 2)) (fld9 S (Nat.add w 3)) (fld9 S (Nat.add w 4))
  let j := fld9 S (Nat.add w 5)
  let hb := lbits LT S (Nat.add w 6) (Nat.add j 1)
  let m := labT LT (g (fld9 S (Nat.add w 6)))
  let Tlow := Nat.land T1 (Nat.sub (Nat.shiftLeft 1 m) 1)
  isGL (fld9 S (Nat.add w 3)) && isGL (fld9 S (Nat.add w 4)) && Nat.beq (Nat.land hb T1) hb &&
    !(Nat.testBit T1 m) && Nat.beq (Nat.land Tlow (ibits LT g S (Nat.add w 7) j)) Tlow

def wit0 (S o k Tb r w : Nat) : Bool :=
  let i := fld9 S (Nat.add w 2)
  let m := labT LT (stG S o k i (fld9 S w))
  Nat.blt i r && Nat.blt m (labT LT (fld9 S w)) && !(Nat.testBit Tb m)

def witOK (S o k Tb r w : Nat) : Bool :=
  cond (Nat.beq (fld9 S (Nat.add w 1)) 0) (wit0 LT S o k Tb r w) (wit1 LT S Tb w)

def wloop (S o k Tb r n : Nat) : Nat → Bool :=
  Nat.rec (motive := fun _ => Nat → Bool) (fun _ => true) (fun _ ih w => witOK LT S o k Tb r w && ih (wnext S w)) n

def nodeOK (S o : Nat) : Bool :=
  let k := fld9 S o
  let r := fld9 S (Nat.add (Nat.add o k) 1)
  let Tb := lbits LT S (Nat.add o 1) k
  stabOK LT S o k Tb r &&
    wloop LT S o k Tb r (fld9 S (Nat.add (Nat.add (Nat.add o k) 2) (Nat.mul 3 r))) (Nat.add (Nat.add (Nat.add o k) 3) (Nat.mul 3 r))

def batchOK (S n : Nat) : Nat → Bool :=
  Nat.rec (motive := fun _ => Nat → Bool) (fun _ => true) (fun _ ih o => nodeOK LT S o && ih (nodeEnd S o)) n

/-! ## Semantics -/

def WitSem (S o k w : Nat) : Prop :=
  ∃ g ∈ Gset, LexLt (keyT LT) ((insert (fld9 S w) (seqF S o k)).image g) (insert (fld9 S w) (seqF S o k))

def WSem (S o k : Nat) : Nat → Nat → Prop
  | 0, _ => True
  | n + 1, w => WitSem LT S o k w ∧ WSem S o k n (wnext S w)

def NodeSem (S o : Nat) : Prop :=
  WSem LT S o (fld9 S o) (fld9 S (o + fld9 S o + 2 + 3 * fld9 S (o + fld9 S o + 1)))
    (o + fld9 S o + 3 + 3 * fld9 S (o + fld9 S o + 1))

def BSem (S : Nat) : Nat → Nat → Prop
  | 0, _ => True
  | n + 1, o => NodeSem LT S o ∧ BSem S n (nodeEnd S o)

/-! ## Soundness -/

variable {LT}

theorem keyT_lt {v : Nat} (hv : v < 512) : keyT LT v = labT LT v := by
  unfold keyT; rw [Nat.mod_eq_of_lt hv, Nat.div_eq_of_lt hv]; simp

theorem lbits_succ (S o k : Nat) : lbits LT S o (k + 1) = lbits LT S o k ||| (1 <<< labT LT (fld9 S (o + k))) := rfl
theorem ibits_succ (f : Nat → Nat) (S o k : Nat) :
    ibits LT f S o (k + 1) = ibits LT f S o k ||| (1 <<< labT LT (f (fld9 S (o + k)))) := rfl

theorem testBit_ibits (f : Nat → Nat) (S o k b : Nat) :
    (ibits LT f S o k).testBit b = true ↔ ∃ i < k, labT LT (f (fld9 S (o + i))) = b := by
  induction k with
  | zero =>
    constructor
    · intro h; exact absurd h (by rw [show ibits LT f S o 0 = 0 from rfl, Nat.zero_testBit]; decide)
    · rintro ⟨i, hi, -⟩; omega
  | succ k ih =>
    rw [ibits_succ, Nat.testBit_or, Bool.or_eq_true, ih, C3.testBit_one_shiftLeft]
    constructor
    · rintro (⟨i, hi, e⟩ | e)
      · exact ⟨i, by omega, e⟩
      · exact ⟨k, by omega, e⟩
    · rintro ⟨i, hi, e⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hi | rfl
      · exact Or.inl ⟨i, hi, e⟩
      · exact Or.inr e

theorem lbits_eq (S o k : Nat) : lbits LT S o k = ibits LT id S o k := by
  induction k with
  | zero => rfl
  | succ k ih => rw [lbits_succ, ibits_succ, ih]; rfl

theorem testBit_lbits (S o k b : Nat) :
    (lbits LT S o k).testBit b = true ↔ ∃ i < k, labT LT (fld9 S (o + i)) = b := by
  rw [lbits_eq, testBit_ibits]; rfl

/-- the label set of `seq` -/
theorem testBit_Tb {S o k b : Nat} : (lbits LT S (o + 1) k).testBit b = true ↔ ∃ x ∈ seqF S o k, labT LT x = b := by
  rw [testBit_lbits]
  constructor
  · rintro ⟨i, hi, e⟩; exact ⟨_, mem_seqF.mpr ⟨i, hi, rfl⟩, e⟩
  · rintro ⟨x, hx, e⟩; obtain ⟨i, hi, rfl⟩ := mem_seqF.mp hx; exact ⟨i, hi, e⟩

theorem stabOK_spec (S o k Tb r : Nat) (h : stabOK LT S o k Tb r = true) (i : Nat) (hi : i < r) :
    stG S o k i ∈ Gset ∧ ibits LT (stG S o k i) S (o + 1) k = Tb := by
  induction r with
  | zero => omega
  | succ r ih =>
    have h' : (stabOK LT S o k Tb r && (isGL (fld9 S (o + k + 3 + 3 * r)) && isGL (fld9 S (o + k + 4 + 3 * r)) &&
        Nat.beq (ibits LT (stG S o k r) S (o + 1) k) Tb)) = true := h
    rw [Bool.and_eq_true, Bool.and_eq_true, Bool.and_eq_true] at h'
    obtain ⟨h1, ⟨h2, h3⟩, h4⟩ := h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hi | rfl
    · exact ih h1 hi
    · exact ⟨gF_mem h2 h3, Nat.eq_of_beq_eq_true h4⟩

theorem stab_onto (hL : LabInj LT) {S o k : Nat} {g : Nat → Nat} (hlt : ∀ v, g v < 512)
    (hg : ibits LT g S (o + 1) k = lbits LT S (o + 1) k) {x : Nat} (hx : x ∈ seqF S o k) : ∃ y ∈ seqF S o k, g y = x := by
  have h1 : (lbits LT S (o + 1) k).testBit (labT LT x) = true := testBit_Tb.mpr ⟨x, hx, rfl⟩
  rw [← hg, testBit_ibits] at h1
  obtain ⟨i, hi, e⟩ := h1
  exact ⟨_, mem_seqF.mpr ⟨i, hi, rfl⟩, hL _ _ (hlt _) (seqF_lt hx) e⟩

theorem wit0_sound (hL : LabInj LT) {S o k r w : Nat} (hs : stabOK LT S o k (lbits LT S (o + 1) k) r = true)
    (h : wit0 LT S o k (lbits LT S (o + 1) k) r w = true) : WitSem LT S o k w := by
  have h' : (Nat.blt (fld9 S (w + 2)) r && Nat.blt (labT LT (stG S o k (fld9 S (w + 2)) (fld9 S w))) (labT LT (fld9 S w)) &&
      !(Nat.testBit (lbits LT S (o + 1) k) (labT LT (stG S o k (fld9 S (w + 2)) (fld9 S w))))) = true := h
  rw [Bool.and_eq_true, Bool.and_eq_true, Nat.blt_eq, Nat.blt_eq, Bool.not_eq_true'] at h'
  obtain ⟨⟨hi, hm⟩, hn⟩ := h'
  obtain ⟨hG, hstab⟩ := stabOK_spec S o k _ r hs _ hi
  set g := stG S o k (fld9 S (w + 2))
  set l := fld9 S w
  have hglt : ∀ v, g v < 512 := fun v => gF_lt _ _ _ v
  have hl : l < 512 := fld9_lt _ _
  refine ⟨g, hG, g l, Finset.mem_image_of_mem g (Finset.mem_insert_self l _), ?_, ?_⟩
  · intro hmem
    rcases Finset.mem_insert.mp hmem with e | e
    · rw [e] at hm; exact lt_irrefl _ hm
    · have : (lbits LT S (o + 1) k).testBit (labT LT (g l)) = true := testBit_Tb.mpr ⟨g l, e, rfl⟩
      rw [hn] at this; exact absurd this (by decide)
  · intro x hx hlt
    rw [keyT_lt (mem_T_lt hl hx), keyT_lt (hglt l)] at hlt
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact absurd (lt_trans hlt hm) (lt_irrefl _)
    · obtain ⟨y, hy, rfl⟩ := stab_onto hL hglt hstab hx
      exact Finset.mem_image_of_mem g (Finset.mem_insert_of_mem hy)

theorem wit1_sound (hL : LabInj LT) {S o k w : Nat} (h : wit1 LT S (lbits LT S (o + 1) k) w = true) : WitSem LT S o k w := by
  set Tb := lbits LT S (o + 1) k
  set l := fld9 S w
  set g := gF (fld9 S (w + 2)) (fld9 S (w + 3)) (fld9 S (w + 4))
  set j := fld9 S (w + 5)
  set T1 := Tb ||| (1 <<< labT LT l) with hT1
  set m := labT LT (g (fld9 S (w + 6)))
  have h' : (isGL (fld9 S (w + 3)) && isGL (fld9 S (w + 4)) &&
      Nat.beq (lbits LT S (w + 6) (j + 1) &&& T1) (lbits LT S (w + 6) (j + 1)) &&
      !(Nat.testBit T1 m) && Nat.beq ((T1 &&& (2 ^ m - 1)) &&& ibits LT g S (w + 7) j) (T1 &&& (2 ^ m - 1))) = true := by
    have e : (2 : Nat) ^ m - 1 = Nat.sub (Nat.shiftLeft 1 m) 1 := by rw [← Nat.one_shiftLeft]; rfl
    rw [e]; exact h
  rw [Bool.and_eq_true, Bool.and_eq_true, Bool.and_eq_true, Bool.and_eq_true, Bool.not_eq_true'] at h'
  obtain ⟨⟨⟨⟨hP, hQ⟩, hhb⟩, hm⟩, hlow⟩ := h'
  have hhb' := Nat.eq_of_beq_eq_true hhb
  have hlow' := Nat.eq_of_beq_eq_true hlow
  have hglt : ∀ v, g v < 512 := fun v => gF_lt _ _ _ v
  have hl : l < 512 := fld9_lt _ _
  have hT1b : ∀ b, T1.testBit b = true ↔ ∃ x ∈ insert l (seqF S o k), labT LT x = b := by
    intro b
    rw [hT1, Nat.testBit_or, Bool.or_eq_true, testBit_Tb, C3.testBit_one_shiftLeft]
    constructor
    · rintro (⟨x, hx, e⟩ | e)
      · exact ⟨x, Finset.mem_insert_of_mem hx, e⟩
      · exact ⟨l, Finset.mem_insert_self l _, e⟩
    · rintro ⟨x, hx, e⟩
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact Or.inr e
      · exact Or.inl ⟨x, hx, e⟩
  have hint : ∀ i ≤ j, fld9 S (w + 6 + i) ∈ insert l (seqF S o k) := by
    intro i hi
    have h1 : (lbits LT S (w + 6) (j + 1)).testBit (labT LT (fld9 S (w + 6 + i))) = true :=
      (testBit_lbits _ _ _ _).mpr ⟨i, by omega, rfl⟩
    rw [← hhb', Nat.testBit_and, Bool.and_eq_true] at h1
    obtain ⟨x, hx, e⟩ := (hT1b _).mp h1.2
    rw [hL _ _ (mem_T_lt hl hx) (fld9_lt _ _) e] at hx
    exact hx
  refine ⟨g, gF_mem hP hQ, g (fld9 S (w + 6)), Finset.mem_image_of_mem g (by simpa using hint 0 (Nat.zero_le _)), ?_, ?_⟩
  · intro hmem
    have : T1.testBit m = true := (hT1b m).mpr ⟨_, hmem, rfl⟩
    rw [hm] at this; exact absurd this (by decide)
  · intro x hx hlt
    rw [keyT_lt (mem_T_lt hl hx), keyT_lt (hglt _)] at hlt
    have h1 : (T1 &&& (2 ^ m - 1)).testBit (labT LT x) = true := by
      rw [Nat.testBit_and, Nat.testBit_two_pow_sub_one, Bool.and_eq_true, decide_eq_true_iff]
      exact ⟨(hT1b _).mpr ⟨x, hx, rfl⟩, hlt⟩
    rw [← hlow', Nat.testBit_and, Bool.and_eq_true, testBit_ibits] at h1
    obtain ⟨i, hi, e⟩ := h1.2
    have hx' : x = g (fld9 S (w + 6 + (i + 1))) := by
      rw [show w + 6 + (i + 1) = w + 7 + i by omega]
      exact (hL _ _ (hglt _) (mem_T_lt hl hx) e).symm
    rw [hx']
    exact Finset.mem_image_of_mem g (hint (i + 1) (by omega))

theorem witOK_sound (hL : LabInj LT) {S o k r w : Nat} (hs : stabOK LT S o k (lbits LT S (o + 1) k) r = true)
    (h : witOK LT S o k (lbits LT S (o + 1) k) r w = true) : WitSem LT S o k w := by
  unfold witOK at h
  cases hk : Nat.beq (fld9 S (Nat.add w 1)) 0
  · rw [hk, cond_false] at h; exact wit1_sound hL h
  · rw [hk, cond_true] at h; exact wit0_sound hL hs h

theorem wloop_sound (hL : LabInj LT) {S o k r : Nat} (hs : stabOK LT S o k (lbits LT S (o + 1) k) r = true) :
    ∀ n w, wloop LT S o k (lbits LT S (o + 1) k) r n w = true → WSem LT S o k n w := by
  intro n
  induction n with
  | zero => intro w _; trivial
  | succ n ih =>
    intro w h
    have h' : (witOK LT S o k (lbits LT S (o + 1) k) r w && wloop LT S o k (lbits LT S (o + 1) k) r n (wnext S w)) = true := h
    rw [Bool.and_eq_true] at h'
    exact ⟨witOK_sound hL hs h'.1, ih _ h'.2⟩

theorem nodeOK_sound (hL : LabInj LT) {S o : Nat} (h : nodeOK LT S o = true) : NodeSem LT S o := by
  have h' : (stabOK LT S o (fld9 S o) (lbits LT S (o + 1) (fld9 S o)) (fld9 S (o + fld9 S o + 1)) &&
      wloop LT S o (fld9 S o) (lbits LT S (o + 1) (fld9 S o)) (fld9 S (o + fld9 S o + 1))
        (fld9 S (o + fld9 S o + 2 + 3 * fld9 S (o + fld9 S o + 1))) (o + fld9 S o + 3 + 3 * fld9 S (o + fld9 S o + 1))) = true := h
  rw [Bool.and_eq_true] at h'
  exact wloop_sound hL h'.1 _ _ h'.2

theorem batch_sound (hL : LabInj LT) (S : Nat) : ∀ n o, batchOK LT S n o = true → BSem LT S n o := by
  intro n
  induction n with
  | zero => intro o _; trivial
  | succ n ih =>
    intro o h
    have h' : (nodeOK LT S o && batchOK LT S n (nodeEnd S o)) = true := h
    rw [Bool.and_eq_true] at h'
    exact ⟨nodeOK_sound hL h'.1, ih _ h'.2⟩

/-- **A checked witness prunes soundly**: no `keyT LT`-canonical set has `T = seq ∪ {l}` as a key-prefix. -/
theorem witSem_prune {S o k w : Nat} (h : WitSem LT S o k w) (S' : Finset ℕ) (hS' : Canon (keyT LT) Gset S') (c : ℕ) :
    S'.filter (fun x => keyT LT x < c) ≠ insert (fld9 S w) (seqF S o k) := by
  intro e
  obtain ⟨g, hg, hw⟩ := h
  exact not_canon_of_prefix (keyT LT) hg hw S' hS' c e

end KD321.C3T
