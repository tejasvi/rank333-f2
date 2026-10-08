module
public import R22Port.U_d41d8cd98f00
public import NLP.Rec
public import R7.Main
/-! # NLP.Cands: record lists, mask folds and candidate lists refine the kernel's

Native record lists map to kernel record lists by `Rec.abs`, slack data by `slAbs`; every list function of the node step
(`mkRecs6`, `mkSls6`, `thru`, `app`, `updRecs`, `andLm`, `andRm`, `cmT`, `bmT`, `cmS`, `bmS`, `candsB7`, `candsC`, `allDom`,
`allThru`, `lgMask`) commutes with the abstraction; candidate lists are equal as lists. -/
@[expose] public section
namespace NL
open Nat S5

set_option maxRecDepth 20000

def slAbs (s : Bool × M8 × M8) : Bool × Nat × Nat := (s.1, s.2.1.toNat, s.2.2.toNat)
def RecsWF (rs : List Rec) : Prop := ∀ r ∈ rs, r.P.WF

theorem recsWF_cons {r : Rec} {rs : List Rec} (h : RecsWF (r :: rs)) : r.P.WF ∧ RecsWF rs :=
  ⟨h r List.mem_cons_self, fun r' hr' => h r' (List.mem_cons_of_mem _ hr')⟩

/-! ## Records -/

theorem mkRecs6_rel (S : S9) (SS ACT : Nat) (asg : Asg) (hU : UOK S SS) (ha : AsgOK asg) (tail : List Rec) :
    ∀ nt : List Nat, (∀ X ∈ nt, X < 512) →
      (mkRecs6 S ACT asg nt tail).1 = (BC6s.mkRecs6 SS ACT asg nt (tail.map Rec.abs)).1 ∧
      (mkRecs6 S ACT asg nt tail).2.map Rec.abs = (BC6s.mkRecs6 SS ACT asg nt (tail.map Rec.abs)).2 ∧
      (RecsWF tail → RecsWF (mkRecs6 S ACT asg nt tail).2)
  | [], _ => ⟨rfl, rfl, id⟩
  | X :: Xs, h => by
    obtain ⟨ih1, ih2, ih3⟩ := mkRecs6_rel S SS ACT asg hU ha tail Xs (fun x hx => h x (List.mem_cons_of_mem _ hx))
    obtain ⟨e1, e2, e3⟩ := mkRec6_rel S SS ACT asg X hU (h X List.mem_cons_self) ha
    have k : BC6s.mkRecs6 SS ACT asg (X :: Xs) (tail.map Rec.abs) =
        ((BC6s.mkRec6 SS ACT asg X).1 && (BC6s.mkRecs6 SS ACT asg Xs (tail.map Rec.abs)).1,
         (BC6s.mkRec6 SS ACT asg X).2 :: (BC6s.mkRecs6 SS ACT asg Xs (tail.map Rec.abs)).2) := rfl
    have n : mkRecs6 S ACT asg (X :: Xs) tail =
        ((mkRec6 S ACT asg X).1 && (mkRecs6 S ACT asg Xs tail).1, (mkRec6 S ACT asg X).2 :: (mkRecs6 S ACT asg Xs tail).2) := rfl
    rw [k, n]
    refine ⟨by simp only [e1, ih1], by simp only [List.map_cons, e2, ih2], fun ht r hr => ?_⟩
    rcases List.mem_cons.mp hr with rfl | hr
    · exact e3
    · exact ih3 ht r hr

theorem mkSls6_rel (S : S9) (SS ACT : Nat) (asg : Asg) (hU : UOK S SS) (ha : AsgOK asg) :
    ∀ sl : List Nat, (∀ X ∈ sl, X < 512) →
      (mkSls6 S ACT asg sl).1 = (BC6s.mkSls6 SS ACT asg sl).1 ∧
      (mkSls6 S ACT asg sl).2.map slAbs = (BC6s.mkSls6 SS ACT asg sl).2
  | [], _ => ⟨rfl, rfl⟩
  | X :: Xs, h => by
    obtain ⟨ih1, ih2⟩ := mkSls6_rel S SS ACT asg hU ha Xs (fun x hx => h x (List.mem_cons_of_mem _ hx))
    obtain ⟨e1, e2, e3⟩ := mkSl6_rel S SS ACT asg X hU (h X List.mem_cons_self) ha
    have k : BC6s.mkSls6 SS ACT asg (X :: Xs) =
        ((BC6s.mkSl6 SS ACT asg X).1 && (BC6s.mkSls6 SS ACT asg Xs).1,
         BC6s.mkSl6 SS ACT asg X :: (BC6s.mkSls6 SS ACT asg Xs).2) := rfl
    have n : mkSls6 S ACT asg (X :: Xs) =
        ((mkSl6 S ACT asg X).1 && (mkSls6 S ACT asg Xs).1, mkSl6 S ACT asg X :: (mkSls6 S ACT asg Xs).2) := rfl
    rw [k, n]
    refine ⟨by simp only [e1, ih1], ?_⟩
    simp only [List.map_cons, ih2]
    congr 1
    show (_, _, _) = _
    rw [e2, e3, e1]

