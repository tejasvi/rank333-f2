module
public import R22Port.U_1eb639312b1c
public import NNP.Stat
public import NN.Case
public import L5.T321H
public import L5.Bind5II
public import R22B.NStat
public import R22B.K3eD479L
public import R22B.K3eDL321
/-! # NNP.RefStat: the static premises of the per-item theorems at `NN.statII` / `NN.stat321`

Everything but the table bindings (`NNP.BindII`, `NNP.Bind321`):
* `statII_ok`, `stat321_ok`: `staticsOK` of the R22D constants (kernel evaluation of the size and width checks);
* `hII`, `h321`: the hyperplane tables are the orders' hit vectors (`L5O.hok_of`; one kernel evaluation over the 511 labels);
* `ksII`, `ks321`, `glII`, `gl321`, `npII`, `np321`: the kinds tables and the X tier's masks, through infra's rfl bridges
  `R22B.NStat` (`R22D.R3RT.VECL = R3RT.VECL`, …);
* `rowII`, `row321`: every value of the row interfaces is a valid row (`R22B.R22D_rowEII_eq` + `L5II.rowE_ok`;
  `R22B.R22D_rowE321_eq` + `L5O.rowE_ok`). -/
@[expose] public section
set_option maxHeartbeats 4000000
set_option maxRecDepth 100000
namespace NNP
open NN R3RT.SpecO

theorem getD_shr {a : Array ℕ} {k i : ℕ} (hi : i < a.size) (h : a.getD i 0 >>> k = 0) : a[i] >>> k = 0 := by
  simpa [Array.getD, hi] using h

/-- `staticsOK` from kernel-friendly checks of its parts -/
theorem staticsOK_of {c2tN : Array ℕ} {conf1N : ℕ} {hN sufN : Array ℕ} (h1 : c2tN.size = 511) (h2 : hN.size = 511)
    (h3 : sufN.size = 511) (h4 : S5.allLT 511 (fun l => Nat.beq (c2tN.getD l 0 >>> 262144) 0) = true)
    (h5 : Nat.beq (conf1N >>> 262144) 0 = true) (h6 : S5.allLT 511 (fun l => Nat.beq (hN.getD l 0 >>> 3584) 0) = true)
    (h7 : S5.allLT 511 (fun l => Nat.beq (sufN.getD l 0 >>> 3584) 0) = true) :
    staticsOK c2tN conf1N hN sufN = true := by
  unfold staticsOK
  simp only [Bool.and_eq_true, beq_iff_eq, Array.all_eq_true]
  refine ⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, fun i hi => ?_⟩, Nat.eq_of_beq_eq_true h5⟩, fun i hi => ?_⟩, fun i hi => ?_⟩
  · exact getD_shr hi (Nat.eq_of_beq_eq_true (S5.allLT_spec h4 i (by omega)))
  · exact getD_shr hi (Nat.eq_of_beq_eq_true (S5.allLT_spec h6 i (by omega)))
  · exact getD_shr hi (Nat.eq_of_beq_eq_true (S5.allLT_spec h7 i (by omega)))

/-! ## Case (II) -/

theorem statII_ok : staticsOK R22D.c2tN NN.CONF1II R22D.hN R22D.sufN = true :=
  staticsOK_of (by decide +kernel) (by decide +kernel) (by decide +kernel) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) (by decide +kernel)

theorem hII_all : S5.allLT 511 (fun l => Nat.beq (R22D.hN.getD l 0) (L5O.hitV (R3RT.vecL l))) = true := by decide +kernel

theorem vecII (l : ℕ) (hl : l < 511) : (vecOf R22D.R3RT.VECL).getD l 0 = LO123.vec l := by
  rw [R22B.R22D_R3RT_VECL_eq]; exact vecOf_123 l hl

theorem rk3_ok (X : ℕ) (hX : X < 512) : ((rk3Of R22D.RootCheck.RKT).get! X).toNat = 3 * RootSound.rkOf X := by
  rw [R22B.R22D_RootCheck_RKT_eq]; exact rk3Of_get X hX

theorem gl_ok (P : ℕ) (hP : P < 512) (h : (glOf R22D.C3.GLM).get! P = 1) : C3.isGL P = true := by
  rw [R22B.R22D_C3_GLM_eq] at h; exact glOf_spec P hP h

theorem szII : NN.statII.st.c2t.size = 511 := mkIStat_size _ _ _ _ _ _ _ statII_ok

theorem c2WII : NN.statII.c2W = XT.prepC2 NN.statII.st.c2t := rfl

theorem npII : KD.NpOK LO123 (XTP.npV NN.statII.npW) := mkIStat_np _ _ _ _ _ _ _ vecII

theorem ksII : KStatOK LO123 NN.statII.ks := mkIStat_ks _ _ _ _ _ _ _ vecII rk3_ok

