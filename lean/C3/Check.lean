module
public import R22Port.U_d41d8cd98f00
public import C3.Act
/-! # Canonicity witnesses: the kernel checker and its soundness

A certificate is a `Nat` read as 9-bit fields (`fld9 S i`).  A node record at field `o` is
`k, seq_1 … seq_k, r, (t, P, Q) × r, nW, witness × nW`: the node's points, `r` stabilizer elements of `seq`, and the
witnesses for its pruned children.  A witness is
* `l, 0, i` (*stabilizer witness*): element `i` maps `seq` onto itself (checked once per node, `stabOK`) and `l` to a
  point `m` with a smaller label that is not in `seq`;
* `l, 1, t, P, Q, j, h_0, …, h_j` (*hinted witness*): `g = (t, P, Q)` maps `h_0 ∈ T = seq ∪ {l}` to `m ∉ T`, and every
  element of `T` with a smaller label than `m` is `g h_i` for some `1 ≤ i ≤ j`, `h_i ∈ T`.
Either way `g` makes `T` lex-smaller (`WitSem`), so by `not_canon_of_prefix` no canonical set has `T` as a label-prefix.
Sets of points are bitsets of labels (`lbits`, `ibits`); every test is a few `Nat` operations on 512-bit numbers. -/
@[expose] public section
namespace C3
open RootSound

/-! ## Checker -/

/-- the group element `(t, P, Q)` for a field value `t` (0: no transpose) -/
def gF (t P Q : Nat) : Nat → Nat :=
  Nat.rec (motive := fun _ => Nat → Nat) (fun v => mulF (mulF P v) Q) (fun _ _ v => mulF (mulF P (trN v)) Q) t

