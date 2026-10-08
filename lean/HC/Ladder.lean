module
public import R22Port.U_d41d8cd98f00
public import HC.RRBridge
/-! # Ladder statements (RR's internal form, `R23.LB`) give `RT.Fact`

`LadderLB rows N` is the body of `FullTable.R23.LB` (R23/Base.lean, the census framework of DESIGN 19): every rank-1 sum list
equal to `matmulT` has at least `N` terms whose first factor is outside `span rows` (`inSpanB`).  `fact_of_ladder`: for a
reduced row list and a point mask `m ⊆ span rows`, `LadderLB rows N → RT.Fact m N`.  So the census route's
`R23.C<c>.lower : R23.LB rowsE lb` discharges the first disjunct of `HC.RaiseCert` (unfold `R23.LB`; the bodies are the
same term). -/
@[expose] public section
open FullTable FullTable.WangLadder RootSound

namespace HC

def LadderLB (rows : List Nat) (N : Nat) : Prop :=
  ∀ L : List (Nat × Nat × Nat), (∀ t ∈ L, t.1 < 512) → rank1sum L = matmulT →
    N ≤ (L.filter fun t => !(inSpanB rows t.1)).length

theorem span_of_mem : ∀ {l : List Nat} {x : Nat}, x ∈ l → Span l x
  | [], _, h => absurd h List.not_mem_nil
  | y :: l, x, h => by
    rcases List.mem_cons.mp h with e | e
    · rw [e]; exact span_head y l
    · exact span_cons y (span_of_mem e)

/-- **A ladder bound gives `RT.Fact` for every point mask inside the rows' span.** -/
theorem fact_of_ladder {rows : List Nat} {N : Nat} (hred : rows.all (fun r => redBy rows r == 0) = true)
    (hsmall : ∀ r ∈ rows, r < 512) (m : Nat) (hsub : subSpan m rows = true) (h : LadderLB rows N) : RT.Fact m N := by
  intro n av b c hav hd
  have hd' : IsDecomp (fun s => toM3 (av s)) (fun s => toM3 (encM (b s))) (fun s => toM3 (encM (c s))) := by
    simpa only [toM3_encM] using hd
  have hsum := rank1sum_of_isDecomp av (fun s => encM (b s)) (fun s => encM (c s)) hav (fun s => encM_lt _)
    (fun s => encM_lt _) hd'
  have hc := h _ (fun t ht => by obtain ⟨s, rfl⟩ := List.mem_ofFn.mp ht; exact hav s) hsum
  rw [length_filter_ofFn] at hc
  refine le_trans hc (Finset.card_le_card fun s hs => ?_)
  simp only [Finset.mem_filter, Finset.mem_univ, true_and, Bool.not_eq_true'] at hs ⊢
  cases e : m.testBit (av s)
  · rfl
  · exfalso
    have hspan : Span rows (av s) :=
      spanL_ind (Span rows) (span_zero rows) (fun x y _ _ hx hy => span_xor hx hy) rows
        (fun r hr => ⟨hsmall r hr, span_of_mem hr⟩) (av s) (hav s) (subSpan_spec hsub (av s) (hav s) e)
    rw [(inSpanB_iff hred (av s)).mpr hspan] at hs
    exact absurd hs (by decide)

end HC
