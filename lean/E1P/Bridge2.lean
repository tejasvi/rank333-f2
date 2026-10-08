module
public import R22Port.U_d41d8cd98f00
public import E1P.Bridge1
public import R7.Main
/-! # The leaf bridge: an E1 leaf refutes every decomposition with its multiset of cosets

`leaf_bridge`: if the multiplicity vector of a decomposition (exactly `R` first factors outside `E`, nonzero second and
third factors) equals the prefix multiset of a leaf, and the v7 leaf checker accepts the leaf record, we have a
contradiction.  On the domain `E^⊥` a functional sees only the coset of a first factor (`par_coset`) and factors in `E`
are invisible, so the `R` factors outside `E`, reordered like the leaf's labels, decompose the leaf's tensor on its
domain, which the leaf theorem (`S7.leafS7_sound`, through `R7.leafS7_ref`) excludes. -/
@[expose] public section
set_option maxRecDepth 20000
namespace E1PS
open Finset RootSound Matrix
set_option exponentiation.threshold 600

/-! ## The leaf record -/

/-- the leaf's terms: representative `vt (label i)` at `9 i` -/
def termsOf (R VT pl : ℕ) : ℕ :=
  Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ) (fun acc _ _ => acc)
    (fun _ ih acc i pl => ih (Nat.lor acc (Nat.shiftLeft (Nat.land (Nat.shiftRight VT (Nat.mul 9 (E1P.rd 8 pl))) 511) (Nat.mul 9 i)))
      (Nat.succ i) (E1P.sk 8 pl)) R 0 0 pl

theorem leafRec_eq (R VT DOM pl cert : ℕ) : E1P.leafRec R VT DOM pl cert =
    Nat.lor R (Nat.lor (Nat.shiftLeft (termsOf R VT pl) 6) (Nat.shiftLeft (Nat.lor 1 (Nat.lor (Nat.shiftLeft DOM 2)
      (Nat.shiftLeft cert 514))) (Nat.add 6 (Nat.mul 9 R)))) := rfl

/-- label `i` of a packed prefix -/
def lab (pl i : ℕ) : ℕ := pl / 2 ^ (8 * i) % 256

theorem terms_gen (VT : ℕ) (R : ℕ) : ∀ acc i pl, acc < 2 ^ (9 * i) →
    (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ) (fun acc _ _ => acc)
      (fun _ ih acc i pl => ih (Nat.lor acc (Nat.shiftLeft (Nat.land (Nat.shiftRight VT (Nat.mul 9 (E1P.rd 8 pl))) 511) (Nat.mul 9 i)))
        (Nat.succ i) (E1P.sk 8 pl)) R acc i pl) = acc + ∑ t ∈ range R, vt VT (lab pl t) * 2 ^ (9 * (i + t)) := by
  induction R with
  | zero => intro acc i pl _; simp
  | succ R ih =>
    intro acc i pl hacc
    have hv : Nat.land (Nat.shiftRight VT (Nat.mul 9 (E1P.rd 8 pl))) 511 = vt VT (lab pl 0) := by
      show (VT >>> (9 * E1P.rd 8 pl)) &&& (2 ^ 9 - 1) = _
      rw [Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow, rd_eq]; unfold vt lab; norm_num
    have hor : Nat.lor acc (Nat.shiftLeft (vt VT (lab pl 0)) (Nat.mul 9 i)) = acc + vt VT (lab pl 0) * 2 ^ (9 * i) := by
      show acc ||| vt VT (lab pl 0) <<< (9 * i) = _
      rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hacc, Nat.shiftLeft_eq]; ring
    show (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ) (fun acc _ _ => acc)
      (fun _ ih acc i pl => ih (Nat.lor acc (Nat.shiftLeft (Nat.land (Nat.shiftRight VT (Nat.mul 9 (E1P.rd 8 pl))) 511) (Nat.mul 9 i)))
        (Nat.succ i) (E1P.sk 8 pl)) R (Nat.lor acc (Nat.shiftLeft (Nat.land (Nat.shiftRight VT (Nat.mul 9 (E1P.rd 8 pl))) 511) (Nat.mul 9 i)))
        (Nat.succ i) (E1P.sk 8 pl)) = _
    have hlt : acc + vt VT (lab pl 0) * 2 ^ (9 * i) < 2 ^ (9 * (i + 1)) := by
      have h1 := vt_lt VT (lab pl 0)
      have : vt VT (lab pl 0) * 2 ^ (9 * i) ≤ 511 * 2 ^ (9 * i) := Nat.mul_le_mul_right _ (by omega)
      have h2 : 2 ^ (9 * (i + 1)) = 512 * 2 ^ (9 * i) := by rw [Nat.mul_succ, pow_add]; norm_num; ring
      omega
    rw [hv, hor, ih _ _ _ (by rw [Nat.succ_eq_add_one]; exact hlt), Finset.sum_range_succ']
    simp only [lab, sk_eq, Nat.div_div_eq_div_mul, ← pow_add]
    rw [show 8 * 0 = 0 from rfl, pow_zero, Nat.div_one, Nat.add_zero]
    have e : ∀ t, 8 + 8 * t = 8 * (t + 1) := fun t => by ring
    simp only [e, show ∀ t, i + 1 + t = i + (t + 1) from fun t => by ring]
    ring

theorem termsOf_eq (R VT pl : ℕ) : termsOf R VT pl = ∑ t ∈ range R, vt VT (lab pl t) * 2 ^ (9 * t) := by
  have := terms_gen VT R 0 0 pl (by norm_num)
  simpa using this

theorem termsOf_lt (R VT pl : ℕ) : termsOf R VT pl < 2 ^ (9 * R) := by
  rw [termsOf_eq, show ∑ t ∈ range R, vt VT (lab pl t) * 2 ^ (9 * t) = pk 9 (fun t => vt VT (lab pl t)) R from rfl]
  exact pk_lt 9 _ R (fun t _ => vt_lt VT _)

theorem aT_terms (R VT pl t : ℕ) (ht : t < R) : S5.aT (termsOf R VT pl) t = vt VT (lab pl t) := by
  show (termsOf R VT pl >>> (9 * t)) &&& (2 ^ 9 - 1) = _
  rw [Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow, termsOf_eq,
    show ∑ t ∈ range R, vt VT (lab pl t) * 2 ^ (9 * t) = pk 9 (fun t => vt VT (lab pl t)) R from rfl]
  exact dig_pk 9 _ R (fun t _ => vt_lt VT _) t ht

theorem lor_add (a b k : ℕ) (ha : a < 2 ^ k) : a ||| b <<< k = a + 2 ^ k * b := by
  rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt ha, Nat.shiftLeft_eq]; ring