/-- `∑ 2^(labN v)` over the `k` fields from `o` -/
def lbits (S o k : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0 (fun i acc => Nat.lor acc (Nat.shiftLeft 1 (labN (fld9 S (Nat.add o i))))) k

/-- `∑ 2^(labN (f v))` over the `k` fields from `o` -/
def ibits (f : Nat → Nat) (S o k : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0 (fun i acc => Nat.lor acc (Nat.shiftLeft 1 (labN (f (fld9 S (Nat.add o i)))))) k

/-- stabilizer element `i` of the node at `o` with `k` points -/
def stG (S o k i : Nat) : Nat → Nat :=
  gF (fld9 S (Nat.add (Nat.add (Nat.add o k) 2) (Nat.mul 3 i))) (fld9 S (Nat.add (Nat.add (Nat.add o k) 3) (Nat.mul 3 i)))
    (fld9 S (Nat.add (Nat.add (Nat.add o k) 4) (Nat.mul 3 i)))

/-- every listed stabilizer element is in `G` and maps the label set `Tb` of `seq` onto itself -/
def stabOK (S o k Tb r : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i acc =>
    acc && (isGL (fld9 S (Nat.add (Nat.add (Nat.add o k) 3) (Nat.mul 3 i))) &&
      isGL (fld9 S (Nat.add (Nat.add (Nat.add o k) 4) (Nat.mul 3 i))) &&
      Nat.beq (ibits (stG S o k i) S (Nat.add o 1) k) Tb)) r

/-- the hinted witness at `w` (`Tb` = label set of `seq`) -/
def wit1 (S Tb w : Nat) : Bool :=
  let T1 := Nat.lor Tb (Nat.shiftLeft 1 (labN (fld9 S w)))
  let g := gF (fld9 S (Nat.add w 2)) (fld9 S (Nat.add w 3)) (fld9 S (Nat.add w 4))
  let j := fld9 S (Nat.add w 5)
  let hb := lbits S (Nat.add w 6) (Nat.add j 1)
  let m := labN (g (fld9 S (Nat.add w 6)))
  let Tlow := Nat.land T1 (Nat.sub (Nat.shiftLeft 1 m) 1)
  isGL (fld9 S (Nat.add w 3)) && isGL (fld9 S (Nat.add w 4)) && Nat.beq (Nat.land hb T1) hb &&
    !(Nat.testBit T1 m) && Nat.beq (Nat.land Tlow (ibits g S (Nat.add w 7) j)) Tlow

/-- the stabilizer witness at `w` -/
def wit0 (S o k Tb r w : Nat) : Bool :=
  let i := fld9 S (Nat.add w 2)
  let m := labN (stG S o k i (fld9 S w))
  Nat.blt i r && Nat.blt m (labN (fld9 S w)) && !(Nat.testBit Tb m)

def witOK (S o k Tb r w : Nat) : Bool :=
  cond (Nat.beq (fld9 S (Nat.add w 1)) 0) (wit0 S o k Tb r w) (wit1 S Tb w)

/-- the field after the witness at `w` -/
def wnext (S w : Nat) : Nat :=
  cond (Nat.beq (fld9 S (Nat.add w 1)) 0) (Nat.add w 3) (Nat.add (Nat.add w 7) (fld9 S (Nat.add w 5)))

def wloop (S o k Tb r n : Nat) : Nat → Bool :=
  Nat.rec (motive := fun _ => Nat → Bool) (fun _ => true) (fun _ ih w => witOK S o k Tb r w && ih (wnext S w)) n

def wend (S n : Nat) : Nat → Nat :=
  Nat.rec (motive := fun _ => Nat → Nat) (fun w => w) (fun _ ih w => ih (wnext S w)) n

def nodeOK (S o : Nat) : Bool :=
  let k := fld9 S o
  let r := fld9 S (Nat.add (Nat.add o k) 1)
  let Tb := lbits S (Nat.add o 1) k
  stabOK S o k Tb r &&
    wloop S o k Tb r (fld9 S (Nat.add (Nat.add (Nat.add o k) 2) (Nat.mul 3 r))) (Nat.add (Nat.add (Nat.add o k) 3) (Nat.mul 3 r))

def nodeEnd (S o : Nat) : Nat :=
  let k := fld9 S o
  let r := fld9 S (Nat.add (Nat.add o k) 1)
  wend S (fld9 S (Nat.add (Nat.add (Nat.add o k) 2) (Nat.mul 3 r))) (Nat.add (Nat.add (Nat.add o k) 3) (Nat.mul 3 r))

/-- `n` node records from field `o` -/
def batchOK (S n : Nat) : Nat → Bool :=
  Nat.rec (motive := fun _ => Nat → Bool) (fun _ => true) (fun _ ih o => nodeOK S o && ih (nodeEnd S o)) n

/-! ## Semantics -/

/-- the node's points -/
def seqF (S o k : Nat) : Finset ℕ := (Finset.range k).image (fun i => fld9 S (o + 1 + i))

/-- the witness at `w` holds: some `g ∈ G` makes `T = seq ∪ {l}` lex-smaller in the label order -/
def WitSem (S o k w : Nat) : Prop :=
  ∃ g ∈ Gset, LexLt labK ((insert (fld9 S w) (seqF S o k)).image g) (insert (fld9 S w) (seqF S o k))

def WSem (S o k : Nat) : Nat → Nat → Prop
  | 0, _ => True
  | n + 1, w => WitSem S o k w ∧ WSem S o k n (wnext S w)

def NodeSem (S o : Nat) : Prop :=
  WSem S o (fld9 S o) (fld9 S (o + fld9 S o + 2 + 3 * fld9 S (o + fld9 S o + 1)))
    (o + fld9 S o + 3 + 3 * fld9 S (o + fld9 S o + 1))

def BSem (S : Nat) : Nat → Nat → Prop
  | 0, _ => True
  | n + 1, o => NodeSem S o ∧ BSem S n (nodeEnd S o)

/-! ## Soundness -/

theorem gF_eq (t P Q : Nat) : gF t P Q = actN (t != 0) P Q := by
  funext v
  cases t
  · rfl
  · rfl

theorem gF_mem {t P Q : Nat} (hP : isGL P = true) (hQ : isGL Q = true) : gF t P Q ∈ Gset :=
  ⟨_, P, Q, hP, hQ, gF_eq t P Q⟩

theorem gF_lt (t P Q v : Nat) : gF t P Q v < 512 := by
  rw [gF_eq]; exact actN_lt _ _ _ _

theorem lbits_succ (S o k : Nat) : lbits S o (k + 1) = lbits S o k ||| (1 <<< labN (fld9 S (o + k))) := rfl
theorem ibits_succ (f : Nat → Nat) (S o k : Nat) :
    ibits f S o (k + 1) = ibits f S o k ||| (1 <<< labN (f (fld9 S (o + k)))) := rfl

theorem testBit_one_shiftLeft (n b : Nat) : (1 <<< n).testBit b = true ↔ n = b := by
  rw [Nat.one_shiftLeft, Nat.testBit_two_pow, decide_eq_true_iff]

theorem testBit_ibits (f : Nat → Nat) (S o k b : Nat) :
    (ibits f S o k).testBit b = true ↔ ∃ i < k, labN (f (fld9 S (o + i))) = b := by
  induction k with
  | zero =>
    constructor
    · intro h; exact absurd h (by rw [show ibits f S o 0 = 0 from rfl, Nat.zero_testBit]; decide)
    · rintro ⟨i, hi, -⟩; omega
  | succ k ih =>
    rw [ibits_succ, Nat.testBit_or, Bool.or_eq_true, ih, testBit_one_shiftLeft]
    constructor
    · rintro (⟨i, hi, e⟩ | e)
      · exact ⟨i, by omega, e⟩
      · exact ⟨k, by omega, e⟩
    · rintro ⟨i, hi, e⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hi | rfl
      · exact Or.inl ⟨i, hi, e⟩
      · exact Or.inr e

theorem lbits_eq (S o k : Nat) : lbits S o k = ibits id S o k := by
  induction k with
  | zero => rfl
  | succ k ih => rw [lbits_succ, ibits_succ, ih]; rfl

theorem testBit_lbits (S o k b : Nat) :
    (lbits S o k).testBit b = true ↔ ∃ i < k, labN (fld9 S (o + i)) = b := by
  rw [lbits_eq, testBit_ibits]; rfl

theorem mem_seqF {S o k x : Nat} : x ∈ seqF S o k ↔ ∃ i < k, fld9 S (o + 1 + i) = x := by
  simp only [seqF, Finset.mem_image, Finset.mem_range]

theorem seqF_lt {S o k x : Nat} (h : x ∈ seqF S o k) : x < 512 := by
  obtain ⟨i, -, rfl⟩ := mem_seqF.mp h; exact fld9_lt _ _

/-- the label set of `seq` -/
theorem testBit_Tb {S o k b : Nat} : (lbits S (o + 1) k).testBit b = true ↔ ∃ x ∈ seqF S o k, labN x = b := by
  rw [testBit_lbits]
  constructor
  · rintro ⟨i, hi, e⟩; exact ⟨_, mem_seqF.mpr ⟨i, hi, rfl⟩, e⟩
  · rintro ⟨x, hx, e⟩; obtain ⟨i, hi, rfl⟩ := mem_seqF.mp hx; exact ⟨i, hi, e⟩

theorem stabOK_spec (S o k Tb r : Nat) (h : stabOK S o k Tb r = true) (i : Nat) (hi : i < r) :
    stG S o k i ∈ Gset ∧ ibits (stG S o k i) S (o + 1) k = Tb := by
  induction r with
  | zero => omega
  | succ r ih =>
    have h' : (stabOK S o k Tb r && (isGL (fld9 S (o + k + 3 + 3 * r)) && isGL (fld9 S (o + k + 4 + 3 * r)) &&
        Nat.beq (ibits (stG S o k r) S (o + 1) k) Tb)) = true := h
    rw [Bool.and_eq_true, Bool.and_eq_true, Bool.and_eq_true] at h'
    obtain ⟨h1, ⟨h2, h3⟩, h4⟩ := h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hi | rfl
    · exact ih h1 hi
    · exact ⟨gF_mem h2 h3, Nat.eq_of_beq_eq_true h4⟩

