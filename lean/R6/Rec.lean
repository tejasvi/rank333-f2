module
public import R22Port.U_d41d8cd98f00
public import R6.Rank1
/-! # v6 ⇒ v6s refinement, part 4: records, claims, candidate lists

`RR r s`: a v6 record and a v5 record agree on `X`, `P`, `lm`, `rm`, and v6's tables are `xtab P`, `gtab P`.  Lists of
records are related by `List.Forall₂ RR`; every list operation of the checkers preserves it, and the claims
(`mkRec`/`mkRec6`, `mkSl`/`mkSl6`, `overOk`/`over6`) agree.  Candidate lists are equal: v6's fused loop over the bits of a
mask is v5's loop over `bitsOf` of it, for masks below `2^512` (then every `b`, `c` is below 512 and the tables apply). -/
@[expose] public section
namespace R6
open BC4

universe u

theorem brecT {α : Sort u} (a b : α) : @Bool.rec (fun _ => α) b a true = a := id rfl
theorem brecF {α : Sort u} (a b : α) : @Bool.rec (fun _ => α) b a false = b := id rfl
theorem beq00 : Nat.beq 0 0 = true := id rfl
theorem beq01 : Nat.beq 0 1 = false := id rfl
theorem beq10 : Nat.beq 1 0 = false := id rfl
theorem beq11 : Nat.beq 1 1 = true := id rfl
theorem beq20 : Nat.beq 2 0 = false := id rfl
theorem beq21 : Nat.beq 2 1 = false := id rfl

/-! ## The record relation -/

structure RR (r : BC6.Rec) (s : BC5.Rec) : Prop where
  X : r.X = s.X
  P : r.P = s.P
  lm : r.lm = s.lm
  rm : r.rm = s.rm
  XT : r.XT = BC6.xtab r.P
  GT : r.GT = BC6.gtab r.P

theorem mkR_rel (X P PM lm rm : Nat) : RR (BC6.mkR X P lm rm) (BC5.mkR X P PM lm rm) := ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩

theorem thru_rel (a : Nat) {t6 : List BC6.Rec} {t5 : List BC5.Rec} (ht : List.Forall₂ RR t6 t5) :
    ∀ {l6 : List BC6.Rec} {l5 : List BC5.Rec}, List.Forall₂ RR l6 l5 →
      List.Forall₂ RR (BC6.thru a l6 t6) (BC5.thru a l5 t5)
  | _, _, .nil => ht
  | r :: l6, s :: l5, .cons hrs h => by
    have e6 : BC6.thru a (r :: l6) t6 = @Bool.rec (fun _ => List BC6.Rec) (BC6.thru a l6 t6) (r :: BC6.thru a l6 t6)
        (BC6.par (Nat.land r.X a)) := rfl
    have e5 : BC5.thru a (s :: l5) t5 = cond (BC5.par (Nat.land s.X a)) (s :: BC5.thru a l5 t5) (BC5.thru a l5 t5) := rfl
    rw [e6, e5, sel_eq, par_eq, hrs.X]
    cases BC5.par (Nat.land s.X a)
    · rw [condF, condF]; exact thru_rel a ht h
    · rw [condT, condT]; exact List.Forall₂.cons hrs (thru_rel a ht h)

theorem app_rel {t6 : List BC6.Rec} {t5 : List BC5.Rec} (ht : List.Forall₂ RR t6 t5) :
    ∀ {l6 : List BC6.Rec} {l5 : List BC5.Rec}, List.Forall₂ RR l6 l5 → List.Forall₂ RR (BC6.app l6 t6) (BC5.app l5 t5)
  | _, _, .nil => ht
  | r :: l6, s :: l5, .cons hrs h => by
    have e6 : BC6.app (r :: l6) t6 = r :: BC6.app l6 t6 := rfl
    have e5 : BC5.app (s :: l5) t5 = s :: BC5.app l5 t5 := rfl
    rw [e6, e5]; exact List.Forall₂.cons hrs (app_rel ht h)

