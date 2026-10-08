module
public import R22Port.U_d41d8cd98f00
public import E1.Sem3
/-! # Soundness of E1's node checker

Fix the multiplicity vector `x` of a hypothetical decomposition: `x l` terms in coset `l`, `∑ x = R`, every row of the
table holds for `x` (`SlotsOK`), the leaf checker refutes `x` (`Glob.leaf`) and `x` is canonical (`Glob.canon`).
`node_sound`: if a node is accepted and `x` completes its state (`NInv`), then `x` completes one of the delegated states
recorded in the block header (`Reach`).  So a block with no delegated state refutes every completion. -/
@[expose] public section
namespace E1S
open Finset
set_option exponentiation.threshold 600

local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)

/-- the image of `x` under the label map `gp` -/
def push (gp : ℕ) (x : ℕ → ℕ) (k : ℕ) : ℕ := ∑ l ∈ range 127, (if gpf gp l = k then x l else 0)

/-- what the node proof needs about `x` -/
structure Glob (C : E1.Ctx) (x : ℕ → ℕ) : Prop where
  N_le : C.N ≤ 127
  R_le : C.R ≤ 31
  xN : ∀ l, C.N ≤ l → x l = 0
  xR : ∑ l ∈ range 127, x l = C.R
  leaf : ∀ pl cert, (∀ l, multR C.R pl l = x l) → E1.leafOK C pl cert = true → False
  canon : ∀ g < 16, ¬ (VR x < VR (push (E1.gpE C.GP g) x))
  gp : ∀ g < 16, ∀ l < C.N, gpf (E1.gpE C.GP g) l < C.N

/-- the packed state invariant at a node: prefix multiplicities, budgets, and `x` completing the state -/
def NInv (x : ℕ → ℕ) (d pos pl MV MVR UF UFR : ℕ) : Prop :=
  ∃ u : ℕ → ℕ, MV = V (multR d pl) ∧ MVR = VR (multR d pl) ∧ UF = V u ∧ UFR = VR u ∧
    (∀ l < 127, u l ≤ 2 ^ 32) ∧ Cmpl x d pos pl u ∧ pl < 2 ^ (7 * d)

section facts
variable {C : E1.Ctx} {x : ℕ → ℕ} (hg : Glob C x)
include hg

theorem m_zero {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) (l : ℕ) (hl : C.N ≤ l) : multR d pl l = 0 := by
  have := hc.1 l; rw [hg.xN l hl] at this; omega

theorem m_sum {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) : ∑ l ∈ range 127, multR d pl l = d :=
  multR_sum d pl (fun l hl => m_zero hg hc l (by have := hg.N_le; omega))

theorem d_le {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) : d ≤ C.R := by
  rw [← m_sum hg hc, ← hg.xR]
  exact Finset.sum_le_sum (fun l _ => hc.1 l)

theorem m_le {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) (l : ℕ) : multR d pl l ≤ 31 :=
  le_trans (multR_le d pl l) (le_trans (d_le hg hc) hg.R_le)

/-- `R - d` new labels: `∑ (x - m) = R - d` -/
theorem rem_eq {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) :
    ∑ l ∈ range 127, (x l - multR d pl l) = C.R - d := by
  rw [Finset.sum_tsub_distrib _ (fun l _ => hc.1 l), hg.xR, m_sum hg hc]

/-- the smallest label with a new copy -/
theorem minAdd {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) (hrem : 1 ≤ C.R - d) :
    ∃ ls, pos ≤ ls ∧ ls < C.N ∧ (∀ j < ls, x j = multR d pl j) ∧ multR d pl ls < x ls := by
  have hex : ∃ l, multR d pl l < x l := by
    by_contra hne
    push_neg at hne
    have : ∑ l ∈ range 127, (x l - multR d pl l) = 0 :=
      Finset.sum_eq_zero (fun l _ => by have := hne l; omega)
    rw [rem_eq hg hc] at this; omega
  classical
  let ls := Nat.find hex
  have h1 : multR d pl ls < x ls := Nat.find_spec hex
  have h2 : ∀ j < ls, x j = multR d pl j := by
    intro j hj
    have := Nat.find_min hex hj
    have := hc.1 j; omega
  refine ⟨ls, ?_, ?_, h2, h1⟩
  · by_contra hlt
    have := hc.2.1 ls (by omega); omega
  · by_contra hge
    have := hg.xN ls (by omega); omega

/-- completions with every new label `≥ cut` and at most `w` budget at labels `≥ cut`: `R - d ≤ w` -/
theorem total_le {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) (cut : ℕ) (hcut : ∀ j < cut, x j = multR d pl j) :
    C.R - d ≤ ∑ l ∈ range 127, (if cut ≤ l then u l else 0) := by
  rw [← rem_eq hg hc]
  apply Finset.sum_le_sum; intro l hl; rw [Finset.mem_range] at hl
  split
  · have := hc.2.2.2 l hl; omega
  · have := hcut l (by omega); omega

/-- the same outside a row `(M, cap)` that holds for `x`: `R - d + m(M) - cap ≤ ∑_{l ≥ cut, l ∉ M} u_l` -/
theorem total_out_le {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) (cut M cap : ℕ) (hrow : msum x M ≤ cap)
    (hcut : ∀ j < cut, x j = multR d pl j) :
    C.R - d + msum (multR d pl) M - cap ≤ ∑ l ∈ range 127, (if cut ≤ l then (if M.testBit l then 0 else u l) else 0) := by
  have hsplit : ∑ l ∈ range 127, (x l - multR d pl l) =
      ∑ l ∈ range 127, (if M.testBit l then x l - multR d pl l else 0) +
      ∑ l ∈ range 127, (if M.testBit l then 0 else x l - multR d pl l) := by
    rw [← Finset.sum_add_distrib]; apply Finset.sum_congr rfl; intro l _; split <;> simp
  have hin : ∑ l ∈ range 127, (if M.testBit l then x l - multR d pl l else 0) = msum x M - msum (multR d pl) M := by
    unfold msum
    rw [← Finset.sum_tsub_distrib _ (fun l _ => by split <;> [exact hc.1 l; exact le_rfl])]
    apply Finset.sum_congr rfl; intro l _; split <;> simp
  have hout : ∑ l ∈ range 127, (if M.testBit l then 0 else x l - multR d pl l) ≤
      ∑ l ∈ range 127, (if cut ≤ l then (if M.testBit l then 0 else u l) else 0) := by
    apply Finset.sum_le_sum; intro l hl; rw [Finset.mem_range] at hl
    split
    · simp
    · split
      · have := hc.2.2.2 l hl; first | omega | (split <;> omega)
      · have := hcut l (by omega); first | omega | (split <;> omega)
  have hmM : msum (multR d pl) M ≤ msum x M := by
    unfold msum; apply Finset.sum_le_sum; intro l _; split
    · exact hc.1 l
    · exact le_rfl
  rw [rem_eq hg hc] at hsplit
  omega

end facts

/-! ## Packed forms of the checker's sums -/

