module
public import R22Port.U_d41d8cd98f00
public import L5.Bind5O
@[expose] public section
set_option maxRecDepth 100000
/-! # The `--rord 321` label order as a revision-6a `LabelOrder` (G5)

`vec` = `RT.O321.vecL` (rank 3, then rank 2, then rank 1, by code within a rank; `#lab` md5 fe645fa2…), with decided facts:
nonzero and injective on labels (`vec321_fact`), ranks `rk321` (labels 0..167 rank 3, 168..461 rank 2, 462..510 rank 1:
`rk321_fact` against `rkOf`), prefix counts `cnt321` (`cnt321_fact`).  L3's canonical key is a parameter (`O321 key`).
`is321`: every `O321 key` is an `Is321` order, so `table_spec` / `bindQ_spec` of `L5.Bind5O` apply. -/
namespace L5O
open RootSound

/-- the ranks of `--rord 321` labels -/
def rk321 (l : ℕ) : ℕ := if l < 168 then 3 else if l < 462 then 2 else 1
/-- prefix counts of `rk321` -/
def cnt321 (r u : ℕ) : ℕ := if r = 3 then min u 168 else if r = 2 then min (u - 168) 294 else if r = 1 then u - 462 else 0

theorem vec321_fact : S5.allLT 511 (fun l => !(RT.O321.vecL l == 0) && S5.allLT l (fun k => !(RT.O321.vecL k == RT.O321.vecL l)))
    = true := by decide +kernel
theorem rk321_fact : S5.allLT 511 (fun l => rk321 l == rkOf (RT.O321.vecL l)) = true := by decide +kernel
theorem cnt321_fact : S5.allLT 511 (fun u => (cnt321 1 (u + 1) == cnt321 1 u + if rk321 u = 1 then 1 else 0) &&
    (cnt321 2 (u + 1) == cnt321 2 u + if rk321 u = 2 then 1 else 0) &&
    (cnt321 3 (u + 1) == cnt321 3 u + if rk321 u = 3 then 1 else 0)) = true := by decide +kernel

theorem vec321_ne (l : ℕ) (hl : l < 511) : RT.O321.vecL l ≠ 0 := by
  have h := S5.allLT_spec vec321_fact l hl
  simp only [Bool.and_eq_true, Bool.not_eq_true', beq_eq_false_iff_ne] at h
  exact h.1

theorem vec321_inj (k l : ℕ) (hk : k < 511) (hl : l < 511) (h : RT.O321.vecL k = RT.O321.vecL l) : k = l := by
  rcases Nat.lt_trichotomy k l with hkl | hkl | hkl
  · have h2 := S5.allLT_spec vec321_fact l hl
    simp only [Bool.and_eq_true, Bool.not_eq_true', beq_eq_false_iff_ne] at h2
    have h3 := S5.allLT_spec h2.2 k hkl
    simp only [Bool.not_eq_true', beq_eq_false_iff_ne] at h3
    exact absurd h h3
  · exact hkl
  · have h2 := S5.allLT_spec vec321_fact k hk
    simp only [Bool.and_eq_true, Bool.not_eq_true', beq_eq_false_iff_ne] at h2
    have h3 := S5.allLT_spec h2.2 l hkl
    simp only [Bool.not_eq_true', beq_eq_false_iff_ne] at h3
    exact absurd h.symm h3

/-- **the `--rord 321` order** (L3's key as a parameter) -/
def O321 (key : ℕ → ℕ) : R3RT.SpecO.LabelOrder where
  vec := RT.O321.vecL
  key := key
  rk := rk321
  cnt := cnt321
  vec_lt := fun l _ => RT.O321.vecL_lt l
  vec_ne := fun l hl => vec321_ne l hl
  vec_inj := fun k l hk hl h => vec321_inj k l hk hl h
  rk_spec := fun l hl => by have := S5.allLT_spec rk321_fact l hl; simpa using this
  cnt_zero := fun r h1 h3 => by unfold cnt321; interval_cases r <;> simp
  cnt_succ := fun r h1 h3 u hu => by
    have := S5.allLT_spec cnt321_fact u hu
    simp only [Bool.and_eq_true, beq_iff_eq] at this
    interval_cases r
    · exact this.1.1
    · exact this.1.2
    · exact this.2

theorem is321 (key : ℕ → ℕ) : Is321 (O321 key) := fun _ _ => rfl

/-- **G5 item 2/4, 321 side**: the per-job table check and the static-table binding for `O321 key` -/
theorem table_spec321 (key : ℕ → ℕ) :
    R3RT.SpecO.TableSpec (O321 key) R3RT.SpecO.ΩT rowE321 (RT.cLB RT.K3eD_Cls.CL) := table_spec (is321 key)
theorem bindQ_spec321 (key : ℕ → ℕ) :
    R3RT.SpecO.BindQSpec (O321 key) R3RT.SpecO.ΩT rowE321 (RT.cLB RT.K3eD_Cls.CL) := bindQ_spec (is321 key)

end L5O
