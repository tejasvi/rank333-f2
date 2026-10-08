module
public import R22Port.U_d41d8cd98f00
public import GS.PhD1
/-! # Track D, part 2: the walks of phase D (`G/D2.lean`) and their guarantees

* `packC_fld`: the C pack of a group's listed C-parts has the listed fields;
* `fld_win`: a window of a stride-32 pack is the pack of the window's fields;
* `grpEmpty_sound`: a group certified empty has no candidate;
* `cntOK_sound`: the groups not counted are certified empty, and their number is the count;
* `candT_mem`, `colOK_mem`: every candidate of a group is enumerated / coloured;
* `classOK_sound`: two members of a class with different first factors are not compatible. -/
@[expose] public section
namespace GS.PD
open G G.V2 G.D2 G.A2 G.Acc Finset

/-! ## packs and windows -/

theorem get32_lt (P k : ℕ) : get32 P k < 2 ^ 32 := by rw [get32_eq]; exact Nat.mod_lt _ (by norm_num)

theorem packC_eq (PC : ℕ) : ∀ (L : List ℕ) (k acc : ℕ), packC PC L k acc = (pack (get32 PC) L k acc, k + L.length)
  | [], k, acc => by simp [packC, pack]
  | c :: cs, k, acc => by
    show packC PC cs (Nat.succ k) (Nat.lor acc (Nat.shiftLeft (get32 PC c) (Nat.mul 32 k))) =
      (pack (get32 PC) cs (Nat.succ k) (Nat.lor acc (Nat.shiftLeft (get32 PC c) (Nat.mul 32 k))), k + (c :: cs).length)
    rw [packC_eq PC cs]
    simp only [List.length_cons, Prod.mk.injEq, true_and]
    omega

/-- the pack of `f` over the list `L`, as a `pk32` -/
theorem pack_pk32 (f : ℕ → ℕ) (L : List ℕ) (hf : ∀ x ∈ L, f x < 2 ^ 32) :
    pack f L 0 0 = pk32 (fun i => f (L.getD i 0)) L.length := by
  rw [pack_eq f L 0 0 hf (by norm_num)]
  unfold pk32; simp only [Nat.zero_add]

theorem fld_pack (f : ℕ → ℕ) (L : List ℕ) (hf : ∀ x ∈ L, f x < 2 ^ 32) (i : ℕ) (hi : i < L.length) :
    fld (pack f L 0 0) i = f (L.getD i 0) := by
  rw [pack_pk32 f L hf]
  apply fld_pk32 _ _ _ _ hi
  intro k hk
  apply hf
  rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hk, Option.getD_some]
  exact List.getElem_mem _

/-- the fields of a group's C pack -/
theorem packC_fld (PC : ℕ) (L : List ℕ) (i : ℕ) (hi : i < L.length) :
    fld (packC PC L 0 0).1 i = get32 PC (L.getD i 0) := by
  rw [packC_eq]
  exact fld_pack (get32 PC) L (fun x _ => get32_lt PC x) i hi

theorem packC_snd (PC : ℕ) (L : List ℕ) : (packC PC L 0 0).2 = L.length := by rw [packC_eq]; simp

/-- a window of 32-bit fields -/
theorem fld_win (P l n k : ℕ) (hk : k < n) : fld (win P (32 * l) (32 * n)) k = fld P (l + k) := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [testBit_fld, testBit_fld, testBit_win]
  by_cases hj : j < 32
  · have h1 : 32 * k + j < 32 * n := by omega
    have e : 32 * l + (32 * k + j) = 32 * (l + k) + j := by ring
    simp [hj, h1, e]
  · simp [hj]

theorem get32_grp (P l n k : ℕ) (hk : k < n) : get32 (win P (32 * l) (32 * n)) k = fld P (l + k) := by
  rw [get32_eq]; exact fld_win P l n k hk

/-! ## listed parts -/

/-- an OK part of the group is listed (at its local index) -/
theorem listed_of (L : List ℕ) (M l n b : ℕ) (h : listChk1 L (win M l n) = true) (h1 : l ≤ b) (h2 : b < l + n)
    (hM : M.testBit b = true) : b - l ∈ L := by
  have := (listChk1_spec L _ h).2 (b - l)
  rw [← this, testBit_win]
  have e : l + (b - l) = b := by omega
  simp [e, hM]; omega

