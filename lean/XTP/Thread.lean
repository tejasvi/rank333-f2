module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import XTP.Loops
public import XTP.Kid
/-! # XTP.Thread: the threaded trees compute what `treeN` computes

`XT.treeT` evaluates a tree on one scratch array that it updates in place: at an in-branch it saves the rows of the in-branch's
candidates `cin` (`gatherWs`), applies the aggregate (`addAgg`, which writes only labels of `cin`), runs the left subtree, and
writes the saved rows back (`restoreWs`) before the right subtree.  `treeT_eq`: it returns `treeN`'s verdict and the array it
was given; hence `kidsLoopT = kidsLoop` and `checkT = check` (`checkT_eq`), and `XTP.check_sound` covers `checkT`. -/
@[expose] public section
namespace XTP
open XT

/-! ## The set bits of a word and of a mask, in loop order -/

/-- the set bits of a word, lowest first (the order of the bit loops) -/
def bitsW (x : UInt64) : List ℕ :=
  if h : x = 0 then [] else (lowIdx x).toNat :: bitsW (x &&& (x - 1))
termination_by x.toNat
decreasing_by exact andPred_lt x h

theorem bitsW_zero : bitsW 0 = [] := by rw [bitsW]; simp

theorem bitsW_ne (x : UInt64) (hx : x ≠ 0) : bitsW x = (lowIdx x).toNat :: bitsW (x &&& (x - 1)) := by
  rw [bitsW, dif_neg hx]

theorem mem_bitsW : ∀ (x : UInt64) (b : ℕ), b ∈ bitsW x ↔ x.toNat.testBit b = true := by
  intro x
  induction x using word_induction with
  | h0 => intro b; rw [bitsW_zero]; simp
  | hs x hx ih =>
    intro b
    obtain ⟨_, hxk, _, hy, _⟩ := lowIdx_spec x hx
    rw [bitsW_ne x hx, List.mem_cons, ih, hy]
    by_cases hb : b = (lowIdx x).toNat
    · subst hb; simp [hxk]
    · simp [hb]

theorem nodup_bitsW : ∀ (x : UInt64), (bitsW x).Nodup := by
  intro x
  induction x using word_induction with
  | h0 => rw [bitsW_zero]; exact List.nodup_nil
  | hs x hx ih =>
    obtain ⟨_, _, _, hy, _⟩ := lowIdx_spec x hx
    rw [bitsW_ne x hx, List.nodup_cons]
    refine ⟨?_, ih⟩
    rw [mem_bitsW, hy]; simp

theorem bitsW_lt (x : UInt64) (b : ℕ) (hb : b ∈ bitsW x) : b < 64 := by
  rw [mem_bitsW] at hb
  by_contra h
  rw [testBit_toNat_lt x b (by omega)] at hb
  exact Bool.false_ne_true hb

theorem length_bitsW_le (x : UInt64) : (bitsW x).length ≤ 64 := by
  have hs := (nodup_bitsW x).subperm (l₂ := List.range 64) (fun b hb => List.mem_range.mpr (bitsW_lt x b hb))
  simpa using hs.length_le

theorem popK_bitsW : ∀ (x c : UInt64), c.toNat + (bitsW x).length < 2 ^ 64 →
    (popK x c).toNat = c.toNat + (bitsW x).length := by
  intro x
  induction x using word_induction with
  | h0 => intro c _; rw [popK, bitsW_zero]; simp
  | hs x hx ih =>
    intro c hc
    rw [bitsW_ne x hx, List.length_cons] at hc ⊢
    rw [popK, dif_neg hx]
    have hc1 : (c + 1).toNat = c.toNat + 1 := by
      rw [UInt64.toNat_add]; simp; omega
    rw [ih (c + 1) (by rw [hc1]; omega), hc1]; ring

theorem pc64_bitsW (x : UInt64) : (pc64 x).toNat = (bitsW x).length := by
  unfold pc64
  rw [popK_bitsW x 0 (by have := length_bitsW_le x; simp; omega)]; simp

/-- the labels of `sel` in words `i ..< 8`, in increasing order (the order of the word loops) -/
def labsFrom (sel : W8) (i : ℕ) : List ℕ :=
  if i < 8 then (bitsW (sel.limb i)).map (64 * i + ·) ++ labsFrom sel (i + 1) else []
termination_by 8 - i

