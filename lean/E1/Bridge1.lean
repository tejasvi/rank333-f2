module
public import R22Port.U_d41d8cd98f00
public import E1.Block
public import RT.Sound
/-! # From decompositions to E1's multiplicity vector: cosets and slot validity

The coset IP of the subspace `E` (point mask `Em`): label `l < N` is the coset `vt l + E` (`vt l = VT[l]`, 9-bit fields).
For a decomposition with first factors `av s`, `xOf l` counts the factors outside `E` in coset `l`.

* `labM_testBit`: E1's label mask of a row-table entry is the set of labels whose representative lies in the row's
  subspace (given the label planes `LB` of the IP).
* `slot_valid`: every slot of the IP's slot table holds for `xOf` — from the row's `Fact` (the verified row table), with
  exactly `R` factors outside `E`. -/
@[expose] public section
namespace E1S
open Finset RootSound
set_option exponentiation.threshold 600

/-- coset representative of label `l` -/
def vt (VT l : ℕ) : ℕ := VT / 2 ^ (9 * l) % 512

theorem vt_lt (VT l : ℕ) : vt VT l < 512 := Nat.mod_lt _ (by norm_num)

/-! ## Label planes -/

/-- the label planes `LB` (128 bits each) carry bit `i` of every representative -/
def Planes (LB VT N : ℕ) : Prop := ∀ i < 9, ∀ l < 127, LB.testBit (128 * i + l) = (decide (l < N) && (vt VT l).testBit i)

theorem lpar_testBit (LB VT N X : ℕ) (hP : Planes LB VT N) (l : ℕ) (hl : l < 127) :
    (E1.lpar LB X).testBit l = (decide (l < N) && S5.xorBits (vt VT l &&& X) 9) := by
  suffices h : ∀ k ≤ 9, (Nat.rec (motive := fun _ => ℕ) 0
      (fun i acc => cond (Nat.testBit X i) (Nat.xor acc (Nat.land (Nat.shiftRight LB (Nat.mul 128 i)) E1.M127)) acc) k :
        ℕ).testBit l = (decide (l < N) && S5.xorBits (vt VT l &&& X) k) from h 9 le_rfl
  intro k hk
  induction k with
  | zero => simp [S5.xorBits]
  | succ k ih =>
    show (cond (Nat.testBit X k) (Nat.xor _ (Nat.land (Nat.shiftRight LB (Nat.mul 128 k)) E1.M127)) _).testBit l = _
    have hb : (Nat.land (Nat.shiftRight LB (Nat.mul 128 k)) E1.M127).testBit l = (decide (l < N) && (vt VT l).testBit k) := by
      show ((LB >>> (128 * k)) &&& E1.M127).testBit l = _
      rw [Nat.testBit_and, Nat.testBit_shiftRight, M127_eq, Nat.testBit_two_pow_sub_one, hP k (by omega) l hl]
      simp [hl]
    show _ = (decide (l < N) && xor (S5.xorBits (vt VT l &&& X) k) ((vt VT l &&& X).testBit k))
    cases hx : X.testBit k
    · rw [cond_false, ih (by omega), Nat.testBit_and, hx]; simp
    · rw [cond_true, show Nat.xor _ _ = _ ^^^ _ from rfl, Nat.testBit_xor, ih (by omega), hb, Nat.testBit_and, hx]
      cases decide (l < N) <;> simp

theorem xorBits_par (w : ℕ) (hw : w < 512) : S5.xorBits w 9 = BC5.par w := (S5.par_eq w hw).symm

