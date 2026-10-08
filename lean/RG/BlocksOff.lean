module
public import R22Port.U_d41d8cd98f00
public import RG.Blocks
/-! # RG.BlocksOff: `allL_blocks` for a table interval `[s, s + N)` (the L479 off-path levels: the indices between the on-path
children of a split node are contiguous intervals; each interval's root list is its own block list). -/
@[expose] public section
namespace E1NRG

theorem allL_blocks_off {P : Nat → Prop} {f : Nat → Nat} (s B N : Nat) (bl : List (List Nat)) (hB0 : 0 < B)
    (hlen : (N + B - 1) / B ≤ bl.length)
    (hb : ∀ j < (N + B - 1) / B, (List.range' (s + B * j) (min B (N - B * j))).map f = bl.getD j [])
    (h : R22N.AllL (fun l => R22N.AllL P l) bl) : ∀ k, s ≤ k → k < s + N → P (f k) := by
  intro k hk1 hk2
  have hb' : ∀ j < (N + B - 1) / B, (List.range' (B * j) (min B (N - B * j))).map (fun i => f (s + i)) = bl.getD j [] := by
    intro j hj
    rw [← hb j hj, ← List.map_add_range', List.map_map]
    rfl
  have := allL_blocks (P := P) (f := fun i => f (s + i)) B N bl hB0 hlen hb' h (k - s) (by omega)
  have e : s + (k - s) = k := by omega
  simpa [e] using this

end E1NRG