theorem rd5_eq (k S : ℕ) : BC5.rd k S = S % 2 ^ k := by
  show Nat.land S (Nat.pred (Nat.shiftLeft 1 k)) = _
  rw [show Nat.shiftLeft 1 k = 2 ^ k from Nat.one_shiftLeft k, Nat.pred_eq_sub_one]
  exact Nat.and_two_pow_sub_one_eq_mod S k
theorem sk5_eq (k S : ℕ) : BC5.sk k S = S / 2 ^ k := Nat.shiftRight_eq_div_pow S k

theorem leafRec_val (R VT DOM pl cert : ℕ) (hR : R < 64) (hDOM : DOM < 2 ^ 512) :
    E1P.leafRec R VT DOM pl cert = R + 2 ^ 6 * (termsOf R VT pl + 2 ^ (9 * R) * (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert))) := by
  rw [leafRec_eq]
  show R ||| (termsOf R VT pl <<< 6 ||| (1 ||| (DOM <<< 2 ||| cert <<< 514)) <<< (6 + 9 * R)) = _
  have h1 : DOM <<< 2 ||| cert <<< 514 = (DOM + 2 ^ 512 * cert) <<< 2 := by
    rw [show (514 : ℕ) = 512 + 2 from rfl, Nat.shiftLeft_add, ← Nat.shiftLeft_or_distrib, lor_add _ _ _ hDOM]
  have h2 : 1 ||| (DOM + 2 ^ 512 * cert) <<< 2 = 1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert) := lor_add _ _ _ (by norm_num)
  have h3 : termsOf R VT pl <<< 6 ||| (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert)) <<< (6 + 9 * R) =
      (termsOf R VT pl + 2 ^ (9 * R) * (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert))) <<< 6 := by
    rw [show 6 + 9 * R = 9 * R + 6 by ring, Nat.shiftLeft_add, ← Nat.shiftLeft_or_distrib, lor_add _ _ _ (termsOf_lt R VT pl)]
  rw [h1, h2, h3, lor_add _ _ _ (show R < 2 ^ 6 by omega)]

