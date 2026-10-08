module
public import R22Port.U_d41d8cd98f00
public import L5.Node5
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
/-! # `Batch5TDSpec`: soundness of `R3RT.batch5TD`

`foldR_sem`: one class fold packs the listed rows (reversed list order, last listed row in slot 0) into 512-bit mask slots
and 8-bit `cap - r` fields; `bad = 0` means every listed row has `cap ≥ r`.  `rec_ok`: the record rebuilt from the three
folds has valid rows (`RecRowsOK`), given `TabOK`.  `batch5TD_spec`: induction over the nodes with `node5_spec`. -/
noncomputable section
namespace L5
open E1S Finset R3RT.Spec RootSound BC4 BC5 Classical

/-! ## One class fold -/

/-- the cap field of a table entry, as `foldR` reads it -/
def capT (tab : ℕ → ℕ) (x : ℕ) : ℕ := (tab x >>> 511) % 512

theorem capT_eq (tab : ℕ → ℕ) (x : ℕ) : Nat.land (Nat.shiftRight (tab x) 511) 511 = capT tab x := by
  unfold capT; rw [land_eq, shr_eq, show (511 : ℕ) = 2 ^ 9 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]

theorem foldR_cons (tab : ℕ → ℕ) (r ri : ℕ) (L : List ℕ) (MB E bad c : ℕ) (k : ℕ → ℕ → ℕ → ℕ → Bool) :
    R3RT.foldR tab r (ri :: L) MB E bad c k = R3RT.foldR tab r L
      (Nat.lor (Nat.shiftLeft MB 512) (Nat.land (tab ri) L1.M511))
      (Nat.lor (Nat.shiftLeft E 8) (Nat.sub (Nat.land (Nat.shiftRight (tab ri) 511) 511) r))
      (Nat.lor bad (Nat.sub r (Nat.land (Nat.shiftRight (tab ri) 511) 511))) (Nat.succ c) k := rfl

theorem foldR_nil (tab : ℕ → ℕ) (r MB E bad c : ℕ) (k : ℕ → ℕ → ℕ → ℕ → Bool) :
    R3RT.foldR tab r [] MB E bad c k = k MB E bad c := rfl

theorem getD_rev_cons (x : ℕ) (L : List ℕ) (s : ℕ) :
    (x :: L).reverse.getD s 0 = if s < L.length then L.reverse.getD s 0 else if s = L.length then x else 0 := by
  rw [List.reverse_cons]
  split
  · rename_i hs; rw [List.getD_append _ _ _ _ (by simpa using hs)]
  · rename_i hs
    rw [List.getD_append_right _ _ _ _ (by simp; omega)]
    split
    · rename_i he; subst he; simp
    · rename_i he; simp only [List.length_reverse]
      rw [List.getD_eq_default _ _ (by simp; omega)]

theorem getD_rev_mem (L : List ℕ) (s : ℕ) (hs : s < L.length) : L.reverse.getD s 0 ∈ L := by
  rw [List.getD_eq_getElem _ _ (by simpa using hs)]
  exact List.mem_reverse.mp (List.getElem_mem _)

