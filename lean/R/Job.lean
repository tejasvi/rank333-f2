module
public import R22Port.U_075f4cf82947
public import R.Block
public import E1P.Compose
public import E1N.Job
/-! # Jobs: the native job checker refines `E1PS.JobOK`

`jobB_ref : E1N.jobB D key ext b = true → (∀ c ∈ ext, JobOK C sl UB c) → JobOK C sl UB key` (infra's R3 shape), through
`E1PS.chain_sound_ext`: every block accepted (`block_ref`), every header record glued (`glueN_ref`, `glue0N_ref`), and the
first block starting with exactly the key (`start_key`). -/
@[expose] public section
namespace E1NR
open E1N Finset E1PS

local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)

variable {D : IPD} {C : E1P.Ctx} {sl : ℕ → ℕ} {UB UBR : ℕ}

/-! ## Comparing windows -/

theorem mod_split (X a b : ℕ) : X % 2 ^ (a + b) = X % 2 ^ a + 2 ^ a * (X / 2 ^ a % 2 ^ b) := by
  rw [pow_add, Nat.mod_mul]

theorem eqBitsGo_spec (A : ByteArray) (ea : ℕ) (Bb : ByteArray) (eb : ℕ) : ∀ f pa pb n, n ≤ 48 * f →
    E1N.eqBitsGo A pa ea Bb pb eb f n = true → win A pa ea % 2 ^ n = win Bb pb eb % 2 ^ n := by
  intro f
  induction f with
  | zero => intro pa pb n hn _; rw [show n = 0 by omega, pow_zero, Nat.mod_one, Nat.mod_one]
  | succ f ih =>
    intro pa pb n hn h
    rw [E1N.eqBitsGo] at h
    by_cases h0 : n = 0
    · subst h0; rw [pow_zero, Nat.mod_one, Nat.mod_one]
    · rw [if_neg (by simp [h0])] at h
      simp only [Bool.and_eq_true, beq_iff_eq] at h
      obtain ⟨h1, h2⟩ := h
      rw [rdE_win A pa ea _ (min_le_left _ _), rdE_win Bb pb eb _ (min_le_left _ _)] at h1
      by_cases hn48 : n ≤ 48
      · rw [min_eq_right hn48] at h1; exact h1
      · rw [min_eq_left (by omega)] at h1 h2
        have := ih (pa + 48) (pb + 48) (n - 48) (by omega) h2
        rw [show n = 48 + (n - 48) by omega, mod_split, mod_split, h1, ← E1PS.sk_eq, ← E1PS.sk_eq, sk_win, sk_win, this]

theorem eqBits_spec (A : ByteArray) (pa ea : ℕ) (Bb : ByteArray) (pb eb n : ℕ)
    (h : E1N.eqBits A pa ea Bb pb eb n = true) : win A pa ea % 2 ^ n = win Bb pb eb % 2 ^ n :=
  eqBitsGo_spec A ea Bb eb _ pa pb n (by omega) h

/-! ## The kernel's view of a block header -/

