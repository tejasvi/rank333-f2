module
public import R22Port.U_1220ddfa2eb4
public import R22N.Glue
/-! # RG.Blocks: a table's first `N` entries are covered, from a covered list of key blocks (no long list anywhere)

A root list of tens of thousands of keys cannot be one literal (the elaborator's recursion limit; 37,363 keys fail even with
`maxRecDepth 100000`). The root lists are therefore blocks of `B` keys (`E1Roots.R<c>.blocks`, each block a short literal); the
glue proves `AllL (fun l => AllL P l) blocks`, and each block's table equation is one bounded `decide` where the table lives. -/
@[expose] public section
namespace E1NRG

theorem allL_getD' {α : Type} {P : α → Prop} {d : α} : ∀ {L : List α} (i : Nat), R22N.AllL P L → i < L.length → P (L.getD i d)
  | [], _, _, h => absurd h (Nat.not_lt_zero _)
  | _ :: _, 0, h, _ => h.1
  | _ :: l, i + 1, h, hi => allL_getD' (L := l) i h.2 (Nat.lt_of_succ_lt_succ hi)

theorem allL_blocks {P : Nat → Prop} {f : Nat → Nat} (B N : Nat) (bl : List (List Nat)) (hB0 : 0 < B)
    (hlen : (N + B - 1) / B ≤ bl.length)
    (hb : ∀ j < (N + B - 1) / B, (List.range' (B * j) (min B (N - B * j))).map f = bl.getD j [])
    (h : R22N.AllL (fun l => R22N.AllL P l) bl) : ∀ k < N, P (f k) := by
  intro k hk
  have hq : B * (k / B) ≤ k := Nat.mul_div_le k B
  have hr : k < B * (k / B) + B := by
    have := Nat.div_add_mod k B; have := Nat.mod_lt k hB0; omega
  have hj : k / B < (N + B - 1) / B := by
    rw [Nat.div_lt_iff_lt_mul hB0]
    have h1 := Nat.div_add_mod (N + B - 1) B
    have h2 := Nat.mod_lt (N + B - 1) hB0
    have h3 : (N + B - 1) / B * B = B * ((N + B - 1) / B) := Nat.mul_comm _ _
    omega
  have hblk : R22N.AllL P (bl.getD (k / B) []) := allL_getD' (k / B) h (Nat.lt_of_lt_of_le hj hlen)
  rw [← hb _ hj] at hblk
  apply R22N.allL_mem hblk
  apply List.mem_map.mpr
  refine ⟨k, ?_, rfl⟩
  rw [List.mem_range'_1]
  omega

end E1NRG