theorem leafN_rec (R VT DOM pl cert : ℕ) (hR : R < 64) (hDOM : DOM < 2 ^ 512) :
    S5.leafN (E1P.leafRec R VT DOM pl cert) = R := by
  show BC5.rd 6 _ = R
  rw [rd5_eq, leafRec_val R VT DOM pl cert hR hDOM, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt (by omega)]

theorem leafT_rec (R VT DOM pl cert : ℕ) (hR : R < 64) (hDOM : DOM < 2 ^ 512) :
    S5.leafT (E1P.leafRec R VT DOM pl cert) = termsOf R VT pl := by
  show BC5.rd (Nat.mul 9 (BC5.rd 6 _)) (BC5.sk 6 _) = _
  rw [show BC5.rd 6 (E1P.leafRec R VT DOM pl cert) = R from leafN_rec R VT DOM pl cert hR hDOM, rd5_eq, sk5_eq,
    leafRec_val R VT DOM pl cert hR hDOM, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt (by omega), Nat.zero_add,
    show Nat.mul 9 R = 9 * R from rfl, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt (termsOf_lt R VT pl)]

theorem leafDom_rec (R VT DOM pl cert : ℕ) (hR : R < 64) (hDOM : DOM < 2 ^ 512) :
    S6.leafDom6 (E1P.leafRec R VT DOM pl cert) = DOM := by
  have hsk : BC5.sk (Nat.add 6 (Nat.mul 9 (BC5.rd 6 (E1P.leafRec R VT DOM pl cert)))) (E1P.leafRec R VT DOM pl cert) =
      1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert) := by
    rw [show BC5.rd 6 (E1P.leafRec R VT DOM pl cert) = R from leafN_rec R VT DOM pl cert hR hDOM, sk5_eq,
      leafRec_val R VT DOM pl cert hR hDOM, show Nat.add 6 (Nat.mul 9 R) = 6 + 9 * R from rfl, pow_add,
      ← Nat.div_div_eq_div_mul, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt (show R < 2 ^ 6 by omega),
      Nat.zero_add, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt (termsOf_lt R VT pl), Nat.zero_add]
  show cond (Nat.beq (BC5.rd 1 _) 0) BC4.ALLNZ (BC5.rd 512 (BC5.sk 2 _)) = DOM
  rw [hsk, rd5_eq, rd5_eq, sk5_eq]
  have e1 : (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert)) % 2 ^ 1 = 1 := by omega
  have e2 : (1 + 2 ^ 2 * (DOM + 2 ^ 512 * cert)) / 2 ^ 2 = DOM + 2 ^ 512 * cert := by
    rw [Nat.add_mul_div_left _ _ (by norm_num)]; norm_num
  rw [e1, e2, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt hDOM]
  rfl
/-! ## List helpers (as in S5.TmodE) -/

theorem perm_map_exists' {α β : Type*} [DecidableEq α] [DecidableEq β] (f : α → β) :
    ∀ (cl : List β) (L : List α), (L.map f).Perm cl → ∃ L' : List α, L'.Perm L ∧ L'.map f = cl := by
  intro cl
  induction cl with
  | nil =>
    intro L h
    have : L.map f = [] := List.perm_nil.mp h
    rw [List.map_eq_nil_iff] at this
    exact ⟨[], by rw [this], rfl⟩
  | cons c cl ih =>
    intro L h
    have hc : c ∈ L.map f := h.symm.subset List.mem_cons_self
    obtain ⟨x, hx, hfx⟩ := List.mem_map.mp hc
    have hp : L.Perm (x :: L.erase x) := List.perm_cons_erase hx
    have h2 : (c :: (L.erase x).map f).Perm (c :: cl) := by
      have := (hp.map f).symm.trans h
      simpa [hfx] using this
    obtain ⟨L1, hL1, hm⟩ := ih (L.erase x) h2.cons_inv
    exact ⟨x :: L1, (hL1.cons x).trans hp.symm, by simp [hm, hfx]⟩

