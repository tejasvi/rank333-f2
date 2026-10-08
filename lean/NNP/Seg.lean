module
public import R22Port.U_a8af897ede0e
public import NNP.Frame
public import NN.Seg
public import R3RT.SpecO
/-! # NNP.Seg: an accepted item tree is a certified segment (`Top.SegOKO`)

`Seg`, `EmptyO`, `SegOKO` are copies of `Top.Seg`, `Top.EmptyO`, `Top.SegOKO` (r22/lean/top/Top/TopL479.lean, md5
89c89da39330a25e6f6a0bd7a8f8cfb9; the definitions are identical, so the bridge is `Iff.rfl` once both are in one environment).

`segOf P lo t`: the segment of a decoded item tree `t` whose root's parent has prefix `P`: OPEN keys, dead keys, external keys and
ranges collected from the tree (keys `(P' ||| 2^l, l)` along the tree's labels).

**`chkItem_sound`**: if `NN.chkT nodeFn deadFn fr lo t` accepts from a parent frame satisfying the invariant `FInv`, and
`nodeFn` / `deadFn` are sound in the sense of `NodeSound` / `DeadSound`, then `SegOKO O C (segOf (natL fr.S 0 8) lo t)`.
The tree layer is generic: the record kinds enter only through `nodeFn` (accounted children) and `deadFn` (dead children). -/
@[expose] public section
set_option maxHeartbeats 2000000
namespace NNP
open NN R3RT.SpecO Finset Classical

/-! ## The segment model (copied from `Top.TopL479`) -/

structure Seg where
  root : ℕ × ℕ
  lo : ℕ
  opens : Set (ℕ × ℕ)
  dead : Set (ℕ × ℕ)
  ext : Set (ℕ × ℕ)
  rng : Set ((ℕ × ℕ) × ℕ)

def Seg.lb (g : Seg) (n : ℕ × ℕ) : ℕ := if n = g.root then g.lo else 0

def EmptyO (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) (S last : ℕ) : Prop :=
  ∀ A : R3RT.Spec.Dec22, Canon O A → C A → ¬ Below O A S last

def SegOKO (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) (g : Seg) : Prop :=
  (g.root ∈ g.opens ∨ g.root ∈ g.dead) ∧
  (0 < g.lo → ∀ n ∈ g.opens, ∀ u, n.2 < u → (n.1 ||| 2 ^ u, u) ≠ g.root) ∧
  (∀ p ∈ g.rng, g.lb p.1 < p.2) ∧
  (∀ n ∈ g.dead, EmptyO O C n.1 n.2) ∧
  (∀ n ∈ g.opens, n.1 >>> n.2 = 1 ∧ ((range 511).filter (fun l => n.1.testBit l = true)).card ≤ 21 ∧
    ∀ u, n.2 < u → u < 511 →
      (n = g.root ∧ u < g.lo) ∨ (∃ l, (n, l) ∈ g.rng ∧ l ≤ u) ∨ ChildDead O C n.1 n.2 u ∨
      (n.1 ||| 2 ^ u, u) ∈ g.opens ∨ (n.1 ||| 2 ^ u, u) ∈ g.dead ∨ (n.1 ||| 2 ^ u, u) ∈ g.ext)

/-! ## The segment of a tree -/

section
variable {NR DR : Type}

mutual
def tOpens (P : ℕ) : STree NR DR → Set (ℕ × ℕ)
  | .node lab _ kids _ => insert (P ||| 2 ^ lab, lab) (kOpens (P ||| 2 ^ lab) kids)
  | .dead _ _ => ∅
  | .ext _ => ∅
def kOpens (P : ℕ) : SKids NR DR → Set (ℕ × ℕ)
  | .nil => ∅
  | .cons t ts => tOpens P t ∪ kOpens P ts
end

mutual
def tDead (P : ℕ) : STree NR DR → Set (ℕ × ℕ)
  | .node lab _ kids _ => kDead (P ||| 2 ^ lab) kids
  | .dead lab _ => {(P ||| 2 ^ lab, lab)}
  | .ext _ => ∅
def kDead (P : ℕ) : SKids NR DR → Set (ℕ × ℕ)
  | .nil => ∅
  | .cons t ts => tDead P t ∪ kDead P ts
end

mutual
def tExt (P : ℕ) : STree NR DR → Set (ℕ × ℕ)
  | .node lab _ kids _ => kExt (P ||| 2 ^ lab) kids
  | .dead _ _ => ∅
  | .ext lab => {(P ||| 2 ^ lab, lab)}
def kExt (P : ℕ) : SKids NR DR → Set (ℕ × ℕ)
  | .nil => ∅
  | .cons t ts => tExt P t ∪ kExt P ts
end

mutual
def tRng (P : ℕ) : STree NR DR → Set ((ℕ × ℕ) × ℕ)
  | .node lab _ kids rng =>
    (match rng with | some l => {((P ||| 2 ^ lab, lab), l)} | none => ∅) ∪ kRng (P ||| 2 ^ lab) kids
  | .dead _ _ => ∅
  | .ext _ => ∅
def kRng (P : ℕ) : SKids NR DR → Set ((ℕ × ℕ) × ℕ)
  | .nil => ∅
  | .cons t ts => tRng P t ∪ kRng P ts
end

/-- the segment of an item tree whose root's parent has prefix `P` -/
def segOf (P lo : ℕ) (t : STree NR DR) : Seg where
  root := (P ||| 2 ^ t.lab, t.lab)
  lo := lo
  opens := tOpens P t
  dead := tDead P t
  ext := tExt P t
  rng := tRng P t

end

/-! ## Soundness of the record checks (what the record kinds must provide) -/

/-- the number of prefix labels -/
def pcard (S : ℕ) : ℕ := ((range 511).filter (fun l => S.testBit l = true)).card

/-- `nodeFn` is sound for the invariant `FInv`: the child frame keeps the invariant, its prefix is the parent's plus the label
(above every parent bit), at most 21 prefix labels, and every accounted child is dead -/
def NodeSound (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) {NR : Type} (FInv : Frame → Prop)
    (nodeFn : Frame → ℕ → NR → Option (Frame × Array UInt64)) : Prop :=
  ∀ fr lab r fr' acc, FInv fr → nodeFn fr lab r = some (fr', acc) →
    FInv fr' ∧ natL fr'.S 0 8 = natL fr.S 0 8 ||| 2 ^ lab ∧ natL fr.S 0 8 < 2 ^ lab ∧ lab < 511 ∧
      pcard (natL fr.S 0 8 ||| 2 ^ lab) ≤ 21 ∧
      ∀ u, lab < u → u < 511 → (natL acc 0 8).testBit u = true → ChildDead O C (natL fr.S 0 8 ||| 2 ^ lab) lab u