theorem andLm_eq : ∀ {l6 : List BC6.Rec} {l5 : List BC5.Rec}, List.Forall₂ RR l6 l5 →
    ∀ m, BC6.andLm l6 m = BC5.andLm l5 m
  | _, _, .nil => fun _ => rfl
  | r :: l6, s :: l5, .cons hrs h => fun m => by
    have e6 : BC6.andLm (r :: l6) m = BC6.andLm l6 (Nat.land m r.lm) := rfl
    have e5 : BC5.andLm (s :: l5) m = BC5.andLm l5 (Nat.land m s.lm) := rfl
    rw [e6, e5, hrs.lm, andLm_eq h]

theorem andRm_eq : ∀ {l6 : List BC6.Rec} {l5 : List BC5.Rec}, List.Forall₂ RR l6 l5 →
    ∀ m, BC6.andRm l6 m = BC5.andRm l5 m
  | _, _, .nil => fun _ => rfl
  | r :: l6, s :: l5, .cons hrs h => fun m => by
    have e6 : BC6.andRm (r :: l6) m = BC6.andRm l6 (Nat.land m r.rm) := rfl
    have e5 : BC5.andRm (s :: l5) m = BC5.andRm l5 (Nat.land m s.rm) := rfl
    rw [e6, e5, hrs.rm, andRm_eq h]

theorem cmT_eq (b : Nat) (hb : b < 512) : ∀ {l6 : List BC6.Rec} {l5 : List BC5.Rec}, List.Forall₂ RR l6 l5 →
    ∀ m, BC6.cmT b l6 m = BC5.cmT b l5 m
  | _, _, .nil => fun _ => rfl
  | r :: l6, s :: l5, .cons hrs h => fun m => by
    have e6 : BC6.cmT b (r :: l6) m = BC6.cmT b l6 (Nat.land m (BC6.nperp (BC6.tb r.XT b))) := rfl
    have e5 : BC5.cmT b (s :: l5) m = BC5.cmT b l5 (Nat.land m (BC5.nperp (BC5.xof s.P b))) := rfl
    rw [e6, e5, hrs.XT, tb_xtab _ _ hb, hrs.P, nperp_eq, cmT_eq b hb h]

theorem bmT_eq (c : Nat) (hc : c < 512) : ∀ {l6 : List BC6.Rec} {l5 : List BC5.Rec}, List.Forall₂ RR l6 l5 →
    ∀ m, BC6.bmT c l6 m = BC5.bmT c l5 m
  | _, _, .nil => fun _ => rfl
  | r :: l6, s :: l5, .cons hrs h => fun m => by
    have e6 : BC6.bmT c (r :: l6) m = BC6.bmT c l6 (Nat.land m (BC6.nperp (BC6.tb r.GT c))) := rfl
    have e5 : BC5.bmT c (s :: l5) m = BC5.bmT c l5 (Nat.land m (BC5.nperp (BC5.gof s.P c))) := rfl
    rw [e6, e5, hrs.GT, tb_gtab _ _ hc, hrs.P, nperp_eq, bmT_eq c hc h]

theorem updRecs_rel (a b c : Nat) (hb : b < 512) (hc : c < 512) : ∀ {l6 : List BC6.Rec} {l5 : List BC5.Rec},
    List.Forall₂ RR l6 l5 → List.Forall₂ RR (BC6.updRecs a b c l6) (BC5.updRecs a b c l5)
  | _, _, .nil => .nil
  | r :: l6, s :: l5, .cons hrs h => by
    have e6 : BC6.updRecs a b c (r :: l6) = @Bool.rec (fun _ => List BC6.Rec) (r :: BC6.updRecs a b c l6)
        (⟨r.X, r.P, Nat.land r.lm (BC6.perp (BC6.tb r.GT c)), Nat.land r.rm (BC6.perp (BC6.tb r.XT b)), r.XT, r.GT⟩ ::
          BC6.updRecs a b c l6) (BC6.par (Nat.land r.X a)) := rfl
    have e5 : BC5.updRecs a b c (s :: l5) = cond (BC5.par (Nat.land s.X a))
        (⟨s.X, s.P, s.PM, Nat.land s.lm (BC5.perp (BC5.gof s.P c)), Nat.land s.rm (BC5.perp (BC5.xof s.P b)), s.XL, s.XH,
          s.GL, s.GH⟩ :: BC5.updRecs a b c l5) (s :: BC5.updRecs a b c l5) := rfl
    rw [e6, e5, sel_eq, par_eq, hrs.X]
    cases BC5.par (Nat.land s.X a)
    · rw [condF, condF]; exact List.Forall₂.cons hrs (updRecs_rel a b c hb hc h)
    · rw [condT, condT]
      refine List.Forall₂.cons ⟨rfl, hrs.P, ?_, ?_, hrs.XT, hrs.GT⟩ (updRecs_rel a b c hb hc h)
      · show Nat.land r.lm (BC6.perp (BC6.tb r.GT c)) = Nat.land s.lm (BC5.perp (BC5.gof s.P c))
        rw [hrs.lm, hrs.GT, tb_gtab _ _ hc, hrs.P, perp_eq]
      · show Nat.land r.rm (BC6.perp (BC6.tb r.XT b)) = Nat.land s.rm (BC5.perp (BC5.xof s.P b))
        rw [hrs.rm, hrs.XT, tb_xtab _ _ hb, hrs.P, perp_eq]