theorem wout_eq (u : ℕ → ℕ) (hu : ∀ l < 127, u l ≤ 2 ^ 32) (M lo : ℕ) (hM : M < 2 ^ 127) :
    E1.wout (V u) M lo = ∑ l ∈ range 127, (if lo ≤ l then (if M.testBit l then 0 else u l) else 0) := by
  show E1.fsum (Nat.land (Nat.land (V u) (Nat.xor ECT.FMALL (E1.fmask M))) (E1.hif lo)) = _
  have hu' : ∀ l < 127, u l < 2 ^ 128 := fun l hl => lt_of_le_of_lt (hu l hl) (by norm_num)
  rw [show Nat.land (Nat.land (V u) (Nat.xor ECT.FMALL (E1.fmask M))) (E1.hif lo) =
    (V u &&& (ECT.FMALL ^^^ E1.fmask M)) &&& E1.hif lo from rfl, and_nfmask u hu' M hM,
    and_hif _ (fun l hl => by show (if M.testBit l then 0 else u l) < 2 ^ 128; split <;> [norm_num; exact hu' l hl]),
    fsum_V _ (2 ^ 32) (fun l hl => by
      show (if lo ≤ l then (if M.testBit l then 0 else u l) else 0) ≤ 2 ^ 32
      split
      · split
        · exact Nat.zero_le _
        · exact hu l hl
      · exact Nat.zero_le _) (by norm_num)]

theorem wout0_eq (u : ℕ → ℕ) (hu : ∀ l < 127, u l ≤ 2 ^ 32) (lo : ℕ) :
    E1.wout (V u) 0 lo = ∑ l ∈ range 127, (if lo ≤ l then u l else 0) := by
  rw [wout_eq u hu 0 lo (by norm_num)]
  apply Finset.sum_congr rfl; intro l _; simp

/-! ## The children loop -/

theorem kids_succ (ih : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool) (C : E1.Ctx) (RTb H cnt d pl MV MVR UF UFR l S : ℕ) :
    E1.kids ih C RTb H (cnt + 1) d pl MV MVR UF UFR l S =
      E1.kidStep ih C RTb H d pl MV MVR UF UFR (fun l S => E1.kids ih C RTb H cnt d pl MV MVR UF UFR l S) l S := rfl

theorem kids_zero (ih : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool) (C : E1.Ctx) (RTb H d pl MV MVR UF UFR l S : ℕ) :
    E1.kids ih C RTb H 0 d pl MV MVR UF UFR l S = true := rfl

theorem kidStep_eq (ih : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool) (C : E1.Ctx) (RTb H d pl MV MVR UF UFR : ℕ)
    (ihl : ℕ → ℕ → Bool) (l S : ℕ) : E1.kidStep ih C RTb H d pl MV MVR UF UFR ihl l S =
    sel (Nat.beq (E1.rd 2 S) 0)
      (Nat.beq (E1.fld UF l) 0 ∧ᵇ ihl (Nat.succ l) (E1.sk 2 S))
      (sel (Nat.beq (E1.rd 2 S) 3)
        (Nat.blt (Nat.add MVR (E1.oner l))
            (E1.imgR (E1.gpE C.GP (E1.rd 4 (E1.sk 2 S))) (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) (Nat.succ d)) ∧ᵇ
          ihl (Nat.succ l) (E1.sk 4 (E1.sk 2 S)))
        (Nat.ble 1 (E1.fld UF l) ∧ᵇ
          (E1.sats RTb (E1.rd 4 (E1.sk 2 S)) (Nat.add MV (E1.one l)) (Nat.sub UF (E1.one l)) (Nat.sub UFR (E1.oner l)) (E1.sk 4 (E1.sk 2 S))).1 ∧ᵇ
          E1.kidC12 ih C RTb H (E1.rd 2 S) d pl MV MVR l ihl
            (E1.sats RTb (E1.rd 4 (E1.sk 2 S)) (Nat.add MV (E1.one l)) (Nat.sub UF (E1.one l)) (Nat.sub UFR (E1.oner l)) (E1.sk 4 (E1.sk 2 S))))) := rfl

theorem cond_ff (a b : Bool) : cond a b false = (a && b) := by cases a <;> rfl
theorem land_eq (a b : ℕ) : Nat.land a b = a &&& b := rfl


/-- the child's prefix: one more copy of `l` -/
theorem child_mult (d pl l : ℕ) (hpl : pl < 2 ^ (7 * d)) (hl : l < 128) (j : ℕ) :
    multR (d + 1) (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) j = multR d pl j + (if l = j then 1 else 0) :=
  multR_append d pl l hpl hl j

theorem child_V (d pl l : ℕ) (hpl : pl < 2 ^ (7 * d)) (hl : l < 127) :
    Nat.add (V (multR d pl)) (E1.one l) = V (multR (d + 1) (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d)))) := by
  rw [one_V l hl, show Nat.add (V (multR d pl)) (V fun j => if j = l then 1 else 0) =
    V (multR d pl) + V (fun j => if j = l then 1 else 0) from rfl, V_add]
  apply V_congr; intro j _
  rw [child_mult d pl l hpl (by omega) j]
  by_cases h : j = l
  · rw [if_pos h, if_pos h.symm]
  · rw [if_neg h, if_neg (Ne.symm h)]

theorem child_VR (d pl l : ℕ) (hpl : pl < 2 ^ (7 * d)) (hl : l < 127) :
    Nat.add (VR (multR d pl)) (E1.oner l) = VR (multR (d + 1) (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d)))) := by
  rw [oner_VR l hl, show Nat.add (VR (multR d pl)) (VR fun j => if j = l then 1 else 0) =
    VR (multR d pl) + VR (fun j => if j = l then 1 else 0) from rfl, VR_add]
  apply VR_congr; intro j _
  rw [child_mult d pl l hpl (by omega) j]
  by_cases h : j = l
  · rw [if_pos h, if_pos h.symm]
  · rw [if_neg h, if_neg (Ne.symm h)]

/-- `x` completes the child `(d + 1, l)` when `l` is its smallest new label -/
theorem child_cmpl {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) (hpl : pl < 2 ^ (7 * d)) (l : ℕ) (hpos : pos ≤ l)
    (hl : l < 127) (hmin : ∀ j < l, x j = multR d pl j) (hlt : multR d pl l < x l) (u2 : ℕ → ℕ)
    (hu2 : ∀ j < 127, x j ≤ multR (d + 1) (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) j + u2 j) :
    Cmpl x (d + 1) l (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) u2 := by
  refine ⟨fun j => ?_, fun j hj => ?_, fun j hj => ?_, hu2⟩
  · rw [child_mult d pl l hpl (by omega) j]
    by_cases h : l = j
    · subst h; rw [if_pos rfl]; omega
    · rw [if_neg h]; have := hc.1 j; omega
  · rw [child_mult d pl l hpl (by omega) j, if_neg (by omega)]; exact hmin j hj
  · rw [child_mult d pl l hpl (by omega) j, if_neg (by omega)]; exact hc.2.2.1 j (by omega)