/-- a stabilizer element maps `seq` onto itself -/
theorem stab_onto {S o k : Nat} {g : Nat → Nat} (hlt : ∀ v, g v < 512) (hg : ibits g S (o + 1) k = lbits S (o + 1) k)
    {x : Nat} (hx : x ∈ seqF S o k) : ∃ y ∈ seqF S o k, g y = x := by
  have h1 : (lbits S (o + 1) k).testBit (labN x) = true := testBit_Tb.mpr ⟨x, hx, rfl⟩
  rw [← hg, testBit_ibits] at h1
  obtain ⟨i, hi, e⟩ := h1
  exact ⟨_, mem_seqF.mpr ⟨i, hi, rfl⟩, labN_inj (hlt _) (seqF_lt hx) e⟩

theorem mem_T_lt {S o k l x : Nat} (hl : l < 512) (hx : x ∈ insert l (seqF S o k)) : x < 512 := by
  rcases Finset.mem_insert.mp hx with rfl | hx
  · exact hl
  · exact seqF_lt hx

theorem wit0_sound {S o k r w : Nat} (hs : stabOK S o k (lbits S (o + 1) k) r = true)
    (h : wit0 S o k (lbits S (o + 1) k) r w = true) : WitSem S o k w := by
  have h' : (Nat.blt (fld9 S (w + 2)) r && Nat.blt (labN (stG S o k (fld9 S (w + 2)) (fld9 S w))) (labN (fld9 S w)) &&
      !(Nat.testBit (lbits S (o + 1) k) (labN (stG S o k (fld9 S (w + 2)) (fld9 S w))))) = true := h
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
    · have : (lbits S (o + 1) k).testBit (labN (g l)) = true := testBit_Tb.mpr ⟨g l, e, rfl⟩
      rw [hn] at this; exact absurd this (by decide)
  · intro x hx hlt
    rw [labK_lt (mem_T_lt hl hx), labK_lt (hglt l)] at hlt
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact absurd (lt_trans hlt hm) (lt_irrefl _)
    · obtain ⟨y, hy, rfl⟩ := stab_onto hglt hstab hx
      exact Finset.mem_image_of_mem g (Finset.mem_insert_of_mem hy)

