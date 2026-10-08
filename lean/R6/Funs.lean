module
public import R22Port.U_d41d8cd98f00
public import R6.Tab
/-! # v6 ⇒ v6s refinement, part 3: the record-free functions

One equality per re-encoded function: residuals, elimination (`es5` maps v6's `ES` to v5's), the root masks, the
stream readers, the rank-1 claim (`r1s` maps v6's `R1` to v6s's), `thru1`, the small list loops. -/
@[expose] public section
namespace R6
open BC4

/-! ## Residuals and elimination -/

theorem resC_eq (X : Nat) : ∀ asg : List (Nat × Nat × Nat), BC6.resC X asg = BC5.resC X asg
  | [] => rfl
  | e :: l => by
    have h6 : BC6.resC X (e :: l) = @Bool.rec (fun _ => Nat) (BC6.resC X l)
        (Nat.xor (Nat.mul (BC6.spr18 e.2.2) e.2.1) (BC6.resC X l)) (BC6.par (Nat.land e.1 X)) := rfl
    have h5 : BC5.resC X (e :: l) = cond (BC5.par (Nat.land e.1 X))
        (Nat.xor (Nat.mul (BC5.spr18 e.2.2) e.2.1) (BC5.resC X l)) (BC5.resC X l) := rfl
    rw [h6, h5, resC_eq X l, sel_eq, par_eq, spr18_eq]

theorem resR_eq (X : Nat) : ∀ asg : List (Nat × Nat × Nat), BC6.resR X asg = BC5.resR X asg
  | [] => rfl
  | e :: l => by
    have h6 : BC6.resR X (e :: l) = @Bool.rec (fun _ => Nat) (BC6.resR X l)
        (Nat.xor (Nat.mul (BC6.spr18 e.2.1) e.2.2) (BC6.resR X l)) (BC6.par (Nat.land e.1 X)) := rfl
    have h5 : BC5.resR X (e :: l) = cond (BC5.par (Nat.land e.1 X))
        (Nat.xor (Nat.mul (BC5.spr18 e.2.1) e.2.2) (BC5.resR X l)) (BC5.resR X l) := rfl
    rw [h6, h5, resR_eq X l, sel_eq, par_eq, spr18_eq]

/-- v6's elimination state as v5's -/
def es5 (s : BC6.ES) : BC5.ES := ⟨s.P, s.PM, s.rk, s.DG, s.D18, s.M⟩

theorem stepE_eq (h : Nat) (s : BC6.ES) : es5 (BC6.stepE h s) = BC5.stepE h (es5 s) := by
  simp only [BC6.stepE, BC5.stepE, sub1_eq, sel_eq, es5]
  cases Nat.beq (Nat.land (Nat.shiftRight s.M h) REP18) 0 <;> simp only [condT, condF]

theorem elim_loop (n : Nat) : ∀ s : BC6.ES,
    es5 (@Nat.rec (fun _ => BC6.ES → BC6.ES) (fun s => s) (fun k ih s => ih (BC6.stepE k s)) n s) =
      @Nat.rec (fun _ => BC5.ES → BC5.ES) (fun s => s) (fun k ih s => ih (BC5.stepE k s)) n (es5 s) := by
  induction n with
  | zero => intro s; rfl
  | succ k ih =>
    intro s
    have e6 : @Nat.rec (fun _ => BC6.ES → BC6.ES) (fun s => s) (fun k ih s => ih (BC6.stepE k s)) (k + 1) s =
        @Nat.rec (fun _ => BC6.ES → BC6.ES) (fun s => s) (fun k ih s => ih (BC6.stepE k s)) k (BC6.stepE k s) := rfl
    have e5 : @Nat.rec (fun _ => BC5.ES → BC5.ES) (fun s => s) (fun k ih s => ih (BC5.stepE k s)) (k + 1) (es5 s) =
        @Nat.rec (fun _ => BC5.ES → BC5.ES) (fun s => s) (fun k ih s => ih (BC5.stepE k s)) k (BC5.stepE k (es5 s)) := rfl
    rw [e6, e5, ih, stepE_eq]

theorem elim_eq (M : Nat) : es5 (BC6.elim M) = BC5.elim M := elim_loop 9 ⟨0, 0, 0, 0, 0, M⟩

theorem elimOk_eq (s : BC6.ES) : BC6.elimOk s = BC5.elimOk (es5 s) := by
  simp only [BC6.elimOk, BC5.elimOk, es5, sel_eq, cond_and, Bool.and_assoc]