/-- **One class fold.** -/
theorem foldR_sem (tab : ℕ → ℕ) (r : ℕ) (k : ℕ → ℕ → ℕ → ℕ → Bool) : ∀ (L : List ℕ) (MB E bad c : ℕ),
    (∀ x ∈ L, capT tab x < 256) → R3RT.foldR tab r L MB E bad c k = true →
    ∃ badf, k (MB * 2 ^ (512 * L.length) + pk 512 (fun s => tab (L.reverse.getD s 0) % 2 ^ 511) L.length)
      (E * 2 ^ (8 * L.length) + pk 8 (fun s => capT tab (L.reverse.getD s 0) - r) L.length) badf (c + L.length) = true ∧
      (badf = 0 → bad = 0 ∧ ∀ x ∈ L, r ≤ capT tab x) := by
  intro L
  induction L with
  | nil =>
    intro MB E bad c _ h
    rw [foldR_nil] at h
    refine ⟨bad, by simpa [pk] using h, fun hb => ⟨hb, fun x hx => absurd hx (by simp)⟩⟩
  | cons x L ih =>
    intro MB E bad c hcap h
    rw [foldR_cons, capT_eq] at h
    have hx : capT tab x < 256 := hcap x (by simp)
    have e1 : Nat.lor (Nat.shiftLeft MB 512) (Nat.land (tab x) L1.M511) = MB * 2 ^ 512 + tab x % 2 ^ 511 := by
      rw [lor_eq, shl_eq, land_eq, M511_eq, Nat.and_two_pow_sub_one_eq_mod,
        ← Nat.shiftLeft_add_eq_or_of_lt (lt_trans (Nat.mod_lt _ (by positivity)) (by norm_num : (2:ℕ) ^ 511 < 2 ^ 512)),
        Nat.shiftLeft_eq]
    have e2 : Nat.lor (Nat.shiftLeft E 8) (Nat.sub (capT tab x) r) = E * 2 ^ 8 + (capT tab x - r) := by
      rw [lor_eq, shl_eq, nsub_eq, ← Nat.shiftLeft_add_eq_or_of_lt (by norm_num; omega : capT tab x - r < 2 ^ 8),
        Nat.shiftLeft_eq]
    rw [e1, e2] at h
    obtain ⟨badf, hk, hbad⟩ := ih _ _ _ _ (fun y hy => hcap y (by simp [hy])) h
    refine ⟨badf, ?_, ?_⟩
    · have eM : (MB * 2 ^ 512 + tab x % 2 ^ 511) * 2 ^ (512 * L.length) +
          pk 512 (fun s => tab (L.reverse.getD s 0) % 2 ^ 511) L.length =
          MB * 2 ^ (512 * (x :: L).length) + pk 512 (fun s => tab ((x :: L).reverse.getD s 0) % 2 ^ 511) (x :: L).length := by
        rw [List.length_cons, pk_succ]
        rw [pk_congr 512 (fun s => tab ((x :: L).reverse.getD s 0) % 2 ^ 511) (fun s => tab (L.reverse.getD s 0) % 2 ^ 511)
          L.length (fun s hs => by beta_reduce; rw [getD_rev_cons, if_pos hs])]
        rw [getD_rev_cons, if_neg (by omega), if_pos rfl, show 512 * (L.length + 1) = 512 + 512 * L.length by ring, pow_add]
        ring
      have eE : (E * 2 ^ 8 + (capT tab x - r)) * 2 ^ (8 * L.length) +
          pk 8 (fun s => capT tab (L.reverse.getD s 0) - r) L.length =
          E * 2 ^ (8 * (x :: L).length) + pk 8 (fun s => capT tab ((x :: L).reverse.getD s 0) - r) (x :: L).length := by
        rw [List.length_cons, pk_succ]
        rw [pk_congr 8 (fun s => capT tab ((x :: L).reverse.getD s 0) - r) (fun s => capT tab (L.reverse.getD s 0) - r)
          L.length (fun s hs => by beta_reduce; rw [getD_rev_cons, if_pos hs])]
        rw [getD_rev_cons, if_neg (by omega), if_pos rfl, show 8 * (L.length + 1) = 8 + 8 * L.length by ring, pow_add]
        ring
      rw [← eM, ← eE, show c + (x :: L).length = Nat.succ c + L.length by simp; ring]
      exact hk
    · intro hb
      obtain ⟨hb1, hb2⟩ := hbad hb
      rw [lor_eq, nsub_eq] at hb1
      have h0 : bad = 0 ∧ r - capT tab x = 0 := by
        constructor
        · apply Nat.eq_of_testBit_eq; intro i
          have := congrArg (fun y => y.testBit i) hb1; simp only [Nat.testBit_or, Nat.zero_testBit] at this
          simp only [Nat.zero_testBit]; cases hbi : bad.testBit i <;> simp_all
        · apply Nat.eq_of_testBit_eq; intro i
          have := congrArg (fun y => y.testBit i) hb1; simp only [Nat.testBit_or, Nat.zero_testBit] at this
          simp only [Nat.zero_testBit]; cases hbi : (r - capT tab x).testBit i <;> simp_all
      refine ⟨h0.1, fun y hy => ?_⟩
      rw [List.mem_cons] at hy
      rcases hy with rfl | hy
      · omega
      · exact hb2 y hy

