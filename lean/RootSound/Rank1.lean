module
public import R22Port.U_6d73af0793e7
public import Mathlib
/-! # Rank-one updates: soundness of the rank-1 fast path of the branching checker v6

`BranchCheck6` (r22/lean/branch6) reads a claim on a functional `X` with exactly one assigned term `(a0, b0, c0)` through
`X` off the root record of `X`: the residual is `M' = M + b0 c0ᵀ` with `M = T(X)` (characteristic 2), and the root record
gives `M`'s rank, its column and row spaces (`lm`, `rm`) and a map `x = X *ᵥ ·` (`xof P`) inverting `M` on its column
space, with `g(c) = Xᵀ *ᵥ c` (`gof P`).  The checker's five cases (`rank1` in BranchCheck6/6d) are the five theorems below,
over any field of characteristic 2.  With `y0 = X *ᵥ b0`, `g0 = Xᵀ *ᵥ c0`:

| case | condition | rank `M'` | column space | row space | new inverse |
|---|---|---|---|---|---|
| `caseA` | `b0 ∈ col`, `c0 ∈ row`, `c0 ⬝ y0 = 1` | `r - 1` | `col ∩ {g0 ⬝ v = 0}` | `row ∩ {w ⬝ y0 = 0}` | `X` |
| `caseB` | `b0 ∈ col`, `c0 ∈ row`, `c0 ⬝ y0 = 0` | `r` | `col` | `row` | `X + y0 g0ᵀ` |
| `caseC` | `b0 ∈ col`, `M k = 0`, `c0 ⬝ k = 1` | `r` | `col` | `{u + (x0 ⬝ u) c0}` | `X + x0 g0ᵀ` |
| `caseD` | `c0 ∈ row`, `Mᵀ l = 0`, `b0 ⬝ l = 1` | `r` | `{u + (z ⬝ u) b0}` | `row` | `X + y0 zᵀ` |
| `caseE` | `M k = 0`, `c0 ⬝ k = 1`, `Mᵀ l = 0`, `b0 ⬝ l = 1` | `r + 1` | `col ⊔ ⟨b0⟩` | `row ⊔ ⟨c0⟩` | `X + b1 lᵀ + k g0ᵀ` |

(`x0` any preimage of `b0` with `c0 ⬝ x0 = 0`, e.g. `y0 + (c0 ⬝ y0) k`; `z` any preimage of `c0` under `Mᵀ` with
`b0 ⬝ z = 0`, e.g. `g0 + (g0 ⬝ b0) l`; `b1 = y0 + (1 + g0 ⬝ b0) k`.)  The rank equalities give the claims' `rk`, the
column/row descriptions are what the 512-bit masks of `rank1` enumerate (`trans S v = {s + v | s ∈ S}`), and the new
inverse is the folded correction `corrP` (`xof (corrP P A B) b = xof P b + <A, b> B`).  A record built this way satisfies
the hypothesis of `RootSound.delta_of_tight` (`Inv`), so record inheritance (Branch.lean) is unchanged. -/
@[expose] public section
open Matrix Module

set_option linter.unusedSectionVars false

namespace RootSound.Rank1

variable {K : Type*} [Field K] {m n : Type*} [Fintype m] [Fintype n] [DecidableEq m] [DecidableEq n]

/-- the column space of `M` -/
abbrev colSp (M : Matrix m n K) : Submodule K (m → K) := LinearMap.range M.mulVecLin

/-- `X` inverts `M` on its column space -/
def Inv (M : Matrix m n K) (X : Matrix n m K) : Prop := ∀ v ∈ colSp M, M *ᵥ (X *ᵥ v) = v

theorem mem_colSp {M : Matrix m n K} {v : m → K} : v ∈ colSp M ↔ ∃ u, M *ᵥ u = v := by
  simp [colSp, LinearMap.mem_range]

theorem rank_eq_finrank (M : Matrix m n K) : M.rank = finrank K (colSp M) := rfl

theorem mulVec_mem_colSp (M : Matrix m n K) (u : n → K) : M *ᵥ u ∈ colSp M := mem_colSp.2 ⟨u, rfl⟩

