module
public import R22Port.U_d41d8cd98f00
public import RG.Agree3
/-! # The node simulation: an accepted native node is an accepted kernel node

`node_ref`: by induction on the fuel, with the children loop (`kids_ref`, induction on the count) and one child
(`kidStep_ref`).  The kernel node's state is the image of the native state: prefix `pk 7 (af labs) labs.size`,
multiplicities `V (cnt labs)`, `VR (cnt labs)`, budgets `V (af u)`, `VR (af u)`, stream `win B p e`. -/
@[expose] public section
namespace E1NRG
open E1N Finset E1GS

local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)

variable {D : IPD} {C : E1G.Ctx} {sl : ℕ → ℕ} {UB UBR : ℕ} {K : Blk} {RTb H : ℕ}

/-- the kernel's node checker at a native state -/
abbrev KNode (ihk : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool) (d pos : ℕ) (labs u : Array ℕ) (B : ByteArray) (p e : ℕ) :
    Bool :=
  ihk d pos (pk 7 (af labs) labs.size) (V (cnt labs)) (VR (cnt labs)) (V (af u)) (VR (af u)) (win B p e)

theorem rd_lt (k S : ℕ) : E1G.rd k S < 2 ^ k := by rw [rd_eq]; exact Nat.mod_lt _ (by positivity)

theorem beq_self_true (a : ℕ) : Nat.beq a a = true := Nat.beq_refl a

/-! ## Selector rewriting (propositional only: no defeq step may reach the stuck packed arithmetic) -/

/-- a selector on a condition known to be `true` (the condition is explicit, so `rw` targets exactly this selector) -/
theorem selC {α : Sort _} (c : Bool) (hc : c = true) (a b : α) : @Bool.rec (fun _ => α) b a c = a := by subst hc; rfl
/-- a selector on a condition known to be `false` -/
theorem selCF {α : Sort _} (c : Bool) (hc : c = false) (a b : α) : @Bool.rec (fun _ => α) b a c = b := by subst hc; rfl
/-- `c ∧ᵇ b = b` when `c = true` -/
theorem andC (c : Bool) (hc : c = true) (b : Bool) : @Bool.rec (fun _ => Bool) false b c = b := by subst hc; rfl

/-- `kidC12` on an explicit saturation result (over variables: the projections reduce by `rfl`) -/
theorem kidC12_mk (ih : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool) (C : E1G.Ctx) (RTb H code d pl MV MVR l : ℕ)
    (ihl : ℕ → ℕ → Bool) (ok : Bool) (U1 U2 S : ℕ) :
    E1G.kidC12 ih C RTb H code d pl MV MVR l ihl (ok, U1, U2, S) =
    sel (Nat.beq code 1)
      (sel (Nat.beq (E1G.rd 1 S) 0)
        (@Bool.rec (fun _ => Bool) false (ihl (Nat.succ l) (E1G.sk 1 S)) (Nat.blt (E1G.wout U1 0 l) (Nat.sub C.R (Nat.succ d))))
        (@Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false (ihl (Nat.succ l) (E1G.sk 13 S))
          (Nat.blt (E1G.wout U1 (E1G.rmask RTb (E1G.rd 12 (E1G.sk 1 S))) l)
            (Nat.sub (Nat.add (Nat.sub C.R (Nat.succ d)) (E1G.fsum (Nat.land (Nat.add MV (E1G.one l))
              (E1G.fmask (E1G.rmask RTb (E1G.rd 12 (E1G.sk 1 S))))))) (E1G.rcap RTb (E1G.rd 12 (E1G.sk 1 S))))))
          (Nat.ble 1 (Nat.sub (Nat.add (Nat.sub C.R (Nat.succ d)) (E1G.fsum (Nat.land (Nat.add MV (E1G.one l))
            (E1G.fmask (E1G.rmask RTb (E1G.rd 12 (E1G.sk 1 S))))))) (E1G.rcap RTb (E1G.rd 12 (E1G.sk 1 S)))))))
      (sel (Nat.beq (E1G.rd 24 S) 0)
        (@Bool.rec (fun _ => Bool) false (ihl (Nat.succ l) (E1G.sk 32 S))
          (E1G.stEq (E1G.rd 540 (E1G.sk (Nat.mul 540 (E1G.rd 8 (E1G.sk 24 S))) H)) (Nat.succ d) l
            (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) U1))
        (@Bool.rec (fun _ => Bool) false (ihl (Nat.succ l) (E1G.sk (Nat.add 24 (E1G.rd 24 S)) S))
          (ih (Nat.succ d) l (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) (Nat.add MV (E1G.one l)) (Nat.add MVR (E1G.oner l))
            U1 U2 (E1G.rd (E1G.rd 24 S) (E1G.sk 24 S))))) := by
  rw [kidC12_named]

/-- the kernel's saturation events of a child, on native data: accepted, zeroed budgets, rest of the stream -/
theorem sats_child (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H)
    (hrev : ∀ i < 2 ^ 15, ∀ t < 127, (smr (sl i)).testBit t = (smask (sl i)).testBit (126 - t))
    (labs : Array ℕ) (hl : LabOK labs) (hs : labs.size ≤ 64) (u1 : Array ℕ) (hu1 : BudOK u1) (e n q : ℕ) (U : Array ℕ)
    (hsat : E1N.satsGo D K labs e n q (Array.replicate D.mw 0) = some U) :
    E1G.sats RTb n (V (cnt labs)) (V (af u1)) (VR (af u1)) (win K.B q e) =
      (true, V (af (E1N.zeroU D u1 U)), VR (af (E1N.zeroU D u1 U)), win K.B (q + 12 * n) e) := by
  have h0 : ∀ x < 127, (0 : ℕ).testBit x = wbit (Array.replicate D.mw 0) x := by
    intro x _; simp [wbit, af_replicate]
  rw [hD.mw] at hsat h0
  obtain ⟨r1, r2, rM, rMR, rMU, rR, rU⟩ := sats_rel hD hK hrev labs hl hs e n q 0 0 _ U hsat (by simp) (by norm_num)
    (by norm_num) h0 (fun t _ => by simp)
  obtain ⟨z1, z2⟩ := satsZ_rel hD u1 hu1 _ _ U rM rMR rMU rR
  rw [sats_tuple, r1, z1, z2, r2]