theorem thru_map (a : Nat) (ha : a < 512) (tail : List Rec) :
    ∀ rs : List Rec, (thru a rs tail).map Rec.abs = BC5.thru a (rs.map Rec.abs) (tail.map Rec.abs)
  | [] => rfl
  | r :: rs => by
    have k : BC5.thru a ((r :: rs).map Rec.abs) (tail.map Rec.abs) =
        cond (BC5.par (Nat.land r.abs.X a)) (r.abs :: BC5.thru a (rs.map Rec.abs) (tail.map Rec.abs))
          (BC5.thru a (rs.map Rec.abs) (tail.map Rec.abs)) := rfl
    have n : thru a (r :: rs) tail = cond (npar (Nat.land r.X a)) (r :: thru a rs tail) (thru a rs tail) := rfl
    rw [k, n, npar_r _ _ ha]
    show _ = cond (BC5.par (Nat.land r.X a)) _ _
    cases BC5.par (Nat.land r.X a)
    · exact thru_map a ha tail rs
    · simp only [cond_true, List.map_cons, thru_map a ha tail rs]

theorem thru_wf (a : Nat) (tail : List Rec) (ht : RecsWF tail) : ∀ rs, RecsWF rs → RecsWF (thru a rs tail)
  | [], _ => ht
  | r :: rs, h => by
    have n : thru a (r :: rs) tail = cond (npar (Nat.land r.X a)) (r :: thru a rs tail) (thru a rs tail) := rfl
    rw [n]
    have ih := thru_wf a tail ht rs (recsWF_cons h).2
    cases npar (Nat.land r.X a)
    · exact ih
    · intro r' hr'; rcases List.mem_cons.mp hr' with rfl | hr'
      · exact (recsWF_cons h).1
      · exact ih r' hr'

theorem app_map (tail : List Rec) : ∀ rs : List Rec, (app rs tail).map Rec.abs = BC5.app (rs.map Rec.abs) (tail.map Rec.abs)
  | [] => rfl
  | r :: rs => by
    show (r :: app rs tail).map Rec.abs = r.abs :: BC5.app (rs.map Rec.abs) (tail.map Rec.abs)
    rw [List.map_cons, app_map tail rs]

theorem app_wf (tail : List Rec) (ht : RecsWF tail) : ∀ rs, RecsWF rs → RecsWF (app rs tail)
  | [], _ => ht
  | r :: rs, h => fun r' hr' => by
    rcases List.mem_cons.mp hr' with rfl | hr'
    · exact (recsWF_cons h).1
    · exact app_wf tail ht rs (recsWF_cons h).2 r' hr'

