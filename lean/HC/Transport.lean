module
public import R22Port.U_d41d8cd98f00
public import RT.Sound
/-! # Transport of a class bound along a symmetry (flag 3 of `leaf2/HCLS.md`)

`fact_transport`: if `h = (t, P, Q)` (prof7's group, `C3.actN`, `P`, `Q` invertible) maps every point of `m'` into `m`, then
`RT.Fact m k → RT.Fact m' k`.  Proof as in `RT.entry_sound`: `h` maps each decomposition to a decomposition
(`C3.isDecomp_actN`), and a term whose image lies outside `m` lies outside `m'`.

`mapsTo t P Q m m'` checks the hypothesis on all 512 codes (a `Bool` for `decide`); `mapsTo_spec` turns it into the
hypothesis.  With the identity (`t = false`, `P = Q = 273`) this is `RT.fact_mono` for `k' = k`. -/
@[expose] public section
namespace HC
open RT RootSound

/-- `h = (t, P, Q)` maps every point of `m'` (below 512) into `m` -/
def mapsToN (t : Bool) (P Q m m' n : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun w b => b && (!m'.testBit w || m.testBit (C3.actN t P Q w))) n

def mapsTo (t : Bool) (P Q m m' : Nat) : Bool := mapsToN t P Q m m' 512

theorem mapsTo_rec (t : Bool) (P Q m m' : Nat) (n : Nat) (h : mapsToN t P Q m m' n = true) :
    ∀ w < n, m'.testBit w = true → m.testBit (C3.actN t P Q w) = true := by
  unfold mapsToN at h
  induction n with
  | zero => intro w hw; exact absurd hw (Nat.not_lt_zero w)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true
        (fun w b => b && (!m'.testBit w || m.testBit (C3.actN t P Q w))) n &&
        (!m'.testBit n || m.testBit (C3.actN t P Q n))) = true := h
    rw [Bool.and_eq_true] at h'
    intro w hw hm
    rcases Nat.lt_succ_iff_lt_or_eq.mp hw with hlt | heq
    · exact ih h'.1 w hlt hm
    · subst heq
      have h2 := h'.2
      rw [hm] at h2
      simpa using h2

theorem mapsTo_spec {t : Bool} {P Q m m' : Nat} (h : mapsTo t P Q m m' = true) :
    ∀ w < 512, m'.testBit w = true → m.testBit (C3.actN t P Q w) = true := by
  exact mapsTo_rec t P Q m m' 512 h

/-- **Transport.** -/
theorem fact_transport {m m' k : Nat} {t : Bool} {P Q : Nat} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true)
    (hmap : ∀ w < 512, m'.testBit w = true → m.testBit (C3.actN t P Q w) = true) (h : Fact m k) : Fact m' k := by
  intro n av b c hav hd
  obtain ⟨b', c', hd'⟩ := C3.isDecomp_actN (t := t) hd hP hQ
  have hk := h n (fun s => C3.actN t P Q (av s)) b' c' (fun s => C3.actN_lt _ _ _ _) hd'
  refine le_trans hk (Finset.card_le_card ?_)
  intro s hs
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  cases e : m'.testBit (av s)
  · rfl
  · rw [hmap _ (hav s) e] at hs; exact absurd hs (by decide)

/-- transport with a checked `mapsTo` -/
theorem fact_transport' {m m' k : Nat} {t : Bool} {P Q : Nat} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true)
    (hmap : mapsTo t P Q m m' = true) (h : Fact m k) : Fact m' k :=
  fact_transport hP hQ (mapsTo_spec hmap) h

end HC
