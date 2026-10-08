module
public import R22Port.U_d41d8cd98f00
public import E1.Bridge3
public import S7.SplitAsm
/-! # External leaves of an E1 instance

With `C.EXT` nonempty, `E1.e1_sound` asks for `hext : ∀ pl ∈ C.EXT, LeafND C pl`: the leaf of label sequence `pl` (its record
header: `R`, the terms of `pl`, `DOM`) has no decomposition.  The certificate does not enter the header (`leafN_rec`,
`leafT_rec`, `leafDom_rec`), so any accepted record of `pl` gives it:
* `leafND_of_leafS`: a monolithic v7 leaf record (checked in chunks by `extChk`);
* `leafND_of_split`: a split leaf (main record and sub-records, `S7X.leafSplit_sound'`). -/
@[expose] public section
namespace E1S

/-- the obligation of an external leaf `pl` -/
def LeafND (C : E1.Ctx) (pl : ℕ) : Prop :=
  S5.NoDecomp (S5.leafT (E1.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1.leafRec C.R C.VT C.DOM pl 0))
    (S6.leafDom6 (E1.leafRec C.R C.VT C.DOM pl 0))

theorem leafND_of_nd (C : E1.Ctx) (hR : C.R < 64) (hDOM : C.DOM < 2 ^ 512) (pl cert : ℕ)
    (h : S5.NoDecomp (S5.leafT (E1.leafRec C.R C.VT C.DOM pl cert)) (S5.leafN (E1.leafRec C.R C.VT C.DOM pl cert))
      (S6.leafDom6 (E1.leafRec C.R C.VT C.DOM pl cert))) : LeafND C pl := by
  unfold LeafND
  rw [leafN_rec _ _ _ _ _ hR hDOM, leafT_rec _ _ _ _ _ hR hDOM, leafDom_rec _ _ _ _ _ hR hDOM] at h ⊢
  exact h

theorem leafND_of_leafS (C : E1.Ctx) (hR : C.R < 64) (hDOM : C.DOM < 2 ^ 512) (pl cert : ℕ)
    (h : BC7.leafS (E1.leafRec C.R C.VT C.DOM pl cert) = true) : LeafND C pl :=
  leafND_of_nd C hR hDOM pl cert (S7.leafS7_sound _ (by rw [← R7.leafS7_ref]; exact h))

/-- a split leaf: its main record `R0` is a leaf record of `pl` -/
theorem leafND_of_split (C : E1.Ctx) (hR : C.R < 64) (hDOM : C.DOM < 2 ^ 512) (pl R0 : ℕ)
    (hR0 : R0 = E1.leafRec C.R C.VT C.DOM pl (R0 >>> (520 + 9 * C.R)))
    (h : S5.NoDecomp (S5.leafT R0) (S5.leafN R0) (S6.leafDom6 R0)) : LeafND C pl := by
  generalize R0 >>> (520 + 9 * C.R) = cert at hR0
  subst hR0
  exact leafND_of_nd C hR hDOM pl cert h

/-- monolithic external leaves `C.EXT[off + a + k]` (`k < m`) with certificates `certs[a + k]` pass -/
noncomputable def extChk (C : E1.Ctx) (off : ℕ) (certs : List ℕ) (a m : ℕ) : Bool :=
  Nat.rec (motive := fun _ => Bool) true
    (fun k b => b && BC7.leafS (E1.leafRec C.R C.VT C.DOM (C.EXT.getD (off + (a + k)) 0) (certs.getD (a + k) 0))) m

theorem extChk_join (C : E1.Ctx) (off : ℕ) (certs : List ℕ) (a m k : ℕ) (h1 : extChk C off certs a m = true)
    (h2 : extChk C off certs (a + m) k = true) : extChk C off certs a (m + k) = true := by
  induction k with
  | zero => exact h1
  | succ k ih =>
    have h2' : (extChk C off certs (a + m) k &&
        BC7.leafS (E1.leafRec C.R C.VT C.DOM (C.EXT.getD (off + (a + m + k)) 0) (certs.getD (a + m + k) 0))) = true := h2
    rw [Bool.and_eq_true] at h2'
    show (extChk C off certs a (m + k) &&
      BC7.leafS (E1.leafRec C.R C.VT C.DOM (C.EXT.getD (off + (a + (m + k))) 0) (certs.getD (a + (m + k)) 0))) = true
    rw [Bool.and_eq_true, show a + (m + k) = a + m + k from (Nat.add_assoc a m k).symm]; exact ⟨ih h2'.1, h2'.2⟩

theorem extChk_spec (C : E1.Ctx) (off : ℕ) (certs : List ℕ) (m : ℕ) (h : extChk C off certs 0 m = true) :
    ∀ k < m, BC7.leafS (E1.leafRec C.R C.VT C.DOM (C.EXT.getD (off + k) 0) (certs.getD k 0)) = true := by
  induction m with
  | zero => intro k hk; omega
  | succ m ih =>
    intro k hk
    have h' : (extChk C off certs 0 m &&
        BC7.leafS (E1.leafRec C.R C.VT C.DOM (C.EXT.getD (off + (0 + m)) 0) (certs.getD (0 + m) 0))) = true := h
    rw [Bool.and_eq_true, Nat.zero_add] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hk with hlt | rfl
    · exact ih h'.1 k hlt
    · exact h'.2

/-- **all external leaves**: the first `s` by their own theorems (split leaves), the rest by monolithic chunks -/
theorem hext_of (C : E1.Ctx) (hR : C.R < 64) (hDOM : C.DOM < 2 ^ 512) (s : ℕ) (certs : List ℕ)
    (hsplit : ∀ k < s, LeafND C (C.EXT.getD k 0)) (hlen : C.EXT.length = s + certs.length)
    (hmono : extChk C s certs 0 certs.length = true) : ∀ pl ∈ C.EXT, LeafND C pl := by
  intro pl hpl
  obtain ⟨k, hk, rfl⟩ := List.getElem_of_mem hpl
  have hg : C.EXT.getD k 0 = C.EXT[k] := List.getD_eq_getElem _ _ hk
  by_cases hks : k < s
  · rw [← hg]; exact hsplit k hks
  · have := extChk_spec C s certs _ hmono (k - s) (by omega)
    rw [show s + (k - s) = k by omega, hg] at this
    exact leafND_of_leafS C hR hDOM _ _ this

end E1S