theorem inv_iff (M : Matrix m n K) (X : Matrix n m K) : Inv M X ↔ M * X * M = M := by
  constructor
  · intro h
    have key : ∀ u, (M * X * M) *ᵥ u = M *ᵥ u := by
      intro u
      rw [← Matrix.mulVec_mulVec, ← Matrix.mulVec_mulVec]
      exact h _ (mulVec_mem_colSp M u)
    ext i j
    have := congrFun (key (Pi.single j 1)) i
    simpa [Matrix.mulVec_single] using this
  · intro h v hv
    obtain ⟨u, rfl⟩ := mem_colSp.1 hv
    rw [Matrix.mulVec_mulVec, Matrix.mulVec_mulVec, h]

theorem inv_transpose {M : Matrix m n K} {X : Matrix n m K} (h : Inv M X) : Inv Mᵀ Xᵀ := by
  rw [inv_iff] at h ⊢
  rw [← Matrix.transpose_mul, ← Matrix.transpose_mul, ← Matrix.mul_assoc, h]

theorem inv_of_transpose {M : Matrix m n K} {X : Matrix n m K} (h : Inv Mᵀ Xᵀ) : Inv M X := by
  simpa using inv_transpose h

/-- `(Xᵀ c) ⬝ b = c ⬝ (X b)`: `gof` is the transpose of `xof` -/
theorem bilin (X : Matrix n m K) (c : n → K) (b : m → K) : (Xᵀ *ᵥ c) ⬝ᵥ b = c ⬝ᵥ (X *ᵥ b) := by
  rw [Matrix.mulVec_transpose, Matrix.dotProduct_mulVec]

/-- `g ⬝ (M u) = (Mᵀ g) ⬝ u` -/
theorem dot_mulVec (M : Matrix m n K) (g : m → K) (u : n → K) : g ⬝ᵥ (M *ᵥ u) = (Mᵀ *ᵥ g) ⬝ᵥ u := by
  rw [Matrix.dotProduct_mulVec, Matrix.mulVec_transpose]

theorem vecMulVec_mulVec' (u : m → K) (v w : n → K) : vecMulVec u v *ᵥ w = (v ⬝ᵥ w) • u := by
  ext i; simp [Matrix.vecMulVec, Matrix.mulVec, dotProduct, Finset.mul_sum, mul_comm, mul_left_comm]