theorem updRecs_map (a b c : Nat) (ha : a < 512) (hb : b < 512) (hc : c < 512) :
    ∀ rs : List Rec, RecsWF rs → (updRecs a b c rs).map Rec.abs = BC5.updRecs a b c (rs.map Rec.abs) ∧
      RecsWF (updRecs a b c rs)
  | [], _ => ⟨rfl, fun _ h => absurd h List.not_mem_nil⟩
  | r :: rs, h => by
    obtain ⟨wr, wrs⟩ := recsWF_cons h
    obtain ⟨ih1, ih2⟩ := updRecs_map a b c ha hb hc rs wrs
    have n : updRecs a b c (r :: rs) = cond (npar (Nat.land r.X a))
        (⟨r.X, r.P, r.PM, r.lm.andn (nperpM (gof r.P c)), r.rm.andn (nperpM (xof r.P b))⟩ :: updRecs a b c rs)
        (r :: updRecs a b c rs) := rfl
    have k : BC5.updRecs a b c ((r :: rs).map Rec.abs) = cond (BC5.par (Nat.land r.abs.X a))
        (⟨r.abs.X, r.abs.P, r.abs.PM, Nat.land r.abs.lm (BC5.perp (BC5.gof r.abs.P c)),
          Nat.land r.abs.rm (BC5.perp (BC5.xof r.abs.P b)), r.abs.XL, r.abs.XH, r.abs.GL, r.abs.GH⟩ ::
          BC5.updRecs a b c (rs.map Rec.abs)) (r.abs :: BC5.updRecs a b c (rs.map Rec.abs)) := rfl
    rw [n, k, npar_r _ _ ha]
    show _ = cond (BC5.par (Nat.land r.X a)) _ _ ∧ _
    cases BC5.par (Nat.land r.X a)
    · refine ⟨by simp only [cond_false, List.map_cons, ih1], fun r' hr' => ?_⟩
      rcases List.mem_cons.mp hr' with rfl | hr'
      · exact wr
      · exact ih2 r' hr'
    · refine ⟨?_, fun r' hr' => ?_⟩
      · simp only [cond_true, List.map_cons, ih1]
        congr 1
        show BC5.mkR r.X r.P.toNat r.PM (r.lm.andn (nperpM (gof r.P c))).toNat (r.rm.andn (nperpM (xof r.P b))).toNat = _
        rw [andn_perp _ _ (gof_lt' _ _), andn_perp _ _ (xof_lt' _ _), gof_eq _ wr c hc, xof_eq _ wr b hb]
        rfl
      · rcases List.mem_cons.mp hr' with rfl | hr'
        · exact wr
        · exact ih2 r' hr'

/-! ## Mask folds -/

theorem andLm_eq : ∀ (rs : List Rec) (m : M8), (andLm rs m).toNat = BC5.andLm (rs.map Rec.abs) m.toNat
  | [], _ => rfl
  | r :: rs, m => by
    show (andLm rs (m.and r.lm)).toNat = BC5.andLm (rs.map Rec.abs) (Nat.land m.toNat r.lm.toNat)
    rw [andLm_eq rs, M8.toNat_and]; rfl

theorem andRm_eq : ∀ (rs : List Rec) (m : M8), (andRm rs m).toNat = BC5.andRm (rs.map Rec.abs) m.toNat
  | [], _ => rfl
  | r :: rs, m => by
    show (andRm rs (m.and r.rm)).toNat = BC5.andRm (rs.map Rec.abs) (Nat.land m.toNat r.rm.toNat)
    rw [andRm_eq rs, M8.toNat_and]; rfl