/-- the index of a listed element -/
theorem idx_of_mem {L : List ℕ} {x : ℕ} (h : x ∈ L) : ∃ i < L.length, L.getD i 0 = x := by
  obtain ⟨i, hi, e⟩ := List.getElem_of_mem h
  exact ⟨i, hi, by rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi, Option.getD_some, e]⟩

/-! ## `noCand` and `grpEmpty` -/

theorem noCand_spec (PB P R : ℕ) : ∀ (L : List ℕ), noCand PB P R L = true → ∀ b ∈ L, swarPar P R (get32 PB b) = 0
  | [], _ => by simp
  | b :: bs, h => by
    have h' : (Nat.beq (swarPar P R (get32 PB b)) 0 && noCand PB P R bs) = true := h
    rw [Bool.and_eq_true] at h'
    intro x hx
    rcases List.mem_cons.mp hx with rfl | hx
    · exact Nat.eq_of_beq_eq_true h'.1
    · exact noCand_spec PB P R bs h'.2 x hx

/-- the parity of a C pack field against a B field, read from `swarPar` -/
theorem swar_bit (P y n i : ℕ) (hy : y < 2 ^ 32) (hi : i < n) :
    (swarPar P (rep32 n) y).testBit (32 * i) = true ↔ parZ (fld P i &&& y) = 1 := by
  rw [swarPar_testBit P y n _ hy]
  have e1 : 32 * i / 32 = i := by omega
  have e2 : 32 * i % 32 = 0 := by omega
  simp [e1, e2, hi]