/-- `deadFn` is sound: an accepted dead child is empty -/
def DeadSound (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) {DR : Type} (FInv : Frame → Prop)
    (deadFn : Frame → ℕ → DR → Bool) : Prop :=
  ∀ fr lab r, FInv fr → deadFn fr lab r = true → EmptyO O C (natL fr.S 0 8 ||| 2 ^ lab) lab

/-! ## Masks and prefixes -/

theorem natL_zero8 : natL #[0, 0, 0, 0, 0, 0, 0, 0] 0 8 = 0 := by decide

theorem pcard_or (S l : ℕ) (hS : S < 2 ^ l) (hl : l < 511) : pcard (S ||| 2 ^ l) = pcard S + 1 :=
  L5O.card_or_pow S l hS hl

theorem setBit8_view' (S : Array UInt64) (l : ℕ) (hl : l < 512) : natL (setBit8 S l) 0 8 = natL S 0 8 ||| 2 ^ l := by
  unfold setBit8
  rw [natL_range_map]
  apply Nat.eq_of_testBit_eq; intro i
  rw [natF_testBit, Nat.testBit_or, natL_testBit, Nat.testBit_two_pow, getElem!_eq_getD', Nat.zero_add]
  by_cases hi : i < 512
  · simp only [decide_eq_true (show i < 64 * 8 by omega), Bool.true_and]
    by_cases hq : i / 64 = l / 64
    · rw [if_pos hq, tb_or, tb_one_shl _ _ (Nat.mod_lt _ (by norm_num))]
      have : (i % 64 = l % 64) ↔ (l = i) := by omega
      simp only [this]
    · rw [if_neg hq]
      have : ¬ (l = i) := by intro h; apply hq; rw [h]
      simp only [this, decide_false, Bool.or_false]
  · simp only [decide_eq_false (show ¬ i < 64 * 8 by omega), Bool.false_and, Bool.false_or]
    exact (decide_eq_false (by omega)).symm

/-- the key of a child (by constructor) lies in the child list's key sets -/
theorem key_mem_kids {NR DR : Type} (P : ℕ) : ∀ (ks : SKids NR DR) (last u : ℕ), kidsOrd last ks = true →
    (natL (kidsMask ks) 0 8).testBit u = true →
    (P ||| 2 ^ u, u) ∈ kOpens P ks ∨ (P ||| 2 ^ u, u) ∈ kDead P ks ∨ (P ||| 2 ^ u, u) ∈ kExt P ks
  | .nil, _, u, _, h => by simp [kidsMask, natL_zero8] at h
  | .cons t ts, last, u, hord, h => by
    unfold kidsOrd at hord
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hord
    obtain ⟨⟨_, ht511⟩, hts⟩ := hord
    unfold kidsMask at h
    rw [setBit8_view' _ _ (by omega), Nat.testBit_or, Bool.or_eq_true, Nat.testBit_two_pow, decide_eq_true_eq] at h
    simp only [kOpens, kDead, kExt, Set.mem_union]
    rcases h with h | h
    · rcases key_mem_kids P ts t.lab u hts h with h1 | h1 | h1
      · exact Or.inl (Or.inr h1)
      · exact Or.inr (Or.inl (Or.inr h1))
      · exact Or.inr (Or.inr (Or.inr h1))
    · subst h
      cases t with
      | node lab r kids rng => left; left; simp [tOpens, STree.lab]
      | dead lab r => right; left; left; simp [tDead, STree.lab]
      | ext lab => right; right; left; simp [tExt, STree.lab]

/-- coverage, bit by bit -/
theorem coverOK_spec (last lb : ℕ) (rng : Option ℕ) (acc kids : Array UInt64) (h : coverOK last lb rng acc kids = true) :
    ∀ u, last < u → u < 511 → (natL acc 0 8).testBit u = true ∨ (natL kids 0 8).testBit u = true ∨ u < lb ∨
      (∃ l, rng = some l ∧ l ≤ u) := by
  intro u hu1 hu2
  unfold coverOK at h
  have hk := (allN_iff _ _).mp h (u / 64) (by omega)
  simp only [beq_iff_eq] at hk
  have hb := congrArg (fun x : UInt64 => x.toNat.testBit (u % 64)) hk
  simp only at hb
  have hj : u % 64 < 64 := Nat.mod_lt _ (by norm_num)
  have hku : 64 * (u / 64) + u % 64 = u := by omega
  rw [tb_and, aboveW_bit _ _ _ hj (by omega), hku, decide_eq_true (show last + 1 ≤ u ∧ u < 511 by omega),
    Bool.and_true, tb_or, tb_or, tb_or] at hb
  simp only [Bool.or_eq_true] at hb
  rcases hb with ((h1 | h1) | h1) | h1
  · left; rw [natL_testBit, decide_eq_true (by omega), Bool.true_and, getElem!_eq_getD', Nat.zero_add]; exact h1
  · right; left; rw [natL_testBit, decide_eq_true (by omega), Bool.true_and, getElem!_eq_getD', Nat.zero_add]; exact h1
  · right; right; left
    unfold belowW at h1; rw [tb_not, fromW_bit _ _ _ hj, hku] at h1
    simp only [Bool.and_eq_true, decide_eq_true_eq, Bool.not_eq_true', decide_eq_false_iff_not] at h1
    omega
  · right; right; right
    rw [fromW_bit _ _ _ hj, hku, decide_eq_true_eq] at h1
    cases rng with
    | none => simp at h1; omega
    | some l => exact ⟨l, rfl, by simpa using h1⟩

/-! ## The tree -/

section
variable {NR DR : Type} {O : LabelOrder} {C : R3RT.Spec.Dec22 → Prop} {FInv : Frame → Prop}
  {nodeFn : Frame → ℕ → NR → Option (Frame × Array UInt64)} {deadFn : Frame → ℕ → DR → Bool}

/-- what an accepted subtree gives, with `r` its root key and `lb` the lower bound on the root's children -/
structure TreeFacts (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) (P lb : ℕ) (r : ℕ × ℕ) (opens dead ext : Set (ℕ × ℕ))
    (rng : Set ((ℕ × ℕ) × ℕ)) : Prop where
  depth : ∀ n ∈ opens, pcard P + 1 ≤ pcard n.1
  lab511 : ∀ n ∈ opens, n.2 < 511
  rdepth : r ∈ opens → pcard r.1 = pcard P + 1
  top : ∀ n ∈ opens, n.1 >>> n.2 = 1 ∧ pcard n.1 ≤ 21
  rng_mem : ∀ p ∈ rng, p.1 ∈ opens
  rng_lb : ∀ p ∈ rng, (if p.1 = r then lb else 0) < p.2
  dead_ok : ∀ n ∈ dead, EmptyO O C n.1 n.2
  cover : ∀ n ∈ opens, ∀ u, n.2 < u → u < 511 →
    (n = r ∧ u < lb) ∨ (∃ l, (n, l) ∈ rng ∧ l ≤ u) ∨ ChildDead O C n.1 n.2 u ∨
      (n.1 ||| 2 ^ u, u) ∈ opens ∨ (n.1 ||| 2 ^ u, u) ∈ dead ∨ (n.1 ||| 2 ^ u, u) ∈ ext

theorem shr_one_lt {S l : ℕ} (h : S >>> l = 1) : S < 2 ^ (l + 1) := by
  rw [Nat.shiftRight_eq_div_pow] at h
  have := Nat.lt_mul_of_div_lt (show S / 2 ^ l < 2 by omega) (Nat.two_pow_pos l)
  rw [pow_succ]; linarith

theorem or_pow_shr (P lab : ℕ) (hP : P < 2 ^ lab) : (P ||| 2 ^ lab) >>> lab = 1 := by
  rw [Nat.shiftRight_eq_div_pow, L5O.or_pow_eq P lab hP, Nat.add_div_left _ (by positivity), Nat.div_eq_of_lt hP]

theorem key_ne_zero {n : ℕ × ℕ} (h : n.1 >>> n.2 = 1) : n.1 ≠ 0 := by
  intro h0; rw [h0, Nat.zero_shiftRight] at h; exact absurd h (by decide)

mutual
theorem chkT_facts (hN : NodeSound O C FInv nodeFn) (hD : DeadSound O C FInv deadFn) :
    ∀ (t : STree NR DR) (fr : Frame) (lb : ℕ), FInv fr → chkT nodeFn deadFn fr lb t = true →
      TreeFacts O C (natL fr.S 0 8) lb (natL fr.S 0 8 ||| 2 ^ t.lab, t.lab) (tOpens (natL fr.S 0 8) t)
        (tDead (natL fr.S 0 8) t) (tExt (natL fr.S 0 8) t) (tRng (natL fr.S 0 8) t)
  | .node lab r kids rng, fr, lb, hI, h => by
    unfold chkT at h
    rcases hnf : nodeFn fr lab r with _ | ⟨fr', acc⟩
    · rw [hnf] at h; exact absurd h (by simp)
    rw [hnf] at h
    simp only [Bool.and_eq_true] at h
    obtain ⟨⟨⟨hord, hrng⟩, hcov⟩, hkids⟩ := h
    obtain ⟨hI', hS', hPlt, hl511, hcard, hacc⟩ := hN fr lab r fr' acc hI hnf
    set P := natL fr.S 0 8 with hPdef
    set P' := P ||| 2 ^ lab with hP'def
    have IH := chkK_facts hN hD kids fr' hI' hkids
    rw [hS'] at IH
    have hpc : pcard P' = pcard P + 1 := pcard_or P lab hPlt hl511
    have hshr : P' >>> lab = 1 := or_pow_shr P lab hPlt
    simp only [STree.lab, tOpens, tDead, tExt, tRng]
    have hrne : ∀ n ∈ kOpens P' kids, n ≠ (P', lab) := by
      intro n hn he; have := IH.depth n hn; rw [he] at this; simp at this
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, IH.dead_ok, ?_⟩
    · intro n hn
      rcases Set.mem_insert_iff.mp hn with rfl | hn
      · exact le_of_eq hpc.symm
      · have := IH.depth n hn; omega
    · intro n hn
      rcases Set.mem_insert_iff.mp hn with rfl | hn
      · exact hl511
      · exact IH.lab511 n hn
    · intro _; exact hpc
    · intro n hn
      rcases Set.mem_insert_iff.mp hn with rfl | hn
      · exact ⟨hshr, hcard⟩
      · exact IH.top n hn
    · intro p hp
      rcases (Set.mem_union _ _ _).mp hp with hp | hp
      · cases rng with
        | none => simp at hp
        | some l => simp at hp; rw [hp]; exact Set.mem_insert _ _
      · exact Set.mem_insert_of_mem _ (IH.rng_mem p hp)
    · intro p hp
      rcases (Set.mem_union _ _ _).mp hp with hp | hp
      · cases rng with
        | none => simp at hp
        | some l =>
          simp at hp; rw [hp]; simp only [if_true]
          unfold rngOK at hrng; simpa using hrng
      · have h1 := IH.rng_lb p hp
        have h2 : p.1 ≠ (P', lab) := hrne p.1 (IH.rng_mem p hp)
        rw [if_neg h2]; simpa using h1
    · intro n hn u hu1 hu2
      rcases Set.mem_insert_iff.mp hn with rfl | hn
      · rcases coverOK_spec lab lb rng acc (kidsMask kids) hcov u hu1 hu2 with h1 | h1 | h1 | ⟨l, hl, hlu⟩
        · right; right; left; exact hacc u hu1 hu2 h1
        · rcases key_mem_kids P' kids lab u hord h1 with h2 | h2 | h2
          · right; right; right; left; exact Set.mem_insert_of_mem _ h2
          · right; right; right; right; left; exact h2
          · right; right; right; right; right; exact h2
        · left; exact ⟨rfl, h1⟩
        · right; left; exact ⟨l, by subst hl; simp, hlu⟩
      · rcases IH.cover n hn u hu1 hu2 with ⟨_, h1⟩ | ⟨l, hl, hlu⟩ | h1 | h1 | h1 | h1
        · omega
        · right; left; exact ⟨l, Set.mem_union_right _ hl, hlu⟩
        · right; right; left; exact h1
        · right; right; right; left; exact Set.mem_insert_of_mem _ h1
        · right; right; right; right; left; exact h1
        · right; right; right; right; right; exact h1
  | .dead lab r, fr, lb, hI, h => by
    unfold chkT at h
    have hE := hD fr lab r hI h
    simp only [STree.lab, tOpens, tDead, tExt, tRng]
    refine ⟨fun n hn => by simp at hn, fun n hn => by simp at hn, fun hn => by simp at hn, fun n hn => by simp at hn,
      fun p hp => by simp at hp, fun p hp => by simp at hp, ?_, fun n hn => by simp at hn⟩
    intro n hn; rw [Set.mem_singleton_iff] at hn; subst hn; exact hE
  | .ext lab, fr, lb, hI, h => by
    simp only [STree.lab, tOpens, tDead, tExt, tRng]
    exact ⟨fun n hn => by simp at hn, fun n hn => by simp at hn, fun hn => by simp at hn, fun n hn => by simp at hn,
      fun p hp => by simp at hp, fun p hp => by simp at hp, fun n hn => by simp at hn, fun n hn => by simp at hn⟩
theorem chkK_facts (hN : NodeSound O C FInv nodeFn) (hD : DeadSound O C FInv deadFn) :
    ∀ (ks : SKids NR DR) (fr : Frame), FInv fr → chkK nodeFn deadFn fr ks = true →
      TreeFacts O C (natL fr.S 0 8) 0 (0, 0) (kOpens (natL fr.S 0 8) ks) (kDead (natL fr.S 0 8) ks)
        (kExt (natL fr.S 0 8) ks) (kRng (natL fr.S 0 8) ks)
  | .nil, fr, hI, h => by
    simp only [kOpens, kDead, kExt, kRng]
    exact ⟨fun n hn => by simp at hn, fun n hn => by simp at hn, fun hn => by simp at hn, fun n hn => by simp at hn,
      fun p hp => by simp at hp, fun p hp => by simp at hp, fun n hn => by simp at hn, fun n hn => by simp at hn⟩
  | .cons t ts, fr, hI, h => by
    unfold chkK at h
    simp only [Bool.and_eq_true] at h
    obtain ⟨ht, hts⟩ := h
    have I1 := chkT_facts hN hD t fr 0 hI ht
    have I2 := chkK_facts hN hD ts fr hI hts
    simp only [kOpens, kDead, kExt, kRng]
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
    · intro n hn; rcases (Set.mem_union _ _ _).mp hn with hn | hn
      · exact I1.depth n hn
      · exact I2.depth n hn
    · intro n hn; rcases (Set.mem_union _ _ _).mp hn with hn | hn
      · exact I1.lab511 n hn
      · exact I2.lab511 n hn
    · intro hn
      exfalso
      rcases (Set.mem_union _ _ _).mp hn with hn | hn
      · exact key_ne_zero (I1.top _ hn).1 rfl
      · exact key_ne_zero (I2.top _ hn).1 rfl
    · intro n hn; rcases (Set.mem_union _ _ _).mp hn with hn | hn
      · exact I1.top n hn
      · exact I2.top n hn
    · intro p hp; rcases (Set.mem_union _ _ _).mp hp with hp | hp
      · exact Set.mem_union_left _ (I1.rng_mem p hp)
      · exact Set.mem_union_right _ (I2.rng_mem p hp)
    · intro p hp; rcases (Set.mem_union _ _ _).mp hp with hp | hp
      · have := I1.rng_lb p hp; split_ifs at this ⊢ <;> simpa using this
      · exact I2.rng_lb p hp
    · intro n hn; rcases (Set.mem_union _ _ _).mp hn with hn | hn
      · exact I1.dead_ok n hn
      · exact I2.dead_ok n hn
    · intro n hn u hu1 hu2
      rcases (Set.mem_union _ _ _).mp hn with hn | hn
      · rcases I1.cover n hn u hu1 hu2 with ⟨_, h1⟩ | ⟨l, hl, hlu⟩ | h1 | h1 | h1 | h1
        · omega
        · right; left; exact ⟨l, Set.mem_union_left _ hl, hlu⟩
        · right; right; left; exact h1
        · right; right; right; left; exact Set.mem_union_left _ h1
        · right; right; right; right; left; exact Set.mem_union_left _ h1
        · right; right; right; right; right; exact Set.mem_union_left _ h1
      · rcases I2.cover n hn u hu1 hu2 with ⟨_, h1⟩ | ⟨l, hl, hlu⟩ | h1 | h1 | h1 | h1
        · omega
        · right; left; exact ⟨l, Set.mem_union_right _ hl, hlu⟩
        · right; right; left; exact h1
        · right; right; right; left; exact Set.mem_union_right _ h1
        · right; right; right; right; left; exact Set.mem_union_right _ h1
        · right; right; right; right; right; exact Set.mem_union_right _ h1
end

/-- **an accepted item tree is a certified segment** -/
theorem chkItem_sound (hN : NodeSound O C FInv nodeFn) (hD : DeadSound O C FInv deadFn) (fr : Frame) (lo : ℕ)
    (t : STree NR DR) (hI : FInv fr) (hroot : t.isRoot = true) (h : chkT nodeFn deadFn fr lo t = true) :
    SegOKO O C (segOf (natL fr.S 0 8) lo t) := by
  have F := chkT_facts hN hD t fr lo hI h
  set P := natL fr.S 0 8 with hPdef
  refine ⟨?_, ?_, F.rng_lb, F.dead_ok, fun n hn => ⟨(F.top n hn).1, (F.top n hn).2, F.cover n hn⟩⟩
  · cases t with
    | node lab r kids rng => left; simp [segOf, tOpens, STree.lab]
    | dead lab r => right; simp [segOf, tDead, STree.lab]
    | ext lab => simp [STree.isRoot] at hroot
  · intro hlo n hn u hu he
    simp only [segOf] at he hn
    have hn2 : u = t.lab := congrArg Prod.snd he
    have hn1 : n.1 ||| 2 ^ u = P ||| 2 ^ t.lab := congrArg Prod.fst he
    -- the root is an OPEN node (otherwise there are no OPEN nodes), with label below 511
    cases t with
    | dead lab r => simp [tOpens] at hn
    | ext lab => simp [tOpens] at hn
    | node lab r kids rng =>
      simp only [STree.lab] at hn2 hn1
      subst hn2
      have hroot_mem : (P ||| 2 ^ u, u) ∈ tOpens P (STree.node u r kids rng : STree NR DR) := by simp [tOpens]
      have hrc : pcard (P ||| 2 ^ u) = pcard P + 1 := F.rdepth (by simpa [STree.lab] using hroot_mem)
      have hdn := F.depth n hn
      obtain ⟨htop, _⟩ := F.top n hn
      have hlab511 : u < 511 := F.lab511 _ hroot_mem
      have hlt : n.1 < 2 ^ u := lt_of_lt_of_le (shr_one_lt htop) (Nat.pow_le_pow_right (by norm_num) (by omega))
      have h1 := pcard_or n.1 u hlt hlab511
      rw [hn1] at h1
      omega

end

end NNP