/-- the header of a block as the kernel reads it: its records' window and count -/
theorem hdr_rel (hD : IPRel D C sl UB UBR) (P : ByteArray) :
    (E1P.hdr (E1P.bS2 (natB P))).2.1 = win P (E1N.hdrOf D P).1 ((E1N.hdrOf D P).1 + 946 * (E1N.hdrOf D P).2) ∧
    E1P.rd 8 (E1P.bS2 (natB P)) = (E1N.hdrOf D P).2 := by
  have hEle : 8 * P.size ≤ 8 * P.size := le_rfl
  unfold E1N.hdrOf
  rw [hD.lb, hD.nl]
  dsimp only
  rw [← win_full P (8 * P.size) hEle]
  have hbD : E1P.bD (win P 0 (8 * P.size)) = E1N.rdE P 1 (8 * P.size) 5 := by
    rw [bD_rs, sk_win, Nat.zero_add, rd_win _ _ _ 5 (by norm_num)]
  have hS1 : E1P.bS1 (win P 0 (8 * P.size)) = win P (6 + 8 + 8 * E1N.rdE P 1 (8 * P.size) 5) (8 * P.size) := by
    rw [bS1_rs, hbD, sk_win, Nat.zero_add]; rfl
  have hmk : E1P.rd 1 (win P 0 (8 * P.size)) = E1N.rdE P 0 (8 * P.size) 1 := rd_win _ _ _ 1 (by norm_num)
  have hml : E1N.rdE P 0 (8 * P.size) 1 < 2 := by rw [← hmk]; exact rd_lt 1 _
  have hS2 : E1P.bS2 (win P 0 (8 * P.size)) = win P (if (E1N.rdE P 0 (8 * P.size) 1 == 1) = true then
      6 + 8 + 8 * E1N.rdE P 1 (8 * P.size) 5 + 3 * 255 else 6 + 8 + 8 * E1N.rdE P 1 (8 * P.size) 5) (8 * P.size) := by
    rw [bS2_rs, hmk, hS1]
    generalize E1N.rdE P 0 (8 * P.size) 1 = mode at hml ⊢
    rcases (by omega : mode = 0 ∨ mode = 1) with rfl | rfl
    · rw [selCF (Nat.beq 0 1) rfl, if_neg (by decide)]
    · rw [selC (Nat.beq 1 1) rfl, sk_win, if_pos (by rfl)]
  generalize (if (E1N.rdE P 0 (8 * P.size) 1 == 1) = true then 6 + 8 + 8 * E1N.rdE P 1 (8 * P.size) 5 + 3 * 255
    else 6 + 8 + 8 * E1N.rdE P 1 (8 * P.size) 5) = s2 at hS2 ⊢
  rw [hS2, hdr_rs]
  refine ⟨?_, rd_win _ _ _ 8 (by norm_num)⟩
  show E1P.rd (Nat.mul 946 (E1P.rd 8 (win P s2 (8 * P.size)))) (E1P.sk 8 (win P s2 (8 * P.size))) = _
  rw [rd_win _ _ _ 8 (by norm_num), sk_win, rdl_win, win_trunc P _ _ _ hEle,
    show Nat.mul 946 (E1N.rdE P s2 (8 * P.size) 8) = 946 * E1N.rdE P s2 (8 * P.size) 8 from rfl]

/-- header record `j < nd` -/
theorem recOf_rel (hD : IPRel D C sl UB UBR) (P : ByteArray) (j : ℕ) (hj : j < (E1N.hdrOf D P).2) :
    recOf (natB P) j = win P ((E1N.hdrOf D P).1 + 946 * j) ((E1N.hdrOf D P).1 + 946 * j + 946) := by
  unfold recOf
  rw [(hdr_rel hD P).1, ← E1PS.sk_eq, ← rd_eq, sk_win, rdl_win, min_eq_right (by omega)]

/-! ## Glue -/