theorem cmT_eq (b : Nat) (hb : b < 512) :
    ∀ (rs : List Rec) (m : M8), RecsWF rs → (cmT b rs m).toNat = BC5.cmT b (rs.map Rec.abs) m.toNat
  | [], _, _ => rfl
  | r :: rs, m, h => by
    show (cmT b rs (m.and (nperpM (xof r.P b)))).toNat =
      BC5.cmT b (rs.map Rec.abs) (Nat.land m.toNat (BC5.nperp (BC5.xof r.P.toNat b)))
    rw [cmT_eq b hb rs _ (recsWF_cons h).2, toNat_andM _ _ (xof_lt' _ _), xof_eq _ (recsWF_cons h).1 b hb]

theorem bmT_eq (c : Nat) (hc : c < 512) :
    ∀ (rs : List Rec) (m : M8), RecsWF rs → (bmT c rs m).toNat = BC5.bmT c (rs.map Rec.abs) m.toNat
  | [], _, _ => rfl
  | r :: rs, m, h => by
    show (bmT c rs (m.and (nperpM (gof r.P c)))).toNat =
      BC5.bmT c (rs.map Rec.abs) (Nat.land m.toNat (BC5.nperp (BC5.gof r.P.toNat c)))
    rw [bmT_eq c hc rs _ (recsWF_cons h).2, toNat_andM _ _ (gof_lt' _ _), gof_eq _ (recsWF_cons h).1 c hc]

theorem cmS_eq (b : Nat) : ∀ (ss : List (Bool × M8 × M8)) (m : M8), (cmS b ss m).toNat = BC5.cmS b (ss.map slAbs) m.toNat
  | [], _ => rfl
  | s :: ss, m => by
    show (cmS b ss (cond (s.2.1.bit b) m (m.and s.2.2))).toNat =
      BC5.cmS b (ss.map slAbs) (cond (BC5.bit s.2.1.toNat b) m.toNat (Nat.land m.toNat s.2.2.toNat))
    rw [cmS_eq b ss, mbit]
    cases BC5.bit s.2.1.toNat b
    · simp only [cond_false]; rw [M8.toNat_and]; rfl
    · rfl

theorem bmS_eq (c : Nat) : ∀ (ss : List (Bool × M8 × M8)) (m : M8), (bmS c ss m).toNat = BC5.bmS c (ss.map slAbs) m.toNat
  | [], _ => rfl
  | s :: ss, m => by
    show (bmS c ss (cond (s.2.2.bit c) m (m.and s.2.1))).toNat =
      BC5.bmS c (ss.map slAbs) (cond (BC5.bit s.2.2.toNat c) m.toNat (Nat.land m.toNat s.2.1.toNat))
    rw [bmS_eq c ss, mbit]
    cases BC5.bit s.2.2.toNat c
    · simp only [cond_false]; rw [M8.toNat_and]; rfl
    · rfl

/-! ## Candidate lists -/

theorem candsB7_eq (sym : Bool) (part : List Rec) (ss : List (Bool × M8 × M8)) (cb : M8) (hp : RecsWF part) :
    ∀ bs : List Nat, (∀ x ∈ bs, x < 512) →
      candsB7 sym part ss cb bs = BC7s.candsB7 sym (part.map Rec.abs) (ss.map slAbs) cb.toNat bs
  | [], _ => rfl
  | b :: bs, h => by
    have hb := h b List.mem_cons_self
    show M8.pLoop true b (candsB7 sym part ss cb bs) 512 (cmS b ss (cmT b part (cond sym (cb.and (corbM b)) cb))) =
      BC5.pairs true b (BC5.cmS b (ss.map slAbs) (BC5.cmT b (part.map Rec.abs)
        (cond sym (Nat.land cb.toNat (BC7T.corbM b)) cb.toNat))) (BC7s.candsB7 sym (part.map Rec.abs) (ss.map slAbs) cb.toNat bs)
    rw [pairs_eq, cmS_eq, cmT_eq b hb _ _ hp, candsB7_eq sym part ss cb hp bs (fun x hx => h x (List.mem_cons_of_mem _ hx))]
    congr 3
    cases sym
    · rfl
    · simp only [cond_true]; rw [M8.toNat_and, corbM_fact b hb]; rfl

theorem candsC_eq (part : List Rec) (ss : List (Bool × M8 × M8)) (bm : M8) (hp : RecsWF part) :
    ∀ cs : List Nat, (∀ x ∈ cs, x < 512) →
      candsC part ss bm cs = BC5.candsC (part.map Rec.abs) (ss.map slAbs) bm.toNat cs
  | [], _ => rfl
  | c :: cs, h => by
    have hc := h c List.mem_cons_self
    show M8.pLoop false c (candsC part ss bm cs) 512 (bmS c ss (bmT c part bm)) =
      BC5.pairs false c (BC5.bmS c (ss.map slAbs) (BC5.bmT c (part.map Rec.abs) bm.toNat))
        (BC5.candsC (part.map Rec.abs) (ss.map slAbs) bm.toNat cs)
    rw [pairs_eq, bmS_eq, bmT_eq c hc _ _ hp, candsC_eq part ss bm hp cs (fun x hx => h x (List.mem_cons_of_mem _ hx))]

theorem bLoop_lt (x : M8) : ∀ y ∈ M8.bLoop 512 x, y < 512 := by
  rw [bitsOf_eq]; exact R6.bitsOf_bnd _ x.toNat_lt

/-! ## Domain and through checks, Lemma G masks -/

theorem allDom_eq (dom : M8) : ∀ l : List Nat, allDom dom l = BC5.allDom dom.toNat l
  | [] => rfl
  | X :: Xs => by
    show (dom.bit X && allDom dom Xs) = (BC5.bit dom.toNat X && BC5.allDom dom.toNat Xs)
    rw [mbit, allDom_eq dom Xs]

theorem allThru_eq (a : Nat) (ha : a < 512) : ∀ l : List Nat, allThru a l = BC5.allThru a l
  | [] => rfl
  | X :: Xs => by
    show (npar (Nat.land a X) && allThru a Xs) = (BC5.par (Nat.land a X) && BC5.allThru a Xs)
    rw [npar_l _ _ ha, allThru_eq a ha Xs]

theorem lgMask_eq (need t : Nat) : (lgMask need t).toNat = BC6s.lgMask need t := by
  unfold lgMask BC6s.lgMask
  exact rge_fact _ (lt_of_le_of_lt Nat.and_le_right (by norm_num))

end NL
