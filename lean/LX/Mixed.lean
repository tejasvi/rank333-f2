module
public import R22Port.U_d41d8cd98f00
public import LG.ExtMono
public import E1G.Hdr
public import E1G.Asm
public import E1G.OK_l479cw
/-! # Mixed-context chains for the L479 external-leaf route (l479x)

The L479 enumeration is checked with the context `C = E1G.IP_l479cw.C` (external-leaf list `[]`). A job whose subtree has a
leaf that gen7 cannot certify is checked under `Cx ext` instead, which accepts that leaf as external (refuted by `ExtOK`).
`Glob (Cx ext) x → Glob C x` (`LG.ExtMono`), so a chain whose blocks are checked under `C` and whose children hold under
`Cx ext` holds under `Cx ext` (`jobOK_of_chain_w_mixed`, `enum_of_chain_w_mixed`: hcls's `chain_sound_f` is in covering form).
-/
@[expose] public section
namespace L479X
open E1GS

/-- **a chain checked under `C`, children under `C'`**: `JobOK C'` of its first block -/
theorem jobOK_of_chain_w_mixed (C C' : E1G.Ctx) (hmono : ∀ x, Glob C' x → Glob C x) (sl : ℕ → ℕ) (UB UBR : ℕ)
    (hUB : UB = V (fun l => E1G.fld UB l)) (hUBR : UBR = VR (fun l => E1G.fld UB l)) (hubb : ∀ l < 127, E1G.fld UB l ≤ 2 ^ 32)
    (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (Wf : ℕ → ℕ → ℕ) (hne : 0 < Ss.length)
    (hblk : ∀ i < Ss.length, E1G.block C sl UB UBR (Ss.getD i 0) = true) (hgl : glueChkW Ss nJ Jf Wf = true)
    (hjobs : ∀ k < nJ, JobOK C' sl UB (Jf k)) : JobOK C' sl UB (Ss.getD 0 0) :=
  fun x hg hsl hxub hx => chain_sound_f C sl UB UBR (fun l => E1G.fld UB l) x (hmono x hg) hsl hUB hUBR hubb hxub hx Ss nJ Jf
    (fun k hk => hjobs k hk x hg hsl hxub hx) hblk Wf hgl 0 hne

/-- **a root chain checked under `C`, jobs under `C'`**: the canonical-point statement for `C'` -/
theorem enum_of_chain_w_mixed (C C' : E1G.Ctx) (hmono : ∀ x, Glob C' x → Glob C x) (sl : ℕ → ℕ) (UB UBR : ℕ)
    (hUB : UB = V (fun l => E1G.fld UB l)) (hUBR : UBR = VR (fun l => E1G.fld UB l)) (hubb : ∀ l < 127, E1G.fld UB l ≤ 2 ^ 32)
    (Ss : List ℕ) (nJ : ℕ) (Jf : ℕ → ℕ) (Wf : ℕ → ℕ → ℕ) (hne : 0 < Ss.length) (hroot : Ss.getD 0 0 % 2 ^ 13 = 0)
    (hblk : ∀ i < Ss.length, E1G.block C sl UB UBR (Ss.getD i 0) = true) (hgl : glueChkW Ss nJ Jf Wf = true)
    (hjobs : ∀ k < nJ, JobOK C' sl UB (Jf k)) :
    ∀ x : ℕ → ℕ, Glob C' x → (∀ i < 2 ^ 15, SlotV x (sl i)) → (∀ l < 127, x l ≤ E1G.fld UB l) →
      (∃ l < 127, 0 < x l) → False := by
  intro x hg hsl hxub hx
  apply jobOK_of_chain_w_mixed C C' hmono sl UB UBR hUB hUBR hubb Ss nJ Jf Wf hne hblk hgl hjobs x hg hsl hxub hx
  have hd0 : Ss.getD 0 0 / 2 % 2 ^ 5 = 0 := by
    have a := mod_div_mod (Ss.getD 0 0) 13 1 5 (by omega)
    rw [hroot] at a; simpa using a.symm
  have hp0 : Ss.getD 0 0 / 2 ^ 6 % 2 ^ 7 = 0 := by
    have a := mod_div_mod (Ss.getD 0 0) 13 6 7 (by omega)
    rw [hroot] at a; simpa using a.symm
  unfold StartOK
  rw [hd0, hp0, if_neg (by omega)]
  refine ⟨fun l => by simp [multR], fun l hl => by omega, fun l _ => by simp [multR], fun l hl => ?_⟩
  simp only [multR, Nat.zero_add, Nat.sub_zero]
  exact hxub l hl

/-- the L479 IP's contexts: `Glob (Cx ext) x → Glob C x` -/
theorem glob_cx (ext : List ℕ) (x : ℕ → ℕ) (h : Glob (E1G.OK_l479cw.Cx ext) x) : Glob E1G.IP_l479cw.C x :=
  L479.glob_ext_mono (C := E1G.IP_l479cw.C) (ext := ext) (fun e he => by simp [E1G.IP_l479cw.C, E1G.IP_l479cw.EXT] at he) h

/-- native jobs (checked under `C`) hold under `Cx ext` -/
theorem jobOK_cx (ext : List ℕ) {sl : ℕ → ℕ} {UB S : ℕ} (h : JobOK E1G.IP_l479cw.C sl UB S) :
    JobOK (E1G.OK_l479cw.Cx ext) sl UB S :=
  fun x hg hsl hub hx => h x (glob_cx ext x hg) hsl hub hx

end L479X

#print axioms L479X.jobOK_of_chain_w_mixed
#print axioms L479X.enum_of_chain_w_mixed
#print axioms L479X.jobOK_cx