/-! ## The rebuilt record -/

/-- the packed masks of one class (last listed row in slot 0) -/
def PK (tab : ℕ → ℕ) (L : List ℕ) : ℕ := pk 512 (fun s => tab (L.reverse.getD s 0) % 2 ^ 511) L.length
/-- the packed `cap - r` fields of one class -/
def QK (tab : ℕ → ℕ) (r : ℕ) (L : List ℕ) : ℕ := pk 8 (fun s => capT tab (L.reverse.getD s 0) - r) L.length

theorem pk_three (B : ℕ) (F : ℕ → ℕ) (a b c : ℕ) :
    pk B F (a + b + c) = pk B F a + 2 ^ (B * a) * (pk B (fun i => F (a + i)) b +
      2 ^ (B * b) * pk B (fun i => F (a + b + i)) c) := by
  rw [Nat.add_assoc, pk_split B F a (b + c), pk_split B (fun i => F (a + i)) b c]
  rw [pk_congr B (fun i => F (a + (b + i))) (fun i => F (a + b + i)) c (fun i _ => by beta_reduce; rw [Nat.add_assoc])]

/-- **The record of `batch5TD`.** -/
theorem rec_ok (tab : ℕ → ℕ) (hT : TabOK tab) (hdr : ℕ) (L2 L1 L0 : List ℕ)
    (hn2 : L2.length = (hdr >>> 52) % 1024) (hn1 : L1.length = (hdr >>> 32) % 1024) (hnV : L0.length = (hdr >>> 22) % 1024)
    (hc2 : ∀ x ∈ L2, 2 ≤ capT tab x) (hc1 : ∀ x ∈ L1, 1 ≤ capT tab x) (MB E : ℕ)
    (hMB : MB = ((0 * 2 ^ (512 * L2.length) + PK tab L2) * 2 ^ (512 * L1.length) + PK tab L1) * 2 ^ (512 * L0.length) +
      PK tab L0)
    (hE : E = ((0 * 2 ^ (8 * L2.length) + QK tab 2 L2) * 2 ^ (8 * L1.length) + QK tab 1 L1) * 2 ^ (8 * L0.length) +
      QK tab 0 L0) :
    RecRowsOK (Nat.lor (Nat.land hdr 18446744073709551615)
      (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 (L0.length + L1.length + L2.length)))) 64)) := by
  set nV := L0.length with hnVdef
  set n1 := L1.length with hn1def
  set n2 := L2.length with hn2def
  set m := nV + n1 + n2 with hm
  have hcapT : ∀ x, capT tab x < 256 := fun x => (hT x).1
  -- the rows, record order
  set F : ℕ → ℕ := fun s => if s < nV then tab (L0.reverse.getD s 0) % 2 ^ 511 else
    if s < nV + n1 then tab (L1.reverse.getD (s - nV) 0) % 2 ^ 511 else tab (L2.reverse.getD (s - nV - n1) 0) % 2 ^ 511
    with hF
  set G : ℕ → ℕ := fun s => if s < nV then capT tab (L0.reverse.getD s 0) - 0 else
    if s < nV + n1 then capT tab (L1.reverse.getD (s - nV) 0) - 1 else capT tab (L2.reverse.getD (s - nV - n1) 0) - 2
    with hG
  have hFlt : ∀ s < m, F s < 2 ^ 512 := by
    intro s _; simp only [hF]
    split
    · exact lt_trans (Nat.mod_lt _ (by positivity)) (by norm_num)
    · split
      · exact lt_trans (Nat.mod_lt _ (by positivity)) (by norm_num)
      · exact lt_trans (Nat.mod_lt _ (by positivity)) (by norm_num)
  have hcb : ∀ x r, capT tab x - r < 2 ^ 8 := fun x r => by have := hcapT x; norm_num; omega
  have hGlt : ∀ s < m, G s < 2 ^ 8 := by
    intro s _; simp only [hG]
    split
    · exact hcb _ _
    · split
      · exact hcb _ _
      · exact hcb _ _
  have hMBp : MB = pk 512 F m := by
    rw [hMB, hm, pk_three]
    have e0 : pk 512 F nV = PK tab L0 := pk_congr 512 _ _ nV (fun s hs => by simp only [hF, if_pos hs])
    have e1 : pk 512 (fun i => F (nV + i)) n1 = PK tab L1 :=
      pk_congr 512 _ _ n1 (fun s hs => by simp only [hF, if_neg (show ¬ nV + s < nV by omega),
        if_pos (show nV + s < nV + n1 by omega), show nV + s - nV = s by omega])
    have e2 : pk 512 (fun i => F (nV + n1 + i)) n2 = PK tab L2 :=
      pk_congr 512 _ _ n2 (fun s hs => by simp only [hF, if_neg (show ¬ nV + n1 + s < nV by omega),
        if_neg (show ¬ nV + n1 + s < nV + n1 by omega), show nV + n1 + s - nV - n1 = s by omega])
    rw [e0, e1, e2]; ring
  have hEp : E = pk 8 G m := by
    rw [hE, hm, pk_three]
    have e0 : pk 8 G nV = QK tab 0 L0 := pk_congr 8 _ _ nV (fun s hs => by simp only [hG, if_pos hs])
    have e1 : pk 8 (fun i => G (nV + i)) n1 = QK tab 1 L1 :=
      pk_congr 8 _ _ n1 (fun s hs => by simp only [hG, if_neg (show ¬ nV + s < nV by omega),
        if_pos (show nV + s < nV + n1 by omega), show nV + s - nV = s by omega])
    have e2 : pk 8 (fun i => G (nV + n1 + i)) n2 = QK tab 2 L2 :=
      pk_congr 8 _ _ n2 (fun s hs => by simp only [hG, if_neg (show ¬ nV + n1 + s < nV by omega),
        if_neg (show ¬ nV + n1 + s < nV + n1 by omega), show nV + n1 + s - nV - n1 = s by omega])
    rw [e0, e1, e2]; ring
  have hMBlt : MB < 2 ^ (512 * m) := by rw [hMBp]; exact pk_lt 512 F m hFlt
  -- the body and the header
  have hbody : Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 m)) = MB + E * 2 ^ (512 * m) := by
    rw [lor_eq, shl_eq, nmul_eq, Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hMBlt, Nat.shiftLeft_eq]; ring
  have hrec : Nat.lor (Nat.land hdr 18446744073709551615) (Nat.shiftLeft (MB + E * 2 ^ (512 * m)) 64) =
      hdr % 2 ^ 64 + (MB + E * 2 ^ (512 * m)) * 2 ^ 64 := by
    rw [lor_eq, land_eq, shl_eq, show (18446744073709551615 : ℕ) = 2 ^ 64 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod,
      Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt (Nat.mod_lt _ (by positivity)), Nat.shiftLeft_eq]; ring
  rw [hbody, hrec]
  set rec := hdr % 2 ^ 64 + (MB + E * 2 ^ (512 * m)) * 2 ^ 64 with hrecdef
  have hlo : rec % 2 ^ 64 = hdr % 2 ^ 64 := by
    rw [hrecdef, Nat.add_mul_mod_self_right, Nat.mod_mod]
  have hhi : rec >>> 64 = MB + E * 2 ^ (512 * m) := by
    rw [hrecdef, Nat.shiftRight_eq_div_pow, Nat.add_mul_div_right _ _ (by positivity),
      Nat.div_eq_of_lt (Nat.mod_lt _ (by positivity)), Nat.zero_add]
  have hfV : ((rec % 2 ^ 64) >>> 22) % 1024 = nV := by rw [hlo, hdr_field hdr 22 (by norm_num)]; exact hnV.symm
  have hf1 : ((rec % 2 ^ 64) >>> 32) % 1024 = n1 := by rw [hlo, hdr_field hdr 32 (by norm_num)]; exact hn1.symm
  have hf2 : ((rec % 2 ^ 64) >>> 52) % 1024 = n2 := by rw [hlo, hdr_field hdr 52 (by norm_num)]; exact hn2.symm
  simp only [RecRowsOK]
  rw [hfV, hf1, hf2, hhi, ← hm]
  intro i hi
  rw [fld_eq_dig, fld_eq_dig]
  have hd1 : dig 512 (MB + E * 2 ^ (512 * m)) i = F i := by
    have h1 := dig_mod_pow (MB + E * 2 ^ (512 * m)) 512 m i
    rw [if_pos hi, Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt hMBlt] at h1
    rw [← h1, hMBp]; exact dig_pk 512 F m hFlt i hi
  have hd2 : dig 8 ((MB + E * 2 ^ (512 * m)) >>> (512 * m)) i = G i := by
    rw [Nat.shiftRight_eq_div_pow, Nat.add_mul_div_right _ _ (by positivity), Nat.div_eq_of_lt hMBlt, Nat.zero_add, hEp]
    exact dig_pk 8 G m hGlt i hi
  rw [hd1, hd2]
  simp only [hF, hG]
  by_cases h0 : i < nV
  · simp only [if_pos h0, Nat.sub_zero, Nat.add_zero, Nat.mod_mod]
    exact (hT _).2
  · by_cases h1 : i < nV + n1
    · simp only [if_neg h0, if_pos h1, Nat.mod_mod]
      have hx := hc1 _ (getD_rev_mem L1 (i - nV) (by omega))
      rw [Nat.sub_add_cancel hx]; exact (hT _).2
    · simp only [if_neg h0, if_neg h1, Nat.mod_mod]
      have hx := hc2 _ (getD_rev_mem L2 (i - nV - n1) (by omega))
      rw [Nat.sub_add_cancel hx]; exact (hT _).2

