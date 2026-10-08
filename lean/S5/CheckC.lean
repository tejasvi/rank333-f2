module
public import R22Port.U_d41d8cd98f00
public import S5.Check
/-! # The same induction for certificates given as `Cert` terms (`BC5.check`, `BC5.leaf`) -/
@[expose] public section
namespace S5
open BC4 BC5 RootSound Matrix

noncomputable def nodeC (ih : Nat → Nat → Nat → Asg → List Rec → Nat → Cert → Bool) (TERMS SS ACT : Nat) (asg : Asg)
    (recs : List Rec) (dom : Nat) (c : Cert) : Bool :=
  @Cert.casesOn (fun _ => Bool) c
    (fun X =>
      let s := elim (resC X asg)
      bit dom X && elimOk s && Nat.blt (ucnt SS ACT X) s.rk)
    (fun t nt sl sym cdir kids =>
      let a := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
      let nr := mkRecs SS ACT asg nt []
      let part := thru a recs (thru a nr.2 [])
      let allr := app recs nr.2
      let ss := mkSls SS ACT asg sl
      let B := andLm part (Nat.land ALLNZ (cond sym ORBM M512))
      let Cb := andRm part ALLNZ
      let cs : List (Nat × Nat) := cond cdir
        (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
        (cond (Nat.beq B 0) [] (candsB part ss.2 Cb (bitsOf B)))
      let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
      bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 &&
        @List.rec (Nat × Nat) (fun _ => List Cert → Bool) (fun ks => ks.isEmpty)
          (fun p _ ihc ks => @List.casesOn Cert (fun _ => Bool) ks false
            (fun k ks' => ih TERMS SS ACT' ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom k && ihc ks')) cs kids)

theorem check_succ (fuel TERMS SS ACT : Nat) (asg : Asg) (recs : List Rec) (dom : Nat) (c : Cert) :
    check (fuel + 1) TERMS SS ACT asg recs dom c = nodeC (check fuel) TERMS SS ACT asg recs dom c := rfl

theorem ckids_ok (f : Nat × Nat → Cert → Bool) : ∀ (cs : List (Nat × Nat)) (ks : List Cert),
    @List.rec (Nat × Nat) (fun _ => List Cert → Bool) (fun ks => ks.isEmpty)
      (fun p _ ihc ks => @List.casesOn Cert (fun _ => Bool) ks false (fun k ks' => f p k && ihc ks')) cs ks = true →
    ∀ p ∈ cs, ∃ k, f p k = true := by
  intro cs
  induction cs with
  | nil => intro ks _ p hp; exact absurd hp List.not_mem_nil
  | cons q cs ih =>
    intro ks h p hp
    cases ks with
    | nil => exact absurd h Bool.false_ne_true
    | cons k ks' =>
      have h' : (f q k && @List.rec (Nat × Nat) (fun _ => List Cert → Bool) (fun ks => ks.isEmpty)
          (fun p _ ihc ks => @List.casesOn Cert (fun _ => Bool) ks false (fun k ks' => f p k && ihc ks')) cs ks') =
          true := h
      rw [Bool.and_eq_true] at h'
      rcases List.mem_cons.mp hp with e | e
      · exact ⟨k, e ▸ h'.1⟩
      · exact ih ks' h'.2 p e

theorem lt_of_dom {dom X : Nat} (hdom : dom < 2 ^ 512) (h : dom.testBit X = true) : X < 512 := by
  by_contra hX
  rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hdom (Nat.pow_le_pow_right (by norm_num) (by omega)))] at h
  exact absurd h Bool.false_ne_true

/-- **Soundness of the node induction** (`Cert` certificates). -/
theorem check_sound (T n dom SS : Nat) (hn : n ≤ 32) (hSS : SSok T n SS) (hdom : dom < 2 ^ 512) :
    ∀ fuel ACT asg recs (cert : Cert), check fuel T SS ACT asg recs dom cert = true →
      ∀ b c, Inv T n dom b c ACT asg recs → False := by
  intro fuel
  induction fuel with
  | zero => intro ACT asg recs cert h; exact absurd h Bool.false_ne_true
  | succ fuel ih =>
    intro ACT asg recs cert hchk b c hinv
    rw [check_succ] at hchk
    unfold nodeC at hchk
    rcases cert with X | ⟨t, nt, sl, sym, cdir, kids⟩
    · have h' : (bit dom X && elimOk (elim (resC X asg)) && Nat.blt (ucnt SS ACT X) (elim (resC X asg)).rk) = true :=
        hchk
      have hX : X < 512 := by
        have h2 := h'
        simp only [Bool.and_eq_true] at h2
        exact lt_of_dom hdom (by rw [← bit_eq]; exact h2.1.1)
      exact over_step T n dom hn SS hSS ACT asg recs X hX h' b c hinv
    · revert hchk
      show let a := Nat.land (Nat.shiftRight T (Nat.mul 9 t)) 511
        let nr := mkRecs SS ACT asg nt []
        let part := thru a recs (thru a nr.2 [])
        let allr := app recs nr.2
        let ss := mkSls SS ACT asg sl
        let B := andLm part (Nat.land ALLNZ (cond sym ORBM M512))
        let Cb := andRm part ALLNZ
        let cs : List (Nat × Nat) := cond cdir
          (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
          (cond (Nat.beq B 0) [] (candsB part ss.2 Cb (bitsOf B)))
        let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
        (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 &&
          @List.rec (Nat × Nat) (fun _ => List Cert → Bool) (fun ks => ks.isEmpty)
            (fun p _ ihc ks => @List.casesOn Cert (fun _ => Bool) ks false
              (fun k ks' => check fuel T SS ACT' ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom k && ihc ks'))
            cs kids) = true → False
      intro a nr part allr ss B Cb cs ACT' hchk
      have ha : a = aT T t := rfl
      have hcs : cs = brCands SS ACT asg recs a nt sl sym cdir := rfl
      have hallr : allr = brAllr SS ACT asg recs nt := rfl
      have hnr : nr = mkRecs SS ACT asg nt [] := rfl
      have hss : ss = mkSls SS ACT asg sl := rfl
      have hACT' : ACT' = ACT ^^^ 1 <<< t := rfl
      clear_value a nr part allr ss B Cb cs ACT'
      subst ha hcs hallr hnr hss hACT'
      simp only [Bool.and_eq_true] at hchk
      obtain ⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩ := hchk
      refine br_step T n dom hn SS hSS ACT asg recs t sym cdir nt sl
        (fun x hx => lt_of_dom hdom (allDom_spec dom nt h3 x hx))
        (fun x hx => lt_of_dom hdom (allDom_spec dom sl h5 x hx)) h1 h2 h3 h4 h5 h6 h7 ?_ b c hinv
      intro p hp b' c' hinv'
      obtain ⟨k, hk⟩ := ckids_ok (fun p k => check fuel T SS (ACT ^^^ 1 <<< t) ((aT T t, p.1, p.2) :: asg)
        (updRecs (aT T t) p.1 p.2 (brAllr SS ACT asg recs nt)) dom k) _ kids h8 p hp
      exact ih _ _ _ k hk b' c' hinv'

/-! ## Packed terms of a `Cert` leaf -/

def mkSSa (l : List Nat) (s : Nat) : Nat :=
  @List.rec Nat (fun _ => Nat → Nat) (fun _ => 0) (fun a _ ih s => Nat.lor (Nat.shiftLeft (dep32 a) s) (ih (Nat.succ s))) l s

theorem mkSSa_bit : ∀ (l : List Nat) (s0 : Nat), (∀ a ∈ l, a < 512) → s0 + l.length ≤ 32 → ∀ k s, k < 9 → s < 32 →
    (mkSSa l s0).testBit (32 * k + s) = (decide (s0 ≤ s ∧ s < s0 + l.length) && (l.getD (s - s0) 0).testBit k) := by
  intro l
  induction l with
  | nil => intro s0 _ _ k s _ _; simp [mkSSa]
  | cons a l ih =>
    intro s0 hl hlen k s hk hs
    have ha := hl a List.mem_cons_self
    show ((dep32 a <<< s0) ||| mkSSa l (s0 + 1)).testBit (32 * k + s) = _
    rw [Nat.testBit_or, ih (s0 + 1) (fun x hx => hl x (List.mem_cons_of_mem _ hx)) (by simp at hlen ⊢; omega) k s hk hs,
      Nat.testBit_shiftLeft, dep32_bit a ha]
    simp only [List.length_cons]
    by_cases e : s = s0
    · subst e
      have e0 : 32 * k + s - s = 32 * k := by omega
      have e1 : 32 * k % 32 = 0 ∧ 32 * k < 288 := by omega
      have e2 : 32 * k / 32 = k := by omega
      rw [e0, e2, decide_eq_true e1]
      simp
    · have e1 : ¬ (32 * k + s ≥ s0 ∧ (32 * k + s - s0) % 32 = 0 ∧ 32 * k + s - s0 < 288) := by
        simp at hlen; omega
      have hfirst : (decide (32 * k + s ≥ s0) && (decide ((32 * k + s - s0) % 32 = 0 ∧ 32 * k + s - s0 < 288) &&
          a.testBit ((32 * k + s - s0) / 32))) = false := by
        by_cases e2 : 32 * k + s ≥ s0
        · have e4 : ¬ ((32 * k + s - s0) % 32 = 0 ∧ 32 * k + s - s0 < 288) := fun x => e1 ⟨e2, x⟩
          simp [e2, e4]
        · simp [e2]
      rw [hfirst, Bool.false_or]
      by_cases hlt : s0 < s
      · have e3 : s - s0 = (s - (s0 + 1)) + 1 := by omega
        rw [e3, List.getD_cons_succ]
        have e5 : (s0 + 1 ≤ s ∧ s < s0 + 1 + l.length) ↔ (s0 ≤ s ∧ s < s0 + (l.length + 1)) := by omega
        simp only [e5]
      · have e5 : ¬ (s0 + 1 ≤ s ∧ s < s0 + 1 + l.length) := by omega
        have e6 : ¬ (s0 ≤ s ∧ s < s0 + (l.length + 1)) := by omega
        rw [decide_eq_false e5, decide_eq_false e6, Bool.false_and, Bool.false_and]

theorem aT_packT : ∀ (l : List Nat), (∀ a ∈ l, a < 512) → ∀ t, aT (packT l) t = l.getD t 0 := by
  intro l
  induction l with
  | nil => intro _ t; simp [aT, packT]
  | cons a l ih =>
    intro hl t
    have ha := hl a List.mem_cons_self
    have hP : packT (a :: l) = a ||| (packT l <<< 9) := rfl
    cases t with
    | zero =>
      show aT (packT (a :: l)) 0 = a
      apply Nat.eq_of_testBit_eq; intro i
      show ((packT (a :: l) >>> (9 * 0)) &&& 511).testBit i = _
      rw [hP, Nat.testBit_and, testBit_511, Nat.mul_zero, Nat.shiftRight_zero, Nat.testBit_or, Nat.testBit_shiftLeft]
      by_cases hi : i < 9
      · have : ¬ (i ≥ 9) := by omega
        simp [hi, this]
      · rw [lt512_bit a i ha (by omega)]; simp [hi]
    | succ t =>
      rw [List.getD_cons_succ, ← ih (fun x hx => hl x (List.mem_cons_of_mem _ hx)) t]
      apply Nat.eq_of_testBit_eq; intro i
      show ((packT (a :: l) >>> (9 * (t + 1))) &&& 511).testBit i = ((packT l >>> (9 * t)) &&& 511).testBit i
      rw [hP, Nat.testBit_and, Nat.testBit_and, testBit_511, Nat.testBit_shiftRight, Nat.testBit_shiftRight,
        Nat.testBit_or, Nat.testBit_shiftLeft, lt512_bit a _ ha (by omega)]
      have e1 : 9 * (t + 1) + i ≥ 9 := by omega
      have e2 : 9 * (t + 1) + i - 9 = 9 * t + i := by omega
      simp [e1, e2]

theorem mkSS_ok (terms : List Nat) (hl : ∀ a ∈ terms, a < 512) (hlen : terms.length ≤ 32) :
    SSok (packT terms) terms.length (mkSS terms) := by
  intro k s hk hs
  show (mkSSa terms 0).testBit (32 * k + s) = _
  rw [mkSSa_bit terms 0 hl (by omega) k s hk hs, aT_packT terms hl, Nat.sub_zero]
  simp

end S5