/-! ## One child -/

theorem kidStep_ref (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H)
    (hrev : ∀ i < 2 ^ 15, ∀ t < 127, (smr (sl i)).testBit t = (smask (sl i)).testBit (126 - t))
    (ih : ℕ → ℕ → Array ℕ → Array ℕ → ℕ → ℕ → Bool) (ihk : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool) (d : ℕ)
    (hih : ∀ pos' (labs' u' : Array ℕ) p' e', labs'.size = d + 1 → LabOK labs' → BudOK u' →
      ih (d + 1) pos' labs' u' p' e' = true → KNode ihk (d + 1) pos' labs' u' K.B p' e' = true)
    (labs u : Array ℕ) (hd : labs.size = d) (hl : LabOK labs) (hs : labs.size ≤ 63) (hu : BudOK u) (e l q : ℕ)
    (hlN : l < C.N) (h : E1N.kidStep D K ih d labs u e l q ≠ 0)
    (ihl : ℕ → ℕ → Bool) (hihl : ihl (l + 1) (win K.B (E1N.kidStep D K ih d labs u e l q) e) = true) :
    E1G.kidStep ihk C RTb H d (pk 7 (af labs) labs.size) (V (cnt labs)) (VR (cnt labs)) (V (af u)) (VR (af u)) ihl l
      (win K.B q e) = true := by
  have hl127 : l < 127 := lt_of_lt_of_le hlN hD.N_le
  have hub : ∀ x < 127, af u x < 2 ^ 128 := fun x hx => lt_of_le_of_lt (hu.2 x hx) (by norm_num)
  have hfU : E1G.fld (V (af u)) l = af u l := fld_V _ hub l hl127
  rw [kidStep_named]
  have hc : E1G.rd 2 (win K.B q e) = E1N.rdE K.B q e 2 := rd_win _ _ _ 2 (by norm_num)
  have hS2 : E1G.sk 2 (win K.B q e) = win K.B (q + 2) e := sk_win _ _ _ 2
  rw [hc, hS2, hfU, Nat.succ_eq_add_one]
  unfold E1N.kidStep at h hihl
  rw [hD.gb, hD.satb, hD.mw, hD.R] at h hihl
  have hclt : E1N.rdE K.B q e 2 < 4 := by rw [← hc]; exact rd_lt 2 _
  generalize hcode : E1N.rdE K.B q e 2 = code at h hihl hclt
  change (if code == 0 then (if af u l == 0 then q + 2 else 0) else _) ≠ 0 at h
  change ihl (l + 1) (win K.B (if code == 0 then (if af u l == 0 then q + 2 else 0) else _) e) = true at hihl
  rcases (by omega : code = 0 ∨ code = 1 ∨ code = 2 ∨ code = 3) with rfl | rfl | rfl | rfl
  · -- skip
    simp only [beq_self_eq_true, if_true] at h hihl
    by_cases hu0 : af u l = 0
    · rw [if_pos (by simp [hu0])] at hihl
      rw [selC (Nat.beq 0 0) rfl, hu0, andC (Nat.beq 0 0) rfl, hihl]
    · rw [if_neg (by simp [hu0])] at h; exact absurd rfl h
  · -- look-ahead-killed child
    simp only [show ((1 : ℕ) == 0) = false from rfl, show ((1 : ℕ) == 3) = false from rfl, Bool.false_eq_true,
      if_false, show ((1 : ℕ) == 1) = true from rfl, if_true] at h hihl
    rw [selCF (Nat.beq 1 0) rfl, selCF (Nat.beq 1 3) rfl]
    by_cases hu0 : af u l = 0
    · rw [if_pos (show (u.getD l 0 == 0) = true by simp [show u.getD l 0 = af u l from rfl, hu0])] at h
      exact absurd rfl h
    rw [if_neg (show ¬ (u.getD l 0 == 0) = true by simp [show u.getD l 0 = af u l from rfl, hu0])] at h hihl
    have hu1 : 1 ≤ af u l := by omega
    generalize hn : E1N.rdE K.B (q + 2) e 6 = n at h hihl
    generalize hso : E1N.satsGo D K (labs.push l) e n (q + 2 + 6) (Array.replicate 4 0) = so at h hihl
    rcases so with _ | U
    · exact absurd rfl h
    dsimp only at h hihl
    simp only [show u.getD l 0 = af u l from rfl] at h hihl
    have hl2 := labOK_push labs hl l hl127
    have hs2 : (labs.push l).size ≤ 64 := by rw [Array.size_push]; omega
    have hu1' := budOK_set u hu l (af u l - 1) (by omega)
    set u' := E1N.zeroU D (u.set! l (af u l - 1)) U with hu'
    have hu'ok : BudOK u' := budOK_zero hD _ U hu1'
    have hn' : E1G.rd 6 (win K.B (q + 2) e) = n := by rw [rd_win _ _ _ 6 (by norm_num), hn]
    rw [hn', show E1G.sk 6 (win K.B (q + 2) e) = win K.B (q + 2 + 6) e from sk_win _ _ _ 6,
      child_V' labs l hl127, (child_U u hu l hl127 hu1).1, (child_U u hu l hl127 hu1).2,
      sats_child hD hK hrev (labs.push l) hl2 hs2 _ hu1' e n (q + 2 + 6) U (by rw [hD.mw]; exact hso),
      andC (Nat.ble 1 (af u l)) (Nat.ble_eq.mpr hu1), andC _ rfl, kidC12_mk, selC (Nat.beq 1 1) rfl,
      rd_win _ _ _ 1 (by norm_num)]
    change (if (E1N.rdE K.B (q + 2 + 6 + 12 * n) e 1 == 0) = true then _ else _) ≠ 0 at h
    have hpk : E1N.rdE K.B (q + 2 + 6 + 12 * n) e 1 < 2 := by
      rw [← rd_win _ _ _ 1 (by norm_num)]; exact rd_lt 1 _
    generalize hpkv : E1N.rdE K.B (q + 2 + 6 + 12 * n) e 1 = pk at h hihl hpk
    rcases (by omega : pk = 0 ∨ pk = 1) with rfl | rfl
    · -- killed by the total budget
      rw [if_pos (by rfl)] at h hihl
      rw [selC (Nat.beq 0 0) rfl, wout0_rel hD u' hu'ok.2, Nat.sub_eq, Nat.succ_eq_add_one]
      by_cases hw : E1N.wout D u' false 0 l < C.R - (d + 1)
      · rw [if_pos hw] at hihl
        rw [andC _ (Nat.blt_eq.mpr hw), sk_win]; exact hihl
      · rw [if_neg hw] at h; exact absurd rfl h
    · -- killed by a row
      rw [if_neg (by decide)] at h hihl
      rw [selCF (Nat.beq 1 0) rfl, sk_win K.B (q + 2 + 6 + 12 * n) e 1, sk_win K.B (q + 2 + 6 + 12 * n) e 13,
        rd_win _ _ _ 12 (by norm_num), child_V' labs l hl127,
        fsum_rel hD hK (labs.push l) hl2 (le_trans hs2 (by norm_num)), rcap_rel hD hK,
        wout_rel hD hK u' hu'ok.2, show Nat.sub C.R (Nat.succ d) = C.R - (d + 1) from rfl, Nat.succ_eq_add_one]
      generalize hjv : E1N.rdE K.B (q + 2 + 6 + 12 * n + 1) e 12 = j at h hihl
      by_cases hw : 1 ≤ C.R - (d + 1) + E1N.msumL D (labs.push l) (E1N.gix D K j) - E1N.scap D (E1N.gix D K j) ∧
          E1N.wout D u' true (E1N.gix D K j) l <
            C.R - (d + 1) + E1N.msumL D (labs.push l) (E1N.gix D K j) - E1N.scap D (E1N.gix D K j)
      · rw [if_pos (by simp only [Bool.and_eq_true, decide_eq_true_eq]; exact hw)] at hihl
        simp only [Nat.add_eq, Nat.sub_eq]
        rw [andC _ (Nat.ble_eq.mpr hw.1), andC _ (Nat.blt_eq.mpr hw.2)]
        exact hihl
      · rw [if_neg (by simp only [Bool.and_eq_true, decide_eq_true_eq]; exact hw)] at h; exact absurd rfl h
  · -- child subtree or delegated child
    simp only [show ((2 : ℕ) == 0) = false from rfl, show ((2 : ℕ) == 3) = false from rfl, Bool.false_eq_true,
      if_false, show ((2 : ℕ) == 1) = false from rfl] at h hihl
    rw [selCF (Nat.beq 2 0) rfl, selCF (Nat.beq 2 3) rfl]
    by_cases hu0 : af u l = 0
    · rw [if_pos (show (u.getD l 0 == 0) = true by simp [show u.getD l 0 = af u l from rfl, hu0])] at h
      exact absurd rfl h
    rw [if_neg (show ¬ (u.getD l 0 == 0) = true by simp [show u.getD l 0 = af u l from rfl, hu0])] at h hihl
    have hu1 : 1 ≤ af u l := by omega
    generalize hn : E1N.rdE K.B (q + 2) e 6 = n at h hihl
    generalize hso : E1N.satsGo D K (labs.push l) e n (q + 2 + 6) (Array.replicate 4 0) = so at h hihl
    rcases so with _ | U
    · exact absurd rfl h
    dsimp only at h hihl
    simp only [show u.getD l 0 = af u l from rfl] at h hihl
    have hl2 := labOK_push labs hl l hl127
    have hs2 : (labs.push l).size ≤ 64 := by rw [Array.size_push]; omega
    have hu1' := budOK_set u hu l (af u l - 1) (by omega)
    set u' := E1N.zeroU D (u.set! l (af u l - 1)) U with hu'
    have hu'ok : BudOK u' := budOK_zero hD _ U hu1'
    have hn' : E1G.rd 6 (win K.B (q + 2) e) = n := by rw [rd_win _ _ _ 6 (by norm_num), hn]
    rw [hn', show E1G.sk 6 (win K.B (q + 2) e) = win K.B (q + 2 + 6) e from sk_win _ _ _ 6,
      child_V' labs l hl127, (child_U u hu l hl127 hu1).1, (child_U u hu l hl127 hu1).2,
      sats_child hD hK hrev (labs.push l) hl2 hs2 _ hu1' e n (q + 2 + 6) U (by rw [hD.mw]; exact hso),
      andC (Nat.ble 1 (af u l)) (Nat.ble_eq.mpr hu1), andC _ rfl, kidC12_mk, selCF (Nat.beq 2 1) rfl,
      rd_win _ _ _ 24 (by norm_num)]
    have hpl : Nat.lor (pk 7 (af labs) labs.size) (Nat.shiftLeft l (Nat.mul 7 d)) =
        pk 7 (af (labs.push l)) (labs.push l).size := by rw [← hd]; exact pl_push labs hl l
    rw [hpl]
    generalize hlenv : E1N.rdE K.B (q + 2 + 6 + 12 * n) e 24 = len at h hihl
    by_cases hlen : len = 0
    · subst hlen
      rw [if_pos (by rfl)] at h hihl
      rw [selC (Nat.beq 0 0) rfl, sk_win K.B (q + 2 + 6 + 12 * n) e 24, sk_win K.B (q + 2 + 6 + 12 * n) e 32,
        rd_win _ _ _ 8 (by norm_num)]
      generalize hidx : E1N.rdE K.B (q + 2 + 6 + 12 * n + 24) e 8 = idx at h hihl
      by_cases hst : E1N.stEqN D K idx (d + 1) l (labs.push l) u' = true
      · rw [if_pos hst] at hihl
        rw [Nat.succ_eq_add_one, andC _ (stEq_rel hD hK idx (d + 1) l (labs.push l) u'
          (by rw [Array.size_push, hd]) hl2 hu'ok hst)]
        exact hihl
      · rw [if_neg hst] at h; exact absurd rfl h
    · rw [if_neg (by simp [hlen])] at h hihl
      have hb : Nat.beq len 0 = false := by
        cases hb : Nat.beq len 0
        · rfl
        · exact absurd (Nat.eq_of_beq_eq_true hb) hlen
      rw [selCF (Nat.beq len 0) hb, sk_win K.B (q + 2 + 6 + 12 * n) e 24, rdl_win,
        sk_win K.B (q + 2 + 6 + 12 * n) e (Nat.add 24 len), child_V' labs l hl127, child_VR' labs l hl127,
        Nat.succ_eq_add_one]
      by_cases hc : ih (d + 1) l (labs.push l) u' (q + 2 + 6 + 12 * n + 24) (min e (q + 2 + 6 + 12 * n + 24 + len)) = true
      · rw [if_pos hc] at hihl
        have hk := hih l (labs.push l) u' _ _ (by rw [Array.size_push, hd]) hl2 hu'ok hc
        unfold KNode at hk
        rw [andC _ hk, show q + 2 + 6 + 12 * n + Nat.add 24 len = q + 2 + 6 + 12 * n + 24 + len by
          simp only [Nat.add_eq]; ring]
        exact hihl
      · rw [if_neg hc] at h; exact absurd rfl h
  · -- non-canonical skip
    simp only [show ((3 : ℕ) == 0) = false from rfl, show ((3 : ℕ) == 3) = true from rfl, Bool.false_eq_true,
      if_false, if_true] at h hihl
    have hg : E1G.rd 11 (win K.B (q + 2) e) = E1N.rdE K.B (q + 2) e 11 := rd_win _ _ _ 11 (by norm_num)
    have hglt : E1N.rdE K.B (q + 2) e 11 < 2048 := by rw [← hg]; exact rd_lt 11 _
    by_cases hcan : E1N.canonOK D (labs.push l) (E1N.rdE K.B (q + 2) e 11) = true
    · rw [if_pos hcan] at hihl
      rw [selCF (Nat.beq 3 0) rfl, selC (Nat.beq 3 3) rfl, hg,
        show E1G.sk 11 (win K.B (q + 2) e) = win K.B (q + 2 + 11) e from sk_win _ _ _ 11, ← hd,
        andC _ (canon_rel hD labs hl l _ hl127 hglt (by omega) hcan), hihl]
    · rw [if_neg hcan] at h; exact absurd rfl h

/-! ## The children loop -/

theorem kids_ref (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H)
    (hrev : ∀ i < 2 ^ 15, ∀ t < 127, (smr (sl i)).testBit t = (smask (sl i)).testBit (126 - t))
    (ih : ℕ → ℕ → Array ℕ → Array ℕ → ℕ → ℕ → Bool) (ihk : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool) (d : ℕ)
    (hih : ∀ pos' (labs' u' : Array ℕ) p' e', labs'.size = d + 1 → LabOK labs' → BudOK u' →
      ih (d + 1) pos' labs' u' p' e' = true → KNode ihk (d + 1) pos' labs' u' K.B p' e' = true)
    (labs u : Array ℕ) (hd : labs.size = d) (hl : LabOK labs) (hs : labs.size ≤ 63) (hu : BudOK u) (e : ℕ) :
    ∀ m l q, (l + m ≤ C.N ∨ m = 0) → E1N.kids D K ih d labs u e m l q = true →
      E1G.kids ihk C RTb H m d (pk 7 (af labs) labs.size) (V (cnt labs)) (VR (cnt labs)) (V (af u)) (VR (af u)) l
        (win K.B q e) = true := by
  intro m
  induction m with
  | zero => intro l q _ _; rfl
  | succ m ihm =>
    intro l q hm h
    rw [kids_succ]
    rw [E1N.kids, Bool.and_eq_true, bne_iff_ne, ne_eq] at h
    exact kidStep_ref hD hK hrev ih ihk d hih labs u hd hl hs hu e l q (by omega) h.1 _
      (ihm (l + 1) _ (Or.inl (by omega)) h.2)

/-! ## The cut condition -/

theorem dot_zero (x : ℕ) : E1G.dot x 0 = 0 := by
  show Nat.land (Nat.shiftRight (Nat.mul x 0) 16128) E1G.FM = 0
  rw [show Nat.mul x 0 = 0 from Nat.mul_zero x, show Nat.shiftRight 0 16128 = 0 from Nat.zero_shiftRight 16128]
  exact Nat.zero_and _

theorem cutOK_ref (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H) (kind cut cj rem : ℕ) (hkind : kind < 4)
    (labs u' : Array ℕ) (hl : LabOK labs) (hs : labs.size ≤ 64) (hu' : BudOK u') (hd : Bool) (du : Dual) (hdu : DuOK du)
    (hk : du.is.size ≤ 64) (RS : ℕ) (h : E1N.cutOK D K kind cut cj rem labs u' hd du RS = true) :
    E1G.cutOK C RTb kind cut cj rem (V (cnt labs)) (V (af u')) hd du.BC (V (tf D du)) (VR (af u')) RS = true := by
  rw [cutOK_named]
  unfold E1N.cutOK at h
  rcases (by omega : kind = 0 ∨ kind = 1 ∨ kind = 2 ∨ kind = 3) with rfl | rfl | rfl | rfl
  · rw [if_pos (by rfl)] at h
    rw [selC (Nat.beq 0 0) rfl, ← hD.N]; exact Nat.ble_eq.mpr (of_decide_eq_true h)
  · rw [if_neg (by decide), if_pos (by rfl)] at h
    simp only [Bool.and_eq_true, decide_eq_true_eq] at h
    rw [selCF (Nat.beq 1 0) rfl, selC (Nat.beq 1 1) rfl, fsum_rel hD hK labs hl (le_trans hs (by norm_num)),
      rcap_rel hD hK, wout_rel hD hK u' hu'.2]
    simp only [Nat.add_eq, Nat.sub_eq]
    rw [andC _ (Nat.ble_eq.mpr h.1)]; exact Nat.blt_eq.mpr h.2
  · rw [if_neg (by decide), if_neg (by decide), if_pos (by rfl)] at h
    rw [selCF (Nat.beq 2 0) rfl, selCF (Nat.beq 2 1) rfl, selC (Nat.beq 2 2) rfl, wout0_rel hD u' hu'.2]
    exact Nat.blt_eq.mpr (of_decide_eq_true h)
  · rw [if_neg (by decide), if_neg (by decide), if_neg (by decide)] at h
    simp only [Bool.and_eq_true, decide_eq_true_eq] at h
    rw [selCF (Nat.beq 3 0) rfl, selCF (Nat.beq 3 1) rfl, selCF (Nat.beq 3 2) rfl, andC hd h.1,
      deficit_rel hD u' hu'.2 du hdu hk cut]
    simp only [Nat.add_eq]
    exact Nat.blt_eq.mpr h.2

/-! ## Branch nodes -/

theorem brHd_eq (S1 : ℕ) : E1G.brHd S1 =
    Nat.beq (E1G.rd 1 (sel (Nat.beq (E1G.rd 2 (E1G.sk 7 S1)) 1) (E1G.sk 12 (E1G.sk 9 S1)) (E1G.sk 9 S1))) 1 := rfl
theorem brS4_eq (S1 : ℕ) : E1G.brS4 S1 =
    E1G.sk 1 (sel (Nat.beq (E1G.rd 2 (E1G.sk 7 S1)) 1) (E1G.sk 12 (E1G.sk 9 S1)) (E1G.sk 9 S1)) := rfl

theorem beq_of_ne (a b : ℕ) (h : a ≠ b) : Nat.beq a b = false := by
  cases hb : Nat.beq a b
  · rfl
  · exact absurd (Nat.eq_of_beq_eq_true hb) h

/-- `branchT` on a variable dual and fixing result (rfl over variables) -/
theorem branchT_v (ih : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool) (C : E1G.Ctx) (RTb H d pos pl MV MVR UFR rem cut kind cj : ℕ)
    (hd : Bool) (du : ℕ × ℕ × ℕ) (fx : Bool × ℕ × ℕ × ℕ) :
    E1G.branchT ih C RTb H d pos pl MV MVR UFR rem cut kind cj hd du fx =
    (@Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false
      (E1G.kids ih C RTb H (Nat.sub (sel (Nat.ble C.N cut) C.N cut) pos) d pl MV MVR fx.2.1 fx.2.2.1 pos fx.2.2.2)
      (E1G.cutOK C RTb kind cut cj rem MV fx.2.1 hd du.1 du.2.1 fx.2.2.1 (Nat.add (Nat.mul rem E1G.SC) (E1G.dot MVR du.2.1))))
      fx.1)
      (@Bool.rec (fun _ => Bool) true (Nat.ble (Nat.add (Nat.mul rem E1G.SC) (E1G.dot MVR du.2.1))
        (Nat.add du.1 (E1G.deficit du.2.1 UFR pos))) hd)) := by
  rw [branchT_named]

theorem branch_ref (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H)
    (hrev : ∀ i < 2 ^ 15, ∀ t < 127, (smr (sl i)).testBit t = (smask (sl i)).testBit (126 - t))
    (ih : ℕ → ℕ → Array ℕ → Array ℕ → ℕ → ℕ → Bool) (ihk : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool) (d pos : ℕ)
    (hih : ∀ pos' (labs' u' : Array ℕ) p' e', labs'.size = d + 1 → LabOK labs' → BudOK u' →
      ih (d + 1) pos' labs' u' p' e' = true → KNode ihk (d + 1) pos' labs' u' K.B p' e' = true)
    (labs u : Array ℕ) (hd : labs.size = d) (hl : LabOK labs) (hs : labs.size ≤ 63) (hu : BudOK u) (p e : ℕ)
    (h : E1N.branch D K ih d pos labs u p e = true) :
    E1G.branchT ihk C RTb H d pos (pk 7 (af labs) labs.size) (V (cnt labs)) (VR (cnt labs)) (VR (af u)) (Nat.sub C.R d)
      (E1G.rd 7 (win K.B p e)) (E1G.rd 2 (E1G.sk 7 (win K.B p e))) (E1G.rd 12 (E1G.sk 9 (win K.B p e)))
      (E1G.brHd (win K.B p e)) (E1G.brDu RTb (win K.B p e))
      (sel (E1G.brHd (win K.B p e))
        (E1G.fixes (E1G.rd 7 (E1G.brDu RTb (win K.B p e)).2.2) (E1G.brDu RTb (win K.B p e)).2.1
          (Nat.sub (Nat.add (E1G.brDu RTb (win K.B p e)).1 (E1G.deficit (E1G.brDu RTb (win K.B p e)).2.1 (VR (af u)) pos))
            (Nat.add (Nat.mul (Nat.sub C.R d) E1G.SC) (E1G.dot (VR (cnt labs)) (E1G.brDu RTb (win K.B p e)).2.1)))
          (V (af u)) (VR (af u)) (E1G.sk 7 (E1G.brDu RTb (win K.B p e)).2.2))
        (true, V (af u), VR (af u), E1G.brS4 (win K.B p e))) = true := by
  have hcut : E1G.rd 7 (win K.B p e) = E1N.rdE K.B p e 7 := rd_win _ _ _ 7 (by norm_num)
  have hkind : E1G.rd 2 (E1G.sk 7 (win K.B p e)) = E1N.rdE K.B (p + 7) e 2 := by
    rw [sk_win]; exact rd_win _ _ _ 2 (by norm_num)
  have hcj : E1G.rd 12 (E1G.sk 9 (win K.B p e)) = E1N.rdE K.B (p + 7 + 2) e 12 := by
    rw [sk_win]; exact rd_win _ _ _ 12 (by norm_num)
  have hkl : E1N.rdE K.B (p + 7) e 2 < 4 := by rw [← hkind]; exact rd_lt 2 _
  unfold E1N.branch at h
  rw [hD.lb, hD.R, hD.N] at h
  dsimp only at h
  generalize hkv : E1N.rdE K.B (p + 7) e 2 = kind at h hkl
  generalize hq0 : (if (kind == 1) = true then p + 7 + 14 else p + 7 + 2) = q0 at h
  have hsel : sel (Nat.beq (E1G.rd 2 (E1G.sk 7 (win K.B p e))) 1) (E1G.sk 12 (E1G.sk 9 (win K.B p e)))
      (E1G.sk 9 (win K.B p e)) = win K.B q0 e := by
    rw [hkind, hkv, ← hq0]
    by_cases hk1 : kind = 1
    · subst hk1; rw [selC (Nat.beq 1 1) rfl, sk_win, sk_win, if_pos (by rfl)]
    · rw [selCF (Nat.beq kind 1) (beq_of_ne _ _ hk1), sk_win, if_neg (by simp [hk1])]
  have hHd : E1G.brHd (win K.B p e) = Nat.beq (E1N.rdE K.B q0 e 1) 1 := by
    rw [brHd_eq, hsel, rd_win _ _ _ 1 (by norm_num)]
  have hS4 : E1G.brS4 (win K.B p e) = win K.B (q0 + 1) e := by rw [brS4_eq, hsel, sk_win]
  rw [brDu_eq, hHd, hS4, hcut, hkind, hcj, hkv]
  have hhl : E1N.rdE K.B q0 e 1 < 2 := by
    have := rd_lt 1 (win K.B q0 e); rwa [rd_win _ _ _ 1 (by norm_num)] at this
  have htop : Nat.sub (sel (Nat.ble C.N (E1N.rdE K.B p e 7)) C.N (E1N.rdE K.B p e 7)) pos =
      (if C.N ≤ E1N.rdE K.B p e 7 then C.N else E1N.rdE K.B p e 7) - pos := by
    by_cases hle : C.N ≤ E1N.rdE K.B p e 7
    · rw [selC _ (Nat.ble_eq.mpr hle), if_pos hle]; rfl
    · rw [selCF _ (by cases hb : Nat.ble C.N (E1N.rdE K.B p e 7)
                      · rfl
                      · exact absurd (Nat.ble_eq.mp hb) hle), if_neg hle]; rfl
  generalize hhv : E1N.rdE K.B q0 e 1 = hdv at h hhl
  rcases (by omega : hdv = 0 ∨ hdv = 1) with rfl | rfl
  · -- no node dual
    rw [if_neg (show ¬ ((0 : ℕ) == 1) = true from by decide)] at h
    simp only [Bool.and_eq_true] at h
    obtain ⟨hcut', hkids⟩ := h
    rw [selCF (Nat.beq 0 1) rfl, selCF (Nat.beq 0 1) rfl]
    generalize hdu3 : ((0, 0, win K.B (q0 + 1) e) : ℕ × ℕ × ℕ) = du3
    generalize hfx3 : ((true, V (af u), VR (af u), win K.B (q0 + 1) e) : Bool × ℕ × ℕ × ℕ) = fx3
    have e1 : du3.1 = 0 := by rw [← hdu3]
    have e2 : du3.2.1 = 0 := by rw [← hdu3]
    have f1 : fx3.1 = true := by rw [← hfx3]
    have f2 : fx3.2.1 = V (af u) := by rw [← hfx3]
    have f3 : fx3.2.2.1 = VR (af u) := by rw [← hfx3]
    have f4 : fx3.2.2.2 = win K.B (q0 + 1) e := by rw [← hfx3]
    rw [branchT_v, e1, e2, f1, f2, f3, f4, selCF (Nat.beq 0 1) rfl, andC true rfl, andC true rfl, dot_zero]
    have hk0 : Dual.empty.is.size ≤ 64 := by simp [Dual.empty]
    have hok0 : DuOK Dual.empty := ⟨rfl, fun r => by simp [af, Dual.empty]⟩
    have hc0 := cutOK_ref hD hK _ _ _ _ (by omega) labs u hl (by omega) hu false Dual.empty hok0 hk0 _ hcut'
    rw [show tf D Dual.empty = fun _ => 0 by funext x; simp [tf, Dual.empty], V_zero,
      show Dual.empty.BC = 0 from rfl] at hc0
    rw [show Nat.add (Nat.mul (Nat.sub C.R d) E1G.SC) 0 = (C.R - d) * E1N.SC from rfl,
      show Nat.beq 0 1 = false from rfl, show Nat.sub C.R d = C.R - d from rfl, andC _ hc0, htop]
    exact kids_ref hD hK hrev ih ihk d hih labs u hd hl hs hu e _ pos (q0 + 1) (by split <;> omega) hkids
  · -- node dual and fixings
    rw [if_pos (show ((1 : ℕ) == 1) = true from rfl)] at h
    have hk64 : E1N.rdE K.B (q0 + 1) e 6 < 64 := by
      have := rd_lt 6 (win K.B (q0 + 1) e); rwa [rd_win _ _ _ 6 (by norm_num)] at this
    generalize hk : E1N.rdE K.B (q0 + 1) e 6 = k at h hk64
    obtain ⟨hrd, hduok, hdusz⟩ := rdual_rel0 hD hK e k (q0 + 1 + 6)
    generalize hdu : E1N.rdual D K e k (q0 + 1 + 6) Dual.empty = du at h hrd hduok hdusz
    have hdu64 : du.is.size ≤ 64 := by omega
    simp only [Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨hRS, h⟩ := h
    generalize hnf : E1N.rdE K.B (q0 + 1 + 6 + 48 * k) e 7 = nf at h
    generalize hfo : E1N.fixesGo D K e (du.BC + E1N.deficit D u du pos - ((C.R - d) * E1N.SC + E1N.dotD D labs du)) du nf
      (q0 + 1 + 6 + 48 * k + 7) u = fo at h
    rcases fo with _ | u'
    · exact absurd h (by simp)
    dsimp only at h
    simp only [Bool.and_eq_true] at h
    obtain ⟨hcut', hkids⟩ := h
    obtain ⟨hfx, hu'⟩ := fixes_rel hD e _ du hduok hdu64 nf (q0 + 1 + 6 + 48 * k + 7) u u' hu hfo
    rw [selC (Nat.beq 1 1) rfl, selC (Nat.beq 1 1) rfl, rd_win _ _ _ 6 (by norm_num), sk_win, hk, hrd]
    generalize hdu3 : ((du.BC, V (tf D du), win K.B (q0 + 1 + 6 + 48 * k) e) : ℕ × ℕ × ℕ) = du3
    have e1 : du3.1 = du.BC := by rw [← hdu3]
    have e2 : du3.2.1 = V (tf D du) := by rw [← hdu3]
    have e3 : du3.2.2 = win K.B (q0 + 1 + 6 + 48 * k) e := by rw [← hdu3]
    have hdef := deficit_rel hD u hu.2 du hduok hdu64 pos
    have hdot := dot_rel (D := D) labs hl (by omega) du hduok hdu64
    rw [e3, rd_win _ _ _ 7 (by norm_num), hnf, sk_win, e2, e1, hdef, hdot,
      show Nat.sub (Nat.add du.BC (E1N.deficit D u du pos)) (Nat.add (Nat.mul (Nat.sub C.R d) E1G.SC) (E1N.dotD D labs du)) =
        du.BC + E1N.deficit D u du pos - ((C.R - d) * E1N.SC + E1N.dotD D labs du) from rfl, fixes_eq, hfx]
    generalize hfx3 : ((true, V (af u'), VR (af u'), win K.B (q0 + 1 + 6 + 48 * k + 7 + 10 * nf) e) :
      Bool × ℕ × ℕ × ℕ) = fx3
    have f1 : fx3.1 = true := by rw [← hfx3]
    have f2 : fx3.2.1 = V (af u') := by rw [← hfx3]
    have f3 : fx3.2.2.1 = VR (af u') := by rw [← hfx3]
    have f4 : fx3.2.2.2 = win K.B (q0 + 1 + 6 + 48 * k + 7 + 10 * nf) e := by rw [← hfx3]
    rw [branchT_v, e1, e2, f1, f2, f3, f4, hdef, hdot, selC (Nat.beq 1 1) rfl,
      show Nat.add (Nat.mul (Nat.sub C.R d) E1G.SC) (E1N.dotD D labs du) = (C.R - d) * E1N.SC + E1N.dotD D labs du from rfl,
      show Nat.add du.BC (E1N.deficit D u du pos) = du.BC + E1N.deficit D u du pos from rfl,
      andC _ (Nat.ble_eq.mpr hRS), andC true rfl, show Nat.beq 1 1 = true from rfl,
      show Nat.sub C.R d = C.R - d from rfl,
      andC _ (cutOK_ref hD hK _ _ _ _ (by omega) labs u' hl (by omega) hu' true du hduok hdu64 _ hcut'), htop]
    rw [show q0 + 1 + 6 + 48 * k + 7 + (7 + 3) * nf = q0 + 1 + 6 + 48 * k + 7 + 10 * nf by ring] at hkids
    exact kids_ref hD hK hrev ih ihk d hih labs u' hd hl hs hu' e _ pos _ (by split <;> omega) hkids

/-! ## Nodes -/

theorem node_ref (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H)
    (hrev : ∀ i < 2 ^ 15, ∀ t < 127, (smr (sl i)).testBit t = (smask (sl i)).testBit (126 - t)) :
    ∀ fuel d pos (labs u : Array ℕ) p e, labs.size = d → labs.size + fuel ≤ 56 → labs.size ≤ C.R → LabOK labs →
      BudOK u → E1N.node D K fuel d pos labs u p e = true → KNode (E1G.node C RTb H fuel) d pos labs u K.B p e = true := by
  intro fuel
  induction fuel with
  | zero => intro d pos labs u p e _ _ _ _ _ h; rw [E1N.node] at h; exact absurd h (by simp)
  | succ n ihn =>
    intro d pos labs u p e hd hsz hR hl hu h
    unfold KNode
    rw [node_succ, nodeStep_named]
    rw [E1N.node] at h
    dsimp only at h
    rw [hD.R] at h
    have hc : E1G.rd 2 (win K.B p e) = E1N.rdE K.B p e 2 := rd_win _ _ _ 2 (by norm_num)
    rw [hc, sk_win]
    have htl : E1N.rdE K.B p e 2 < 4 := by rw [← hc]; exact rd_lt 2 _
    generalize htag : E1N.rdE K.B p e 2 = tag at h htl
    rcases (by omega : tag = 0 ∨ tag = 1 ∨ tag = 2 ∨ tag = 3) with rfl | rfl | rfl | rfl
    · -- leaf
      rw [if_pos (by rfl)] at h
      simp only [Bool.and_eq_true, beq_iff_eq] at h
      obtain ⟨h0, hlf⟩ := h
      rw [selC (Nat.beq 0 0) rfl, show Nat.sub C.R d = C.R - d from rfl, h0, andC (Nat.beq 0 0) rfl]
      exact hD.leaf labs K.B (p + 2) e hlf (by omega) hl
    · -- kill
      rw [if_neg (by decide)] at h
      have hrem : C.R - d ≠ 0 := by intro h0; rw [if_pos (by simp [h0])] at h; exact absurd h (by simp)
      rw [if_neg (by simp [hrem]), if_pos (by rfl)] at h
      have hk64 : E1N.rdE K.B (p + 2) e 6 < 64 := by
        have := rd_lt 6 (win K.B (p + 2) e); rwa [rd_win _ _ _ 6 (by norm_num)] at this
      generalize hk : E1N.rdE K.B (p + 2) e 6 = k at h hk64
      obtain ⟨hrd, hduok, hdusz⟩ := rdual_rel0 hD hK e k (p + 2 + 6)
      generalize hdu : E1N.rdual D K e k (p + 2 + 6) Dual.empty = du at h hrd hduok hdusz
      have hdu64 : du.is.size ≤ 64 := by omega
      rw [selCF (Nat.beq 1 0) rfl, show Nat.sub C.R d = C.R - d from rfl,
        andC _ (Nat.ble_eq.mpr (by omega)), selC (Nat.beq 1 1) rfl, rd_win _ _ _ 6 (by norm_num), hk, sk_win, hrd]
      generalize hdu3 : ((du.BC, V (tf D du), win K.B (p + 2 + 6 + 48 * k) e) : ℕ × ℕ × ℕ) = du3
      have e1 : du3.1 = du.BC := by rw [← hdu3]
      have e2 : du3.2.1 = V (tf D du) := by rw [← hdu3]
      rw [e1, e2, deficit_rel hD u hu.2 du hduok hdu64 pos, dot_rel (D := D) labs hl (by omega) du hduok hdu64]
      exact Nat.blt_eq.mpr (of_decide_eq_true h)
    · rw [if_neg (by decide)] at h
      have hrem : C.R - d ≠ 0 := by intro h0; rw [if_pos (by simp [h0])] at h; exact absurd h (by simp)
      rw [if_neg (by simp [hrem]), if_neg (by decide)] at h
      rw [selCF (Nat.beq 2 0) rfl, show Nat.sub C.R d = C.R - d from rfl, andC _ (Nat.ble_eq.mpr (by omega)),
        selCF (Nat.beq 2 1) rfl, show C.R - d = Nat.sub C.R d from rfl]
      refine branch_ref hD hK hrev (E1N.node D K n) (E1G.node C RTb H n) d pos ?_ labs u hd hl (by omega) hu (p + 2) e h
      intro pos' labs' u' p' e' hd' hl' hu' hc'
      exact ihn (d + 1) pos' labs' u' p' e' hd' (by omega) (by omega) hl' hu' hc'
    · rw [if_neg (by decide)] at h
      have hrem : C.R - d ≠ 0 := by intro h0; rw [if_pos (by simp [h0])] at h; exact absurd h (by simp)
      rw [if_neg (by simp [hrem]), if_neg (by decide)] at h
      rw [selCF (Nat.beq 3 0) rfl, show Nat.sub C.R d = C.R - d from rfl, andC _ (Nat.ble_eq.mpr (by omega)),
        selCF (Nat.beq 3 1) rfl, show C.R - d = Nat.sub C.R d from rfl]
      refine branch_ref hD hK hrev (E1N.node D K n) (E1G.node C RTb H n) d pos ?_ labs u hd hl (by omega) hu (p + 2) e h
      intro pos' labs' u' p' e' hd' hl' hu' hc'
      exact ihn (d + 1) pos' labs' u' p' e' hd' (by omega) (by omega) hl' hu' hc'

end E1NRG