/-- the residual after one assignment acts as `M u + (c0 ⬝ u) b0` -/
theorem upd_mulVec (M : Matrix m n K) (b0 : m → K) (c0 u : n → K) :
    (M + vecMulVec b0 c0) *ᵥ u = M *ᵥ u + (c0 ⬝ᵥ u) • b0 := by
  rw [Matrix.add_mulVec, vecMulVec_mulVec']

theorem upd_transpose (M : Matrix m n K) (b0 : m → K) (c0 : n → K) :
    (M + vecMulVec b0 c0)ᵀ = Mᵀ + vecMulVec c0 b0 := by
  rw [Matrix.transpose_add, Matrix.transpose_vecMulVec]

/-- vectors orthogonal to the left kernel vector `l` -/
theorem dot_colSp_of_left_ker {M : Matrix m n K} {l : m → K} (hl : Mᵀ *ᵥ l = 0) {v : m → K} (hv : v ∈ colSp M) :
    l ⬝ᵥ v = 0 := by
  obtain ⟨u, rfl⟩ := mem_colSp.1 hv
  rw [dot_mulVec, hl, zero_dotProduct]

/-- adding a vector outside a subspace raises the dimension by one -/
theorem finrank_sup_span {V : Type*} [AddCommGroup V] [Module K V] [FiniteDimensional K V] (S : Submodule K V) (w : V)
    (hw : w ∉ S) : finrank K ↥(S ⊔ K ∙ w) = finrank K S + 1 := by
  have hw0 : w ≠ 0 := fun h => hw (h ▸ S.zero_mem)
  have hinf : S ⊓ K ∙ w = ⊥ := by
    rw [eq_bot_iff]
    intro v hv
    obtain ⟨hvS, hvw⟩ := Submodule.mem_inf.1 hv
    obtain ⟨a, rfl⟩ := Submodule.mem_span_singleton.1 hvw
    by_cases ha : a = 0
    · simp [ha]
    · exact absurd (by simpa [ha] using S.smul_mem a⁻¹ hvS) hw
  have := Submodule.finrank_sup_add_finrank_inf_eq S (K ∙ w)
  rw [hinf, finrank_bot, add_zero, finrank_span_singleton hw0] at this
  exact this

section char2

variable [CharP K 2]

/-- **Case A** (`b0 ∈ col M`, `c0 ∈ row M`, `c0 ⬝ y0 = 1`), column side: the rank drops by one, `X` still inverts. -/
theorem caseA_col {M : Matrix m n K} {X : Matrix n m K} (hX : Inv M X) {b0 : m → K} {c0 : n → K}
    (hb : b0 ∈ colSp M) (hc : c0 ∈ colSp Mᵀ) (h1 : c0 ⬝ᵥ (X *ᵥ b0) = 1) :
    Inv (M + vecMulVec b0 c0) X ∧
      (∀ v, v ∈ colSp (M + vecMulVec b0 c0) ↔ v ∈ colSp M ∧ (Xᵀ *ᵥ c0) ⬝ᵥ v = 0) ∧
      (M + vecMulVec b0 c0).rank + 1 = M.rank := by
  set g0 := Xᵀ *ᵥ c0 with hg0def
  have hg : Mᵀ *ᵥ g0 = c0 := by
    have := inv_transpose hX c0 hc
    simpa [hg0def] using this
  have hg1 : g0 ⬝ᵥ b0 = 1 := by rw [hg0def, bilin, h1]
  -- every vector of the new column space lies in the old one and is orthogonal to g0
  have fwd : ∀ u, M *ᵥ u + (c0 ⬝ᵥ u) • b0 ∈ colSp M ∧ g0 ⬝ᵥ (M *ᵥ u + (c0 ⬝ᵥ u) • b0) = 0 := by
    intro u
    refine ⟨Submodule.add_mem _ (mulVec_mem_colSp M u) (Submodule.smul_mem _ _ hb), ?_⟩
    rw [dotProduct_add, dotProduct_smul, dot_mulVec, hg, hg1, smul_eq_mul, mul_one, CharTwo.add_self_eq_zero]
  -- on the old column space, M' X v = v + (g0 ⬝ v) b0
  have act : ∀ v ∈ colSp M, (M + vecMulVec b0 c0) *ᵥ (X *ᵥ v) = v + (g0 ⬝ᵥ v) • b0 := by
    intro v hv
    rw [upd_mulVec, hX v hv, hg0def, bilin]
  have char : ∀ v, v ∈ colSp (M + vecMulVec b0 c0) ↔ v ∈ colSp M ∧ g0 ⬝ᵥ v = 0 := by
    intro v
    constructor
    · intro hv
      obtain ⟨u, rfl⟩ := mem_colSp.1 hv
      rw [upd_mulVec]
      exact fwd u
    · rintro ⟨hv, h0⟩
      have := act v hv
      rw [h0, zero_smul, add_zero] at this
      exact mem_colSp.2 ⟨_, this⟩
  refine ⟨?_, char, ?_⟩
  · intro v hv
    obtain ⟨hvM, h0⟩ := (char v).1 hv
    rw [act v hvM, h0, zero_smul, add_zero]
  · -- col M = col M' ⊔ ⟨b0⟩ and b0 ∉ col M'
    have hnot : b0 ∉ colSp (M + vecMulVec b0 c0) := by
      intro h
      have := ((char b0).1 h).2
      rw [hg1] at this
      exact one_ne_zero this
    have hsup : colSp (M + vecMulVec b0 c0) ⊔ K ∙ b0 = colSp M := by
      apply le_antisymm
      · refine sup_le (fun v hv => ((char v).1 hv).1) ?_
        rw [Submodule.span_le]
        simpa using hb
      · intro v hv
        have hdec : v = (v - (g0 ⬝ᵥ v) • b0) + (g0 ⬝ᵥ v) • b0 := by abel
        rw [hdec]
        refine Submodule.add_mem_sup ?_ (Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self b0))
        refine (char _).2 ⟨Submodule.sub_mem _ hv (Submodule.smul_mem _ _ hb), ?_⟩
        rw [dotProduct_sub, dotProduct_smul, hg1, smul_eq_mul, mul_one, sub_self]
    have := finrank_sup_span (colSp (M + vecMulVec b0 c0)) b0 hnot
    rw [hsup] at this
    rw [rank_eq_finrank, rank_eq_finrank, this]