theorem wit1_sound {S o k w : Nat} (h : wit1 S (lbits S (o + 1) k) w = true) : WitSem S o k w := by
  set Tb := lbits S (o + 1) k
  set l := fld9 S w
  set g := gF (fld9 S (w + 2)) (fld9 S (w + 3)) (fld9 S (w + 4))
  set j := fld9 S (w + 5)
  set T1 := Tb ||| (1 <<< labN l) with hT1
  set m := labN (g (fld9 S (w + 6)))
  have h' : (isGL (fld9 S (w + 3)) && isGL (fld9 S (w + 4)) && Nat.beq (lbits S (w + 6) (j + 1) &&& T1) (lbits S (w + 6) (j + 1)) &&
      !(Nat.testBit T1 m) && Nat.beq ((T1 &&& (2 ^ m - 1)) &&& ibits g S (w + 7) j) (T1 &&& (2 ^ m - 1))) = true := by
    have e : (2 : Nat) ^ m - 1 = Nat.sub (Nat.shiftLeft 1 m) 1 := by rw [← Nat.one_shiftLeft]; rfl
    rw [e]; exact h
  rw [Bool.and_eq_true, Bool.and_eq_true, Bool.and_eq_true, Bool.and_eq_true, Bool.not_eq_true'] at h'
  obtain ⟨⟨⟨⟨hP, hQ⟩, hhb⟩, hm⟩, hlow⟩ := h'
  have hhb' := Nat.eq_of_beq_eq_true hhb
  have hlow' := Nat.eq_of_beq_eq_true hlow
  have hglt : ∀ v, g v < 512 := fun v => gF_lt _ _ _ v
  have hl : l < 512 := fld9_lt _ _
  -- the label set of T = seq ∪ {l}
  have hT1b : ∀ b, T1.testBit b = true ↔ ∃ x ∈ insert l (seqF S o k), labN x = b := by
    intro b
    rw [hT1, Nat.testBit_or, Bool.or_eq_true, testBit_Tb, testBit_one_shiftLeft]
    constructor
    · rintro (⟨x, hx, e⟩ | e)
      · exact ⟨x, Finset.mem_insert_of_mem hx, e⟩
      · exact ⟨l, Finset.mem_insert_self l _, e⟩
    · rintro ⟨x, hx, e⟩
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact Or.inr e
      · exact Or.inl ⟨x, hx, e⟩
  -- every hint lies in T
  have hint : ∀ i ≤ j, fld9 S (w + 6 + i) ∈ insert l (seqF S o k) := by
    intro i hi
    have h1 : (lbits S (w + 6) (j + 1)).testBit (labN (fld9 S (w + 6 + i))) = true :=
      (testBit_lbits _ _ _ _).mpr ⟨i, by omega, rfl⟩
    rw [← hhb', Nat.testBit_and, Bool.and_eq_true] at h1
    obtain ⟨x, hx, e⟩ := (hT1b _).mp h1.2
    rw [labN_inj (mem_T_lt hl hx) (fld9_lt _ _) e] at hx
    exact hx
  refine ⟨g, gF_mem hP hQ, g (fld9 S (w + 6)), Finset.mem_image_of_mem g (by simpa using hint 0 (Nat.zero_le _)), ?_, ?_⟩
  · intro hmem
    have : T1.testBit m = true := (hT1b m).mpr ⟨_, hmem, rfl⟩
    rw [hm] at this; exact absurd this (by decide)
  · intro x hx hlt
    rw [labK_lt (mem_T_lt hl hx), labK_lt (hglt _)] at hlt
    have h1 : (T1 &&& (2 ^ m - 1)).testBit (labN x) = true := by
      rw [Nat.testBit_and, Nat.testBit_two_pow_sub_one, Bool.and_eq_true, decide_eq_true_iff]
      exact ⟨(hT1b _).mpr ⟨x, hx, rfl⟩, hlt⟩
    rw [← hlow', Nat.testBit_and, Bool.and_eq_true, testBit_ibits] at h1
    obtain ⟨i, hi, e⟩ := h1.2
    have hx' : x = g (fld9 S (w + 6 + (i + 1))) := by
      rw [show w + 6 + (i + 1) = w + 7 + i by omega]
      exact (labN_inj (hglt _) (mem_T_lt hl hx) e).symm
    rw [hx']
    exact Finset.mem_image_of_mem g (hint (i + 1) (by omega))

theorem witOK_sound {S o k r w : Nat} (hs : stabOK S o k (lbits S (o + 1) k) r = true)
    (h : witOK S o k (lbits S (o + 1) k) r w = true) : WitSem S o k w := by
  unfold witOK at h
  cases hk : Nat.beq (fld9 S (Nat.add w 1)) 0
  · rw [hk, cond_false] at h; exact wit1_sound h
  · rw [hk, cond_true] at h; exact wit0_sound hs h

theorem wloop_sound {S o k r : Nat} (hs : stabOK S o k (lbits S (o + 1) k) r = true) :
    ∀ n w, wloop S o k (lbits S (o + 1) k) r n w = true → WSem S o k n w := by
  intro n
  induction n with
  | zero => intro w _; trivial
  | succ n ih =>
    intro w h
    have h' : (witOK S o k (lbits S (o + 1) k) r w && wloop S o k (lbits S (o + 1) k) r n (wnext S w)) = true := h
    rw [Bool.and_eq_true] at h'
    exact ⟨witOK_sound hs h'.1, ih _ h'.2⟩

theorem nodeOK_sound {S o : Nat} (h : nodeOK S o = true) : NodeSem S o := by
  have h' : (stabOK S o (fld9 S o) (lbits S (o + 1) (fld9 S o)) (fld9 S (o + fld9 S o + 1)) &&
      wloop S o (fld9 S o) (lbits S (o + 1) (fld9 S o)) (fld9 S (o + fld9 S o + 1))
        (fld9 S (o + fld9 S o + 2 + 3 * fld9 S (o + fld9 S o + 1))) (o + fld9 S o + 3 + 3 * fld9 S (o + fld9 S o + 1))) = true := h
  rw [Bool.and_eq_true] at h'
  exact wloop_sound h'.1 _ _ h'.2

/-- **Batch soundness.** -/
theorem batch_sound (S : Nat) : ∀ n o, batchOK S n o = true → BSem S n o := by
  intro n
  induction n with
  | zero => intro o _; trivial
  | succ n ih =>
    intro o h
    have h' : (nodeOK S o && batchOK S n (nodeEnd S o)) = true := h
    rw [Bool.and_eq_true] at h'
    exact ⟨nodeOK_sound h'.1, ih _ h'.2⟩

/-- **A checked witness prunes soundly**: no canonical set has `T = seq ∪ {l}` as a label-prefix. -/
theorem witSem_prune {S o k w : Nat} (h : WitSem S o k w) (S' : Finset ℕ) (hS' : Canon labK Gset S') (c : ℕ) :
    S'.filter (fun x => labK x < c) ≠ insert (fld9 S w) (seqF S o k) := by
  intro e
  obtain ⟨g, hg, hw⟩ := h
  exact not_canon_of_prefix labK hg hw S' hS' c e

end C3