theorem labsFrom_lt (sel : W8) (i : ℕ) (h : i < 8) :
    labsFrom sel i = (bitsW (sel.limb i)).map (64 * i + ·) ++ labsFrom sel (i + 1) := by
  rw [labsFrom, if_pos h]

theorem labsFrom_ge (sel : W8) (i : ℕ) (h : ¬ i < 8) : labsFrom sel i = [] := by
  rw [labsFrom, if_neg h]

theorem mem_labsFrom (sel : W8) : ∀ (k i : ℕ) (l : ℕ), 8 - i = k →
    (l ∈ labsFrom sel i ↔ i ≤ l / 64 ∧ sel.view.testBit l = true) := by
  intro k
  induction k with
  | zero =>
    intro i l hk
    rw [labsFrom_ge sel i (by omega)]
    simp only [List.not_mem_nil, false_iff, not_and]
    intro h1 h2
    rw [W8.testBit_view] at h2; simp at h2; omega
  | succ k ih =>
    intro i l hk
    rw [labsFrom_lt sel i (by omega), List.mem_append, ih (i + 1) l (by omega), List.mem_map]
    constructor
    · rintro (⟨b, hb, rfl⟩ | ⟨h1, h2⟩)
      · have hb64 := bitsW_lt _ b hb
        rw [mem_bitsW] at hb
        have := limb_bit sel i (64 * i + b) (by omega) (by omega)
        rw [show 64 * i + b - 64 * i = b by omega, hb] at this
        simp only [Bool.true_eq, Bool.and_eq_true, decide_eq_true_eq] at this
        exact ⟨by omega, this.2⟩
      · exact ⟨by omega, h2⟩
    · rintro ⟨h1, h2⟩
      by_cases hli : l / 64 = i
      · left
        refine ⟨l - 64 * i, ?_, by omega⟩
        rw [mem_bitsW, limb_bit sel i l (by omega) (by omega), hli]; simpa using h2
      · right; exact ⟨by omega, h2⟩

theorem labsFrom_div (sel : W8) : ∀ (k i : ℕ) (l : ℕ), 8 - i = k → l ∈ labsFrom sel i → i ≤ l / 64 := by
  intro k i l hk hl
  exact ((mem_labsFrom sel k i l hk).mp hl).1

theorem nodup_labsFrom (sel : W8) : ∀ (k i : ℕ), 8 - i = k → (labsFrom sel i).Nodup := by
  intro k
  induction k with
  | zero => intro i hk; rw [labsFrom_ge sel i (by omega)]; exact List.nodup_nil
  | succ k ih =>
    intro i hk
    rw [labsFrom_lt sel i (by omega), List.nodup_append]
    refine ⟨(nodup_bitsW _).map (fun a b h => by omega), ih (i + 1) (by omega), ?_⟩
    intro a ha b hb hab
    subst hab
    obtain ⟨c, hc, rfl⟩ := List.mem_map.mp ha
    have := labsFrom_div sel _ (i + 1) _ rfl hb
    have := bitsW_lt _ c hc
    omega

/-! ## Gathering and restoring rows -/

theorem gatherL_eq (rs : Array W8) (base : ℕ) : ∀ (x : UInt64) (acc : Array W8),
    (gatherL rs base x acc).toList = acc.toList ++ (bitsW x).map (fun b => rs[base + b]!) := by
  intro x
  induction x using word_induction with
  | h0 => intro acc; rw [gatherL, bitsW_zero]; simp
  | hs x hx ih => intro acc; rw [gatherL, dif_neg hx, ih, bitsW_ne x hx]; simp

theorem gatherWs_eq (rs : Array W8) (sel : W8) : ∀ (k i : ℕ) (acc : Array W8), 8 - i = k →
    (gatherWs rs sel i acc).toList = acc.toList ++ (labsFrom sel i).map (fun l => rs[l]!) := by
  intro k
  induction k with
  | zero => intro i acc hk; rw [gatherWs, if_neg (by omega), labsFrom_ge sel i (by omega)]; simp
  | succ k ih =>
    intro i acc hk
    rw [gatherWs, if_pos (by omega), ih (i + 1) _ (by omega), gatherL_eq, labsFrom_lt sel i (by omega)]
    simp [List.map_append, List.map_map, Function.comp_def]

/-- `restoreL`'s writes as a list fold -/
def restoreList (sv : Array W8) : List ℕ → ℕ → Array W8 → Array W8
  | [], _, rs => rs
  | l :: L, k, rs => restoreList sv L (k + 1) (rs.set! l sv[k]!)