/-- **Case A**, both sides (`rowSp = colSp ·ᵀ`). -/
theorem caseA {M : Matrix m n K} {X : Matrix n m K} (hX : Inv M X) {b0 : m → K} {c0 : n → K}
    (hb : b0 ∈ colSp M) (hc : c0 ∈ colSp Mᵀ) (h1 : c0 ⬝ᵥ (X *ᵥ b0) = 1) :
    Inv (M + vecMulVec b0 c0) X ∧
      (∀ v, v ∈ colSp (M + vecMulVec b0 c0) ↔ v ∈ colSp M ∧ (Xᵀ *ᵥ c0) ⬝ᵥ v = 0) ∧
      (∀ w, w ∈ colSp (M + vecMulVec b0 c0)ᵀ ↔ w ∈ colSp Mᵀ ∧ w ⬝ᵥ (X *ᵥ b0) = 0) ∧
      (M + vecMulVec b0 c0).rank + 1 = M.rank := by
  obtain ⟨h1', h2', h3'⟩ := caseA_col hX hb hc h1
  refine ⟨h1', h2', ?_, h3'⟩
  have hT := caseA_col (inv_transpose hX) (b0 := c0) (c0 := b0) hc (by simpa using hb)
    (by rw [← bilin, Matrix.transpose_transpose, dotProduct_comm, h1])
  intro w
  rw [upd_transpose, (hT.2.1 w), Matrix.transpose_transpose, dotProduct_comm]

/-- **Case B** (`b0 ∈ col M`, `c0 ∈ row M`, `c0 ⬝ y0 = 0`), column side: same column space, corrected inverse. -/
theorem caseB_col {M : Matrix m n K} {X : Matrix n m K} (hX : Inv M X) {b0 : m → K} {c0 : n → K}
    (hb : b0 ∈ colSp M) (h0 : c0 ⬝ᵥ (X *ᵥ b0) = 0) :
    (∀ v ∈ colSp M, (M + vecMulVec b0 c0) *ᵥ ((X + vecMulVec (X *ᵥ b0) (Xᵀ *ᵥ c0)) *ᵥ v) = v) ∧
      colSp (M + vecMulVec b0 c0) = colSp M := by
  have hMy : M *ᵥ (X *ᵥ b0) = b0 := hX b0 hb
  have act : ∀ v ∈ colSp M, (M + vecMulVec b0 c0) *ᵥ ((X + vecMulVec (X *ᵥ b0) (Xᵀ *ᵥ c0)) *ᵥ v) = v := by
    intro v hv
    rw [Matrix.add_mulVec, vecMulVec_mulVec', upd_mulVec, Matrix.mulVec_add, Matrix.mulVec_smul, hX v hv, hMy,
      dotProduct_add, dotProduct_smul, h0, smul_eq_mul, mul_zero, add_zero, bilin]
    rw [add_assoc, ← add_smul, CharTwo.add_self_eq_zero, zero_smul, add_zero]
  refine ⟨act, le_antisymm ?_ ?_⟩
  · intro v hv
    obtain ⟨u, rfl⟩ := mem_colSp.1 hv
    rw [upd_mulVec]
    exact Submodule.add_mem _ (mulVec_mem_colSp M u) (Submodule.smul_mem _ _ hb)
  · intro v hv
    exact mem_colSp.2 ⟨_, act v hv⟩

theorem caseB {M : Matrix m n K} {X : Matrix n m K} (hX : Inv M X) {b0 : m → K} {c0 : n → K}
    (hb : b0 ∈ colSp M) (hc : c0 ∈ colSp Mᵀ) (h0 : c0 ⬝ᵥ (X *ᵥ b0) = 0) :
    Inv (M + vecMulVec b0 c0) (X + vecMulVec (X *ᵥ b0) (Xᵀ *ᵥ c0)) ∧
      colSp (M + vecMulVec b0 c0) = colSp M ∧ colSp (M + vecMulVec b0 c0)ᵀ = colSp Mᵀ ∧
      (M + vecMulVec b0 c0).rank = M.rank := by
  obtain ⟨act, hcol⟩ := caseB_col hX hb h0
  have hT := caseB_col (inv_transpose hX) (b0 := c0) (c0 := b0) hc
    (by rw [← bilin, Matrix.transpose_transpose, dotProduct_comm, h0])
  refine ⟨fun v hv => act v (hcol ▸ hv), hcol, by rw [upd_transpose]; exact hT.2, ?_⟩
  rw [rank_eq_finrank, rank_eq_finrank, hcol]

