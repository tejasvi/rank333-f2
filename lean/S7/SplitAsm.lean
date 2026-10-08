module
public import R22Port.U_d41d8cd98f00
public import S7.Split
/-! # Assembling a split leaf from chunked sub-record checks

`subsChk R paths certs a m`: the sub-records `a .. a+m-1` (path `paths[k]`, certificate `certs[k]`) pass.  Checked by `decide`
in chunks of bounded size and joined (`subsChk_join`); `leafSplit_sound'` gives the leaf theorem. -/
@[expose] public section
namespace S7X
open BC4 BC5 BC6 BC6s BC7s BC7x S5 S6 S7

noncomputable def subsChk (R : Nat) (paths : List (List Step)) (certs : List Nat) (a m : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun k b => b && subOK R (paths.getD (a + k) []) (certs.getD (a + k) 0)) m

theorem subsChk_join (R : Nat) (paths : List (List Step)) (certs : List Nat) (a m k : Nat)
    (h1 : subsChk R paths certs a m = true) (h2 : subsChk R paths certs (a + m) k = true) :
    subsChk R paths certs a (m + k) = true := by
  induction k with
  | zero => exact h1
  | succ k ih =>
    have h2' : (subsChk R paths certs (a + m) k && subOK R (paths.getD (a + m + k) []) (certs.getD (a + m + k) 0)) = true := h2
    rw [Bool.and_eq_true] at h2'
    show (subsChk R paths certs a (m + k) && subOK R (paths.getD (a + (m + k)) []) (certs.getD (a + (m + k)) 0)) = true
    rw [Bool.and_eq_true, ← Nat.add_assoc]; exact ⟨ih h2'.1, h2'.2⟩

theorem subsChk_spec (R : Nat) (paths : List (List Step)) (certs : List Nat) (m : Nat) (h : subsChk R paths certs 0 m = true) :
    ∀ k < m, subOK R (paths.getD k []) (certs.getD k 0) = true := by
  induction m with
  | zero => intro k hk; omega
  | succ m ih =>
    intro k hk
    have h' : (subsChk R paths certs 0 m && subOK R (paths.getD (0 + m) []) (certs.getD (0 + m) 0)) = true := h
    rw [Bool.and_eq_true, Nat.zero_add] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hk with hlt | rfl
    · exact ih h'.1 k hlt
    · exact h'.2

/-- **Split leaf, assembled.** -/
theorem leafSplit_sound' (R : Nat) (paths : List (List Step)) (certs : List Nat) (hlen : paths.length = certs.length)
    (hmain : leafSX R paths = true) (hsubs : subsChk R paths certs 0 paths.length = true) :
    NoDecomp (leafT R) (leafN R) (leafDom6 R) := by
  have hmap : (paths.zip certs).map Prod.fst = paths := List.map_fst_zip (by omega)
  refine leafSplit_sound R (paths.zip certs) (by rw [hmap]; exact hmain) (fun q hq => ?_)
  obtain ⟨k, hk, hq'⟩ := List.getElem_of_mem hq
  have hk' : k < paths.length := by simp at hk; omega
  have hs := subsChk_spec R paths certs _ hsubs k hk'
  rw [← hq', List.getElem_zip]
  rw [List.getD_eq_getElem _ _ hk', List.getD_eq_getElem _ _ (by omega)] at hs
  exact hs

end S7X