theorem list_sum_range' {α M : Type*} [AddCommMonoid M] (d : α) (g : α → M) :
    ∀ L : List α, (L.map g).sum = ∑ t ∈ Finset.range L.length, g (L.getD t d) := by
  intro L
  induction L with
  | nil => simp
  | cons x L ih =>
    rw [List.map_cons, List.sum_cons, ih, List.length_cons, Finset.sum_range_succ']
    simp only [List.getD_cons_succ, List.getD_cons_zero]
    rw [add_comm]

theorem multR_count (d : ℕ) : ∀ pl l, multR d pl l = ((List.range d).map (lab pl)).count l := by
  induction d with
  | zero => intro pl l; simp [multR]
  | succ d ih =>
    intro pl l
    rw [List.range_succ_eq_map, List.map_cons, List.map_map, List.count_cons, multR, ih (pl / 256) l]
    have e : (lab pl ∘ Nat.succ) = lab (pl / 256) := by
      funext i; simp only [Function.comp, lab, Nat.div_div_eq_div_mul]
      congr 2; rw [show 8 * i.succ = 8 * i + 8 by rw [Nat.mul_succ], pow_add]; norm_num; ring
    rw [e]
    simp only [lab, pow_zero, Nat.mul_zero, Nat.div_one, beq_iff_eq]
    omega

/-- **The leaf bridge.** -/
theorem leaf_bridge (VT N Em DOM R : ℕ) (hN : N ≤ 255) (hR : R ≤ 31) (hC : Cosets Em VT N) (hD : DomPerp DOM Em)
    (hDOM : DOM < 2 ^ 512) {n : ℕ} (av : Fin n → ℕ) (b c : Fin n → M3) (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) (hbc : ∀ s, b s ≠ 0 ∧ c s ≠ 0)
    (hRn : (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = R)
    (pl cert : ℕ) (hx : ∀ l, multR R pl l = xOf av Em VT N l)
    (hleaf : BC7.leafS (E1P.leafRec R VT DOM pl cert) = true) : False := by
  have hnd := S7.leafS7_sound _ (by rw [← R7.leafS7_ref]; exact hleaf)
  rw [leafN_rec _ _ _ _ _ (by omega) hDOM, leafT_rec _ _ _ _ _ (by omega) hDOM, leafDom_rec _ _ _ _ _ (by omega) hDOM]
    at hnd
  apply hnd
  classical
  -- the coset label of a factor outside `E`
  let cs : Fin n → ℕ := fun s => if h : ∃ l, l < N ∧ Em.testBit (av s ^^^ vt VT l) = true then Nat.find h else 0
  have hcs : ∀ s, Em.testBit (av s) = false → cs s < N ∧ Em.testBit (av s ^^^ vt VT (cs s)) = true := by
    intro s h0
    have hex : ∃ l, l < N ∧ Em.testBit (av s ^^^ vt VT l) = true := by
      obtain ⟨l, hl, hE⟩ := hC.cover (av s) (hav s) h0; exact ⟨l, hl, hE⟩
    have := Nat.find_spec hex
    simp only [cs, dif_pos hex]; exact this
  have hcs_eq : ∀ s l, Em.testBit (av s) = false → l < N → Em.testBit (av s ^^^ vt VT l) = true → cs s = l := by
    intro s l h0 hl hE
    obtain ⟨h1, h2⟩ := hcs s h0
    exact coset_unique hC (av s) (hav s) _ _ h1 hl h2 hE
  let Lout := (List.finRange n).filter (fun s => Em.testBit (av s) == false)
  have hLnd : Lout.Nodup := (List.nodup_finRange n).filter _
  have hmemL : ∀ s, s ∈ Lout ↔ Em.testBit (av s) = false := by
    intro s; simp [Lout, List.mem_filter, List.mem_finRange]
  have hcount : ∀ l, (Lout.map cs).count l = ((List.range R).map (lab pl)).count l := by
    intro l
    rw [← multR_count, hx l, List.count_eq_countP, List.countP_map, List.countP_eq_length_filter]
    unfold xOf
    split
    · next hl =>
      rw [← List.toFinset_card_of_nodup (hLnd.filter _)]
      apply congrArg Finset.card
      ext s
      simp only [List.mem_toFinset, List.mem_filter, hmemL, mem_filter, mem_univ, true_and, Function.comp, beq_iff_eq]
      constructor
      · rintro ⟨h0, hcl⟩; refine ⟨h0, ?_⟩; rw [← hcl]; exact (hcs s h0).2
      · rintro ⟨h0, hE⟩; exact ⟨h0, hcs_eq s l h0 hl hE⟩
    · next hl =>
      rw [List.length_eq_zero_iff, List.filter_eq_nil_iff]
      intro s hs
      simp only [Function.comp, beq_iff_eq]
      intro hcl
      have := (hcs s ((hmemL s).mp hs)).1
      omega
  obtain ⟨L', hperm, hmap⟩ := perm_map_exists' cs _ Lout (List.perm_iff_count.mpr hcount)
  have hlen : L'.length = R := by
    have := congrArg List.length hmap; simpa using this
  have hmemL' : ∀ s ∈ L', Em.testBit (av s) = false := fun s hs => (hmemL s).mp (hperm.subset hs)
  -- a factor exists (the decomposition is not empty)
  have hn : 0 < n := by
    by_contra h0
    have h := hd 0 0 0 0 0 0
    have : n = 0 := by omega
    subst this
    simp at h
  let s0 : Fin n := ⟨0, hn⟩
  let bb : ℕ → ℕ := fun t => S5.natOf (vecB (b (L'.getD t s0)))
  let cc : ℕ → ℕ := fun t => S5.natOf (vecC (c (L'.getD t s0)))
  have hget : ∀ t < R, L'.getD t s0 ∈ L' := by
    intro t ht; rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem (by omega)]; exact List.getElem_mem _
  have hlabt : ∀ t < R, cs (L'.getD t s0) = lab pl t := by
    intro t ht
    have h1 := congrArg (fun L => L[t]?) hmap
    simp only [List.getElem?_map, List.getElem?_range ht, Option.map_some] at h1
    rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem (by omega), Option.getD_some]
    rw [List.getElem?_eq_getElem (by omega)] at h1
    simpa using h1
  refine ⟨bb, cc, fun t ht => ?_, fun X hX hdom => ?_⟩
  · obtain ⟨h1, h2⟩ := hbc (L'.getD t s0)
    have p1 : 0 < S5.natOf (vecB (b (L'.getD t s0))) := by
      apply Nat.pos_of_ne_zero; intro e
      apply h1; apply S5.vecB_inj; rw [← S5.nv_natOf (vecB _), e]; funext i; simp [S5.nv, bitF]
    have p2 : 0 < S5.natOf (vecC (c (L'.getD t s0))) := by
      apply Nat.pos_of_ne_zero; intro e
      apply h2; apply S5.vecC_inj; rw [← S5.nv_natOf (vecC _), e]; funext i; simp [S5.nv, bitF]
    exact ⟨p1, S5.natOf_lt _, p2, S5.natOf_lt _⟩
  · rw [TX_eq_sum hd (toM3 X)]
    let F : Fin n → Matrix (Fin 9) (Fin 9) F2 := fun s => vecMulVec (vecB (b s)) (vecC (c s))
    let G : Fin n → Matrix (Fin 9) (Fin 9) F2 := fun s => if BC5.par (av s &&& X) = true then F s else 0
    have e1 : ∑ s ∈ hitSet (fun s => toM3 (av s)) (toM3 X), F s = ∑ s : Fin n, G s := by
      rw [hitSet, Finset.sum_filter]
      apply Finset.sum_congr rfl; intro s _
      simp only [G]
      rw [S5.pair_par X (av s) hX (hav s)]
      cases BC5.par (av s &&& X) <;> simp [S5.bf]
    have e2 : ∑ s : Fin n, G s = (Lout.map G).sum := by
      rw [Fin.sum_univ_def]
      have : ∀ L : List (Fin n), (L.map G).sum = ((L.filter (fun s => Em.testBit (av s) == false)).map G).sum := by
        intro L
        induction L with
        | nil => rfl
        | cons x L ih =>
          rw [List.map_cons, List.sum_cons, ih]
          cases hx : Em.testBit (av x)
          · rw [List.filter_cons_of_pos (by simp [hx]), List.map_cons, List.sum_cons]
          · rw [List.filter_cons_of_neg (by simp [hx])]
            have : G x = 0 := by
              simp only [G]
              rw [hD X hX hdom (av x) (hav x) hx]; simp
            rw [this, zero_add]
      exact this _
    have e3 : (Lout.map G).sum = (L'.map G).sum := (hperm.map G).sum_eq.symm
    have e4 : (L'.map G).sum = ∑ t ∈ range R, G (L'.getD t s0) := by rw [list_sum_range' s0 G L', hlen]
    rw [e1, e2, e3, e4, Finset.sum_filter]
    apply Finset.sum_congr rfl; intro t ht
    rw [Finset.mem_range] at ht
    have hpar : BC5.par (av (L'.getD t s0) &&& X) = BC5.par (S5.aT (termsOf R VT pl) t &&& X) := by
      rw [aT_terms R VT pl t ht, ← hlabt t ht]
      have h0 := hmemL' _ (hget t ht)
      exact par_coset hD X hX hdom _ _ (hav _) (vt_lt VT _) (hcs _ h0).2
    simp only [G, F]
    rw [hpar]
    split
    · simp only [bb, cc, S5.nv_natOf]
    · rfl

end E1PS