theorem glueN_ref (hD : IPRel D C sl UB UBR) (P : ByteArray) (j : ℕ) (Sc : ByteArray) (hj : j < (E1N.hdrOf D P).2)
    (h : E1N.glueN D P j Sc = true) : E1P.glue (recOf (natB P) j) (natB Sc) = true := by
  have hrw : D.rw = 946 := by unfold IPD.rw; rw [hD.lb, hD.nl]
  unfold E1N.glueN at h
  rw [hD.lb, hD.nl, hrw] at h
  dsimp only at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨h1, h2⟩ := h
  rw [recOf_rel hD P j hj, glue_named]
  generalize hrs : (E1N.hdrOf D P).1 + 946 * j = rs at h1 h2 ⊢
  have hE : 8 * Sc.size ≤ 8 * Sc.size := le_rfl
  rw [← win_full Sc (8 * Sc.size) hE, rd_win _ _ _ 1 (by norm_num), h1, rd_win _ _ _ 5 (by norm_num)]
  rw [show Nat.beq 1 1 = true from rfl, andC true rfl]
  have heq := eqBits_spec _ _ _ _ _ _ _ h2
  generalize hW : 5 + 8 + 3 * 255 + 8 * E1N.rdE P rs (rs + 946) 5 = W at heq
  rw [sk_win, rdl_win, Nat.zero_add, show Nat.add 778 (Nat.mul 8 (E1N.rdE P rs (rs + 946) 5)) = W by
    rw [← hW]; show 778 + 8 * _ = _; omega]
  apply Nat.beq_eq.mpr
  -- both windows are below `2 ^ max W 946`
  have hA : win P rs (rs + 946) < 2 ^ max W 946 :=
    lt_of_lt_of_le (win_lt _ _ _) (Nat.pow_le_pow_right (by norm_num) (by omega))
  have hB : win Sc 1 (min (8 * Sc.size) (1 + W)) < 2 ^ max W 946 :=
    lt_of_lt_of_le (win_lt _ _ _) (Nat.pow_le_pow_right (by norm_num) (by omega))
  rw [Nat.mod_eq_of_lt hA, Nat.mod_eq_of_lt hB] at heq
  exact heq.symm

theorem glue0N_ref (hD : IPRel D C sl UB UBR) (P : ByteArray) (j : ℕ) (Sc : ByteArray) (hj : j < (E1N.hdrOf D P).2)
    (h : E1N.glue0N D P j Sc = true) : E1P.glue0 (recOf (natB P) j) (natB Sc) = true := by
  have hrw : D.rw = 946 := by unfold IPD.rw; rw [hD.lb, hD.nl]
  unfold E1N.glue0N at h
  rw [hD.lb, hrw] at h
  dsimp only at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨h1, h2⟩ := h
  rw [recOf_rel hD P j hj, glue0_named]
  generalize hrs : (E1N.hdrOf D P).1 + 946 * j = rs at h1 h2 ⊢
  have hE : 8 * Sc.size ≤ 8 * Sc.size := le_rfl
  rw [← win_full Sc (8 * Sc.size) hE, rd_win _ _ _ 1 (by norm_num), h1, rd_win _ _ _ 5 (by norm_num)]
  rw [show Nat.beq 0 0 = true from rfl, andC true rfl]
  have heq := eqBits_spec _ _ _ _ _ _ _ h2
  rw [sk_win, rd_eq, rd_eq, Nat.zero_add, show Nat.add 13 (Nat.mul 8 (E1N.rdE P rs (rs + 946) 5)) =
    5 + 8 + 8 * E1N.rdE P rs (rs + 946) 5 by show 13 + 8 * _ = _; omega]
  exact Nat.beq_eq.mpr heq.symm

/-! ## The start state -/

theorem natB_digits (B : ByteArray) (X n : ℕ) (hn : B.size = n)
    (h : ∀ a < n, natB B / 2 ^ (8 * a) % 256 = X / 2 ^ (8 * a) % 256) : natB B = X % 2 ^ (8 * n) := by
  have hlt := natB_lt B
  rw [hn] at hlt
  rw [← Nat.mod_eq_of_lt hlt, mod_digits, mod_digits]
  apply Finset.sum_congr rfl; intro a ha; rw [h a (Finset.mem_range.mp ha)]

theorem keyBytes_val (key : ℕ) : natB (E1N.keyBytes key) = key % 2 ^ 1088 := by
  have hs : (E1N.keyBytes key).size = 136 := by simp [E1N.keyBytes, ByteArray.size]
  rw [show (1088 : ℕ) = 8 * 136 by norm_num]
  apply natB_digits _ _ 136 hs
  intro a ha
  rw [← byte_eq]
  unfold E1N.byte
  rw [dif_pos (by rw [hs]; exact ha)]
  simp only [E1N.keyBytes, ByteArray.get, Array.getElem_ofFn, UInt8.toNat_toUInt64]
  rw [show ((key >>> (8 * a)) &&& 255).toUInt8.toNat = ((key >>> (8 * a)) &&& 255) % 256 from rfl,
    show (255 : ℕ) = 2 ^ 8 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow]
  norm_num