/-- `cutOK` with its arithmetic primitives abstracted (so that case lemmas are checked without evaluating them) -/
def cutOKG (fs fm : ℕ → ℕ) (rm rc : ℕ → ℕ → ℕ) (wo df : ℕ → ℕ → ℕ → ℕ)
    (C : E1.Ctx) (RTb kind cut cj rem MV UF' : ℕ) (hd : Bool) (BC T UFR' RS : ℕ) : Bool :=
  sel (Nat.beq kind 0) (Nat.ble C.N cut)
    (sel (Nat.beq kind 1)
      (Nat.ble 1 (Nat.sub (Nat.add rem (fs (Nat.land MV (fm (rm RTb cj))))) (rc RTb cj)) ∧ᵇ
       Nat.blt (wo UF' (rm RTb cj) cut) (Nat.sub (Nat.add rem (fs (Nat.land MV (fm (rm RTb cj))))) (rc RTb cj)))
      (sel (Nat.beq kind 2) (Nat.blt (wo UF' 0 cut) rem)
        (hd ∧ᵇ Nat.blt (Nat.add BC (df T UFR' cut)) RS)))

theorem cutOK_G (C : E1.Ctx) (RTb kind cut cj rem MV UF' : ℕ) (hd : Bool) (BC T UFR' RS : ℕ) :
    E1.cutOK C RTb kind cut cj rem MV UF' hd BC T UFR' RS =
      cutOKG E1.fsum E1.fmask E1.rmask E1.rcap E1.wout E1.deficit C RTb kind cut cj rem MV UF' hd BC T UFR' RS := rfl

section cutG
variable (fs fm : ℕ → ℕ) (rm rc : ℕ → ℕ → ℕ) (wo df : ℕ → ℕ → ℕ → ℕ)
  (C : E1.Ctx) (RTb cut cj rem MV UF' : ℕ) (hd : Bool) (BC T UFR' RS : ℕ)
theorem cutOKG_0 : cutOKG fs fm rm rc wo df C RTb 0 cut cj rem MV UF' hd BC T UFR' RS = Nat.ble C.N cut := rfl
theorem cutOKG_1 : cutOKG fs fm rm rc wo df C RTb 1 cut cj rem MV UF' hd BC T UFR' RS =
    @Bool.rec (fun _ => Bool) false
      (Nat.blt (wo UF' (rm RTb cj) cut) (Nat.sub (Nat.add rem (fs (Nat.land MV (fm (rm RTb cj))))) (rc RTb cj)))
      (Nat.ble 1 (Nat.sub (Nat.add rem (fs (Nat.land MV (fm (rm RTb cj))))) (rc RTb cj))) := rfl
theorem cutOKG_2 : cutOKG fs fm rm rc wo df C RTb 2 cut cj rem MV UF' hd BC T UFR' RS = Nat.blt (wo UF' 0 cut) rem := rfl
theorem cutOKG_3 : cutOKG fs fm rm rc wo df C RTb 3 cut cj rem MV UF' hd BC T UFR' RS =
    @Bool.rec (fun _ => Bool) false (Nat.blt (Nat.add BC (df T UFR' cut)) RS) hd := rfl
end cutG

theorem brDu_eq (RTb S1 : ℕ) : E1.brDu RTb S1 =
    @Bool.rec (fun _ => ℕ × ℕ × ℕ) (0, 0, E1.brS4 S1) (E1.rdual RTb (E1.rd 6 (E1.brS4 S1)) (E1.sk 6 (E1.brS4 S1))) (E1.brHd S1) := rfl
theorem selF' {α : Sort _} (a b : α) : @Bool.rec (fun _ => α) b a false = b := rfl
theorem selT' {α : Sort _} (a b : α) : @Bool.rec (fun _ => α) b a true = a := rfl

theorem node_zero (C : E1.Ctx) (RTb H d pos pl MV MVR UF UFR S : ℕ) :
    E1.node C RTb H 0 d pos pl MV MVR UF UFR S = false := rfl
theorem node_succ (C : E1.Ctx) (RTb H n d pos pl MV MVR UF UFR S : ℕ) :
    E1.node C RTb H (n + 1) d pos pl MV MVR UF UFR S = E1.nodeStep C RTb H (E1.node C RTb H n) d pos pl MV MVR UF UFR S := rfl

section kids
variable {C : E1.Ctx} {x : ℕ → ℕ} (hg : Glob C x) {RTb H : ℕ} (hT : SlotsOK x RTb)
include hg

include hT in
/-- the saturation events of a child at its smallest new label: the child's budgets -/
theorem child_sats {d pos pl : ℕ} {u : ℕ → ℕ} (hu : ∀ j < 127, u j ≤ 2 ^ 32) (hc : Cmpl x d pos pl u)
    (hpl : pl < 2 ^ (7 * d)) (l : ℕ) (hpos : pos ≤ l) (hl : l < 127) (hmin : ∀ j < l, x j = multR d pl j)
    (hlt : multR d pl l < x l) (hul : 1 ≤ u l) (n S' : ℕ)
    (hok : (E1.sats RTb n (Nat.add (V (multR d pl)) (E1.one l)) (Nat.sub (V u) (E1.one l)) (Nat.sub (VR u) (E1.oner l)) S').1 = true) :
    ∃ u2, (E1.sats RTb n (Nat.add (V (multR d pl)) (E1.one l)) (Nat.sub (V u) (E1.one l)) (Nat.sub (VR u) (E1.oner l)) S').2.1 = V u2 ∧
      (E1.sats RTb n (Nat.add (V (multR d pl)) (E1.one l)) (Nat.sub (V u) (E1.one l)) (Nat.sub (VR u) (E1.oner l)) S').2.2.1 = VR u2 ∧
      (∀ j < 127, u2 j ≤ 2 ^ 32) ∧ Cmpl x (d + 1) l (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) u2 := by
  set pl2 := Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d)) with hpl2
  set u1 : ℕ → ℕ := fun j => u j - (if j = l then 1 else 0) with hu1
  have eU : Nat.sub (V u) (E1.one l) = V u1 := by
    rw [one_V l hl, show Nat.sub (V u) (V fun j => if j = l then 1 else 0) = V u - V (fun j => if j = l then 1 else 0) from rfl,
      V_sub _ _ (fun j _ => by
        show (if j = l then 1 else 0) ≤ u j
        split
        · next h => subst h; omega
        · exact Nat.zero_le _)]
  have eUR : Nat.sub (VR u) (E1.oner l) = VR u1 := by
    rw [oner_VR l hl, show Nat.sub (VR u) (VR fun j => if j = l then 1 else 0) = VR u - VR (fun j => if j = l then 1 else 0) from rfl,
      VR_sub _ _ (fun j _ => by
        show (if j = l then 1 else 0) ≤ u j
        split
        · next h => subst h; omega
        · exact Nat.zero_le _)]
  rw [eU, eUR, child_V d pl l hpl hl, sats_eq] at hok ⊢
  have hm2 : ∀ j < 127, multR (d + 1) pl2 j ≤ 2 ^ 40 := by
    intro j _; have := multR_le (d + 1) pl2 j; have := d_le hg hc; have := hg.R_le; omega
  have hmx : ∀ j, multR (d + 1) pl2 j ≤ x j := by
    intro j; rw [hpl2, child_mult d pl l hpl (by omega) j]
    by_cases h : l = j
    · subst h; rw [if_pos rfl]; omega
    · rw [if_neg h]; have := hc.1 j; omega
  have hu1b : ∀ j < 127, u1 j < 2 ^ 128 := by
    intro j hj; simp only [hu1]; have := hu j hj; omega
  obtain ⟨-, u2, h1, h2, h3, h4⟩ := sats_sem x RTb hT _ hm2 hmx n true u1 S' hu1b hok
  refine ⟨u2, h1, h2, fun j hj => le_trans (h3 j hj) (by simp only [hu1]; have := hu j hj; omega), ?_⟩
  apply child_cmpl hc hpl l hpos hl hmin hlt u2
  apply h4
  intro j hj
  rw [hpl2, child_mult d pl l hpl (by omega) j]
  simp only [hu1]
  have := hc.2.2.2 j hj
  by_cases h : j = l
  · subst h; simp only [if_true]; omega
  · rw [if_neg (Ne.symm h), if_neg h]; omega

/-- **Canonicity.** A child whose prefix has a smaller image (`code 3`) cannot hold the smallest new label of `x`. -/
theorem canon_contra {d pos pl : ℕ} {u : ℕ → ℕ} (hu : ∀ j < 127, u j ≤ 2 ^ 32) (hc : Cmpl x d pos pl u)
    (hpl : pl < 2 ^ (7 * d)) (l : ℕ) (hpos : pos ≤ l)
    (hlN : l < C.N) (hmin : ∀ j < l, x j = multR d pl j) (hlt : multR d pl l < x l) (g : ℕ) (hg16 : g < 16)
    (h : Nat.blt (Nat.add (VR (multR d pl)) (E1.oner l))
      (E1.imgR (E1.gpE C.GP g) (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) (Nat.succ d)) = true) : False := by
  have hN := hg.N_le
  have hl127 : l < 127 := by omega
  have hdR := d_le hg hc
  have hR := hg.R_le
  obtain ⟨gp, hgp⟩ : ∃ gp, gp = E1.gpE C.GP g := ⟨_, rfl⟩
  obtain ⟨pl2, hpl2⟩ : ∃ pl2, pl2 = Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d)) := ⟨_, rfl⟩
  rw [← hgp, ← hpl2] at h
  have hpj : ∀ j, multR (d + 1) pl2 j = multR d pl j + (if l = j then 1 else 0) := by
    intro j; rw [hpl2]; exact child_mult d pl l hpl (by omega) j
  have hpx : ∀ j, multR (d + 1) pl2 j ≤ x j := by
    intro j; rw [hpj j]
    by_cases h' : l = j
    · subst h'; rw [if_pos rfl]; omega
    · rw [if_neg h']; have := hc.1 j; omega
  have hpN : ∀ j, C.N ≤ j → multR (d + 1) pl2 j = 0 := by
    intro j hj; have := hpx j; rw [hg.xN j hj] at this; omega
  have hgpN : ∀ j, 0 < multR (d + 1) pl2 j → gpf gp j < C.N := by
    intro j hj
    have : j < C.N := by by_contra hc'; have := hpN j (by omega); omega
    rw [hgp]; exact hg.gp g hg16 j this
  have hqs : ∀ k, imR (d + 1) pl2 gp k = ∑ j ∈ range 128, (if gpf gp j = k then multR (d + 1) pl2 j else 0) :=
    fun k => imR_eq_sum gp (d + 1) pl2 k
  have hq0 : ∀ k, 127 ≤ k → imR (d + 1) pl2 gp k = 0 := by
    intro k hk; rw [hqs k]
    apply Finset.sum_eq_zero; intro j _
    split
    · next h' =>
      by_contra hne
      have := hgpN j (by omega); omega
    · rfl
  have eL : Nat.add (VR (multR d pl)) (E1.oner l) = VR (multR (d + 1) pl2) := by rw [hpl2]; exact child_VR d pl l hpl hl127
  rw [eL, imgR_eq gp (d + 1) pl2 hq0, Nat.blt_eq] at h
  have hpb : ∀ j, multR (d + 1) pl2 j ≤ 32 := by
    intro j; have := multR_le (d + 1) pl2 j; omega
  have hp127 : multR (d + 1) pl2 127 = 0 := hpN 127 (by omega)
  have hqQ : ∀ k < 127, imR (d + 1) pl2 gp k ≤ push gp x k := by
    intro k _
    rw [hqs k, Finset.sum_range_succ, hp127, ite_self, Nat.add_zero]
    apply Finset.sum_le_sum; intro j _; split
    · exact hpx j
    · exact le_rfl
  have hsum : ∑ k ∈ range 127, imR (d + 1) pl2 gp k = ∑ k ∈ range 127, multR (d + 1) pl2 k := by
    rw [Finset.sum_congr rfl (fun k _ => hqs k), Finset.sum_comm]
    have : ∀ j ∈ range 128, ∑ k ∈ range 127, (if gpf gp j = k then multR (d + 1) pl2 j else 0) = multR (d + 1) pl2 j := by
      intro j _
      rw [Finset.sum_ite_eq (range 127) (gpf gp j) (fun _ => multR (d + 1) pl2 j)]
      split
      · rfl
      · next h' =>
        by_contra hne
        have := hgpN j (by omega)
        exact h' (Finset.mem_range.mpr (by omega))
    rw [Finset.sum_congr rfl this, Finset.sum_range_succ, hp127, Nat.add_zero]
  have hqb : ∀ k, imR (d + 1) pl2 gp k ≤ 128 * 32 := by
    intro k; rw [hqs k]
    calc ∑ j ∈ range 128, (if gpf gp j = k then multR (d + 1) pl2 j else 0) ≤ ∑ j ∈ range 128, 32 := by
          apply Finset.sum_le_sum; intro j _; split
          · exact hpb j
          · exact Nat.zero_le _
      _ = 128 * 32 := by rw [Finset.sum_const, Finset.card_range, smul_eq_mul]
  obtain ⟨j0, hj0, h1, h2⟩ := (VR_lt_iff _ _ (fun j _ => lt_of_le_of_lt (hpb j) (by norm_num))
    (fun k _ => lt_of_le_of_lt (hqb k) (by norm_num))).mp h
  obtain ⟨j1, hj1, h3, h4⟩ := prefix_lex (multR (d + 1) pl2) x (imR (d + 1) pl2 gp) (push gp x) l hl127
    (fun j hj => by rw [hpj j, if_neg (by omega), Nat.add_zero]; exact (hmin j hj).symm)
    (by rw [hpj l, if_pos rfl]; omega)
    (fun j hj _ => by rw [hpj j, if_neg (by omega), hc.2.2.1 j (by omega)])
    hqQ hsum ⟨j0, hj0, h1, h2⟩
  have hxb : ∀ j < 127, x j < 2 ^ 128 := by
    intro j hj; have := hc.2.2.2 j hj; have := m_le hg hc j; have := hu j hj; omega
  have hQb : ∀ k < 127, push gp x k < 2 ^ 128 := by
    intro k _
    have : push gp x k ≤ ∑ j ∈ range 127, x j := by
      unfold push; apply Finset.sum_le_sum; intro j _; split
      · exact le_rfl
      · exact Nat.zero_le _
    rw [hg.xR] at this; omega
  apply hg.canon g hg16
  rw [← hgp]
  exact (VR_lt_iff x (push gp x) hxb hQb).mpr ⟨j1, hj1, h3, h4⟩

include hT in
/-- one step of the children loop: the rest of the loop is accepted, and a completion whose smallest new label is `l`
reaches a delegated state -/
theorem kidStep_sound (ih : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool)
    (hih : ∀ d pos pl MV MVR UF UFR S, ih d pos pl MV MVR UF UFR S = true → NInv x d pos pl MV MVR UF UFR → Reach x H)
    {d pos pl : ℕ} {u : ℕ → ℕ} (hu : ∀ j < 127, u j ≤ 2 ^ 32) (hc : Cmpl x d pos pl u) (hpl : pl < 2 ^ (7 * d))
    (ihl : ℕ → ℕ → Bool) (l S : ℕ) (hpos : pos ≤ l) (hlN : l < C.N)
    (h : E1.kidStep ih C RTb H d pl (V (multR d pl)) (VR (multR d pl)) (V u) (VR u) ihl l S = true) :
    (∃ S', ihl (l + 1) S' = true) ∧ ((∀ j < l, x j = multR d pl j) → multR d pl l < x l → Reach x H) := by
  have hl127 : l < 127 := by have := hg.N_le; omega
  have hub : ∀ j < 127, u j < 2 ^ 128 := fun j hj => lt_of_le_of_lt (hu j hj) (by norm_num)
  rw [kidStep_eq] at h
  have hcode : E1.rd 2 S < 4 := by rw [rd_eq]; exact Nat.mod_lt _ (by norm_num)
  generalize E1.rd 2 S = code at h hcode
  rcases (by omega : code = 0 ∨ code = 1 ∨ code = 2 ∨ code = 3) with rfl | rfl | rfl | rfl
  · -- skip: budget 0
    simp only [selE, cond_ff, show Nat.beq 0 0 = true from rfl, cond_true, Bool.and_eq_true] at h
    refine ⟨⟨_, h.2⟩, fun _ hlt => ?_⟩
    have h0 := Nat.eq_of_beq_eq_true h.1
    rw [fld_V u hub l hl127] at h0
    have := hc.2.2.2 l hl127; omega
  · -- lookahead-killed child
    simp only [selE, cond_ff, show Nat.beq 1 0 = false from rfl, show Nat.beq 1 3 = false from rfl, cond_false,
      Bool.and_eq_true] at h
    obtain ⟨h1, h2, h3⟩ := h
    have hul : 1 ≤ u l := by rw [Nat.ble_eq, fld_V u hub l hl127] at h1; exact h1
    unfold E1.kidC12 at h3
    simp only [selE, cond_ff, show Nat.beq 1 1 = true from rfl, cond_true, Bool.and_eq_true] at h3
    have hchild := fun hmin hlt => child_sats hg hT hu hc hpl l hpos hl127 hmin hlt hul _ _ h2
    generalize E1.sats RTb (E1.rd 4 (E1.sk 2 S)) ((V (multR d pl)).add (E1.one l)) ((V u).sub (E1.one l))
      ((VR u).sub (E1.oner l)) (E1.sk 4 (E1.sk 2 S)) = s at h3 hchild
    generalize (E1.rd 1 s.2.2.2).beq 0 = b at h3
    cases b
    · -- killed by a row
      rw [cond_false, Bool.and_eq_true, Bool.and_eq_true] at h3
      refine ⟨⟨_, h3.2.2⟩, fun hmin hlt => ?_⟩
      obtain ⟨u2, e1, -, hu2, hc2⟩ := hchild hmin hlt
      obtain ⟨hn1, hn2, -⟩ := h3
      generalize E1.rd 12 (E1.sk 1 s.2.2.2) = j at hn1 hn2
      have hv := hT j
      generalize hvd : RTb / 2 ^ (264 * j) % 2 ^ 264 = v at hv
      simp only [land_eq] at hn1 hn2
      rw [rmask_eq, rcap_eq, hvd, child_V d pl l hpl hl127, fsum_and_fmask _ (fun i _ => by
        have := multR_le (d + 1) (Nat.lor pl (Nat.shiftLeft l (Nat.mul 7 d))) i; have := d_le hg hc; have := hg.R_le; omega)
        _ (smask_lt v)] at hn1 hn2
      rw [e1, wout_eq u2 hu2 _ l (smask_lt v)] at hn2
      have := total_out_le hg hc2 l (smask v) (scap v) hv.1 hc2.2.1
      simp only [Nat.ble_eq, Nat.blt_eq, Nat.sub_eq, Nat.add_eq, Nat.succ_eq_add_one] at hn1 hn2
      omega
    · -- killed by the total budget
      rw [cond_true, Bool.and_eq_true] at h3
      refine ⟨⟨_, h3.2⟩, fun hmin hlt => ?_⟩
      obtain ⟨u2, e1, -, hu2, hc2⟩ := hchild hmin hlt
      have hk := h3.1
      rw [e1, wout0_eq u2 hu2] at hk
      have := total_le hg hc2 l hc2.2.1
      simp only [Nat.blt_eq, Nat.sub_eq, Nat.succ_eq_add_one] at hk
      omega
  · -- child subtree
    simp only [selE, cond_ff, show Nat.beq 2 0 = false from rfl, show Nat.beq 2 3 = false from rfl, cond_false,
      Bool.and_eq_true] at h
    obtain ⟨h1, h2, h3⟩ := h
    have hul : 1 ≤ u l := by rw [Nat.ble_eq, fld_V u hub l hl127] at h1; exact h1
    unfold E1.kidC12 at h3
    simp only [selE, cond_ff, show Nat.beq 2 1 = false from rfl, cond_false, Bool.and_eq_true] at h3
    have hchild := fun hmin hlt => child_sats hg hT hu hc hpl l hpos hl127 hmin hlt hul _ _ h2
    generalize E1.sats RTb (E1.rd 4 (E1.sk 2 S)) ((V (multR d pl)).add (E1.one l)) ((V u).sub (E1.one l))
      ((VR u).sub (E1.oner l)) (E1.sk 4 (E1.sk 2 S)) = s at h3 hchild
    generalize (E1.rd 24 s.2.2.2).beq 0 = b at h3
    cases b
    · -- inline subtree
      rw [cond_false, Bool.and_eq_true] at h3
      refine ⟨⟨_, h3.2⟩, fun hmin hlt => ?_⟩
      obtain ⟨u2, e1, e2, hu2, hc2⟩ := hchild hmin hlt
      apply hih _ _ _ _ _ _ _ _ h3.1
      refine ⟨u2, child_V d pl l hpl hl127, child_VR d pl l hpl hl127, e1, e2, hu2, hc2, ?_⟩
      exact append_lt d pl l hpl (by omega)
    · -- delegated subtree
      rw [cond_true, Bool.and_eq_true] at h3
      refine ⟨⟨_, h3.2⟩, fun hmin hlt => ?_⟩
      obtain ⟨u2, e1, -, hu2, hc2⟩ := hchild hmin hlt
      have hs := h3.1
      rw [e1] at hs
      exact stEq_reach x H _ _ _ _ u2 (fun j hj => lt_of_le_of_lt (hu2 j hj) (by norm_num)) hs hc2
  · -- non-canonical skip
    simp only [selE, cond_ff, show Nat.beq 3 0 = false from rfl, show Nat.beq 3 3 = true from rfl, cond_false, cond_true,
      Bool.and_eq_true] at h
    refine ⟨⟨_, h.2⟩, fun hmin hlt => ?_⟩
    exact (canon_contra hg hu hc hpl l hpos hlN hmin hlt _ (by rw [rd_eq]; exact Nat.mod_lt _ (by norm_num)) h.1).elim


include hT in
/-- **The children loop.** Every completion whose smallest new label lies in `[l, l + cnt)` reaches a delegated state. -/
theorem kids_sound (ih : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool)
    (hih : ∀ d pos pl MV MVR UF UFR S, ih d pos pl MV MVR UF UFR S = true → NInv x d pos pl MV MVR UF UFR → Reach x H)
    {d pos pl : ℕ} {u : ℕ → ℕ} (hu : ∀ j < 127, u j ≤ 2 ^ 32) (hc : Cmpl x d pos pl u) (hpl : pl < 2 ^ (7 * d)) :
    ∀ cnt l S, E1.kids ih C RTb H cnt d pl (V (multR d pl)) (VR (multR d pl)) (V u) (VR u) l S = true →
      pos ≤ l → l + cnt ≤ C.N → ∀ ls, l ≤ ls → ls < l + cnt → (∀ j < ls, x j = multR d pl j) → multR d pl ls < x ls →
      Reach x H := by
  intro cnt
  induction cnt with
  | zero => intro l S _ _ _ ls h1 h2; omega
  | succ cnt ihc =>
    intro l S h hpos hN ls h1 h2 hmin hlt
    rw [kids_succ] at h
    obtain ⟨⟨S', hS'⟩, hcur⟩ := kidStep_sound hg hT ih hih hu hc hpl _ l S hpos (by omega) h
    rcases (by omega : ls = l ∨ l < ls) with rfl | hlt'
    · exact hcur hmin hlt
    · exact ihc (l + 1) S' hS' (by omega) (by omega) ls (by omega) (by omega) hmin hlt

/-- weak duality for a completion: `∑ m t + SC (R - d) + (t_{l0} - SC)(x_{l0} - m_{l0}) ≤ ∑ Y cap + deficit` -/
theorem wd_full {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) (t : ℕ → ℕ) (BC : ℕ)
    (hBC : ∑ l ∈ range 127, t l * x l ≤ BC) (l0 : ℕ) (hl0 : l0 < 127) :
    ∑ l ∈ range 127, multR d pl l * t l + 2 ^ 30 * (C.R - d) + (t l0 - 2 ^ 30) * (x l0 - multR d pl l0) ≤
      BC + ∑ l ∈ range 127, (if pos ≤ l then u l * (2 ^ 30 - t l) else 0) := by
  have h := wd_bound x (multR d pl) u t pos l0 hl0 (fun l _ => hc.1 l) hc.2.1 hc.2.2.2
  rw [hg.xR, m_sum hg hc] at h
  have e : ∑ l ∈ range 127, multR d pl l * t l = ∑ l ∈ range 127, t l * multR d pl l :=
    Finset.sum_congr rfl (fun l _ => mul_comm _ _)
  rw [e]; omega

/-- the packed deficit and dot product of a node -/
theorem node_sums {d pos pl : ℕ} {u : ℕ → ℕ} (hu : ∀ j < 127, u j ≤ 2 ^ 32) (hc : Cmpl x d pos pl u)
    (t : ℕ → ℕ) (ht : ∀ l < 127, t l < 2 ^ 42) (lo : ℕ) :
    E1.deficit (V t) (VR u) lo = ∑ l ∈ range 127, (if lo ≤ l then u l * (2 ^ 30 - t l) else 0) ∧
    E1.dot (VR (multR d pl)) (V t) = ∑ l ∈ range 127, multR d pl l * t l := by
  constructor
  · exact deficit_eq t u (2 ^ 32) (fun l hl => lt_trans (ht l hl) (by norm_num)) hu (by norm_num) lo
  · exact dot_VR_V _ t 31 (2 ^ 42) (fun l _ => m_le hg hc l) (fun l hl => le_of_lt (ht l hl)) (by norm_num)

theorem leaf_mult {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) (hd : d = C.R) : ∀ l, multR C.R pl l = x l := by
  subst hd
  have hle : ∀ l ∈ range 127, multR C.R pl l ≤ x l := fun l _ => hc.1 l
  have heq := (Finset.sum_eq_sum_iff_of_le hle).mp (by rw [m_sum hg hc, hg.xR])
  intro l
  by_cases hl : l < 127
  · exact heq l (Finset.mem_range.mpr hl)
  · have := hg.N_le
    rw [m_zero hg hc l (by omega), hg.xN l (by omega)]

/-- weak duality with an explicit lower bound `lo` on the new labels -/
theorem wd_lo {d pos pl : ℕ} {u : ℕ → ℕ} (hc : Cmpl x d pos pl u) (t : ℕ → ℕ) (BC : ℕ)
    (hBC : ∑ l ∈ range 127, t l * x l ≤ BC) (lo : ℕ) (hlo : ∀ j < lo, x j = multR d pl j) :
    ∑ l ∈ range 127, multR d pl l * t l + 2 ^ 30 * (C.R - d) ≤
      BC + ∑ l ∈ range 127, (if lo ≤ l then u l * (2 ^ 30 - t l) else 0) := by
  have h := wd_bound x (multR d pl) u t lo 0 (by norm_num) (fun l _ => hc.1 l) hlo hc.2.2.2
  rw [hg.xR, m_sum hg hc] at h
  have e : ∑ l ∈ range 127, multR d pl l * t l = ∑ l ∈ range 127, t l * multR d pl l :=
    Finset.sum_congr rfl (fun l _ => mul_comm _ _)
  rw [e]; omega

include hT in
/-- **Branch coverage.** With the node dual, the budgets after fixings, the cut and the children loop accepted, every
completion reaches a delegated state. -/
theorem branch_cover (ih : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool)
    (hih : ∀ d pos pl MV MVR UF UFR S, ih d pos pl MV MVR UF UFR S = true → NInv x d pos pl MV MVR UF UFR → Reach x H)
    {d pos pl : ℕ} {u' : ℕ → ℕ} (hu' : ∀ j < 127, u' j ≤ 2 ^ 32) (hc' : Cmpl x d pos pl u') (hpl : pl < 2 ^ (7 * d))
    (hrem : 1 ≤ C.R - d) (cut kind cj : ℕ) (hkind : kind < 4) (hd : Bool) (BC : ℕ) (t : ℕ → ℕ)
    (ht : ∀ l < 127, t l < 2 ^ 42) (hBC : ∑ l ∈ range 127, t l * x l ≤ BC) (S5 T UF' UFR' : ℕ)
    (eT : T = V t) (eUF : UF' = V u') (eUFR : UFR' = VR u')
    (hcut : E1.cutOK C RTb kind cut cj (Nat.sub C.R d) (V (multR d pl)) UF' hd BC T UFR'
      (Nat.add (Nat.mul (Nat.sub C.R d) E1.SC) (E1.dot (VR (multR d pl)) T)) = true)
    (hkids : E1.kids ih C RTb H (Nat.sub (@Bool.rec (fun _ => ℕ) cut C.N (Nat.ble C.N cut)) pos) d pl
      (V (multR d pl)) (VR (multR d pl)) UF' UFR' pos S5 = true) : Reach x H := by
  rw [eUF, eUFR] at hkids
  rw [eUF] at hcut
  have hN := hg.N_le
  obtain ⟨ls, hls1, hls2, hmin, hlt⟩ := minAdd hg hc' hrem
  generalize htop : @Bool.rec (fun _ => ℕ) cut C.N (Nat.ble C.N cut) = top at hkids
  have htop' : top = if C.N ≤ cut then C.N else cut := by
    rw [← htop]
    by_cases hle : C.N ≤ cut
    · rw [if_pos hle, show Nat.ble C.N cut = true from Nat.ble_eq.mpr hle]
    · rw [if_neg hle, show Nat.ble C.N cut = false from by
        cases hb : Nat.ble C.N cut
        · rfl
        · exact absurd (Nat.ble_eq.mp hb) hle]
  by_cases hls : ls < top
  · have htopN : top ≤ C.N := by rw [htop']; split <;> omega
    exact kids_sound hg hT ih hih hu' hc' hpl (Nat.sub top pos) pos S5 hkids le_rfl
      (by rw [Nat.sub_eq]; omega) ls hls1 (by rw [Nat.sub_eq]; omega) hmin hlt
  · -- every new label is `≥ cut < N`
    have hcutN : ¬ (C.N ≤ cut) := by intro hle; rw [htop', if_pos hle] at hls; omega
    have htc : top = cut := by rw [htop', if_neg hcutN]
    have hcx : ∀ j < cut, x j = multR d pl j := fun j hj => hmin j (by omega)
    have hm40 : ∀ i < 127, multR d pl i ≤ 2 ^ 40 := fun i _ => le_trans (m_le hg hc' i) (by norm_num)
    rcases (by omega : kind = 0 ∨ kind = 1 ∨ kind = 2 ∨ kind = 3) with rfl | rfl | rfl | rfl
    · rw [cutOK_G, cutOKG_0] at hcut
      exact absurd (Nat.ble_eq.mp hcut) hcutN
    · rw [cutOK_G, cutOKG_1] at hcut
      obtain ⟨hn1, hn2⟩ := band_true hcut
      have hv := hT cj
      generalize hvd : RTb / 2 ^ (264 * cj) % 2 ^ 264 = v at hv
      rw [land_eq, rmask_eq, rcap_eq, hvd, fsum_and_fmask _ hm40 _ (smask_lt v)] at hn1 hn2
      rw [wout_eq u' hu' _ cut (smask_lt v)] at hn2
      have := total_out_le hg hc' cut (smask v) (scap v) hv.1 hcx
      rw [Nat.ble_eq] at hn1
      rw [Nat.blt_eq] at hn2
      simp only [Nat.sub_eq, Nat.add_eq] at hn1 hn2
      omega
    · rw [cutOK_G, cutOKG_2, wout0_eq u' hu', Nat.blt_eq] at hcut
      have := total_le hg hc' cut hcx
      rw [Nat.sub_eq] at hcut
      omega
    · rw [cutOK_G, cutOKG_3] at hcut
      obtain ⟨-, hk⟩ := band_true hcut
      rw [eT, eUFR] at hk
      rw [(node_sums hg hu' hc' t ht cut).1, (node_sums hg hu' hc' t ht cut).2, Nat.blt_eq] at hk
      have := wd_lo hg hc' t BC hBC cut hcx
      simp only [Nat.add_eq, Nat.mul_eq, Nat.sub_eq, E1.SC] at hk
      norm_num at this hk
      omega


include hT in
/-- **Branch nodes.** -/
theorem branch_node (ih : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool)
    (hih : ∀ d pos pl MV MVR UF UFR S, ih d pos pl MV MVR UF UFR S = true → NInv x d pos pl MV MVR UF UFR → Reach x H)
    {d pos pl : ℕ} {u : ℕ → ℕ} (hu : ∀ j < 127, u j ≤ 2 ^ 32) (hc : Cmpl x d pos pl u) (hpl : pl < 2 ^ (7 * d))
    (hrem : 1 ≤ C.R - d) (S1 : ℕ)
    (h : E1.branchT ih C RTb H d pos pl (V (multR d pl)) (VR (multR d pl)) (VR u) (Nat.sub C.R d) (E1.rd 7 S1)
      (E1.rd 2 (E1.sk 7 S1)) (E1.rd 12 (E1.sk 9 S1)) (E1.brHd S1) (E1.brDu RTb S1)
      (@Bool.rec (fun _ => Bool × ℕ × ℕ × ℕ) (true, V u, VR u, E1.brS4 S1)
        (E1.fixes (E1.rd 7 (E1.brDu RTb S1).2.2) (E1.brDu RTb S1).2.1
          (Nat.sub (Nat.add (E1.brDu RTb S1).1 (E1.deficit (E1.brDu RTb S1).2.1 (VR u) pos))
            (Nat.add (Nat.mul (Nat.sub C.R d) E1.SC) (E1.dot (VR (multR d pl)) (E1.brDu RTb S1).2.1)))
          (V u) (VR u) (E1.sk 7 (E1.brDu RTb S1).2.2))
        (E1.brHd S1)) = true) : Reach x H := by
  have hub : ∀ j < 127, u j < 2 ^ 128 := fun j hj => lt_of_le_of_lt (hu j hj) (by norm_num)
  have hdu := brDu_eq RTb S1
  have hkind : E1.rd 2 (E1.sk 7 S1) < 4 := by rw [rd_eq]; exact Nat.mod_lt _ (by norm_num)
  generalize E1.rd 2 (E1.sk 7 S1) = kind at h hkind
  generalize E1.brHd S1 = hd at h hdu
  generalize E1.brDu RTb S1 = du at h hdu
  generalize hfx : @Bool.rec (fun _ => Bool × ℕ × ℕ × ℕ) (true, V u, VR u, E1.brS4 S1)
      (E1.fixes (E1.rd 7 du.2.2) du.2.1
        (Nat.sub (Nat.add du.1 (E1.deficit du.2.1 (VR u) pos)) (Nat.add (Nat.mul (Nat.sub C.R d) E1.SC) (E1.dot (VR (multR d pl)) du.2.1)))
        (V u) (VR u) (E1.sk 7 du.2.2)) hd = fx at h
  unfold E1.branchT at h
  obtain ⟨hA, h⟩ := band_true h
  obtain ⟨hB, h⟩ := band_true h
  obtain ⟨hcut, hkids⟩ := band_true h
  obtain ⟨BC, T, S6⟩ := du
  obtain ⟨ok, UF', UFR', S5⟩ := fx
  dsimp only at hA hB hcut hkids hfx
  have hmd : ∀ l < 127, multR d pl l ≤ 31 := fun l _ => m_le hg hc l
  cases hd
  · -- no node dual
    dsimp only at hdu hfx
    simp only [Prod.mk.injEq] at hdu hfx
    obtain ⟨rfl, rfl, rfl⟩ := hdu
    obtain ⟨-, rfl, rfl, rfl⟩ := hfx
    exact branch_cover hg hT ih hih hu hc hpl hrem _ kind _ hkind false 0 (fun _ => 0) (fun _ _ => by norm_num)
      (by simp) _ 0 (V u) (VR u) V_zero.symm rfl rfl hcut hkids
  · -- node dual and fixings
    dsimp only at hdu hfx hA
    obtain ⟨t, et, ht, hBC⟩ := rdual_sem x RTb hT (E1.rd 6 (E1.brS4 S1)) (E1.sk 6 (E1.brS4 S1))
      (by rw [rd_eq]; exact Nat.mod_lt _ (by norm_num))
    have eT : T = (E1.rdual RTb (E1.rd 6 (E1.brS4 S1)) (E1.sk 6 (E1.brS4 S1))).2.1 := congrArg (fun p => p.2.1) hdu
    have eBC : BC = (E1.rdual RTb (E1.rd 6 (E1.brS4 S1)) (E1.sk 6 (E1.brS4 S1))).1 := congrArg (fun p => p.1) hdu
    rw [et] at eT
    rw [← eBC] at hBC
    rw [eT] at hA hfx hcut
    have hsums := node_sums hg hu hc t ht pos
    rw [hsums.1, hsums.2] at hA
    rw [hsums.1, hsums.2] at hfx
    rw [Nat.ble_eq] at hA
    simp only [Nat.add_eq, Nat.mul_eq, Nat.sub_eq] at hA hfx
    -- the fixings are valid
    have hfix : FixOK x (multR d pl) t
        (BC + ∑ l ∈ range 127, (if pos ≤ l then u l * (2 ^ 30 - t l) else 0) -
          ((C.R - d) * E1.SC + ∑ l ∈ range 127, multR d pl l * t l)) := by
      intro l hl ν h1 h2
      have hw := wd_full hg hc t BC hBC l hl
      by_contra hne
      have hge : ν + 1 ≤ x l - multR d pl l := by omega
      have h3 := Nat.mul_le_mul_left (t l - 2 ^ 30) hge
      rw [SC_eq] at h2
      have h4 : (ν + 1) * (t l - 2 ^ 30) = (t l - 2 ^ 30) * (ν + 1) := mul_comm _ _
      norm_num at hw h2 h3 h4
      omega
    rw [fixes_eq] at hfx
    have hfx1 := congrArg (fun p => p.1) hfx
    have hfx2 := congrArg (fun p => p.2.1) hfx
    have hfx3 := congrArg (fun p => p.2.2.1) hfx
    dsimp only at hfx1 hfx2 hfx3
    rw [hB] at hfx1
    obtain ⟨-, u', e1, e2, hu'1, hu'2⟩ := fixes_sem x (multR d pl) t _ hfix
      (fun l hl => lt_trans (ht l hl) (by norm_num)) _ true u _ hub hfx1
    rw [hfx2] at e1
    rw [hfx3] at e2
    have hc' : Cmpl x d pos pl u' := ⟨hc.1, hc.2.1, hc.2.2.1, hu'2 hc.2.2.2⟩
    exact branch_cover hg hT ih hih (fun j hj => le_trans (hu'1 j hj) (hu j hj)) hc' hpl hrem _ kind _ hkind true BC t ht
      hBC S5 (V t) UF' UFR' rfl e1 e2 hcut hkids

include hT in
/-- the leaf and kill cases of a node -/
theorem nodeStep_sound (ih : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool)
    (hih : ∀ d pos pl MV MVR UF UFR S, ih d pos pl MV MVR UF UFR S = true → NInv x d pos pl MV MVR UF UFR → Reach x H)
    (d pos pl MV MVR UF UFR S : ℕ) (h : E1.nodeStep C RTb H ih d pos pl MV MVR UF UFR S = true)
    (hinv : NInv x d pos pl MV MVR UF UFR) : Reach x H := by
  obtain ⟨u, hMV, hMVR, hUF, hUFR, hu, hc, hpl⟩ := hinv
  have hdR := d_le hg hc
  have hR := hg.xR
  have hub : ∀ j < 127, u j < 2 ^ 128 := fun j hj => lt_of_le_of_lt (hu j hj) (by norm_num)
  unfold E1.nodeStep at h
  have htag : E1.rd 2 S < 4 := by rw [rd_eq]; exact Nat.mod_lt _ (by norm_num)
  generalize E1.rd 2 S = tag at h htag
  rcases (by omega : tag = 0 ∨ tag = 1 ∨ tag = 2 ∨ tag = 3) with rfl | rfl | rfl | rfl
  · -- leaf
    rw [show Nat.beq 0 0 = true from rfl] at h
    dsimp only at h
    obtain ⟨h1, h2⟩ := band_true h
    have hd : d = C.R := by have := Nat.eq_of_beq_eq_true h1; rw [Nat.sub_eq] at this; omega
    exact (hg.leaf pl _ (leaf_mult hg hc hd) h2).elim
  · -- kill
    rw [show Nat.beq 1 0 = false from rfl, show Nat.beq 1 1 = true from rfl] at h
    dsimp only at h
    obtain ⟨h1, h2⟩ := band_true h
    obtain ⟨t, et, ht, hBC⟩ := rdual_sem x RTb hT (E1.rd 6 (E1.sk 2 S)) (E1.sk 6 (E1.sk 2 S))
      (by rw [rd_eq]; exact Nat.mod_lt _ (by norm_num))
    generalize E1.rdual RTb (E1.rd 6 (E1.sk 2 S)) (E1.sk 6 (E1.sk 2 S)) = du at h2 et hBC
    rw [et, hUFR, hMVR, (node_sums hg hu hc t ht pos).1, (node_sums hg hu hc t ht pos).2, Nat.blt_eq] at h2
    have := wd_full hg hc t du.1 hBC 0 (by norm_num)
    simp only [Nat.add_eq, Nat.mul_eq, Nat.sub_eq, E1.SC] at h2
    have hx0 := Nat.zero_le ((t 0 - 2 ^ 30) * (x 0 - multR d pl 0))
    norm_num at this hx0 h2
    omega
  · -- branch
    rw [show Nat.beq 2 0 = false from rfl, show Nat.beq 2 1 = false from rfl] at h
    dsimp only at h
    obtain ⟨h1, h2⟩ := band_true h
    rw [hMV, hMVR, hUF, hUFR] at h2
    exact branch_node hg hT ih hih hu hc hpl (by have := Nat.ble_eq.mp h1; rw [Nat.sub_eq] at this; omega) _ h2
  · rw [show Nat.beq 3 0 = false from rfl, show Nat.beq 3 1 = false from rfl] at h
    dsimp only at h
    obtain ⟨h1, h2⟩ := band_true h
    rw [hMV, hMVR, hUF, hUFR] at h2
    exact branch_node hg hT ih hih hu hc hpl (by have := Nat.ble_eq.mp h1; rw [Nat.sub_eq] at this; omega) _ h2

include hT in
/-- **Node soundness.** An accepted node whose state `x` completes leads `x` to a delegated state of the block. -/
theorem node_sound (fuel : ℕ) : ∀ d pos pl MV MVR UF UFR S, E1.node C RTb H fuel d pos pl MV MVR UF UFR S = true →
    NInv x d pos pl MV MVR UF UFR → Reach x H := by
  induction fuel with
  | zero => intro d pos pl MV MVR UF UFR S h; rw [node_zero] at h; exact absurd h (by simp)
  | succ n ih =>
    intro d pos pl MV MVR UF UFR S h hinv
    rw [node_succ] at h
    exact nodeStep_sound hg hT (E1.node C RTb H n) ih d pos pl MV MVR UF UFR S h hinv

end kids

end E1S