theorem elim_rk (M : Nat) : (BC6.elim M).rk = (BC5.elim M).rk := by rw [← elim_eq]; rfl
theorem elim_P (M : Nat) : (BC6.elim M).P = (BC5.elim M).P := by rw [← elim_eq]; rfl
theorem elim_PM (M : Nat) : (BC6.elim M).PM = (BC5.elim M).PM := by rw [← elim_eq]; rfl
theorem elim_M (M : Nat) : (BC6.elim M).M = (BC5.elim M).M := by rw [← elim_eq]; rfl
theorem elimOk_elim (M : Nat) : BC6.elimOk (BC6.elim M) = BC5.elimOk (BC5.elim M) := by rw [elimOk_eq, elim_eq]

/-! ## Masks from an elimination -/

/-- the loop of `BC6.lmC` -/
def lmC6 (P PM n : Nat) : Nat → Nat :=
  @Nat.rec (fun _ => Nat → Nat) (fun acc => acc)
    (fun j ih acc => ih (@Bool.rec (fun _ => Nat) (Nat.land acc (BC6.perp (Nat.lor (BC6.gather P j) (Nat.shiftLeft 1 j))))
      acc (BC6.bit PM j))) n
def lmC5 (P PM n : Nat) : Nat → Nat :=
  @Nat.rec (fun _ => Nat → Nat) (fun acc => acc)
    (fun j ih acc => ih (cond (BC5.bit PM j) acc (Nat.land acc (BC5.perp (Nat.lor (BC5.gather P j) (Nat.shiftLeft 1 j)))))) n

theorem lmC_loop (P PM : Nat) : ∀ n acc, lmC6 P PM n acc = lmC5 P PM n acc := by
  intro n
  induction n with
  | zero => intro acc; rfl
  | succ k ih =>
    intro acc
    have e6 : lmC6 P PM (k + 1) acc = lmC6 P PM k (@Bool.rec (fun _ => Nat)
        (Nat.land acc (BC6.perp (Nat.lor (BC6.gather P k) (Nat.shiftLeft 1 k)))) acc (BC6.bit PM k)) := rfl
    have e5 : lmC5 P PM (k + 1) acc = lmC5 P PM k (cond (BC5.bit PM k) acc
        (Nat.land acc (BC5.perp (Nat.lor (BC5.gather P k) (Nat.shiftLeft 1 k))))) := rfl
    rw [e6, e5, ih, sel_eq, bit_eq, perp_eq, gather_eq]

theorem lmC_eq (P PM : Nat) : BC6.lmC P PM = BC5.lmC P PM := lmC_loop P PM 9 M512

def kerM6 (M n : Nat) : Nat → Nat :=
  @Nat.rec (fun _ => Nat → Nat) (fun acc => acc)
    (fun z ih acc => ih (@Bool.rec (fun _ => Nat)
      (Nat.land acc (BC6.perp (Nat.shiftRight (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) M18) 9))) acc
      (Nat.beq (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) M18) 0))) n
def kerM5 (M n : Nat) : Nat → Nat :=
  @Nat.rec (fun _ => Nat → Nat) (fun acc => acc)
    (fun z ih acc => ih (cond (Nat.beq (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) M18) 0) acc
      (Nat.land acc (BC5.perp (Nat.shiftRight (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) M18) 9))))) n

theorem kerM_loop (M : Nat) : ∀ n acc, kerM6 M n acc = kerM5 M n acc := by
  intro n
  induction n with
  | zero => intro acc; rfl
  | succ k ih =>
    intro acc
    have e6 : kerM6 M (k + 1) acc = kerM6 M k (@Bool.rec (fun _ => Nat)
        (Nat.land acc (BC6.perp (Nat.shiftRight (Nat.land (Nat.shiftRight M (Nat.mul 18 k)) M18) 9))) acc
        (Nat.beq (Nat.land (Nat.shiftRight M (Nat.mul 18 k)) M18) 0)) := rfl
    have e5 : kerM5 M (k + 1) acc = kerM5 M k (cond (Nat.beq (Nat.land (Nat.shiftRight M (Nat.mul 18 k)) M18) 0) acc
        (Nat.land acc (BC5.perp (Nat.shiftRight (Nat.land (Nat.shiftRight M (Nat.mul 18 k)) M18) 9)))) := rfl
    rw [e6, e5, ih, sel_eq, perp_eq]

theorem kerM_eq (M : Nat) : BC6.kerM M = BC5.kerM M := kerM_loop M 9 M512

/-! ## Stream readers and per-leaf data -/

theorem rdList_eq : ∀ m S, BC6.rdList m S = BC5.rdList m S := by
  intro m
  induction m with
  | zero => intro S; rfl
  | succ k ih =>
    intro S
    have e6 : BC6.rdList (k + 1) S = (let r := BC6.rdList k (BC6.sk 9 S); (BC6.rd 9 S :: r.1, r.2)) := rfl
    have e5 : BC5.rdList (k + 1) S = (let r := BC5.rdList k (BC5.sk 9 S); (BC5.rd 9 S :: r.1, r.2)) := rfl
    rw [e6, e5, ih, rd_eq, sk_eq]