theorem cmS_eq (b : Nat) : ∀ (l : List (Bool × Nat × Nat)) (m : Nat), BC6.cmS b l m = BC5.cmS b l m
  | [], _ => rfl
  | sd :: l, m => by
    have e6 : BC6.cmS b (sd :: l) m = BC6.cmS b l (@Bool.rec (fun _ => Nat) (Nat.land m sd.2.2) m (BC6.bit sd.2.1 b)) := rfl
    have e5 : BC5.cmS b (sd :: l) m = BC5.cmS b l (cond (BC5.bit sd.2.1 b) m (Nat.land m sd.2.2)) := rfl
    rw [e6, e5, sel_eq, bit_eq, cmS_eq b l]

theorem bmS_eq (c : Nat) : ∀ (l : List (Bool × Nat × Nat)) (m : Nat), BC6.bmS c l m = BC5.bmS c l m
  | [], _ => rfl
  | sd :: l, m => by
    have e6 : BC6.bmS c (sd :: l) m = BC6.bmS c l (@Bool.rec (fun _ => Nat) (Nat.land m sd.2.1) m (BC6.bit sd.2.2 c)) := rfl
    have e5 : BC5.bmS c (sd :: l) m = BC5.bmS c l (cond (BC5.bit sd.2.2 c) m (Nat.land m sd.2.1)) := rfl
    rw [e6, e5, sel_eq, bit_eq, bmS_eq c l]

/-! ## Candidate lists -/

/-- the loop of `BC6.pairsB` -/
noncomputable def pB6 (b : Nat) (tail : List (Nat × Nat)) (n : Nat) : Nat → List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => tail)
    (fun _ ih m => @Bool.rec (fun _ => List (Nat × Nat))
      ((b, BC6.lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) :: ih (Nat.land m (Nat.sub m 1))) tail (Nat.beq m 0)) n
/-- the loop of `BC6.pairsC` -/
noncomputable def pC6 (c : Nat) (tail : List (Nat × Nat)) (n : Nat) : Nat → List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => tail)
    (fun _ ih m => @Bool.rec (fun _ => List (Nat × Nat))
      ((BC6.lg2 (Nat.xor m (Nat.land m (Nat.sub m 1))), c) :: ih (Nat.land m (Nat.sub m 1))) tail (Nat.beq m 0)) n

theorem pL5_succ (bf : Bool) (c : Nat) (tail : List (Nat × Nat)) (k m : Nat) : S5.pLoop bf c tail (k + 1) m =
    cond (Nat.beq m 0) tail (cond bf (c, BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))))
      (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))), c) :: S5.pLoop bf c tail k (Nat.land m (Nat.pred m))) := rfl

theorem pB_eq (b : Nat) (tail : List (Nat × Nat)) : ∀ n m, pB6 b tail n m = S5.pLoop true b tail n m := by
  intro n
  induction n with
  | zero => intro m; rfl
  | succ k ih =>
    intro m
    have e6 : pB6 b tail (k + 1) m = @Bool.rec (fun _ => List (Nat × Nat))
        ((b, BC6.lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) :: pB6 b tail k (Nat.land m (Nat.sub m 1))) tail
        (Nat.beq m 0) := rfl
    rw [e6, pL5_succ, sel_eq, condT, sub1_eq, lg2_eq, ih]

