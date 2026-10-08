module
public import R22Port.U_1c71214424ff
public import Mathlib.Data.Nat.Bitwise
public import G.Accept
/-! # Coverage lemmas for the per-anchor assembly: batch theorems (`allV2 … = true`, …) to the `G/Accept.lean` statements -/
@[expose] public section
namespace G.Cov
open G.V2 G.A2 G.Acc

theorem bit_eq_one_iff (M x : Nat) : G.bit M x = 1 ↔ M.testBit x = true := by
  show (M >>> x &&& 1 = 1) ↔ _
  rw [Nat.testBit, Nat.shiftRight_eq_div_pow]; constructor <;> intro h <;> simp_all [Nat.and_one_is_mod]

theorem testBit_one_shiftLeft (x i : Nat) : (1 <<< x).testBit i = decide (x = i) := by
  simp [Nat.one_shiftLeft, Nat.testBit_two_pow]

/-- `listChk1 L M` lists every set bit of `M` -/
theorem listChk1_mem : ∀ (L : List Nat) (M k : Nat), listChk1 L M = true → M.testBit k = true → k ∈ L
  | [], M, k, h, hk => by
    have : M = 0 := Nat.eq_of_beq_eq_true h
    subst this; simp at hk
  | x :: L, M, k, h, hk => by
    have h' : G.bit M x = 1 ∧ listChk1 L (Nat.xor M (Nat.shiftLeft 1 x)) = true := by
      simpa [listChk1, Bool.and_eq_true, Nat.beq_eq] using h
    by_cases hkx : k = x
    · simp [hkx]
    · refine List.mem_cons_of_mem _ (listChk1_mem L _ k h'.2 ?_)
      show (M ^^^ (1 <<< x)).testBit k = true
      rw [Nat.testBit_xor, testBit_one_shiftLeft, hk]
      simp [Ne.symm hkx]

theorem testBit_jwin (jlo jhi j : Nat) (h1 : jlo ≤ j) (h2 : j < jhi) : (jwin jlo jhi).testBit j = true := by
  show ((1 <<< jhi - 1) ^^^ (1 <<< jlo - 1)).testBit j = true
  rw [Nat.testBit_xor, Nat.one_shiftLeft, Nat.one_shiftLeft, Nat.testBit_two_pow_sub_one, Nat.testBit_two_pow_sub_one]
  simp [h2, Nat.not_lt.mpr h1]

/-! ### per-vertex batches -/
theorem allV2_sem (o : Orb2) (n1 : Nat) : ∀ (cs : List VCert2) (lo : Nat), allV2 o n1 lo cs = true →
    ∀ i, lo ≤ i → i < lo + cs.length → ∃ c, allV2 o n1 i [c] = true
  | [], lo, _, i, h1, h2 => by simp at h2; omega
  | (chs, recs, ws, qs) :: cs, lo, h, i, h1, h2 => by
    simp only [allV2, Bool.and_eq_true] at h
    by_cases hi : i = lo
    · subst hi; exact ⟨(chs, recs, ws, qs), by simp [allV2, h.1]⟩
    · exact allV2_sem o n1 cs (lo + 1) h.2 i (by omega) (by simp at h2; omega)

theorem allV1_sem (o : Orb2) (n1 : Nat) : ∀ (cs : List VCert1) (lo : Nat), allV1 o n1 lo cs = true →
    ∀ i, lo ≤ i → i < lo + cs.length → ∃ c, allV1 o n1 i [c] = true
  | [], lo, _, i, h1, h2 => by simp at h2; omega
  | (chs, recs, ws) :: cs, lo, h, i, h1, h2 => by
    simp only [allV1, Bool.and_eq_true] at h
    by_cases hi : i = lo
    · subst hi; exact ⟨(chs, recs, ws), by simp [allV1, h.1]⟩
    · exact allV1_sem o n1 cs (lo + 1) h.2 i (by omega) (by simp at h2; omega)

theorem allA2_sem (t0 d : Nat) (o : Orb2) (PY0 PY1 : Nat) (rB rC : List (Nat × Nat × Nat)) :
    ∀ (cs : List (List Nat × List (List CEnt))) (lo : Nat), allA2 t0 d o PY0 PY1 rB rC lo cs = true →
    ∀ i, lo ≤ i → i < lo + cs.length → ∃ c, allA2 t0 d o PY0 PY1 rB rC i [c] = true
  | [], lo, _, i, h1, h2 => by simp at h2; omega
  | c :: cs, lo, h, i, h1, h2 => by
    obtain ⟨es, css⟩ := c
    simp only [allA2, Bool.and_eq_true] at h
    by_cases hi : i = lo
    · subst hi; exact ⟨(es, css), by simp only [allA2, Bool.and_eq_true]; exact ⟨h.1, trivial⟩⟩
    · exact allA2_sem t0 d o PY0 PY1 rB rC cs (lo + 1) h.2 i (by omega) (by simp at h2; omega)

theorem allA3_sem (t0 d : Nat) (o : Orb2) (rV : List (Nat × Nat × Nat)) :
    ∀ (cs : List (List (List CEnt))) (lo : Nat), allA3 t0 d o rV lo cs = true →
    ∀ i, lo ≤ i → i < lo + cs.length → ∃ c, allA3 t0 d o rV i [c] = true
  | [], lo, _, i, h1, h2 => by simp at h2; omega
  | c :: cs, lo, h, i, h1, h2 => by
    simp only [allA3, Bool.and_eq_true] at h
    by_cases hi : i = lo
    · subst hi; exact ⟨c, by simp only [allA3, Bool.and_eq_true]; exact ⟨h.1, trivial⟩⟩
    · exact allA3_sem t0 d o rV cs (lo + 1) h.2 i (by omega) (by simp at h2; omega)

/-! ### chaining intervals -/
theorem upto_ext {P : Nat → Prop} (lo hi : Nat) (h : ∀ i, lo ≤ i → i < hi → P i) (hp : ∀ i, i < lo → P i) :
    ∀ i, i < hi → P i :=
  fun i hi' => if hl : i < lo then hp i hl else h i (by omega) hi'
theorem upto_zero {P : Nat → Prop} : ∀ i, i < 0 → P i := fun i h => absurd h (Nat.not_lt_zero i)
/-- a batch theorem with its length, as an interval statement -/
theorem allV2_int (o : Orb2) (n1 : Nat) (cs : List VCert2) (lo hi : Nat) (h : allV2 o n1 lo cs = true)
    (hl : lo + cs.length = hi) : ∀ i, lo ≤ i → i < hi → ∃ c, allV2 o n1 i [c] = true :=
  fun i h1 h2 => allV2_sem o n1 cs lo h i h1 (hl ▸ h2)
theorem allV1_int (o : Orb2) (n1 : Nat) (cs : List VCert1) (lo hi : Nat) (h : allV1 o n1 lo cs = true)
    (hl : lo + cs.length = hi) : ∀ i, lo ≤ i → i < hi → ∃ c, allV1 o n1 i [c] = true :=
  fun i h1 h2 => allV1_sem o n1 cs lo h i h1 (hl ▸ h2)
theorem allA2_int (t0 d : Nat) (o : Orb2) (PY0 PY1 : Nat) (rB rC : List (Nat × Nat × Nat))
    (cs : List (List Nat × List (List CEnt))) (lo hi : Nat) (h : allA2 t0 d o PY0 PY1 rB rC lo cs = true)
    (hl : lo + cs.length = hi) : ∀ i, lo ≤ i → i < hi → ∃ c, allA2 t0 d o PY0 PY1 rB rC i [c] = true :=
  fun i h1 h2 => allA2_sem t0 d o PY0 PY1 rB rC cs lo h i h1 (hl ▸ h2)
theorem allA3_int (t0 d : Nat) (o : Orb2) (rV : List (Nat × Nat × Nat)) (cs : List (List (List CEnt))) (lo hi : Nat)
    (h : allA3 t0 d o rV lo cs = true) (hl : lo + cs.length = hi) : ∀ i, lo ≤ i → i < hi → ∃ c, allA3 t0 d o rV i [c] = true :=
  fun i h1 h2 => allA3_sem t0 d o rV cs lo h i h1 (hl ▸ h2)

/-! ### rank-2 bases -/
/-- `p` holds for every element (plain recursion, so `AllL p (x :: l)` unfolds to `p x ∧ AllL p l`) -/
def AllL {α : Type} (p : α → Prop) : List α → Prop
  | [] => True
  | x :: l => p x ∧ AllL p l
theorem allL_append {α : Type} {p : α → Prop} : ∀ (l1 l2 : List α), AllL p l1 → AllL p l2 → AllL p (l1 ++ l2)
  | [], _, _, h2 => h2
  | _ :: l1, l2, h1, h2 => ⟨h1.1, allL_append l1 l2 h1.2 h2⟩
theorem allL_mem {α : Type} {p : α → Prop} : ∀ (l : List α), AllL p l → ∀ x ∈ l, p x
  | [], _, x, hx => by simp at hx
  | y :: l, h, x, hx => by
    rcases List.mem_cons.mp hx with rfl | hx
    · exact h.1
    · exact allL_mem l h.2 x hx
theorem vertsS_sem (o : Orb2) (n1 c r : Nat) : ∀ (js : List Nat) (cs : List SCert), vertsS o n1 c r js cs = true →
    ∀ j ∈ js, ∃ cert : SCert, checkS o n1 c r j cert.1 cert.2 = true
  | [], [], _, j, hj => by simp at hj
  | [], _ :: _, h, _, _ => by simp [vertsS] at h
  | _ :: _, [], h, _, _ => by simp [vertsS] at h
  | j0 :: js, (chs, recs) :: cs, h, j, hj => by
    simp only [vertsS, Bool.and_eq_true] at h
    rcases List.mem_cons.mp hj with rfl | hj
    · exact ⟨(chs, recs), h.1⟩
    · exact vertsS_sem o n1 c r js cs h.2 j hj

/-- the window entries `(off, jlo, jhi)` of a shape-S batch are checked: every vertex of record `off` in `[jlo, jhi)` passes -/
def WinOK (o : Orb2) (ci ch : Nat) (x : Nat × Nat × Nat) : Prop :=
  ∀ j, (rLoc (recOf ch x.1)).testBit j = true → x.2.1 ≤ j → j < x.2.2 →
    ∃ cert : SCert, checkS o 17 (256 * ci + x.1) (recOf ch x.1) j cert.1 cert.2 = true

def winsOf (es : List (Nat × Nat × Nat × List Nat × List SCert)) : List (Nat × Nat × Nat) := es.map fun e => (e.1, e.2.1, e.2.2.1)

theorem allS_sem (o : Orb2) (ci ch : Nat) : ∀ (es : List (Nat × Nat × Nat × List Nat × List SCert)),
    allS o 17 ci ch es = true → AllL (WinOK o ci ch) (winsOf es)
  | [], _ => trivial
  | (off, jlo, jhi, js, cs) :: es, h => by
    simp only [allS, Bool.and_eq_true] at h
    show WinOK o ci ch (off, jlo, jhi) ∧ AllL (WinOK o ci ch) (winsOf es)
    refine ⟨fun j hj h1 h2 => ?_, allS_sem o ci ch es h.2⟩
    simp only at hj h1 h2
    have hm : j ∈ js := listChk1_mem js _ j h.1.1 (by
      show ((rLoc (recOf ch off)) &&& (jwin jlo jhi)).testBit j = true
      rw [Nat.testBit_land, hj, testBit_jwin jlo jhi j h1 h2]; rfl)
    have : 256 * ci + off = Nat.add (Nat.mul 256 ci) off := rfl
    exact this ▸ vertsS_sem o 17 (Nat.add (Nat.mul 256 ci) off) (recOf ch off) js cs h.1.2 j hm


/-- the windows of a chunk tile its records: per record `off` (in order, from 0 to `n`) windows `[0, j1), [j1, j2), …,
`[jk, 512)` -/
def tilesS : List (Nat × Nat × Nat) → Nat → Nat → Nat → Bool
  | [], off, j, n => Nat.beq off n && Nat.beq j 0
  | (o', lo, hi) :: ws, off, j, n =>
    Nat.beq o' off && Nat.beq lo j && Nat.blt lo hi && Nat.ble hi 512 &&
      cond (Nat.beq hi 512) (tilesS ws (Nat.succ off) 0 n) (tilesS ws off hi n)

theorem tilesS_sem (P : Nat → Nat → Prop) : ∀ (ws : List (Nat × Nat × Nat)) (off j n : Nat), tilesS ws off j n = true →
    AllL (fun x : Nat × Nat × Nat => ∀ k, x.2.1 ≤ k → k < x.2.2 → P x.1 k) ws →
    (∀ k, j ≤ k → k < 512 → P off k) ∧ (∀ o', off < o' → o' < n → ∀ k, k < 512 → P o' k) ∨ (off = n ∧ j = 0)
  | [], off, j, n, h, _ => by
    simp only [tilesS, Bool.and_eq_true, Nat.beq_eq] at h
    exact Or.inr ⟨h.1, h.2⟩
  | (o', lo, hi) :: ws, off, j, n, h, hf => by
    simp only [tilesS, Bool.and_eq_true, Nat.beq_eq, Nat.blt_eq, Nat.ble_eq] at h
    obtain ⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩ := h
    subst h1; subst h2
    have hf' : (∀ k, lo ≤ k → k < hi → P o' k) ∧ AllL (fun x : Nat × Nat × Nat => ∀ k, x.2.1 ≤ k → k < x.2.2 → P x.1 k) ws := hf
    have hx := hf'.1
    have hr := hf'.2
    by_cases he : hi = 512
    · rw [he] at h5; simp only [show Nat.beq 512 512 = true from rfl, cond_true] at h5
      rcases tilesS_sem P ws (o' + 1) 0 n h5 hr with ⟨ha, hb⟩ | ⟨hn, _⟩
      · refine Or.inl ⟨fun k hk1 hk2 => hx k hk1 (he ▸ hk2), fun o2 ho1 ho2 k hk => ?_⟩
        rcases Nat.lt_or_ge (o' + 1) o2 with hlt | hge
        · exact hb o2 hlt ho2 k hk
        · have : o2 = o' + 1 := by omega
          subst this; exact ha k (Nat.zero_le _) hk
      · refine Or.inl ⟨fun k hk1 hk2 => hx k hk1 (he ▸ hk2), fun o2 ho1 ho2 k hk => ?_⟩
        omega
    · have hne : Nat.beq hi 512 = false := by
        cases hb : Nat.beq hi 512
        · rfl
        · exact absurd (Nat.eq_of_beq_eq_true hb) he
      simp only [hne, cond_false] at h5
      rcases tilesS_sem P ws o' hi n h5 hr with ⟨ha, hb⟩ | ⟨hn, hz⟩
      · refine Or.inl ⟨fun k hk1 hk2 => ?_, hb⟩
        rcases Nat.lt_or_ge k hi with hlt | hge
        · exact hx k hk1 hlt
        · exact ha k hge hk2
      · omega


/-! ### shape S: chunks to `SOK` -/
theorem allL_imp {α : Type} {p q : α → Prop} (hpq : ∀ x, p x → q x) : ∀ (l : List α), AllL p l → AllL q l
  | [], _ => trivial
  | x :: l, h => ⟨hpq x h.1, allL_imp hpq l h.2⟩

/-- the vertices of the records of chunk `ci` pass `checkS` -/
def Qch (o : Orb2) (nRec ci : Nat) : Prop :=
  ∀ off, off < 256 → 256 * ci + off < nRec → ∀ k, k < 512 → (rLoc (recOf (o.CH.getD ci 0) off)).testBit k = true →
    ∃ cert : SCert, checkS o 17 (256 * ci + off) (recOf (o.CH.getD ci 0) off) k cert.1 cert.2 = true

theorem chunk_Q (o : Orb2) (nRec ci ch nOff : Nat) (W : List (Nat × Nat × Nat)) (hW : AllL (WinOK o ci ch) W)
    (ht : tilesS W 0 0 nOff = true) (hch : o.CH.getD ci 0 = ch) (hn : 256 ≤ nOff ∨ nRec ≤ 256 * ci + nOff) : Qch o nRec ci := by
  intro off ho hc k hk hb
  rw [hch] at hb ⊢
  let P : Nat → Nat → Prop := fun off k => (rLoc (recOf ch off)).testBit k = true →
    ∃ cert : SCert, checkS o 17 (256 * ci + off) (recOf ch off) k cert.1 cert.2 = true
  have hW' : AllL (fun x : Nat × Nat × Nat => ∀ k, x.2.1 ≤ k → k < x.2.2 → P x.1 k) W :=
    allL_imp (fun x hx k h1 h2 hb => hx k hb h1 h2) W hW
  rcases tilesS_sem P W 0 0 nOff ht hW' with ⟨h0, hrest⟩ | ⟨hz, _⟩
  · rcases Nat.eq_zero_or_pos off with rfl | hpos
    · exact h0 k (Nat.zero_le _) hk hb
    · exact hrest off hpos (by omega) k hk hb
  · omega

theorem testBit_rLoc_recOf (ch off j : Nat) (hj : 512 ≤ j) : (rLoc (recOf ch off)).testBit j = false := by
  show (((ch >>> (640 * off)) &&& (1 <<< 640 - 1)) >>> 128).testBit j = false
  rw [Nat.testBit_shiftRight, Nat.testBit_land, Nat.one_shiftLeft, Nat.testBit_two_pow_sub_one]
  simp; omega

theorem one_int {Q : Nat → Prop} (c : Nat) (h : Q c) : ∀ i, c ≤ i → i < c + 1 → Q i :=
  fun i h1 h2 => (show i = c by omega) ▸ h

theorem sok_of (o : Orb2) (nRec nch : Nat) (hn : nRec ≤ 256 * nch) (h : ∀ ci, ci < nch → Qch o nRec ci) : SOK o nRec := by
  intro c hc j hj
  have hci : c / 256 < nch := by omega
  have hdec : 256 * (c / 256) + c % 256 = c := Nat.div_add_mod c 256
  have hj5 : j < 512 := by
    by_contra hne
    have := testBit_rLoc_recOf (o.CH.getD (c / 256) 0) (c % 256) j (by omega)
    unfold recG at hj; rw [this] at hj; exact Bool.false_ne_true hj
  have := h (c / 256) hci (c % 256) (Nat.mod_lt _ (by norm_num)) (by omega) j hj5 hj
  unfold recG; rw [hdec] at this; exact this

end G.Cov