/-- `StartOK` reads only the first `14 + 8 d` bits, and in mode 1 the `765` budget bits after them -/
theorem startOK_mod (x ub : ℕ → ℕ) (S n : ℕ)
    (hn : 14 + 8 * (S / 2 % 2 ^ 5) + (if S % 2 = 1 then 765 else 0) ≤ n) :
    StartOK x ub (S % 2 ^ n) ↔ StartOK x ub S := by
  have h14 : 14 + 8 * (S / 2 % 2 ^ 5) ≤ n := by split at hn <;> omega
  have ed : (S % 2 ^ n) / 2 % 2 ^ 5 = S / 2 % 2 ^ 5 := by
    have := mod_div_mod S n 1 5 (by omega); simpa using this
  have epos : (S % 2 ^ n) / 2 ^ 6 % 2 ^ 8 = S / 2 ^ 6 % 2 ^ 8 := mod_div_mod S n 6 8 (by omega)
  have epl : (S % 2 ^ n) / 2 ^ 14 % 2 ^ (8 * (S / 2 % 2 ^ 5)) = S / 2 ^ 14 % 2 ^ (8 * (S / 2 % 2 ^ 5)) :=
    mod_div_mod S n 14 _ (by omega)
  have em : (S % 2 ^ n) % 2 = S % 2 := by have := mod_div_mod S n 0 1 (by omega); simpa using this
  unfold StartOK
  rw [ed, epos, epl, em]
  by_cases hm : S % 2 = 1
  · rw [if_pos hm] at hn
    rw [if_pos hm, if_pos hm]
    have eb : ∀ l < 255, bud3 ((S % 2 ^ n) / 2 ^ (14 + 8 * (S / 2 % 2 ^ 5))) l =
        bud3 (S / 2 ^ (14 + 8 * (S / 2 % 2 ^ 5))) l := by
      intro l hl
      unfold bud3
      rw [Nat.div_div_eq_div_mul, Nat.div_div_eq_div_mul, ← pow_add, show (8 : ℕ) = 2 ^ 3 by norm_num,
        mod_div_mod S _ _ 3 (by omega)]
    exact ⟨fun h => cmpl_congr x _ _ _ _ _ eb h, fun h => cmpl_congr x _ _ _ _ _ (fun l hl => (eb l hl).symm) h⟩
  · rw [if_neg hm, if_neg hm]

/-- a key equal to the block's start header (mode 0: its first `14 + 8 d` bits; mode 1: also the budgets) is the same
start state -/
theorem start_key (hD : IPRel D C sl UB UBR) (B : ByteArray) (key : ℕ) (h : E1N.startsWith D B key = true)
    (x ub : ℕ → ℕ) (hs : StartOK x ub key) : StartOK x ub (natB B) := by
  unfold E1N.startsWith E1N.hdrLen at h
  rw [hD.lb, hD.nl] at h
  dsimp only at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨hlt, heq⟩ := h
  have hE : 8 * B.size ≤ 8 * B.size := le_rfl
  have h3 := eqBits_spec _ _ _ _ _ _ _ heq
  have hdS : E1N.rdE B 1 (8 * B.size) 5 = natB B / 2 % 2 ^ 5 := by rw [rdE_E B 1 _ 5 hE (by norm_num), pow_one]
  have hmS : E1N.rdE B 0 (8 * B.size) 1 = natB B % 2 := by
    rw [rdE_E B 0 _ 1 hE (by norm_num), pow_zero, Nat.div_one, pow_one]
  rw [hdS, hmS] at hlt h3
  have hd32 : natB B / 2 % 2 ^ 5 < 32 := Nat.mod_lt _ (by norm_num)
  have hcond : 14 + 8 * (natB B / 2 % 2 ^ 5) + (if natB B % 2 = 1 then 765 else 0) ≤
      6 + 8 + 8 * (natB B / 2 % 2 ^ 5) + (if (natB B % 2 == 1) = true then 3 * 255 else 0) := by
    by_cases hm : natB B % 2 = 1
    · rw [if_pos hm, if_pos (by simp [hm])]
    · rw [if_neg hm, if_neg (by simp [hm])]
  generalize hn : 6 + 8 + 8 * (natB B / 2 % 2 ^ 5) + (if (natB B % 2 == 1) = true then 3 * 255 else 0) = n at hlt h3 hcond
  have hn1088 : n ≤ 1088 := by
    rw [← hn]; split <;> omega
  have hkey : key = natB B % 2 ^ n := by
    rw [win_full B _ hE] at h3
    have hk : win (E1N.keyBytes key) 0 1088 = key % 2 ^ 1088 := by
      rw [win, pow_zero, Nat.div_one, Nat.sub_zero, keyBytes_val, Nat.mod_mod]
    rw [hk, mod_mod_pow, min_eq_right hn1088, Nat.mod_eq_of_lt hlt] at h3
    exact h3.symm
  rw [hkey] at hs
  exact (startOK_mod x ub (natB B) n hcond).mp hs