theorem restoreList_append (sv : Array W8) : ∀ (L1 L2 : List ℕ) (k : ℕ) (rs : Array W8),
    restoreList sv (L1 ++ L2) k rs = restoreList sv L2 (k + L1.length) (restoreList sv L1 k rs) := by
  intro L1
  induction L1 with
  | nil => intro L2 k rs; simp [restoreList]
  | cons l L1 ih =>
    intro L2 k rs
    rw [List.cons_append, restoreList, restoreList, ih]
    congr 1; simp; ring

theorem restoreList_size (sv : Array W8) : ∀ (L : List ℕ) (k : ℕ) (rs : Array W8), (restoreList sv L k rs).size = rs.size := by
  intro L
  induction L with
  | nil => intro k rs; rfl
  | cons l L ih => intro k rs; rw [restoreList, ih, Array.set!_eq_setIfInBounds, Array.size_setIfInBounds]

theorem restoreL_eq (sv : Array W8) (base : ℕ) : ∀ (x : UInt64) (k : ℕ) (rs : Array W8),
    restoreL sv base x k rs = restoreList sv ((bitsW x).map (base + ·)) k rs := by
  intro x
  induction x using word_induction with
  | h0 => intro k rs; rw [restoreL, bitsW_zero]; simp [restoreList]
  | hs x hx ih => intro k rs; rw [restoreL, dif_neg hx, ih, bitsW_ne x hx]; simp [restoreList]

theorem restoreWs_eq (sv : Array W8) (sel : W8) : ∀ (n i k : ℕ) (rs : Array W8), 8 - i = n →
    restoreWs sv sel i k rs = restoreList sv (labsFrom sel i) k rs := by
  intro n
  induction n with
  | zero => intro i k rs hn; rw [restoreWs, if_neg (by omega), labsFrom_ge sel i (by omega)]; rfl
  | succ n ih =>
    intro i k rs hn
    rw [restoreWs, if_pos (by omega), ih (i + 1) _ _ (by omega), restoreL_eq, labsFrom_lt sel i (by omega),
      restoreList_append, pc64_bitsW, List.length_map]

/-- restoring the gathered rows: entry `j` is the original row when `j` is a restored label -/
theorem restoreList_get (rs0 : Array W8) : ∀ (L : List ℕ) (pre : List W8) (rs : Array W8) (j : ℕ), L.Nodup →
    (restoreList (pre ++ L.map (fun l => rs0[l]!)).toArray L pre.length rs)[j]! =
      if j ∈ L ∧ j < rs.size then rs0[j]! else rs[j]! := by
  intro L
  induction L with
  | nil => intro pre rs j _; simp [restoreList]
  | cons l L ih =>
    intro pre rs j hnd
    rw [List.nodup_cons] at hnd
    have hsv : (pre ++ (l :: L).map (fun l => rs0[l]!)).toArray[pre.length]! = rs0[l]! := by
      rw [Array.getElem!_eq_getD, Array.getD_eq_getD_getElem?]
      simp
    have hre : (pre ++ (l :: L).map (fun l => rs0[l]!)) = (pre ++ [rs0[l]!]) ++ L.map (fun l => rs0[l]!) := by simp
    rw [restoreList, hsv, hre, show pre.length + 1 = (pre ++ [rs0[l]!]).length by simp, ih _ _ j hnd.2,
      Array.set!_eq_setIfInBounds, Array.size_setIfInBounds, ← Array.set!_eq_setIfInBounds, get!_set!]
    by_cases hj : j ∈ L
    · have hlj : l ≠ j := fun h => hnd.1 (h ▸ hj)
      simp [hj, hlj]
    · by_cases hjl : j = l
      · subst hjl; by_cases hs : j < rs.size <;> simp [hj, hs]
      · simp [hj, hjl, Ne.symm hjl]

theorem addAgg_size (c2W : Array (Array W8)) (ag : AggC) (cin : W8) (rs : Array W8) : (addAgg c2W ag cin rs).size = rs.size := by
  unfold addAgg; rw [scatRows_size, addC2Ws_size _ _ _ _ 0 rs rfl]

theorem addAgg_get_of_not (c2W : Array (Array W8)) (ag : AggC) (cin : W8) (rs : Array W8) (l : ℕ)
    (hl : cin.view.testBit l = false) : (addAgg c2W ag cin rs)[l]! = rs[l]! := by
  unfold addAgg
  rw [scatRows_get_of_not _ _ _ l hl, addC2Ws_get c2W ag cin _ 0 rs l rfl, if_neg (by simp [hl])]