theorem pC_eq (c : Nat) (tail : List (Nat × Nat)) : ∀ n m, pC6 c tail n m = S5.pLoop false c tail n m := by
  intro n
  induction n with
  | zero => intro m; rfl
  | succ k ih =>
    intro m
    have e6 : pC6 c tail (k + 1) m = @Bool.rec (fun _ => List (Nat × Nat))
        ((BC6.lg2 (Nat.xor m (Nat.land m (Nat.sub m 1))), c) :: pC6 c tail k (Nat.land m (Nat.sub m 1))) tail
        (Nat.beq m 0) := rfl
    rw [e6, pL5_succ, sel_eq, condF, sub1_eq, lg2_eq, ih]

theorem pairsB_eq (b m : Nat) (tail : List (Nat × Nat)) : BC6.pairsB b m tail = BC5.pairs true b m tail :=
  pB_eq b tail 512 m
theorem pairsC_eq (c m : Nat) (tail : List (Nat × Nat)) : BC6.pairsC c m tail = BC5.pairs false c m tail :=
  pC_eq c tail 512 m

/-- the lowest set bit of a nonzero mask below `2^512` is below 512 -/
theorem lowbit_lt (m : Nat) (hm0 : m ≠ 0) (hm : m < 2 ^ 512) : BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))) < 512 := by
  obtain ⟨k, hk, hkl⟩ := S5.exists_low_bit hm0
  obtain ⟨_, hxor⟩ := S5.lowbit_spec hk hkl
  have hk512 : k < 512 := by
    by_contra h
    have := Nat.testBit_lt_two_pow (lt_of_lt_of_le hm (Nat.pow_le_pow_right (by norm_num) (by omega : 512 ≤ k)))
    rw [hk] at this; exact absurd this (by decide)
  have e : Nat.xor m (Nat.land m (Nat.pred m)) = m ^^^ (m &&& (m - 1)) := by
    rw [Nat.xor_eq, Nat.land_eq, Nat.pred_eq_sub_one]
  rw [e, hxor, S5.lg2_pow k hk512]; exact hk512

theorem land_pred_lt (m : Nat) (hm : m < 2 ^ 512) : Nat.land m (Nat.pred m) < 2 ^ 512 := by
  rw [Nat.land_eq]; exact lt_of_le_of_lt Nat.and_le_left hm

theorem bL5_succ (k m : Nat) : S5.bLoop (k + 1) m =
    cond (Nat.beq m 0) [] (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))) :: S5.bLoop k (Nat.land m (Nat.pred m))) := rfl

/-- the loop of `BC6.candsB` -/
noncomputable def cB6 (part : List BC6.Rec) (ss : List (Bool × Nat × Nat)) (cb n : Nat) : Nat → List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => [])
    (fun _ ih m => @Bool.rec (fun _ => List (Nat × Nat))
      (BC6.candB1 part ss cb (BC6.lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) (ih (Nat.land m (Nat.sub m 1)))) []
      (Nat.beq m 0)) n
/-- the loop of `BC6.candsC` -/
noncomputable def cC6 (part : List BC6.Rec) (ss : List (Bool × Nat × Nat)) (bm n : Nat) : Nat → List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => [])
    (fun _ ih m => @Bool.rec (fun _ => List (Nat × Nat))
      (BC6.candC1 part ss bm (BC6.lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) (ih (Nat.land m (Nat.sub m 1)))) []
      (Nat.beq m 0)) n