/-! ## Jobs -/

theorem getD_map_natB (bs : Array ByteArray) (i : ℕ) (hi : i < bs.size) :
    (bs.toList.map natB).getD i 0 = natB (bs.getD i ByteArray.empty) := by
  rw [List.getD_eq_getElem _ _ (by simpa using hi)]
  simp [Array.getD, hi]

theorem toList_getD (a : Array ℕ) (k : ℕ) : a.toList.getD k 0 = a.getD k 0 := by
  simp [List.getD_eq_getElem?_getD, Array.getD_eq_getD_getElem?]

theorem map_getD (a : Array ℕ) (f : ℕ → ByteArray) (k : ℕ) (hk : k < a.size) :
    (a.map f).getD k ByteArray.empty = f (a.getD k 0) := by
  simp [Array.getD_eq_getD_getElem?, hk]

/-- **Jobs.** An accepted native job refines the kernel's `JobOK` of its key, given `JobOK` of its external children. -/
theorem jobB_ref (hD : IPRel D C sl UB UBR) (key : ℕ) (ext : Array ℕ) (b : ByteArray)
    (h : E1N.jobB D key ext b = true) (hext : ∀ k < ext.size, JobOK C sl UB (ext.getD k 0)) :
    JobOK C sl UB key := by
  intro x hg hsl hxub hx hs
  have hrev : ∀ i < 2 ^ 19, ∀ t < 255, (smr (sl i)).testBit t = (smask (sl i)).testBit (254 - t) :=
    fun i hi t ht => (hsl i hi).2.1 t ht
  unfold E1N.jobB at h
  generalize hpj : E1N.parseJob b = pj at h
  rcases pj with _ | ⟨bs, ws⟩
  · exact absurd h (by simp)
  dsimp only at h
  simp only [Bool.and_eq_true, bne_iff_ne, ne_eq] at h
  obtain ⟨⟨⟨⟨_, hne⟩, hextlt⟩, hst⟩, hall⟩ := h
  have hextlt' : ∀ k < ext.size, ext.getD k 0 < 2 ^ 1088 := by
    intro k hk
    have := (Array.all_eq_true.mp hextlt) k hk
    simpa [Array.getD, hk] using this
  have hall' : ∀ i < bs.size, E1N.blkGlued D bs ws (ext.map E1N.keyBytes) i = true :=
    fun i hi => List.all_eq_true.mp hall i (List.mem_range.mpr hi)
  have hSs : ∀ i < bs.size, (bs.toList.map natB).getD i 0 = natB (bs.getD i ByteArray.empty) := getD_map_natB bs
  have hlen : (bs.toList.map natB).length = bs.size := by simp
  -- every block accepted, every record glued
  have hblk : ∀ i < (bs.toList.map natB).length, E1P.block C sl UB UBR ((bs.toList.map natB).getD i 0) = true := by
    intro i hi
    rw [hlen] at hi
    have hb := hall' i hi
    unfold E1N.blkGlued at hb
    simp only [Bool.and_eq_true] at hb
    rw [hSs i hi]
    exact block_ref hD hrev _ hb.1.1
  have hglue : ∀ i < (bs.toList.map natB).length, ∀ j < E1P.rd 8 (E1P.bS2 ((bs.toList.map natB).getD i 0)),
      (∃ i', i < i' ∧ i' < (bs.toList.map natB).length ∧
        (E1P.glue (recOf ((bs.toList.map natB).getD i 0) j) ((bs.toList.map natB).getD i' 0) = true ∨
         E1P.glue0 (recOf ((bs.toList.map natB).getD i 0) j) ((bs.toList.map natB).getD i' 0) = true)) ∨
      (∃ k < ext.toList.length, E1P.glue (recOf ((bs.toList.map natB).getD i 0) j) (ext.toList.getD k 0) = true ∨
        E1P.glue0 (recOf ((bs.toList.map natB).getD i 0) j) (ext.toList.getD k 0) = true) := by
    intro i hi j hj
    rw [hlen] at hi
    rw [hSs i hi] at hj ⊢
    have hb := hall' i hi
    unfold E1N.blkGlued at hb
    simp only [Bool.and_eq_true, beq_iff_eq] at hb
    obtain ⟨⟨_, hws⟩, hgl⟩ := hb
    rw [(hdr_rel hD _).2, ← hws] at hj
    have hgj := List.all_eq_true.mp hgl j (List.mem_range.mpr hj)
    have hjn : j < (E1N.hdrOf D (bs.getD i ByteArray.empty)).2 := by rw [← hws]; exact hj
    try dsimp only at hgj
    by_cases ht : (ws.getD i #[]).getD j 0 < bs.size
    · rw [if_pos ht] at hgj
      simp only [Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq] at hgj
      obtain ⟨hit, hg2⟩ := hgj
      refine Or.inl ⟨_, hit, by rw [hlen]; exact ht, ?_⟩
      rw [hSs _ ht]
      rcases hg2 with hg2 | hg2
      · exact Or.inl (glueN_ref hD _ j _ hjn hg2)
      · exact Or.inr (glue0N_ref hD _ j _ hjn hg2)
    · rw [if_neg ht] at hgj
      simp only [Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq] at hgj
      obtain ⟨hk, hg2⟩ := hgj
      rw [Array.size_map] at hk
      refine Or.inr ⟨(ws.getD i #[]).getD j 0 - bs.size, by rw [Array.length_toList]; exact hk, ?_⟩
      have e1 := toList_getD ext ((ws.getD i #[]).getD j 0 - bs.size)
      have e2 := map_getD ext E1N.keyBytes _ hk
      rw [e2] at hg2
      rw [e1]
      rcases hg2 with hg2 | hg2
      · have := glueN_ref hD _ j _ hjn hg2
        rw [keyBytes_val, Nat.mod_eq_of_lt (hextlt' _ hk)] at this
        exact Or.inl this
      · have := glue0N_ref hD _ j _ hjn hg2
        rw [keyBytes_val, Nat.mod_eq_of_lt (hextlt' _ hk)] at this
        exact Or.inr this
  have hJ : ∀ k < ext.toList.length, ¬ StartOK x (fun l => E1P.fld UB l) (ext.toList.getD k 0) := by
    intro k hk
    have hk' : k < ext.size := by simpa using hk
    rw [toList_getD]
    exact hext k hk' x hg hsl hxub hx
  have hne' : 0 < (bs.toList.map natB).length := by rw [hlen]; omega
  have hc := chain_sound_ext C sl UB UBR (fun l => E1P.fld UB l) x hg hsl hD.UB_eq hD.UBR_eq hD.ub_le hxub hx
    (bs.toList.map natB) ext.toList hJ hblk hglue 0 hne'
  rw [hSs 0 (by omega)] at hc
  exact hc (start_key hD _ key hst x _ hs)

end E1NR