/-- **Case C** (`b0 ∈ col M`, `c0 ∉ row M` witnessed by `M k = 0`, `c0 ⬝ k = 1`), with a preimage `x0` of `b0`,
`c0 ⬝ x0 = 0`. -/
theorem caseC {M : Matrix m n K} {X : Matrix n m K} (hX : Inv M X) {b0 : m → K} {c0 : n → K}
    (hb : b0 ∈ colSp M) {k : n → K} (hk : M *ᵥ k = 0) (hck : c0 ⬝ᵥ k = 1) {x0 : n → K} (hx0 : M *ᵥ x0 = b0)
    (hcx0 : c0 ⬝ᵥ x0 = 0) :
    Inv (M + vecMulVec b0 c0) (X + vecMulVec x0 (Xᵀ *ᵥ c0)) ∧
      colSp (M + vecMulVec b0 c0) = colSp M ∧
      (∀ w, w ∈ colSp (M + vecMulVec b0 c0)ᵀ ↔ ∃ u ∈ colSp Mᵀ, w = u + (x0 ⬝ᵥ u) • c0) ∧
      (M + vecMulVec b0 c0).rank = M.rank := by
  have hcol : colSp (M + vecMulVec b0 c0) = colSp M := by
    apply le_antisymm
    · intro v hv
      obtain ⟨u, rfl⟩ := mem_colSp.1 hv
      rw [upd_mulVec]
      exact Submodule.add_mem _ (mulVec_mem_colSp M u) (Submodule.smul_mem _ _ hb)
    · intro v hv
      obtain ⟨u, rfl⟩ := mem_colSp.1 hv
      have hb' : (M + vecMulVec b0 c0) *ᵥ k = b0 := by rw [upd_mulVec, hk, hck, one_smul, zero_add]
      have : M *ᵥ u = (M + vecMulVec b0 c0) *ᵥ u - (c0 ⬝ᵥ u) • (M + vecMulVec b0 c0) *ᵥ k := by
        rw [hb', upd_mulVec, add_sub_cancel_right]
      rw [this]
      exact Submodule.sub_mem _ (mulVec_mem_colSp _ u) (Submodule.smul_mem _ _ (mulVec_mem_colSp _ k))
  refine ⟨?_, hcol, ?_, by rw [rank_eq_finrank, rank_eq_finrank, hcol]⟩
  · intro v hv
    rw [hcol] at hv
    rw [Matrix.add_mulVec, vecMulVec_mulVec', upd_mulVec, Matrix.mulVec_add, Matrix.mulVec_smul, hX v hv, hx0,
      dotProduct_add, dotProduct_smul, hcx0, smul_eq_mul, mul_zero, add_zero, bilin]
    rw [add_assoc, ← add_smul, CharTwo.add_self_eq_zero, zero_smul, add_zero]
  · intro w
    rw [upd_transpose]
    constructor
    · intro hw
      obtain ⟨y, rfl⟩ := mem_colSp.1 hw
      refine ⟨Mᵀ *ᵥ y, mulVec_mem_colSp _ y, ?_⟩
      rw [upd_mulVec, ← hx0, dotProduct_comm, dot_mulVec, dotProduct_comm]
    · rintro ⟨u, hu, rfl⟩
      obtain ⟨y, rfl⟩ := mem_colSp.1 hu
      refine mem_colSp.2 ⟨y, ?_⟩
      rw [upd_mulVec, ← hx0, dotProduct_comm (M *ᵥ x0), dot_mulVec, dotProduct_comm]

/-- **Case D** (`c0 ∈ row M`, `b0 ∉ col M` witnessed by `Mᵀ l = 0`, `b0 ⬝ l = 1`), with a preimage `z` of `c0` under
`Mᵀ`, `b0 ⬝ z = 0`: the transpose of case C. -/
theorem caseD {M : Matrix m n K} {X : Matrix n m K} (hX : Inv M X) {b0 : m → K} {c0 : n → K}
    (hc : c0 ∈ colSp Mᵀ) {l : m → K} (hl : Mᵀ *ᵥ l = 0) (hbl : b0 ⬝ᵥ l = 1) {z : m → K} (hz : Mᵀ *ᵥ z = c0)
    (hbz : b0 ⬝ᵥ z = 0) :
    Inv (M + vecMulVec b0 c0) (X + vecMulVec (X *ᵥ b0) z) ∧
      (∀ v, v ∈ colSp (M + vecMulVec b0 c0) ↔ ∃ u ∈ colSp M, v = u + (z ⬝ᵥ u) • b0) ∧
      colSp (M + vecMulVec b0 c0)ᵀ = colSp Mᵀ ∧
      (M + vecMulVec b0 c0).rank = M.rank := by
  have hT := caseC (inv_transpose hX) (b0 := c0) (c0 := b0) hc hl hbl hz hbz
  rw [← upd_transpose] at hT
  obtain ⟨hinv, hcol, hrow, hrk⟩ := hT
  refine ⟨inv_of_transpose ?_, ?_, hcol, by rw [Matrix.rank_transpose, Matrix.rank_transpose] at hrk; exact hrk⟩
  · rw [Matrix.transpose_add, Matrix.transpose_vecMulVec]
    simpa using hinv
  · intro v
    simpa using hrow v

/-- **Case E** (`b0 ∉ col M` via `Mᵀ l = 0`, `b0 ⬝ l = 1`; `c0 ∉ row M` via `M k = 0`, `c0 ⬝ k = 1`): the rank grows by
one; the corrected inverse adds `b1 lᵀ + k g0ᵀ`, `b1 = y0 + (1 + g0 ⬝ b0) k`. -/
theorem caseE_col {M : Matrix m n K} {X : Matrix n m K} (hX : Inv M X) {b0 : m → K} {c0 : n → K}
    {k : n → K} (hk : M *ᵥ k = 0) (hck : c0 ⬝ᵥ k = 1) {l : m → K} (hl : Mᵀ *ᵥ l = 0) (hbl : b0 ⬝ᵥ l = 1) :
    Inv (M + vecMulVec b0 c0)
        (X + vecMulVec (X *ᵥ b0 + (1 + (Xᵀ *ᵥ c0) ⬝ᵥ b0) • k) l + vecMulVec k (Xᵀ *ᵥ c0)) ∧
      colSp (M + vecMulVec b0 c0) = colSp M ⊔ K ∙ b0 ∧
      (M + vecMulVec b0 c0).rank = M.rank + 1 := by
  set g0 := Xᵀ *ᵥ c0 with hg0def
  have hb' : (M + vecMulVec b0 c0) *ᵥ k = b0 := by rw [upd_mulVec, hk, hck, one_smul, zero_add]
  have hcol : colSp (M + vecMulVec b0 c0) = colSp M ⊔ K ∙ b0 := by
    apply le_antisymm
    · intro v hv
      obtain ⟨u, rfl⟩ := mem_colSp.1 hv
      rw [upd_mulVec]
      exact Submodule.add_mem_sup (mulVec_mem_colSp M u) (Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self b0))
    · refine sup_le ?_ ?_
      · intro v hv
        obtain ⟨u, rfl⟩ := mem_colSp.1 hv
        have : M *ᵥ u = (M + vecMulVec b0 c0) *ᵥ u - (c0 ⬝ᵥ u) • (M + vecMulVec b0 c0) *ᵥ k := by
          rw [hb', upd_mulVec, add_sub_cancel_right]
        rw [this]
        exact Submodule.sub_mem _ (mulVec_mem_colSp _ u) (Submodule.smul_mem _ _ (mulVec_mem_colSp _ k))
      · rw [Submodule.span_le, Set.singleton_subset_iff]
        have := mulVec_mem_colSp (M + vecMulVec b0 c0) k
        rw [hb'] at this
        exact this
  have hlb : l ⬝ᵥ b0 = 1 := by rw [dotProduct_comm, hbl]
  refine ⟨?_, hcol, ?_⟩
  · intro v hv
    rw [hcol] at hv
    obtain ⟨u, hu, w, hw, rfl⟩ := Submodule.mem_sup.1 hv
    obtain ⟨a, rfl⟩ := Submodule.mem_span_singleton.1 hw
    have hlu : l ⬝ᵥ u = 0 := dot_colSp_of_left_ker hl hu
    have hgu : c0 ⬝ᵥ (X *ᵥ u) = g0 ⬝ᵥ u := by rw [hg0def, bilin]
    -- X' (u + a b0) = X u + a k + (g0 ⬝ u) k
    have hX' : (X + vecMulVec (X *ᵥ b0 + (1 + g0 ⬝ᵥ b0) • k) l + vecMulVec k g0) *ᵥ (u + a • b0) =
        X *ᵥ u + (a + g0 ⬝ᵥ u) • k := by
      rw [Matrix.add_mulVec, Matrix.add_mulVec, vecMulVec_mulVec', vecMulVec_mulVec', dotProduct_add, dotProduct_add,
        dotProduct_smul, dotProduct_smul, hlu, hlb, Matrix.mulVec_add, Matrix.mulVec_smul]
      simp only [smul_eq_mul, mul_one, zero_add, smul_add, smul_smul]
      have h2 : ∀ x : K, x + x = 0 := CharTwo.add_self_eq_zero
      have e : X *ᵥ u + a • X *ᵥ b0 + (a • X *ᵥ b0 + (a * (1 + g0 ⬝ᵥ b0)) • k) + (g0 ⬝ᵥ u + a * g0 ⬝ᵥ b0) • k =
          X *ᵥ u + (a + a) • X *ᵥ b0 + (a * (1 + g0 ⬝ᵥ b0) + a * g0 ⬝ᵥ b0 + g0 ⬝ᵥ u) • k := by
        module
      have hs : a * (1 + g0 ⬝ᵥ b0) + a * g0 ⬝ᵥ b0 + g0 ⬝ᵥ u = a + g0 ⬝ᵥ u := by
        rw [mul_add, mul_one, add_assoc a, h2, add_zero]
      rw [e, h2, zero_smul, add_zero, hs]
    rw [hX', upd_mulVec, Matrix.mulVec_add, Matrix.mulVec_smul, hk, smul_zero, add_zero, hX u hu, dotProduct_add,
      dotProduct_smul, hck, hgu, smul_eq_mul, mul_one]
    congr 1
    congr 1
    rw [add_comm a (g0 ⬝ᵥ u), ← add_assoc, CharTwo.add_self_eq_zero, zero_add]
  · have hnot : b0 ∉ colSp M := by
      intro h
      have := dot_colSp_of_left_ker hl h
      rw [hlb] at this
      exact one_ne_zero this
    have := finrank_sup_span (colSp M) b0 hnot
    rw [rank_eq_finrank, rank_eq_finrank, hcol, this]

theorem caseE {M : Matrix m n K} {X : Matrix n m K} (hX : Inv M X) {b0 : m → K} {c0 : n → K}
    {k : n → K} (hk : M *ᵥ k = 0) (hck : c0 ⬝ᵥ k = 1) {l : m → K} (hl : Mᵀ *ᵥ l = 0) (hbl : b0 ⬝ᵥ l = 1) :
    Inv (M + vecMulVec b0 c0)
        (X + vecMulVec (X *ᵥ b0 + (1 + (Xᵀ *ᵥ c0) ⬝ᵥ b0) • k) l + vecMulVec k (Xᵀ *ᵥ c0)) ∧
      colSp (M + vecMulVec b0 c0) = colSp M ⊔ K ∙ b0 ∧
      colSp (M + vecMulVec b0 c0)ᵀ = colSp Mᵀ ⊔ K ∙ c0 ∧
      (M + vecMulVec b0 c0).rank = M.rank + 1 := by
  obtain ⟨h1, h2, h3⟩ := caseE_col hX hk hck hl hbl
  have hT := caseE_col (inv_transpose hX) (b0 := c0) (c0 := b0) (k := l) (l := k) hl hbl (by simpa using hk) hck
  rw [← upd_transpose] at hT
  exact ⟨h1, h2, hT.2.1, h3⟩

end char2

end RootSound.Rank1