theorem cB_eq {part6 : List BC6.Rec} {part5 : List BC5.Rec} (h : List.Forall₂ RR part6 part5)
    (ss : List (Bool × Nat × Nat)) (cb : Nat) :
    ∀ n m, m < 2 ^ 512 → cB6 part6 ss cb n m = BC5.candsB part5 ss cb (S5.bLoop n m) := by
  intro n
  induction n with
  | zero => intro m _; rfl
  | succ k ih =>
    intro m hm
    have e6 : cB6 part6 ss cb (k + 1) m = @Bool.rec (fun _ => List (Nat × Nat))
        (BC6.candB1 part6 ss cb (BC6.lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) (cB6 part6 ss cb k (Nat.land m (Nat.sub m 1))))
        [] (Nat.beq m 0) := rfl
    rw [e6, bL5_succ, sel_eq, sub1_eq, lg2_eq]
    cases h0 : Nat.beq m 0
    · rw [condF, condF]
      have hm0 : m ≠ 0 := by intro e; rw [e] at h0; exact absurd h0 (by decide)
      have hb := lowbit_lt m hm0 hm
      have e1 : BC6.candB1 part6 ss cb (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))))
          (cB6 part6 ss cb k (Nat.land m (Nat.pred m))) =
          BC6.pairsB (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))))
            (BC6.cmS (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) ss
              (BC6.cmT (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) part6 cb))
            (cB6 part6 ss cb k (Nat.land m (Nat.pred m))) := rfl
      have e2 : BC5.candsB part5 ss cb (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))) :: S5.bLoop k (Nat.land m (Nat.pred m))) =
          BC5.pairs true (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))))
            (BC5.cmS (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) ss
              (BC5.cmT (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) part5 cb))
            (BC5.candsB part5 ss cb (S5.bLoop k (Nat.land m (Nat.pred m)))) := rfl
      rw [e1, e2, cmT_eq _ hb h, cmS_eq, pairsB_eq, ih _ (land_pred_lt m hm)]
    · rw [condT, condT]; rfl

theorem cC_eq {part6 : List BC6.Rec} {part5 : List BC5.Rec} (h : List.Forall₂ RR part6 part5)
    (ss : List (Bool × Nat × Nat)) (bm : Nat) :
    ∀ n m, m < 2 ^ 512 → cC6 part6 ss bm n m = BC5.candsC part5 ss bm (S5.bLoop n m) := by
  intro n
  induction n with
  | zero => intro m _; rfl
  | succ k ih =>
    intro m hm
    have e6 : cC6 part6 ss bm (k + 1) m = @Bool.rec (fun _ => List (Nat × Nat))
        (BC6.candC1 part6 ss bm (BC6.lg2 (Nat.xor m (Nat.land m (Nat.sub m 1)))) (cC6 part6 ss bm k (Nat.land m (Nat.sub m 1))))
        [] (Nat.beq m 0) := rfl
    rw [e6, bL5_succ, sel_eq, sub1_eq, lg2_eq]
    cases h0 : Nat.beq m 0
    · rw [condF, condF]
      have hm0 : m ≠ 0 := by intro e; rw [e] at h0; exact absurd h0 (by decide)
      have hc := lowbit_lt m hm0 hm
      have e1 : BC6.candC1 part6 ss bm (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))))
          (cC6 part6 ss bm k (Nat.land m (Nat.pred m))) =
          BC6.pairsC (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))))
            (BC6.bmS (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) ss
              (BC6.bmT (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) part6 bm))
            (cC6 part6 ss bm k (Nat.land m (Nat.pred m))) := rfl
      have e2 : BC5.candsC part5 ss bm (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))) :: S5.bLoop k (Nat.land m (Nat.pred m))) =
          BC5.pairs false (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m))))
            (BC5.bmS (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) ss
              (BC5.bmT (BC5.lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) part5 bm))
            (BC5.candsC part5 ss bm (S5.bLoop k (Nat.land m (Nat.pred m)))) := rfl
      rw [e1, e2, bmT_eq _ hc h, bmS_eq, pairsC_eq, ih _ (land_pred_lt m hm)]
    · rw [condT, condT]; rfl

theorem candsB_eq {part6 : List BC6.Rec} {part5 : List BC5.Rec} (h : List.Forall₂ RR part6 part5)
    (ss : List (Bool × Nat × Nat)) (cb B : Nat) (hB : B < 2 ^ 512) :
    BC6.candsB part6 ss cb B = BC5.candsB part5 ss cb (BC5.bitsOf B) := cB_eq h ss cb 512 B hB