theorem mkSSP_eq (T n : Nat) : BC6.mkSSP T n = BC5.mkSSP T n := rfl
theorem rkSum_eq (T n : Nat) : BC6.rkSum T n = BC6s.rkSum T n := rfl
theorem needP_eq (T n D : Nat) : BC6.needP T n D = BC6s.needP T n D := rfl

theorem allDom_eq (dom : Nat) : ∀ l : List Nat, BC6.allDom dom l = BC5.allDom dom l
  | [] => rfl
  | X :: l => by
    have e6 : BC6.allDom dom (X :: l) = @Bool.rec (fun _ => Bool) false (BC6.allDom dom l) (BC6.bit dom X) := rfl
    have e5 : BC5.allDom dom (X :: l) = (BC5.bit dom X && BC5.allDom dom l) := rfl
    rw [e6, e5, allDom_eq dom l, sel_eq, cond_and, bit_eq]

theorem allThru_eq (a : Nat) : ∀ l : List Nat, BC6.allThru a l = BC5.allThru a l
  | [] => rfl
  | X :: l => by
    have e6 : BC6.allThru a (X :: l) = @Bool.rec (fun _ => Bool) false (BC6.allThru a l) (BC6.par (Nat.land a X)) := rfl
    have e5 : BC5.allThru a (X :: l) = (BC5.par (Nat.land a X) && BC5.allThru a l) := rfl
    rw [e6, e5, allThru_eq a l, sel_eq, cond_and, par_eq]

theorem isNil_eq (l : List (Nat × Nat × Nat)) : BC6.isNil l = l.isEmpty := by cases l <;> rfl

/-! ## Rank-1 claims -/

theorem thru1_eq (X : Nat) : ∀ asg : List (Nat × Nat × Nat), BC6.thru1 X asg = BC6s.thru1 X asg
  | [] => rfl
  | e :: l => by
    have e6 : BC6.thru1 X (e :: l) = @Bool.rec (fun _ => Nat × Nat × Nat) (BC6.thru1 X l)
        (@Bool.rec (fun _ => Nat × Nat × Nat) (2, (BC6.thru1 X l).2.1, (BC6.thru1 X l).2.2) (1, e.2.1, e.2.2)
          (Nat.beq (BC6.thru1 X l).1 0)) (BC6.par (Nat.land e.1 X)) := rfl
    have e5 : BC6s.thru1 X (e :: l) = cond (BC5.par (Nat.land e.1 X))
        (cond (Nat.beq (BC6s.thru1 X l).1 0) (1, e.2.1, e.2.2) (2, (BC6s.thru1 X l).2.1, (BC6s.thru1 X l).2.2))
        (BC6s.thru1 X l) := rfl
    rw [e6, e5, thru1_eq X l, sel_eq, sel_eq, par_eq]

/-- one translation step of `trans` -/
def tst6 (v i d K S : Nat) : Nat := @Bool.rec (fun _ => Nat) S (BC6.hsw S d K) (BC6.bit v i)
def tst5 (v i d K S : Nat) : Nat := cond (BC5.bit v i) (BC6s.hsw S d K) S

theorem tst_eq (v i d K S : Nat) : tst6 v i d K S = tst5 v i d K S := by
  unfold tst6 tst5; rw [sel_eq, bit_eq, hsw_eq]

theorem trans6_def (S v : Nat) : BC6.trans S v =
    tst6 v 8 256 BC6.KM8 (tst6 v 7 128 BC6.KM7 (tst6 v 6 64 BC6.KM6 (tst6 v 5 32 BC6.KM5 (tst6 v 4 16 BC6.KM4
      (tst6 v 3 8 BC6.KM3 (tst6 v 2 4 BC6.KM2 (tst6 v 1 2 BC6.KM1 (tst6 v 0 1 BC6.KM0 S)))))))) := rfl
theorem trans5_def (S v : Nat) : BC6s.trans S v =
    tst5 v 8 256 BC6.KM8 (tst5 v 7 128 BC6.KM7 (tst5 v 6 64 BC6.KM6 (tst5 v 5 32 BC6.KM5 (tst5 v 4 16 BC6.KM4
      (tst5 v 3 8 BC6.KM3 (tst5 v 2 4 BC6.KM2 (tst5 v 1 2 BC6.KM1 (tst5 v 0 1 BC6.KM0 S)))))))) := rfl

theorem trans_eq (S v : Nat) : BC6.trans S v = BC6s.trans S v := by
  rw [trans6_def, trans5_def]; simp only [tst_eq]

end R6