/-- E1's label mask: label `l` is in the row of entry `e` iff its representative lies in the row's subspace -/
theorem labM_testBit (LB VT N e : ℕ) (hP : Planes LB VT N) (l : ℕ) (hl : l < N) (hN : N ≤ 127) :
    (E1.labM LB e).testBit l = (RT.dualM e).testBit (vt VT l) := by
  have hl' : l < 127 := by omega
  suffices h : ∀ k, (Nat.rec (motive := fun _ => ℕ) E1.M127
      (fun j acc => Nat.land acc (Nat.xor E1.M127 (E1.lpar LB (RT.eV e (Nat.add (RT.eD e) j))))) k : ℕ).testBit l =
      decide (∀ j < k, BC5.par (vt VT l &&& RT.eV e (RT.eD e + j)) = false) by
    rw [show E1.labM LB e = Nat.rec (motive := fun _ => ℕ) E1.M127
      (fun j acc => Nat.land acc (Nat.xor E1.M127 (E1.lpar LB (RT.eV e (Nat.add (RT.eD e) j))))) (Nat.sub 9 (RT.eD e)) from rfl,
      h, RT.dualM]
    have := RT.kerM_testBit (fun j => RT.eV e (RT.eD e + j)) (fun j => Nat.mod_lt _ (by norm_num)) (9 - RT.eD e)
      (vt VT l) (vt_lt VT l)
    cases hk : (RT.kerM (fun j => RT.eV e (RT.eD e + j)) (9 - RT.eD e)).testBit (vt VT l)
    · rw [hk] at this; simp only [Bool.false_eq_true, false_iff] at this
      simp only [decide_eq_false_iff_not]; exact this
    · rw [hk] at this; simp only [true_iff] at this
      simp only [decide_eq_true_eq]; exact this
  intro k
  induction k with
  | zero => rw [show (Nat.rec (motive := fun _ => ℕ) E1.M127 _ 0 : ℕ) = E1.M127 from rfl, M127_eq, Nat.testBit_two_pow_sub_one]
            simp [hl']
  | succ k ih =>
    show (Nat.land _ (Nat.xor E1.M127 (E1.lpar LB (RT.eV e (Nat.add (RT.eD e) k))))).testBit l = _
    rw [show Nat.land _ _ = _ &&& _ from rfl, Nat.testBit_and, ih, show Nat.xor E1.M127 _ = E1.M127 ^^^ _ from rfl,
      Nat.testBit_xor, M127_eq, Nat.testBit_two_pow_sub_one, lpar_testBit LB VT N _ hP l hl',
      xorBits_par _ (lt_of_le_of_lt Nat.and_le_left (vt_lt VT l))]
    simp only [hl', hl, decide_true, Bool.true_and, Nat.add_eq]
    have hiff : (∀ j < k + 1, BC5.par (vt VT l &&& RT.eV e (RT.eD e + j)) = false) ↔
        ((∀ j < k, BC5.par (vt VT l &&& RT.eV e (RT.eD e + j)) = false) ∧
          BC5.par (vt VT l &&& RT.eV e (RT.eD e + k)) = false) := by
      constructor
      · intro h; exact ⟨fun j hj => h j (by omega), h k (by omega)⟩
      · rintro ⟨h1, h2⟩ j hj
        rcases (by omega : j < k ∨ j = k) with h | h
        · exact h1 j h
        · subst h; exact h2
    rw [decide_eq_decide.mpr hiff, Bool.decide_and]
    cases BC5.par (vt VT l &&& RT.eV e (RT.eD e + k)) <;> simp

/-! ## Cosets of `E` -/

/-- `E` (point mask `Em`) is a subspace, the representatives lie in distinct non-zero cosets, and they cover every
point outside `E` -/
structure Cosets (Em VT N : ℕ) : Prop where
  zero : Em.testBit 0 = true
  xor_mem : ∀ a < 512, ∀ b < 512, Em.testBit a = true → Em.testBit b = true → Em.testBit (a ^^^ b) = true
  rep_out : ∀ l < N, Em.testBit (vt VT l) = false
  rep_dist : ∀ l < N, ∀ l' < N, l ≠ l' → Em.testBit (vt VT l ^^^ vt VT l') = false
  cover : ∀ a < 512, Em.testBit a = false → ∃ l < N, Em.testBit (a ^^^ vt VT l) = true

theorem coset_unique {Em VT N : ℕ} (hC : Cosets Em VT N) (a : ℕ) (ha : a < 512) (l l' : ℕ) (hl : l < N) (hl' : l' < N)
    (h1 : Em.testBit (a ^^^ vt VT l) = true) (h2 : Em.testBit (a ^^^ vt VT l') = true) : l = l' := by
  by_contra hne
  have := hC.xor_mem _ (RootSound.TransBits.xor_lt _ _ ha (vt_lt VT l)) _
    (RootSound.TransBits.xor_lt _ _ ha (vt_lt VT l')) h1 h2
  rw [show (a ^^^ vt VT l) ^^^ (a ^^^ vt VT l') = vt VT l ^^^ vt VT l' by
    rw [Nat.xor_assoc, ← Nat.xor_assoc (vt VT l), Nat.xor_comm (vt VT l) a, Nat.xor_assoc, ← Nat.xor_assoc a a,
      Nat.xor_self, Nat.zero_xor]] at this
  rw [hC.rep_dist l hl l' hl' hne] at this; exact absurd this (by simp)

/-- the domain functionals vanish on `E` -/
def DomPerp (DOM Em : ℕ) : Prop := ∀ X < 512, DOM.testBit X = true → ∀ a < 512, Em.testBit a = true → BC5.par (a &&& X) = false

theorem par_coset {DOM Em : ℕ} (hD : DomPerp DOM Em) (X : ℕ) (hX : X < 512) (hXd : DOM.testBit X = true) (a w : ℕ)
    (ha : a < 512) (hw : w < 512) (h : Em.testBit (a ^^^ w) = true) : BC5.par (a &&& X) = BC5.par (w &&& X) := by
  have e : a = w ^^^ (a ^^^ w) := by rw [← Nat.xor_assoc, Nat.xor_comm w a, Nat.xor_assoc, Nat.xor_self, Nat.xor_zero]
  have hp := RT.par_xor w (a ^^^ w) X hw (RootSound.TransBits.xor_lt _ _ ha hw)
  rw [← e, hD X hX hXd _ (RootSound.TransBits.xor_lt _ _ ha hw) h] at hp
  rw [hp]; simp

/-! ## The multiplicity vector of a decomposition -/

section dec
variable {n : ℕ} (av : Fin n → ℕ)

/-- copies of coset label `l` among the first factors outside `E` -/
noncomputable def xOf (Em VT N : ℕ) (l : ℕ) : ℕ :=
  if l < N then (univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ Em.testBit (av s ^^^ vt VT l) = true)).card
  else 0

theorem xOf_ge (Em VT N l : ℕ) (hl : N ≤ l) : xOf av Em VT N l = 0 := by unfold xOf; rw [if_neg (by omega)]

/-- labels in `M` (below `N`) collect exactly the factors outside `E` whose coset is in `M` -/
theorem msum_xOf (Em VT N M : ℕ) (hN : N ≤ 127) (hC : Cosets Em VT N) (hav : ∀ s, av s < 512) :
    msum (xOf av Em VT N) M =
      (univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ ∃ l < N, M.testBit l = true ∧
        Em.testBit (av s ^^^ vt VT l) = true)).card := by
  unfold msum
  have e1 : ∀ l ∈ range 127, (if M.testBit l = true then xOf av Em VT N l else 0) =
      ∑ s : Fin n, (if l < N ∧ M.testBit l = true ∧ Em.testBit (av s) = false ∧ Em.testBit (av s ^^^ vt VT l) = true
        then 1 else 0) := by
    intro l _
    unfold xOf
    rw [Finset.card_filter]
    by_cases h1 : M.testBit l = true <;> by_cases h2 : l < N <;> simp [h1, h2]
  rw [Finset.sum_congr rfl e1, Finset.sum_comm, Finset.card_filter]
  apply Finset.sum_congr rfl; intro s _
  by_cases hs : Em.testBit (av s) = false ∧ ∃ l < N, M.testBit l = true ∧ Em.testBit (av s ^^^ vt VT l) = true
  · obtain ⟨h0, l, hl, hM, hE⟩ := hs
    rw [if_pos ⟨h0, l, hl, hM, hE⟩, Finset.sum_eq_single l]
    · rw [if_pos ⟨hl, hM, h0, hE⟩]
    · intro l' _ hne
      rw [if_neg]
      rintro ⟨hl', _, _, hE'⟩
      exact hne (coset_unique hC (av s) (hav s) l' l hl' hl hE' hE)
    · intro h; exact absurd (Finset.mem_range.mpr (by omega)) h
  · rw [if_neg hs]
    apply Finset.sum_eq_zero; intro l _
    rw [if_neg]
    rintro ⟨hl, hM, h0, hE⟩; exact hs ⟨h0, l, hl, hM, hE⟩

theorem sum_xOf (Em VT N : ℕ) (hN : N ≤ 127) (hC : Cosets Em VT N) (hav : ∀ s, av s < 512) :
    ∑ l ∈ range 127, xOf av Em VT N l = (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card := by
  have := msum_xOf av Em VT N (2 ^ 127 - 1) hN hC hav
  unfold msum at this
  rw [show (∑ l ∈ range 127, (if (2 ^ 127 - 1 : ℕ).testBit l = true then xOf av Em VT N l else 0)) =
    ∑ l ∈ range 127, xOf av Em VT N l from Finset.sum_congr rfl (fun l hl => by
      rw [Nat.testBit_two_pow_sub_one, if_pos (by simpa using hl)])] at this
  rw [this]
  apply congrArg Finset.card
  apply Finset.filter_congr
  intro s _
  constructor
  · exact fun h => h.1
  · intro h0
    obtain ⟨l, hl, hE⟩ := hC.cover (av s) (hav s) h0
    exact ⟨h0, l, hl, by rw [Nat.testBit_two_pow_sub_one]; simp; omega, hE⟩

end dec

/-! ## Slot validity -/

/-- the reversed planes -/
def PlanesR (LB LBR : ℕ) : Prop := ∀ i < 9, ∀ j < 127, LBR.testBit (128 * i + j) = LB.testBit (128 * i + (126 - j))

/-- bit `j` of `lpar P X`, as a fold -/
def lparB (P X j : ℕ) : Bool := Nat.rec (motive := fun _ => Bool) false (fun i acc => xor acc (X.testBit i && P.testBit (128 * i + j))) 9

theorem lpar_bit (P X j : ℕ) (hj : j < 127) : (E1.lpar P X).testBit j = lparB P X j := by
  suffices h : ∀ k, (Nat.rec (motive := fun _ => ℕ) 0
      (fun i acc => cond (Nat.testBit X i) (Nat.xor acc (Nat.land (Nat.shiftRight P (Nat.mul 128 i)) E1.M127)) acc) k :
        ℕ).testBit j = Nat.rec (motive := fun _ => Bool) false (fun i acc => xor acc (X.testBit i && P.testBit (128 * i + j))) k
    from h 9
  intro k
  induction k with
  | zero => simp
  | succ k ih =>
    show (cond (Nat.testBit X k) (Nat.xor _ (Nat.land (Nat.shiftRight P (Nat.mul 128 k)) E1.M127)) _).testBit j =
      xor (Nat.rec (motive := fun _ => Bool) false (fun i acc => xor acc (X.testBit i && P.testBit (128 * i + j))) k)
        (X.testBit k && P.testBit (128 * k + j))
    have hb : (Nat.land (Nat.shiftRight P (Nat.mul 128 k)) E1.M127).testBit j = P.testBit (128 * k + j) := by
      show ((P >>> (128 * k)) &&& E1.M127).testBit j = _
      rw [Nat.testBit_and, Nat.testBit_shiftRight, M127_eq, Nat.testBit_two_pow_sub_one]; simp [hj]
    cases hx : X.testBit k
    · rw [cond_false, ih]; simp
    · rw [cond_true, show Nat.xor _ _ = _ ^^^ _ from rfl, Nat.testBit_xor, ih, hb]; simp

theorem labM_bit (P e j : ℕ) (hj : j < 127) : (E1.labM P e).testBit j =
    decide (∀ k < 9 - RT.eD e, lparB P (RT.eV e (RT.eD e + k)) j = false) := by
  suffices h : ∀ m, (Nat.rec (motive := fun _ => ℕ) E1.M127
      (fun k acc => Nat.land acc (Nat.xor E1.M127 (E1.lpar P (RT.eV e (Nat.add (RT.eD e) k))))) m : ℕ).testBit j =
      decide (∀ k < m, lparB P (RT.eV e (RT.eD e + k)) j = false) from h _
  intro m
  induction m with
  | zero => rw [show (Nat.rec (motive := fun _ => ℕ) E1.M127 _ 0 : ℕ) = E1.M127 from rfl, M127_eq,
      Nat.testBit_two_pow_sub_one]; simp [hj]
  | succ m ih =>
    show (Nat.land _ (Nat.xor E1.M127 (E1.lpar P (RT.eV e (Nat.add (RT.eD e) m))))).testBit j = _
    rw [show Nat.land _ _ = _ &&& _ from rfl, Nat.testBit_and, ih, show Nat.xor E1.M127 _ = E1.M127 ^^^ _ from rfl,
      Nat.testBit_xor, M127_eq, Nat.testBit_two_pow_sub_one, lpar_bit P _ j hj]
    simp only [hj, decide_true, Bool.true_and, Nat.add_eq]
    have hiff : (∀ k < m + 1, lparB P (RT.eV e (RT.eD e + k)) j = false) ↔
        ((∀ k < m, lparB P (RT.eV e (RT.eD e + k)) j = false) ∧ lparB P (RT.eV e (RT.eD e + m)) j = false) := by
      constructor
      · intro h; exact ⟨fun k hk => h k (by omega), h m (by omega)⟩
      · rintro ⟨h1, h2⟩ k hk
        rcases (by omega : k < m ∨ k = m) with h | h
        · exact h1 k h
        · subst h; exact h2
    rw [decide_eq_decide.mpr hiff, Bool.decide_and]
    cases lparB P (RT.eV e (RT.eD e + m)) j <;> simp

theorem labM_rev (LB LBR e : ℕ) (hR : PlanesR LB LBR) (j : ℕ) (hj : j < 127) :
    (E1.labM LBR e).testBit j = (E1.labM LB e).testBit (126 - j) := by
  rw [labM_bit LBR e j hj, labM_bit LB e (126 - j) (by omega)]
  have : ∀ X, lparB LBR X j = lparB LB X (126 - j) := by
    intro X; unfold lparB
    suffices h : ∀ k ≤ 9, (Nat.rec (motive := fun _ => Bool) false (fun i acc => xor acc (X.testBit i && LBR.testBit (128 * i + j))) k) =
      (Nat.rec (motive := fun _ => Bool) false (fun i acc => xor acc (X.testBit i && LB.testBit (128 * i + (126 - j)))) k) from h 9 le_rfl
    intro k hk
    induction k with
    | zero => rfl
    | succ k ih =>
      show xor _ (X.testBit k && LBR.testBit (128 * k + j)) = xor _ (X.testBit k && LB.testBit (128 * k + (126 - j)))
      rw [ih (by omega), hR k (by omega) j hj]
  simp only [this]

theorem labM_lt (P e : ℕ) : E1.labM P e < 2 ^ 127 := by
  apply Nat.lt_pow_two_of_testBit
  intro j hj
  suffices h : ∀ m, (Nat.rec (motive := fun _ => ℕ) E1.M127
      (fun k acc => Nat.land acc (Nat.xor E1.M127 (E1.lpar P (RT.eV e (Nat.add (RT.eD e) k))))) m : ℕ).testBit j = false from h _
  intro m
  induction m with
  | zero => rw [show (Nat.rec (motive := fun _ => ℕ) E1.M127 _ 0 : ℕ) = E1.M127 from rfl, M127_eq,
      Nat.testBit_two_pow_sub_one]; simp; omega
  | succ m ih =>
    show (Nat.land _ _).testBit j = false
    rw [show Nat.land _ _ = _ &&& _ from rfl, Nat.testBit_and, ih]; simp

/-- **Slot validity.** A verified row-table entry whose dual basis lies in `E^⊥` gives a slot that holds for the
multiplicity vector of every decomposition with exactly `R` first factors outside `E`. -/
theorem slot_valid (LB LBR VT N Em DOM R : ℕ) (hN : N ≤ 127) (hP : Planes LB VT N) (hPR : PlanesR LB LBR)
    (hC : Cosets Em VT N) (hD : DomPerp DOM Em) (e : ℕ) (hfact : RT.Fact (RT.dualM e) (R - RT.eCap e))
    (hin : E1.dualIn DOM e = true) {n : ℕ} (av : Fin n → ℕ) (b c : Fin n → M3) (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c)
    (hR : (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = R) :
    SlotV (xOf av Em VT N) (E1.slot LB LBR e) := by
  have hm := labM_lt LB e
  have hmr := labM_lt LBR e
  have hcap : RT.eCap e < 32 := Nat.mod_lt _ (by norm_num)
  have eslot : E1.slot LB LBR e = E1.labM LB e + 2 ^ 127 * (E1.labM LBR e + 2 ^ 127 * RT.eCap e) := by
    show E1.labM LB e ||| (E1.labM LBR e <<< 127 ||| RT.eCap e <<< 254) = _
    have h1 : E1.labM LBR e <<< 127 ||| RT.eCap e <<< 254 = (E1.labM LBR e + 2 ^ 127 * RT.eCap e) <<< 127 := by
      rw [show (254 : ℕ) = 127 + 127 from rfl, Nat.shiftLeft_add, ← Nat.shiftLeft_or_distrib, Nat.lor_comm,
        ← Nat.shiftLeft_add_eq_or_of_lt hmr, Nat.shiftLeft_eq (RT.eCap e) 127]
      ring_nf
    rw [h1, Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hm, Nat.shiftLeft_eq]; ring
  have hsm : smask (E1.slot LB LBR e) = E1.labM LB e := by
    unfold smask; rw [eslot, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt hm]
  have hsr : smr (E1.slot LB LBR e) = E1.labM LBR e := by
    unfold smr
    rw [eslot, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt hm, Nat.zero_add, Nat.add_mul_mod_self_left,
      Nat.mod_eq_of_lt hmr]
  have hsc : scap (E1.slot LB LBR e) = RT.eCap e := by
    unfold scap
    have e2 : E1.labM LB e + 2 ^ 127 * (E1.labM LBR e + 2 ^ 127 * RT.eCap e) =
        (E1.labM LB e + 2 ^ 127 * E1.labM LBR e) + 2 ^ 254 * RT.eCap e := by ring
    have hlow : E1.labM LB e + 2 ^ 127 * E1.labM LBR e < 2 ^ 254 := by
      have : 2 ^ 127 * E1.labM LBR e ≤ 2 ^ 127 * (2 ^ 127 - 1) := Nat.mul_le_mul_left _ (by omega)
      have h3 : 2 ^ 127 * (2 ^ 127 - 1) + 2 ^ 127 = (2 : ℕ) ^ 254 := by norm_num
      omega
    rw [eslot, e2, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt hlow, Nat.zero_add, Nat.mod_eq_of_lt hcap]
  have hlt : E1.slot LB LBR e < 2 ^ 264 := by
    rw [eslot]
    have : E1.labM LBR e + 2 ^ 127 * RT.eCap e < 2 ^ 137 := by
      have : 2 ^ 127 * RT.eCap e ≤ 2 ^ 127 * 31 := Nat.mul_le_mul_left _ (by omega)
      have h3 : (2 : ℕ) ^ 127 + 2 ^ 127 * 31 ≤ 2 ^ 137 := by norm_num
      omega
    have h4 : 2 ^ 127 * (E1.labM LBR e + 2 ^ 127 * RT.eCap e) ≤ 2 ^ 127 * (2 ^ 137 - 1) := Nat.mul_le_mul_left _ (by omega)
    have h5 : (2 : ℕ) ^ 127 * (2 ^ 137 - 1) + 2 ^ 127 = 2 ^ 264 := by norm_num
    omega
  refine ⟨?_, fun j hj => by rw [hsr, hsm]; exact labM_rev LB LBR e hPR j hj, hlt⟩
  rw [hsm, hsc, msum_xOf av Em VT N _ hN hC hav]
  -- the dual vectors are domain functionals
  have hdom : ∀ k < 9 - RT.eD e, DOM.testBit (RT.eV e (RT.eD e + k)) = true := by
    have h : ∀ m, (Nat.rec (motive := fun _ => Bool) true
        (fun j b => b && Nat.testBit DOM (RT.eV e (Nat.add (RT.eD e) j))) m) = true →
        ∀ k < m, DOM.testBit (RT.eV e (RT.eD e + k)) = true := by
      intro m
      induction m with
      | zero => intro _ k hk; omega
      | succ m ih =>
        intro hm k hk
        have hm' : ((Nat.rec (motive := fun _ => Bool) true
          (fun j b => b && Nat.testBit DOM (RT.eV e (Nat.add (RT.eD e) j))) m) &&
            Nat.testBit DOM (RT.eV e (Nat.add (RT.eD e) m))) = true := hm
        rw [Bool.and_eq_true] at hm'
        rcases (by omega : k < m ∨ k = m) with h | h
        · exact ih hm'.1 k h
        · subst h; exact hm'.2
    exact h _ hin
  have hfv : ∀ k, RT.eV e (RT.eD e + k) < 512 := fun k => Nat.mod_lt _ (by norm_num)
  have hU : ∀ w < 512, (RT.dualM e).testBit w = true ↔
      ∀ k < 9 - RT.eD e, BC5.par (w &&& RT.eV e (RT.eD e + k)) = false :=
    fun w hw => RT.kerM_testBit (fun k => RT.eV e (RT.eD e + k)) hfv (9 - RT.eD e) w hw
  have hEU : ∀ a < 512, Em.testBit a = true → (RT.dualM e).testBit a = true := by
    intro a ha hE
    rw [hU a ha]
    intro k hk
    exact hD _ (hfv k) (hdom k hk) a ha hE
  have hinv : ∀ a < 512, ∀ w < 512, Em.testBit (a ^^^ w) = true →
      ((RT.dualM e).testBit a = true ↔ (RT.dualM e).testBit w = true) := by
    intro a ha w hw hE
    rw [hU a ha, hU w hw]
    constructor
    · intro h k hk; rw [← par_coset hD _ (hfv k) (hdom k hk) a w ha hw hE]; exact h k hk
    · intro h k hk; rw [par_coset hD _ (hfv k) (hdom k hk) a w ha hw hE]; exact h k hk
  have hset : (univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ ∃ l < N, (E1.labM LB e).testBit l = true ∧
      Em.testBit (av s ^^^ vt VT l) = true)) =
      univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ (RT.dualM e).testBit (av s) = true) := by
    apply Finset.filter_congr
    intro s _
    constructor
    · rintro ⟨h0, l, hl, hM, hE⟩
      refine ⟨h0, (hinv (av s) (hav s) (vt VT l) (vt_lt VT l) hE).mpr ?_⟩
      rwa [labM_testBit LB VT N e hP l hl hN] at hM
    · rintro ⟨h0, hu⟩
      obtain ⟨l, hl, hE⟩ := hC.cover (av s) (hav s) h0
      refine ⟨h0, l, hl, ?_, hE⟩
      rw [labM_testBit LB VT N e hP l hl hN]
      exact (hinv (av s) (hav s) (vt VT l) (vt_lt VT l) hE).mp hu
  rw [hset]
  -- count: outside `E` = (outside `E`, inside `U`) + outside `U`
  have hsplit : (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card =
      (univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ (RT.dualM e).testBit (av s) = true)).card +
      (univ.filter (fun s : Fin n => (RT.dualM e).testBit (av s) = false)).card := by
    rw [← Finset.card_union_of_disjoint]
    · apply congrArg Finset.card
      ext s
      simp only [mem_filter, mem_univ, true_and, mem_union]
      constructor
      · intro h0
        cases hu : (RT.dualM e).testBit (av s)
        · exact Or.inr rfl
        · exact Or.inl ⟨h0, rfl⟩
      · rintro (⟨h0, _⟩ | hu)
        · exact h0
        · cases h0 : Em.testBit (av s)
          · rfl
          · rw [hEU (av s) (hav s) h0] at hu; exact absurd hu (by simp)
    · rw [Finset.disjoint_filter]
      intro s _ h1 h2; rw [h1.2] at h2; exact absurd h2 (by simp)
  have hF := hfact n av b c hav hd
  omega

end E1S