/-- the group data of `R1Data` for group `gi` -/
theorem grp_data {r1 : R1} {PB1 PC1 nB nC : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {gi : ℕ} (hgi : gi < r1.gs.length) :
    (grpAt r1 gi).lb + (grpAt r1 gi).nb ≤ nB ∧ (grpAt r1 gi).lc + (grpAt r1 gi).nc ≤ nC ∧
    (∀ k < (grpAt r1 gi).nb, get32 (grpAt r1 gi).PB k = fld PB1 ((grpAt r1 gi).lb + k)) ∧
    (∀ k < (grpAt r1 gi).nc, get32 (grpAt r1 gi).PC k = fld PC1 ((grpAt r1 gi).lc + k)) ∧
    0 < (grpAt r1 gi).a ∧ (grpAt r1 gi).a < 512 := by
  obtain ⟨h1, h2, h3, h4, h5, h6⟩ := hD.grps gi hgi
  refine ⟨h1, h2, fun k hk => ?_, fun k hk => ?_, h5, h6⟩
  · rw [h3]; exact get32_grp PB1 _ _ k hk
  · rw [h4]; exact get32_grp PC1 _ _ k hk

theorem grpEmpty_eq (okb okc : ℕ) (g : Grp) (obs ocs : List ℕ) : grpEmpty okb okc g obs ocs =
    (listChk1 obs (win okb g.lb g.nb) && listChk1 ocs (win okc g.lc g.nc) &&
      noCand g.PB (packC g.PC ocs 0 0).1 (rep32 (packC g.PC ocs 0 0).2) obs) := by
  unfold grpEmpty
  cases packC g.PC ocs 0 0
  rfl

/-- **a group certified empty has no candidate** -/
theorem grpEmpty_sound {r1 : R1} {PB1 PC1 nB nC : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {gi : ℕ} (hgi : gi < r1.gs.length)
    {okb okc : ℕ} {obs ocs : List ℕ} (h : grpEmpty okb okc (grpAt r1 gi) obs ocs = true) :
    ∀ x, Cand r1 PB1 PC1 okb okc x → x.1 ≠ gi := by
  rintro ⟨gx, b, c⟩ ⟨hgx, hb1, hb2, hc1, hc2, hokb, hokc, hpar⟩ hgxi
  simp only at hgx hb1 hb2 hc1 hc2 hokb hokc hpar hgxi
  subst hgxi
  obtain ⟨_, _, hPB, hPC, _, _⟩ := grp_data hD hgi
  rw [grpEmpty_eq] at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨hobs, hocs⟩, hnc⟩ := h
  have hbL := listed_of obs okb _ _ b hobs hb1 hb2 hokb
  have hcL := listed_of ocs okc _ _ c hocs hc1 hc2 hokc
  obtain ⟨i, hi, hie⟩ := idx_of_mem hcL
  have h0 := noCand_spec _ _ _ obs hnc (b - (grpAt r1 gx).lb) hbL
  rw [packC_snd] at h0
  -- the parity of the candidate, in the pack's terms
  have hp : parZ (fld (packC (grpAt r1 gx).PC ocs 0 0).1 i &&& get32 (grpAt r1 gx).PB (b - (grpAt r1 gx).lb)) = 1 := by
    rw [packC_fld _ ocs i hi, hie, hPB (b - (grpAt r1 gx).lb) (by omega), hPC (c - (grpAt r1 gx).lc) (by omega)]
    have e1 : (grpAt r1 gx).lb + (b - (grpAt r1 gx).lb) = b := by omega
    have e2 : (grpAt r1 gx).lc + (c - (grpAt r1 gx).lc) = c := by omega
    rw [e1, e2]
    exact (par32_one_iff _).mp hpar
  have hbit := (swar_bit _ _ ocs.length i (get32_lt _ _) hi).mpr hp
  rw [h0, Nat.zero_testBit] at hbit
  exact absurd hbit (by decide)

/-! ## `cntOK` -/

/-- the groups with a `some` entry are certified empty; the `none` entries are counted -/
theorem cntOK_spec (okb okc : ℕ) : ∀ (gs : List Grp) (cs : List (Option (List ℕ × List ℕ))) (n0 n : ℕ),
    cntOK okb okc gs cs n0 = some n →
    ∃ S : Finset ℕ, (∀ gi ∈ S, gi < gs.length) ∧ S.card + n0 = n ∧
      ∀ gi < gs.length, gi ∉ S → ∃ obs ocs, grpEmpty okb okc (gs.getD gi g0) obs ocs = true
  | [], [], n0, n, h => by
    have : n0 = n := by simpa [cntOK] using h
    exact ⟨∅, by simp, by simp [this], by simp⟩
  | g :: gs, none :: cs, n0, n, h => by
    have h' : cntOK okb okc gs cs (Nat.succ n0) = some n := h
    obtain ⟨S, hS1, hS2, hS3⟩ := cntOK_spec okb okc gs cs (Nat.succ n0) n h'
    refine ⟨insert 0 (S.map ⟨Nat.succ, Nat.succ_injective⟩), ?_, ?_, ?_⟩
    · intro gi hgi
      rcases Finset.mem_insert.mp hgi with rfl | hgi
      · simp
      · obtain ⟨k, hk, rfl⟩ := Finset.mem_map.mp hgi
        simp only [List.length_cons, Function.Embedding.coeFn_mk]; have := hS1 k hk; omega
    · rw [Finset.card_insert_of_notMem (by simp), Finset.card_map]; omega
    · intro gi hgi hnot
      rcases gi with _ | k
      · exact absurd (Finset.mem_insert_self 0 _) hnot
      · have hk : k ∉ S := fun hk => hnot (Finset.mem_insert_of_mem (Finset.mem_map.mpr ⟨k, hk, rfl⟩))
        obtain ⟨obs, ocs, he⟩ := hS3 k (by simp at hgi; omega) hk
        exact ⟨obs, ocs, by simpa using he⟩
  | g :: gs, some (obs, ocs) :: cs, n0, n, h => by
    have h' : cond (grpEmpty okb okc g obs ocs) (cntOK okb okc gs cs n0) none = some n := h
    cases he : grpEmpty okb okc g obs ocs
    · rw [he] at h'; simp at h'
    · rw [he] at h'
      obtain ⟨S, hS1, hS2, hS3⟩ := cntOK_spec okb okc gs cs n0 n h'
      refine ⟨S.map ⟨Nat.succ, Nat.succ_injective⟩, ?_, ?_, ?_⟩
      · intro gi hgi
        obtain ⟨k, hk, rfl⟩ := Finset.mem_map.mp hgi
        simp only [List.length_cons, Function.Embedding.coeFn_mk]; have := hS1 k hk; omega
      · rw [Finset.card_map]; exact hS2
      · intro gi hgi hnot
        rcases gi with _ | k
        · exact ⟨obs, ocs, by simpa using he⟩
        · have hk : k ∉ S := fun hk => hnot (Finset.mem_map.mpr ⟨k, hk, rfl⟩)
          obtain ⟨obs', ocs', he'⟩ := hS3 k (by simp at hgi; omega) hk
          exact ⟨obs', ocs', by simpa using he'⟩
  | [], _ :: _, _, _, h => by simp [cntOK] at h
  | _ :: _, [], _, _, h => by simp [cntOK] at h

/-! ## enumerated candidates (`candT`) -/

theorem pushT_mem (P a xv : ℕ) : ∀ (js acc : List ℕ),
    (∀ t ∈ acc, t ∈ pushT P a xv js acc) ∧ ∀ j ∈ js, mkTerm1 (get32 P j) xv a ∈ pushT P a xv js acc
  | [], acc => ⟨fun t ht => ht, by simp⟩
  | j :: js, acc => by
    obtain ⟨h1, h2⟩ := pushT_mem P a xv js (mkTerm1 (get32 P j) xv a :: acc)
    refine ⟨fun t ht => h1 t (List.mem_cons_of_mem _ ht), fun j' hj' => ?_⟩
    rcases List.mem_cons.mp hj' with rfl | hj'
    · exact h1 _ List.mem_cons_self
    · exact h2 j' hj'

/-- every enumerated position of every listed B-part is a pushed term -/
theorem candT_mem (PB P R a : ℕ) : ∀ (obs : List ℕ) (jss : List (List ℕ)) (acc xs : List ℕ),
    candT PB P R a obs jss acc = some xs → (∀ t ∈ acc, t ∈ xs) ∧
      ∀ b ∈ obs, ∀ j, (swarPar P R (get32 PB b)).testBit (32 * j) = true → mkTerm1 (get32 P j) (get32 PB b) a ∈ xs
  | [], [], acc, xs, h => by
    have : acc = xs := by simpa [candT] using h
    subst this; exact ⟨fun t ht => ht, by simp⟩
  | b :: bs, js :: jss, acc, xs, h => by
    have h' : cond (listChk32 js (swarPar P R (get32 PB b))) (candT PB P R a bs jss (pushT P a (get32 PB b) js acc)) none
      = some xs := h
    cases hc : listChk32 js (swarPar P R (get32 PB b))
    · rw [hc] at h'; simp at h'
    · rw [hc] at h'
      obtain ⟨h1, h2⟩ := candT_mem PB P R a bs jss _ xs h'
      obtain ⟨hp1, hp2⟩ := pushT_mem P a (get32 PB b) js acc
      refine ⟨fun t ht => h1 t (hp1 t ht), fun b' hb' j hj => ?_⟩
      rcases List.mem_cons.mp hb' with rfl | hb'
      · have hjs : j ∈ js := by
          obtain ⟨k, hk, e⟩ := ((listChk32_spec js _ hc).2 (32 * j)).mp hj
          have : j = k := by omega
          rw [this]; exact hk
        exact h1 _ (hp2 j hjs)
      · exact h2 b' hb' j hj
  | [], _ :: _, _, _, h => by simp [candT] at h
  | _ :: _, [], _, _, h => by simp [candT] at h

/-! ## colouring (`colOK`) -/

theorem upd_length : ∀ (k x : ℕ) (ls : List (List ℕ)), (upd k x ls).length = ls.length
  | k, _, [] => by cases k <;> rfl
  | 0, x, l :: ls => rfl
  | k + 1, x, l :: ls => by simp [upd, upd_length k x ls]

theorem upd_mono : ∀ (k x : ℕ) (ls : List (List ℕ)) (t j : ℕ), t ∈ ls.getD j [] → t ∈ (upd k x ls).getD j []
  | k, _, [], _, _, h => by cases k <;> exact h
  | 0, x, l :: ls, t, j, h => by
    rcases j with _ | j
    · simp [upd] at h ⊢; exact Or.inr h
    · simpa [upd] using h
  | k + 1, x, l :: ls, t, j, h => by
    rcases j with _ | j
    · simpa [upd] using h
    · simp only [upd, List.getD_cons_succ] at h ⊢; exact upd_mono k x ls t j h

theorem upd_mem : ∀ (k x : ℕ) (ls : List (List ℕ)), k < ls.length → x ∈ (upd k x ls).getD k []
  | _, _, [], h => by simp at h
  | 0, x, l :: ls, _ => by simp [upd]
  | k + 1, x, l :: ls, h => by
    simp only [upd, List.getD_cons_succ]; exact upd_mem k x ls (by simp at h; omega)

/-- the classes after pushing: length kept, old members kept, every pushed term in a class `< 16` -/
theorem pushC_spec (P a xv : ℕ) : ∀ (js : List ℕ) (cols : ℕ) (cl : List (List ℕ)), cl.length = 16 →
    (pushC P a xv js cols cl).2.length = 16 ∧ (∀ t k, t ∈ cl.getD k [] → t ∈ (pushC P a xv js cols cl).2.getD k []) ∧
    ∀ j ∈ js, ∃ k < 16, mkTerm1 (get32 P j) xv a ∈ (pushC P a xv js cols cl).2.getD k []
  | [], cols, cl, hl => ⟨hl, fun t k h => h, by simp⟩
  | j :: js, cols, cl, hl => by
    have hlen : (upd (Nat.land cols 15) (mkTerm1 (get32 P j) xv a) cl).length = 16 := by rw [upd_length]; exact hl
    obtain ⟨h1, h2, h3⟩ := pushC_spec P a xv js (Nat.shiftRight cols 4) _ hlen
    have hk : Nat.land cols 15 < 16 := by
      have : cols &&& 15 < 16 := Nat.lt_of_le_of_lt Nat.and_le_right (by norm_num)
      exact this
    refine ⟨h1, fun t k h => h2 t k (upd_mono _ _ _ t k h), fun j' hj' => ?_⟩
    rcases List.mem_cons.mp hj' with rfl | hj'
    · exact ⟨_, hk, h2 _ _ (upd_mem _ _ _ (by rw [hl]; exact hk))⟩
    · exact h3 j' hj'

theorem candsG_spec (PB P R a : ℕ) : ∀ (obs : List ℕ) (jss : List (List ℕ)) (cols : ℕ) (cl : List (List ℕ)) (cols' : ℕ)
    (cl' : List (List ℕ)), cl.length = 16 → candsG PB P R a obs jss cols cl = some (cols', cl') →
    cl'.length = 16 ∧ (∀ t k, t ∈ cl.getD k [] → t ∈ cl'.getD k []) ∧
    ∀ b ∈ obs, ∀ j, (swarPar P R (get32 PB b)).testBit (32 * j) = true →
      ∃ k < 16, mkTerm1 (get32 P j) (get32 PB b) a ∈ cl'.getD k []
  | [], [], cols, cl, cols', cl', hl, h => by
    simp only [candsG, Option.some.injEq, Prod.mk.injEq] at h
    obtain ⟨-, rfl⟩ := h
    exact ⟨hl, fun t k h => h, by simp⟩
  | b :: bs, js :: jss, cols, cl, cols', cl', hl, h => by
    have h' : cond (listChk32 js (swarPar P R (get32 PB b)))
        (match pushC P a (get32 PB b) js cols cl with
         | (cols', cl') => candsG PB P R a bs jss cols' cl') none = some (cols', cl') := h
    cases hc : listChk32 js (swarPar P R (get32 PB b))
    · rw [hc] at h'; simp at h'
    · rw [hc] at h'
      obtain ⟨hp1, hp2, hp3⟩ := pushC_spec P a (get32 PB b) js cols cl hl
      have h'' : candsG PB P R a bs jss (pushC P a (get32 PB b) js cols cl).1 (pushC P a (get32 PB b) js cols cl).2
          = some (cols', cl') := by
        simpa using h'
      obtain ⟨hc1, hc2, hc3⟩ := candsG_spec PB P R a bs jss _ _ cols' cl' hp1 h''
      refine ⟨hc1, fun t k ht => hc2 t k (hp2 t k ht), fun b' hb' j hj => ?_⟩
      rcases List.mem_cons.mp hb' with rfl | hb'
      · have hjs : j ∈ js := by
          obtain ⟨k, hk, e⟩ := ((listChk32_spec js _ hc).2 (32 * j)).mp hj
          have : j = k := by omega
          rw [this]; exact hk
        obtain ⟨k, hk, hm⟩ := hp3 j hjs
        exact ⟨k, hk, hc2 _ _ hm⟩
      · exact hc3 b' hb' j hj
  | [], _ :: _, _, _, _, _, _, h => by simp [candsG] at h
  | _ :: _, [], _, _, _, _, _, h => by simp [candsG] at h

/-- the coloured classes of all groups: every listed candidate position of every group is in a class `< 16` -/
theorem colOK_spec (okb okc : ℕ) : ∀ (gs : List Grp) (cs : List (List ℕ × List ℕ × List (List ℕ))) (cols : ℕ)
    (cl cl' : List (List ℕ)), cl.length = 16 → colOK okb okc gs cs cols cl = some cl' →
    cl'.length = 16 ∧ (∀ t k, t ∈ cl.getD k [] → t ∈ cl'.getD k []) ∧
    ∀ gi < gs.length, ∃ obs ocs : List ℕ, listChk1 obs (win okb (gs.getD gi g0).lb (gs.getD gi g0).nb) = true ∧
      listChk1 ocs (win okc (gs.getD gi g0).lc (gs.getD gi g0).nc) = true ∧
      ∀ b ∈ obs, ∀ j, (swarPar (packC (gs.getD gi g0).PC ocs 0 0).1 (rep32 (packC (gs.getD gi g0).PC ocs 0 0).2)
          (get32 (gs.getD gi g0).PB b)).testBit (32 * j) = true →
        ∃ k < 16, mkTerm1 (get32 (packC (gs.getD gi g0).PC ocs 0 0).1 j) (get32 (gs.getD gi g0).PB b) (gs.getD gi g0).a ∈
          cl'.getD k []
  | [], [], cols, cl, cl', hl, h => by
    simp only [colOK, Option.some.injEq] at h
    subst h; exact ⟨hl, fun t k h => h, by simp⟩
  | g :: gs, (obs, ocs, jss) :: cs, cols, cl, cl', hl, h => by
    have h' : (match grpCol okb okc g obs ocs jss cols cl with
        | none => none
        | some (cols', cl') => colOK okb okc gs cs cols' cl') = some cl' := h
    cases hg : grpCol okb okc g obs ocs jss cols cl with
    | none => rw [hg] at h'; simp at h'
    | some p =>
      obtain ⟨cols1, cl1⟩ := p
      rw [hg] at h'
      have h'' : colOK okb okc gs cs cols1 cl1 = some cl' := h'
      -- the group's own colouring
      unfold grpCol at hg
      cases hch : (listChk1 obs (win okb g.lb g.nb) && listChk1 ocs (win okc g.lc g.nc))
      · rw [hch] at hg; simp at hg
      · rw [hch] at hg
        rw [Bool.and_eq_true] at hch
        have hg' : candsG g.PB (packC g.PC ocs 0 0).1 (rep32 (packC g.PC ocs 0 0).2) g.a obs jss cols cl = some (cols1, cl1) := by
          simpa using hg
        obtain ⟨hc1, hc2, hc3⟩ := candsG_spec _ _ _ _ obs jss cols cl cols1 cl1 hl hg'
        obtain ⟨hr1, hr2, hr3⟩ := colOK_spec okb okc gs cs cols1 cl1 cl' hc1 h''
        refine ⟨hr1, fun t k ht => hr2 t k (hc2 t k ht), fun gi hgi => ?_⟩
        rcases gi with _ | k
        · refine ⟨obs, ocs, by simpa using hch.1, by simpa using hch.2, fun b hb j hj => ?_⟩
          obtain ⟨k, hk, hm⟩ := hc3 b hb j (by simpa using hj)
          exact ⟨k, hk, hr2 _ _ (by simpa using hm)⟩
        · obtain ⟨obs', ocs', h1, h2, h3⟩ := hr3 k (by simp at hgi; omega)
          exact ⟨obs', ocs', by simpa using h1, by simpa using h2, fun b hb j hj => by simpa using h3 b hb j (by simpa using hj)⟩
  | [], _ :: _, _, _, _, _, h => by simp [colOK] at h
  | _ :: _, [], _, _, _, _, h => by simp [colOK] at h

theorem classesOK_get : ∀ (cl : List (List ℕ)), classesOK cl = true → ∀ k, classOK (cl.getD k []) = true
  | [], _, k => by simp [classOK, indep]
  | c :: cs, h, k => by
    have h' : (classOK c && classesOK cs) = true := h
    rw [Bool.and_eq_true] at h'
    rcases k with _ | k
    · simpa using h'.1
    · simpa using classesOK_get cs h'.2 k

end GS.PD