theorem glII (P : ℕ) (hP : P < 512) (h : NN.statII.ks.gl.get! P = 1) : C3.isGL P = true := gl_ok P hP h

theorem c1II : natL NN.statII.st.conf1 0 4096 = NN.CONF1II := mkIStat_c1 _ _ _ _ _ _ _ statII_ok

theorem c2II (l : ℕ) (hl : l < 511) : c2tV NN.statII.st l = R22D.c2tN.getD l 0 := mkIStat_c2 _ _ _ _ _ _ _ statII_ok l hl

theorem hII (l : ℕ) (hl : l < 511) : HOK LO123 l (hV NN.statII.st l) := by
  rw [show hV NN.statII.st l = R22D.hN.getD l 0 from mkIStat_h _ _ _ _ _ _ _ statII_ok l hl]
  exact L5O.hok_of LO123 l _ (Nat.eq_of_beq_eq_true (S5.allLT_spec hII_all l hl))

/-- the rows of `R22D.rowEII` in case (II), for class bounds `lb` with class 479 at 21 and the others at `cLB` -/
theorem rowII (lb : ℕ → ℕ) (h479 : lb 479 = 21) (hother : ∀ c, c ≠ 479 → lb c = RT.cLB RT.K3eD_Cls.CL c)
    (hcls : ClassFactsC (CaseK 14 22) lb) (i : ℕ) :
    RowOK LO123 (CaseK 14 22) (R22D.rowEII i % 2 ^ 511) ((R22D.rowEII i >>> 511) % 512) := by
  rw [R22B.R22D_rowEII_eq]
  exact (L5II.rowE_ok L5W.is123_LO123 (RT.Om.caseK_rankInv 14 22)
    (RT.Om.hcls_of_classFactsC _ lb (L5W.hlb_479 lb h479 hother) hcls) (L5II.h479_of _ lb h479 hcls) i).2

/-! ## Cases (I) / (I13) -/

theorem stat321_ok : staticsOK R22D.T321.c2tN R22D.T321.CONF1T R22D.T321.hN R22D.T321.sufN = true :=
  staticsOK_of (by decide +kernel) (by decide +kernel) (by decide +kernel) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) (by decide +kernel)

theorem h321_all : S5.allLT 511 (fun l => Nat.beq (R22D.T321.hN.getD l 0) (L5O.hitV (RT.O321.vecL l))) = true := by
  decide +kernel

theorem vec321 (l : ℕ) (hl : l < 511) : (vecOf R22D.RT.O321.VECL).getD l 0 = Top321.O.vec l := by
  rw [R22B.R22D_RT_O321_VECL_eq]; exact vecOf_321 l hl

theorem sz321 : NN.stat321.st.c2t.size = 511 := mkIStat_size _ _ _ _ _ _ _ stat321_ok

theorem c2W321 : NN.stat321.c2W = XT.prepC2 NN.stat321.st.c2t := rfl

theorem np321 : KD.NpOK Top321.O (XTP.npV NN.stat321.npW) := mkIStat_np _ _ _ _ _ _ _ vec321

theorem ks321 : KStatOK Top321.O NN.stat321.ks := mkIStat_ks _ _ _ _ _ _ _ vec321 rk3_ok

theorem gl321 (P : ℕ) (hP : P < 512) (h : NN.stat321.ks.gl.get! P = 1) : C3.isGL P = true := gl_ok P hP h

theorem c1321 : natL NN.stat321.st.conf1 0 4096 = R22D.T321.CONF1T := mkIStat_c1 _ _ _ _ _ _ _ stat321_ok

theorem c2321 (l : ℕ) (hl : l < 511) : c2tV NN.stat321.st l = R22D.T321.c2tN.getD l 0 :=
  mkIStat_c2 _ _ _ _ _ _ _ stat321_ok l hl

theorem h321 (l : ℕ) (hl : l < 511) : HOK Top321.O l (hV NN.stat321.st l) := by
  rw [show hV NN.stat321.st l = R22D.T321.hN.getD l 0 from mkIStat_h _ _ _ _ _ _ _ stat321_ok l hl]
  exact L5O.hok_of Top321.O l _ (Nat.eq_of_beq_eq_true (S5.allLT_spec h321_all l hl))

/-- the rows of `R22D.rowE321` under revision 5's class facts -/
theorem row321 (hcls : R3RT.Spec.ClassFacts) (i : ℕ) :
    RowOK Top321.O ΩT (R22D.rowE321 i % 2 ^ 511) ((R22D.rowE321 i >>> 511) % 512) := by
  rw [R22B.R22D_rowE321_eq]
  exact (L5O.rowE_ok (L5O.is321 _) (L5O.classFactsN_of hcls) i).2

end NNP
