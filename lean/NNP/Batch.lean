module
public import R22Port.U_b137c0030f76
public import NNP.Node
public import NNP.Statics
public import NNP.Tab
public import NN.Batch
/-! # NNP.Batch: the native batch loop gives `KD.batchX_sound`'s conclusion for the decoded values

`checkNodes_sound`: for the views of the decoded stack and nodes (`frameV`, `nodeV`), an accepted `NN.checkNodes` gives
`KD.BatchOKX` (every node's T/C kills, every bulk-peel child dead, every child frame valid), under the hypotheses of
`KD.batchX_sound` (valid input frames, the static facts per node) with `TabOK` of the table's view and `TabWF`.

The X tier enters through `xc` and its views `XViews`; the one hypothesis `hX` says that an accepted `xc` gives `KD.xpartC = true`
on the views, with the dictionary `dictRowV tab ids` (= `rowV (mkDict tab ids)`, `rowV_mkDict`). This is revision 5 (`LO123`,
`ΩT`); `nodeStep_sound` itself is proved for every order and universe. -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN Classical

/-- the X tier's views of its decoded record -/
structure XViews (α : Type) where
  nrows : α → List ℕ
  aggs : (ℕ → ℕ) → α → List KD.Agg
  XL : α → List ℕ
  HP : α → ℕ
  DEFP : α → ℕ
  J : α → ℕ
  kids : α → List KD.KidX

/-- a decoded node as `KD.batchX` sees it -/
def nodeV {α : Type} (st : Statics) (tab : Tab) (xv : XViews α) (n : NodeRec × α) : KD.NodeX :=
  (c2tV st n.1.lab, hV st n.1.lab, sufV st n.1.lab, n.1.hdr, n.1.r2.toList, n.1.r1.toList, n.1.r0.toList, n.1.x2.toList,
    n.1.x1.toList, n.1.ks.toList.map killV, xv.nrows n.2, xv.aggs (dictRowV tab (dictIds n.1)) n.2, xv.XL n.2, xv.HP n.2,
    xv.DEFP n.2, xv.J n.2, xv.kids n.2)

theorem dictSem_LO {Ω : R3RT.Spec.Dec22 → Prop} (S last : ℕ) (mk rp : ℕ → ℕ) :
    DictSemXO R3RT.SpecO.LO123 Ω S last mk rp ↔ KD.DictSemX Ω S last mk rp := Iff.rfl

/-- **the native batch loop's soundness** (over any universe `Ω`, label order `--rord 123`) -/
theorem checkNodes_sound {α : Type} {Ω : R3RT.Spec.Dec22 → Prop} (st : Statics) (tab : Tab) (hT : KD.TabOKU Ω (tabV tab))
    (hW : TabWF tab) (xv : XViews α) (xc : ℕ → StepOut → α → Bool)
    (hX : ∀ last out x, xc last out x = true →
      KD.xpartC R3RT.nperpL (natL out.fr.S 0 8) (natL out.fr.D 0 8) (natL out.fr.N 0 4096) (natU out.fr.U) out.fr.d last out.b1
        out.m out.e1 (dictRowV tab out.ids) (xv.nrows x) (xv.aggs (dictRowV tab out.ids) x) (xv.XL x) (xv.HP x)
        (xv.DEFP x) (xv.J x) (xv.kids x) = true)
    (hstat : ∀ l < 511, KD.C2OKU Ω l (c2tV st l) ∧ R3RT.SpecO.HOK R3RT.SpecO.LO123 l (hV st l))
    (hxv : ∀ mk x, (∀ ag ∈ xv.aggs mk x, KD.C2OKU Ω ag.1 ag.2.1) ∧ (∀ c ∈ xv.kids x, KD.KidXOK Ω c)) :
    ∀ (nodes : List (NodeRec × α)) (stk : List Frame),
      (∀ f ∈ stk, KD.FrameOKU Ω (natL f.S 0 8) (natL f.D 0 8) (natL f.N 0 4096) (natU f.U) f.d) →
      checkNodes st tab xc stk nodes = true →
      KD.BatchOKX Ω (stk.map frameV) (nodes.map (nodeV st tab xv)) := by
  intro nodes
  induction nodes with
  | nil => intro stk _ _; simp [KD.BatchOKX]
  | cons n rest ih =>
    intro stk hstk hc
    obtain ⟨nd, x⟩ := n
    simp only [checkNodes] at hc
    show KD.BatchOKX Ω (stk.map frameV) (nodeV st tab xv (nd, x) :: rest.map (nodeV st tab xv))
    simp only [nodeV, KD.BatchOKX]
    rw [← List.map_drop]
    rcases hd : stk.drop (nd.hdr % 256) with _ | ⟨fr, stk'⟩
    · rw [hd] at hc; exact absurd hc (by simp)
    rw [hd] at hc
    dsimp only at hc
    simp only [List.map_cons]
    rcases hs : nodeStep st tab fr nd with _ | out
    · rw [hs] at hc; exact absurd hc (by simp)
    rw [hs] at hc
    simp only [Bool.and_eq_true] at hc
    obtain ⟨hxc, hrest⟩ := hc
    -- the node's facts
    have hfr : KD.FrameOKU Ω (natL fr.S 0 8) (natL fr.D 0 8) (natL fr.N 0 4096) (natU fr.U) fr.d :=
      hstk fr (List.mem_of_mem_drop (by rw [hd]; exact List.mem_cons_self))
    -- the label of the node is its header's
    have hhd : nd.lab = hLast nd.hdr ∧ hLast nd.hdr < 511 := by
      unfold nodeStep at hs
      simp only [] at hs
      split at hs
      · exact absurd hs (by simp)
      rename_i hhead
      simp only [Bool.not_eq_true', Bool.not_eq_false] at hhead
      exact ⟨(headOK_spec fr nd hhead).1, (headOK_spec fr nd hhead).2.1⟩
    obtain ⟨hlab, hl511⟩ := hhd
    obtain ⟨hc2, hh⟩ := hstat (hLast nd.hdr) hl511
    obtain ⟨hagg, hkid⟩ := hxv (dictRowV tab (dictIds nd)) x
    obtain ⟨hS', hN', hU', hd', hF', hK, hshr, hD, hmk, hids, hb1, hm, he1⟩ :=
      nodeStep_sound (O := R3RT.SpecO.LO123) (Ω := Ω) st tab hT hW fr nd out hfr hc2 hh hs
    rw [hlab]
    simp only [frameV]
    rw [show (nd.hdr >>> 8) % 512 = hLast nd.hdr from rfl]
    have hF5 := hF'
    rw [hS', hN', hU', hd'] at hF5
    refine ⟨hK, ?_, natL out.fr.D 0 8, hF5, ?_⟩
    · -- the bulk-peel children
      have hxp := hX (hLast nd.hdr) out x hxc
      rw [hids] at hxp hD hmk
      have hkill := KD.xpartC_sound hF' (by rw [hS']; exact hshr) (by rw [hS']; exact hD) hmk hagg hkid hxp
      rw [hS'] at hkill
      exact hkill
    · -- the rest of the batch
      have := ih (out.fr :: fr :: stk') (by
        intro f hf
        rcases List.mem_cons.mp hf with rfl | hf
        · exact hF'
        rcases List.mem_cons.mp hf with rfl | hf
        · exact hfr
        exact hstk f (List.mem_of_mem_drop (by rw [hd]; exact List.mem_cons_of_mem _ hf))) hrest
      simp only [List.map_cons, frameV] at this
      rw [hS', hN', hU', hd'] at this
      exact this

/-! ## A whole batch, with the statics built from the Nat constants and the per-job table checked natively -/

/-- **soundness of a native batch run.** Hypotheses: the per-job table passed `tabCheck` against a row interface with a
`TableSpec`; the statics are `buildStatics` of Nat constants that passed `staticsOK` and satisfy the kernel track's static facts;
the X tier's soundness (`hX`) and its static facts (`hxv`). Conclusion: the decoded batch satisfies `KD.BatchOKX Ω` whenever its
input stack is valid. -/
theorem runBatch_sound {α : Type} {Ω : R3RT.Spec.Dec22 → Prop} (c2tN : Array ℕ) (conf1N : ℕ) (hN sufN : Array ℕ)
    (rk3 : ByteArray) (hstOK : staticsOK c2tN conf1N hN sufN = true)
    (hstat : ∀ l < 511, KD.C2OKU Ω l (c2tN.getD l 0) ∧ R3RT.SpecO.HOK R3RT.SpecO.LO123 l (hN.getD l 0))
    (tab : Tab) (rowE lb : ℕ → ℕ) (hTS : R3RT.SpecO.TableSpec R3RT.SpecO.LO123 Ω rowE lb)
    (hcls : R3RT.SpecO.ClassFactsC Ω lb) (htab : tabCheck tab rowE = true)
    (xp : ByteArray → ℕ → Option (α × ℕ)) (xv : XViews α) (xc : ℕ → StepOut → α → Bool)
    (hX : ∀ last out x, xc last out x = true →
      KD.xpartC R3RT.nperpL (natL out.fr.S 0 8) (natL out.fr.D 0 8) (natL out.fr.N 0 4096) (natU out.fr.U) out.fr.d last out.b1
        out.m out.e1 (dictRowV tab out.ids) (xv.nrows x) (xv.aggs (dictRowV tab out.ids) x) (xv.XL x) (xv.HP x)
        (xv.DEFP x) (xv.J x) (xv.kids x) = true)
    (hxv : ∀ mk x, (∀ ag ∈ xv.aggs mk x, KD.C2OKU Ω ag.1 ag.2.1) ∧ (∀ c ∈ xv.kids x, KD.KidXOK Ω c))
    (b : ByteArray) (h : runBatch (buildStatics c2tN conf1N hN sufN rk3) tab xp xc b = true) :
    ∃ stk nodes, parseBatch xp b = some (stk, nodes) ∧
      ((∀ f ∈ stk, KD.FrameOKU Ω (natL f.S 0 8) (natL f.D 0 8) (natL f.N 0 4096) (natU f.U) f.d) →
        KD.BatchOKX Ω (stk.map frameV) (nodes.map (nodeV (buildStatics c2tN conf1N hN sufN rk3) tab xv))) := by
  obtain ⟨hT, hW⟩ := tabOK_of_check rowE lb hTS hcls tab htab
  unfold runBatch at h
  split at h
  · rename_i stk nodes hp
    refine ⟨stk, nodes, hp, fun hstk => ?_⟩
    exact checkNodes_sound _ tab hT hW xv xc hX (fun l hl => by
        rw [c2tV_build rk3 hstOK l hl, hV_build rk3 hstOK l hl]; exact hstat l hl) hxv nodes stk hstk h
  · exact absurd h (by simp)

end NNP