theorem candsC_eq {part6 : List BC6.Rec} {part5 : List BC5.Rec} (h : List.Forall₂ RR part6 part5)
    (ss : List (Bool × Nat × Nat)) (bm C : Nat) (hC : C < 2 ^ 512) :
    BC6.candsC part6 ss bm C = BC5.candsC part5 ss bm (BC5.bitsOf C) := cC_eq h ss bm 512 C hC

/-! ## Candidate bounds (every `b`, `c` below 512, so the children's tables apply) -/

def Bnd (l : List (Nat × Nat)) : Prop := ∀ p ∈ l, p.1 < 512 ∧ p.2 < 512

theorem pLoop_bnd (bf : Bool) (c : Nat) (hc : c < 512) (tail : List (Nat × Nat)) (ht : Bnd tail) :
    ∀ n m, m < 2 ^ 512 → Bnd (S5.pLoop bf c tail n m) := by
  intro n
  induction n with
  | zero => intro m _; exact ht
  | succ k ih =>
    intro m hm
    rw [pL5_succ]
    cases h0 : Nat.beq m 0
    · rw [condF]
      have hm0 : m ≠ 0 := by intro e; rw [e] at h0; exact absurd h0 (by decide)
      have hb := lowbit_lt m hm0 hm
      intro p hp
      rcases List.mem_cons.mp hp with e | hp'
      · subst e; cases bf
        · rw [condF]; exact ⟨hb, hc⟩
        · rw [condT]; exact ⟨hc, hb⟩
      · exact ih _ (land_pred_lt m hm) p hp'
    · rw [condT]; exact ht

theorem bLoop_bnd : ∀ n m, m < 2 ^ 512 → ∀ x ∈ S5.bLoop n m, x < 512 := by
  intro n
  induction n with
  | zero => intro m _ x hx; exact absurd hx List.not_mem_nil
  | succ k ih =>
    intro m hm x hx
    rw [bL5_succ] at hx
    cases h0 : Nat.beq m 0
    · rw [h0, condF] at hx
      have hm0 : m ≠ 0 := by intro e; rw [e] at h0; exact absurd h0 (by decide)
      rcases List.mem_cons.mp hx with e | hx'
      · rw [e]; exact lowbit_lt m hm0 hm
      · exact ih _ (land_pred_lt m hm) x hx'
    · rw [h0, condT] at hx; exact absurd hx List.not_mem_nil

theorem candsB_bnd (part : List BC5.Rec) (ss : List (Bool × Nat × Nat)) (cb : Nat) (hcb : cb < 2 ^ 512) :
    ∀ bs : List Nat, (∀ x ∈ bs, x < 512) → Bnd (BC5.candsB part ss cb bs)
  | [], _ => fun _ hp => absurd hp List.not_mem_nil
  | b :: bs, hbs => by
    have e : BC5.candsB part ss cb (b :: bs) = BC5.pairs true b (BC5.cmS b ss (BC5.cmT b part cb)) (BC5.candsB part ss cb bs) := rfl
    rw [e]
    exact pLoop_bnd true b (hbs b List.mem_cons_self) _ (candsB_bnd part ss cb hcb bs (fun x hx => hbs x (List.mem_cons_of_mem _ hx)))
      512 _ (lt_of_le_of_lt (le_trans (S5.cmS_le _ _ _) (S5.cmT_le _ _ _)) hcb)

theorem candsC_bnd (part : List BC5.Rec) (ss : List (Bool × Nat × Nat)) (bm : Nat) (hbm : bm < 2 ^ 512) :
    ∀ cs : List Nat, (∀ x ∈ cs, x < 512) → Bnd (BC5.candsC part ss bm cs)
  | [], _ => fun _ hp => absurd hp List.not_mem_nil
  | c :: cs, hcs => by
    have e : BC5.candsC part ss bm (c :: cs) = BC5.pairs false c (BC5.bmS c ss (BC5.bmT c part bm)) (BC5.candsC part ss bm cs) := rfl
    rw [e]
    exact pLoop_bnd false c (hcs c List.mem_cons_self) _ (candsC_bnd part ss bm hbm cs (fun x hx => hcs x (List.mem_cons_of_mem _ hx)))
      512 _ (lt_of_le_of_lt (le_trans (S5.bmS_le _ _ _) (S5.bmT_le _ _ _)) hbm)

end R6