/-- **save, update, restore**: the in-branch leaves the array as it found it -/
theorem restore_addAgg (c2W : Array (Array W8)) (ag : AggC) (cin : W8) (rows : Array W8) :
    restoreWs (gatherWs rows cin 0 (Array.mkEmpty 64)) cin 0 0 (addAgg c2W ag cin rows) = rows := by
  have hg : gatherWs rows cin 0 (Array.mkEmpty 64) = ([] ++ (labsFrom cin 0).map (fun l => rows[l]!)).toArray := by
    apply Array.ext'
    rw [gatherWs_eq rows cin _ 0 _ rfl]; simp
  rw [restoreWs_eq _ cin _ 0 0 _ rfl, hg]
  apply Array.ext
  · rw [restoreList_size, addAgg_size]
  · intro j h1 h2
    have e1 := getElem!_pos (restoreList ([] ++ (labsFrom cin 0).map (fun l => rows[l]!)).toArray (labsFrom cin 0) 0
      (addAgg c2W ag cin rows)) j h1
    have e2 := getElem!_pos rows j h2
    rw [← e1, ← e2]
    have := restoreList_get rows (labsFrom cin 0) [] (addAgg c2W ag cin rows) j (nodup_labsFrom cin _ 0 rfl)
    simp only [List.length_nil] at this
    rw [this]
    split
    · rfl
    · rename_i hn
      rw [addAgg_size] at hn
      have hnot : cin.view.testBit j = false := by
        by_contra hc
        apply hn
        exact ⟨(mem_labsFrom cin _ 0 j rfl).mpr ⟨Nat.zero_le _, by simpa using hc⟩, h2⟩
      exact addAgg_get_of_not c2W ag cin rows j hnot

/-! ## The threaded tree, the children, the node -/

theorem ite_pair (a b : Bool) (rs : Array W8) : (if a = true then (b, rs) else (false, rs)) = (a && b, rs) := by
  cases a <;> simp

/-- **the threaded tree** returns `treeN`'s verdict and the array it was given -/
theorem treeT_eq (nc : NodeC) (kc : KidC) : ∀ (t : XTN) (rows : Array W8) (path picks : List ℕ) (c : W8),
    treeT nc kc t rows path picks c = (treeN nc kc t rows path picks c, rows) := by
  intro t
  induction t with
  | cut => intro rows path picks c; simp [treeT, treeN]
  | leaf sts fj fd => intro rows path picks c; simp only [treeT, treeN]
  | node sts v k l r ihl ihr =>
    intro rows path picks c
    simp only [treeT, treeN]
    split
    · rfl
    · rename_i c' _
      by_cases hc : (decide (k < nc.aggs.size) && (nc.aggs[k]!).x == kc.u + 1 + v) = true
      · rw [if_pos hc]
        by_cases hp : kc.u + 1 + v < 511
        · rw [if_pos hp, ihl]
          simp only [restore_addAgg]
          rw [hc, Bool.true_and, decide_eq_true hp, Bool.true_and, if_pos hp, ihr]
          exact ite_pair _ _ _
        · rw [if_neg hp]
          simp [hc, hp]
      · rw [if_neg hc]
        simp only [Bool.not_eq_true] at hc
        rw [hc]; rfl

theorem kidsLoopT_eq (nc : NodeC) (x : XRec) : ∀ (n i : ℕ) (rows : Array W8), x.kids.size - i = n →
    kidsLoopT nc x i rows = kidsLoop nc x i rows := by
  intro n
  induction n with
  | zero =>
    intro i rows hn
    rw [kidsLoopT, kidsLoop, dif_neg (by omega), dif_neg (by omega)]
  | succ n ih =>
    intro i rows hn
    rw [kidsLoopT, kidsLoop, dif_pos (by omega), dif_pos (by omega)]
    split
    · rename_i kc rows1 _
      rw [treeT_eq]
      simp only
      rw [ih (i + 1) rows1 (by omega)]
    · rfl

/-- **the production checker is the proved one** -/
theorem checkT_eq (S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : ℕ) (dict : Array UInt64)
    (c2W : Array (Array W8)) (npW : Array W8) (x : XRec) :
    checkT S D N U du last b1 m e1 dict c2W npW x = check S D N U du last b1 m e1 dict c2W npW x := by
  unfold checkT check
  split
  · rw [kidsLoopT_eq _ x _ 0 _ rfl]
  · rfl

end XTP