/-! ## The batch -/

theorem low_field (x y a w : ℕ) (h : x % 2 ^ 64 = y % 2 ^ 64) (ha : a + w ≤ 64) : (x >>> a) % 2 ^ w = (y >>> a) % 2 ^ w := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_shiftRight, Nat.testBit_shiftRight]
  by_cases hj : j < w
  · have h1 := congrArg (fun z => z.testBit (a + j)) h
    simp only [Nat.testBit_mod_two_pow, show a + j < 64 by omega, decide_true, Bool.true_and] at h1
    rw [h1]
  · simp [hj]

theorem rec_lo (hdr MB E m : ℕ) (hMB : MB < 2 ^ (512 * m)) :
    Nat.lor (Nat.land hdr 18446744073709551615) (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 m))) 64) % 2 ^ 64 =
      hdr % 2 ^ 64 := by
  rw [lor_eq, land_eq, shl_eq, show (18446744073709551615 : ℕ) = 2 ^ 64 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod,
    Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt (Nat.mod_lt _ (by positivity)), Nat.shiftLeft_eq,
    Nat.mul_comm, Nat.mul_add_mod, Nat.mod_mod]

theorem batch5TD'_sound (tab : ℕ → ℕ) (hT : TabOK tab) : ∀ (nodes : List Node5) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)),
    (∀ f ∈ st, FrameOK f.1 f.2.1 f.2.2.1 f.2.2.2.1 f.2.2.2.2) →
    (∀ x ∈ nodes, C2OK ((x.2.2.2.1 >>> 8) % 512) x.1 ∧ HOK ((x.2.2.2.1 >>> 8) % 512) x.2.1) →
    R3RT.batch5TD' tab st nodes = true → BatchOK st nodes := by
  intro nodes
  induction nodes with
  | nil => intro st _ _ _; simp [BatchOK]
  | cons x rest ih =>
    intro st hst hnodes hb
    obtain ⟨c2, h, suf, hdr, r2, r1, r0, ks⟩ := x
    have hx := hnodes (c2, h, suf, hdr, r2, r1, r0, ks) (List.mem_cons_self ..)
    simp only at hx
    have hrest : ∀ y ∈ rest, C2OK ((y.2.2.2.1 >>> 8) % 512) y.1 ∧ HOK ((y.2.2.2.1 >>> 8) % 512) y.2.1 :=
      fun y hy => hnodes y (List.mem_cons_of_mem _ hy)
    have hpop : Nat.land hdr 255 = hdr % 256 := by
      rw [land_eq, show (255 : ℕ) = 2 ^ 8 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
    simp only [R3RT.batch5TD'] at hb
    rw [hpop] at hb
    show BatchOK st ((c2, h, suf, hdr, r2, r1, r0, ks) :: rest)
    simp only [BatchOK]
    rcases hd : List.drop (hdr % 256) st with _ | ⟨⟨S, D, N, U, dP⟩, st'⟩
    · rw [hd] at hb; exact absurd hb (by simp)
    · rw [hd] at hb
      simp only at hb ⊢
      have hF : FrameOK S D N U dP := by
        have := hst (S, D, N, U, dP) (List.mem_of_mem_drop (i := hdr % 256) (a := (S, D, N, U, dP)) (by rw [hd]; simp))
        exact this
      have hcap : ∀ y, capT tab y < 256 := fun y => (hT y).1
      obtain ⟨b2, hk2, hb2⟩ := foldR_sem tab 2 _ r2 0 0 0 0 (fun y _ => hcap y) hb
      obtain ⟨b1, hk1, hb1⟩ := foldR_sem tab 1 _ r1 _ _ _ 0 (fun y _ => hcap y) hk2
      obtain ⟨b0, hk0, hb0⟩ := foldR_sem tab 0 _ r0 _ _ _ 0 (fun y _ => hcap y) hk1
      simp only [Bool.and_eq_true, Nat.beq_eq] at hk0
      obtain ⟨⟨⟨⟨hbad, hc2'⟩, hc1'⟩, hc0'⟩, hn5⟩ := hk0
      obtain ⟨hb1z, _⟩ := hb0 hbad
      obtain ⟨hb2z, hcap1⟩ := hb1 hb1z
      obtain ⟨_, hcap2⟩ := hb2 hb2z
      have hn2 : r2.length = (hdr >>> 52) % 1024 := by rw [← n5n2_eq]; unfold n5n2; omega
      have hn1 : r1.length = (hdr >>> 32) % 1024 := by rw [← n5n1_eq]; unfold n5n1; omega
      have hnV : r0.length = (hdr >>> 22) % 1024 := by rw [← n5nV_eq]; unfold n5nV; omega
      have hm : Nat.add (Nat.land (Nat.shiftRight hdr 22) 1023)
          (Nat.add (Nat.land (Nat.shiftRight hdr 32) 1023) (Nat.land (Nat.shiftRight hdr 52) 1023)) =
          r0.length + r1.length + r2.length := by
        rw [nadd_eq, nadd_eq, hnV, hn1, hn2, ← n5nV_eq, ← n5n1_eq, ← n5n2_eq]; unfold n5nV n5n1 n5n2; ring
      rw [hm] at hn5
      set MB := ((0 * 2 ^ (512 * r2.length) + PK tab r2) * 2 ^ (512 * r1.length) + PK tab r1) * 2 ^ (512 * r0.length) +
        PK tab r0 with hMB
      set E := ((0 * 2 ^ (8 * r2.length) + QK tab 2 r2) * 2 ^ (8 * r1.length) + QK tab 1 r1) * 2 ^ (8 * r0.length) +
        QK tab 0 r0 with hE
      have hrecok := rec_ok tab hT hdr r2 r1 r0 hn2 hn1 hnV hcap2 hcap1 MB E rfl rfl
      have hMBlt : MB < 2 ^ (512 * (r0.length + r1.length + r2.length)) := by
        have hPK : ∀ L : List ℕ, PK tab L < 2 ^ (512 * L.length) := fun L =>
          pk_lt 512 _ _ (fun s _ => lt_trans (Nat.mod_lt _ (by positivity)) (by norm_num))
        rw [hMB]
        have h2 := hPK r2; have h1 := hPK r1; have h0 := hPK r0
        calc _ = PK tab r0 + 2 ^ (512 * r0.length) * (PK tab r1 + 2 ^ (512 * r1.length) * PK tab r2) := by ring
          _ < 2 ^ (512 * r0.length) + 2 ^ (512 * r0.length) * (PK tab r1 + 2 ^ (512 * r1.length) * PK tab r2) := by omega
          _ = 2 ^ (512 * r0.length) * (PK tab r1 + 2 ^ (512 * r1.length) * PK tab r2 + 1) := by ring
          _ ≤ 2 ^ (512 * r0.length) * (2 ^ (512 * r1.length) * 2 ^ (512 * r2.length)) := by
              apply Nat.mul_le_mul_left
              calc PK tab r1 + 2 ^ (512 * r1.length) * PK tab r2 + 1
                  ≤ 2 ^ (512 * r1.length) + 2 ^ (512 * r1.length) * PK tab r2 := by omega
                _ = 2 ^ (512 * r1.length) * (PK tab r2 + 1) := by ring
                _ ≤ 2 ^ (512 * r1.length) * 2 ^ (512 * r2.length) := Nat.mul_le_mul_left _ (by omega)
          _ = 2 ^ (512 * (r0.length + r1.length + r2.length)) := by rw [← pow_add, ← pow_add]; ring_nf
      have hlo := rec_lo hdr MB E (r0.length + r1.length + r2.length) hMBlt
      have hlast : ((Nat.lor (Nat.land hdr 18446744073709551615)
          (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 (r0.length + r1.length + r2.length)))) 64)) >>> 8) % 512 =
          (hdr >>> 8) % 512 := low_field _ _ 8 9 hlo (by norm_num)
      obtain ⟨D', hF', hK, hk⟩ := node5_spec S D N U dP c2 h suf _ ks _ hF (by rw [hlast]; exact hx.1)
        (by rw [hlast]; exact hx.2) hrecok hn5
      rw [hlast] at hF' hK hk
      refine ⟨hK, D', hF', ?_⟩
      apply ih _ _ hrest hk
      intro f hf
      rw [List.mem_cons] at hf
      rcases hf with rfl | hf
      · exact hF'
      · rw [List.mem_cons] at hf
        rcases hf with rfl | hf
        · exact hF
        · exact hst f (List.mem_of_mem_drop (i := hdr % 256) (a := f) (by rw [hd]; exact List.mem_cons_of_mem _ hf))

/-- **`batch5TD`'s contract.** -/
theorem batch5TD_spec : Batch5TDSpec := by
  intro tab st nodes hT hst hnodes hb
  exact batch5TD'_sound tab hT nodes st hst hnodes hb

end L5
