module
public import R22Port.U_d41d8cd98f00
public import L5.T321
public import L5.O321
@[expose] public section
set_option maxRecDepth 100000
/-! # `HOK` for L1's `--rord 321` hit vectors (G5): `hok321_<l> (hO : Is321 O) : HOK O <l> L1.T321.h_<l>` for every label

`hitV v`: the 7-bit fields `par (v &&& X)`, `X < 512`, as a `Nat.rec` (decidable); `hok_of`: `HOK O l h` from `h = hitV (O.vec l)`.
Each label's table entry is compared with `hitV (RT.O321.vecL l)` by `decide +kernel`. -/
noncomputable section
namespace L5O
open RootSound BC4 BC5

/-- the hit vector of a code: 7-bit field `X` is `par (v &&& X)` -/
def hitV (v : ℕ) : ℕ :=
  Nat.rec (motive := fun _ => ℕ) 0 (fun X acc => acc + (if par (v &&& X) = true then 1 else 0) * 2 ^ (7 * X)) 512

theorem sum_rec (f : ℕ → ℕ) : ∀ n, ∑ X ∈ Finset.range n, f X = Nat.rec (motive := fun _ => ℕ) 0 (fun X acc => acc + f X) n := by
  intro n
  induction n with
  | zero => simp
  | succ n ih => rw [Finset.sum_range_succ, ih]

theorem hok_of (O : R3RT.SpecO.LabelOrder) (l h : ℕ) (hh : h = hitV (O.vec l)) : R3RT.SpecO.HOK O l h := by
  unfold R3RT.SpecO.HOK; rw [hh, sum_rec]; rfl

theorem hok321_0 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 0 L1.T321.h_0 :=
  hok_of O 0 _ (by rw [hO 0 (by norm_num)]; decide +kernel)
theorem hok321_1 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 1 L1.T321.h_1 :=
  hok_of O 1 _ (by rw [hO 1 (by norm_num)]; decide +kernel)
theorem hok321_2 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 2 L1.T321.h_2 :=
  hok_of O 2 _ (by rw [hO 2 (by norm_num)]; decide +kernel)
theorem hok321_3 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 3 L1.T321.h_3 :=
  hok_of O 3 _ (by rw [hO 3 (by norm_num)]; decide +kernel)
theorem hok321_4 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 4 L1.T321.h_4 :=
  hok_of O 4 _ (by rw [hO 4 (by norm_num)]; decide +kernel)
theorem hok321_5 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 5 L1.T321.h_5 :=
  hok_of O 5 _ (by rw [hO 5 (by norm_num)]; decide +kernel)
theorem hok321_6 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 6 L1.T321.h_6 :=
  hok_of O 6 _ (by rw [hO 6 (by norm_num)]; decide +kernel)
theorem hok321_7 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 7 L1.T321.h_7 :=
  hok_of O 7 _ (by rw [hO 7 (by norm_num)]; decide +kernel)
theorem hok321_8 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 8 L1.T321.h_8 :=
  hok_of O 8 _ (by rw [hO 8 (by norm_num)]; decide +kernel)
theorem hok321_9 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 9 L1.T321.h_9 :=
  hok_of O 9 _ (by rw [hO 9 (by norm_num)]; decide +kernel)
theorem hok321_10 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 10 L1.T321.h_10 :=
  hok_of O 10 _ (by rw [hO 10 (by norm_num)]; decide +kernel)
theorem hok321_11 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 11 L1.T321.h_11 :=
  hok_of O 11 _ (by rw [hO 11 (by norm_num)]; decide +kernel)
theorem hok321_12 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 12 L1.T321.h_12 :=
  hok_of O 12 _ (by rw [hO 12 (by norm_num)]; decide +kernel)
theorem hok321_13 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 13 L1.T321.h_13 :=
  hok_of O 13 _ (by rw [hO 13 (by norm_num)]; decide +kernel)
theorem hok321_14 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 14 L1.T321.h_14 :=
  hok_of O 14 _ (by rw [hO 14 (by norm_num)]; decide +kernel)
theorem hok321_15 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 15 L1.T321.h_15 :=
  hok_of O 15 _ (by rw [hO 15 (by norm_num)]; decide +kernel)
theorem hok321_16 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 16 L1.T321.h_16 :=
  hok_of O 16 _ (by rw [hO 16 (by norm_num)]; decide +kernel)
theorem hok321_17 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 17 L1.T321.h_17 :=
  hok_of O 17 _ (by rw [hO 17 (by norm_num)]; decide +kernel)
theorem hok321_18 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 18 L1.T321.h_18 :=
  hok_of O 18 _ (by rw [hO 18 (by norm_num)]; decide +kernel)
theorem hok321_19 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 19 L1.T321.h_19 :=
  hok_of O 19 _ (by rw [hO 19 (by norm_num)]; decide +kernel)
theorem hok321_20 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 20 L1.T321.h_20 :=
  hok_of O 20 _ (by rw [hO 20 (by norm_num)]; decide +kernel)
theorem hok321_21 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 21 L1.T321.h_21 :=
  hok_of O 21 _ (by rw [hO 21 (by norm_num)]; decide +kernel)
theorem hok321_22 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 22 L1.T321.h_22 :=
  hok_of O 22 _ (by rw [hO 22 (by norm_num)]; decide +kernel)
theorem hok321_23 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 23 L1.T321.h_23 :=
  hok_of O 23 _ (by rw [hO 23 (by norm_num)]; decide +kernel)
theorem hok321_24 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 24 L1.T321.h_24 :=
  hok_of O 24 _ (by rw [hO 24 (by norm_num)]; decide +kernel)
theorem hok321_25 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 25 L1.T321.h_25 :=
  hok_of O 25 _ (by rw [hO 25 (by norm_num)]; decide +kernel)
theorem hok321_26 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 26 L1.T321.h_26 :=
  hok_of O 26 _ (by rw [hO 26 (by norm_num)]; decide +kernel)
theorem hok321_27 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 27 L1.T321.h_27 :=
  hok_of O 27 _ (by rw [hO 27 (by norm_num)]; decide +kernel)
theorem hok321_28 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 28 L1.T321.h_28 :=
  hok_of O 28 _ (by rw [hO 28 (by norm_num)]; decide +kernel)
theorem hok321_29 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 29 L1.T321.h_29 :=
  hok_of O 29 _ (by rw [hO 29 (by norm_num)]; decide +kernel)
theorem hok321_30 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 30 L1.T321.h_30 :=
  hok_of O 30 _ (by rw [hO 30 (by norm_num)]; decide +kernel)
theorem hok321_31 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 31 L1.T321.h_31 :=
  hok_of O 31 _ (by rw [hO 31 (by norm_num)]; decide +kernel)
theorem hok321_32 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 32 L1.T321.h_32 :=
  hok_of O 32 _ (by rw [hO 32 (by norm_num)]; decide +kernel)
theorem hok321_33 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 33 L1.T321.h_33 :=
  hok_of O 33 _ (by rw [hO 33 (by norm_num)]; decide +kernel)
theorem hok321_34 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 34 L1.T321.h_34 :=
  hok_of O 34 _ (by rw [hO 34 (by norm_num)]; decide +kernel)
theorem hok321_35 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 35 L1.T321.h_35 :=
  hok_of O 35 _ (by rw [hO 35 (by norm_num)]; decide +kernel)
theorem hok321_36 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 36 L1.T321.h_36 :=
  hok_of O 36 _ (by rw [hO 36 (by norm_num)]; decide +kernel)
theorem hok321_37 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 37 L1.T321.h_37 :=
  hok_of O 37 _ (by rw [hO 37 (by norm_num)]; decide +kernel)
theorem hok321_38 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 38 L1.T321.h_38 :=
  hok_of O 38 _ (by rw [hO 38 (by norm_num)]; decide +kernel)
theorem hok321_39 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 39 L1.T321.h_39 :=
  hok_of O 39 _ (by rw [hO 39 (by norm_num)]; decide +kernel)
theorem hok321_40 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 40 L1.T321.h_40 :=
  hok_of O 40 _ (by rw [hO 40 (by norm_num)]; decide +kernel)
theorem hok321_41 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 41 L1.T321.h_41 :=
  hok_of O 41 _ (by rw [hO 41 (by norm_num)]; decide +kernel)
theorem hok321_42 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 42 L1.T321.h_42 :=
  hok_of O 42 _ (by rw [hO 42 (by norm_num)]; decide +kernel)
theorem hok321_43 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 43 L1.T321.h_43 :=
  hok_of O 43 _ (by rw [hO 43 (by norm_num)]; decide +kernel)
theorem hok321_44 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 44 L1.T321.h_44 :=
  hok_of O 44 _ (by rw [hO 44 (by norm_num)]; decide +kernel)
theorem hok321_45 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 45 L1.T321.h_45 :=
  hok_of O 45 _ (by rw [hO 45 (by norm_num)]; decide +kernel)
theorem hok321_46 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 46 L1.T321.h_46 :=
  hok_of O 46 _ (by rw [hO 46 (by norm_num)]; decide +kernel)
theorem hok321_47 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 47 L1.T321.h_47 :=
  hok_of O 47 _ (by rw [hO 47 (by norm_num)]; decide +kernel)
theorem hok321_48 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 48 L1.T321.h_48 :=
  hok_of O 48 _ (by rw [hO 48 (by norm_num)]; decide +kernel)
theorem hok321_49 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 49 L1.T321.h_49 :=
  hok_of O 49 _ (by rw [hO 49 (by norm_num)]; decide +kernel)
theorem hok321_50 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 50 L1.T321.h_50 :=
  hok_of O 50 _ (by rw [hO 50 (by norm_num)]; decide +kernel)
theorem hok321_51 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 51 L1.T321.h_51 :=
  hok_of O 51 _ (by rw [hO 51 (by norm_num)]; decide +kernel)
theorem hok321_52 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 52 L1.T321.h_52 :=
  hok_of O 52 _ (by rw [hO 52 (by norm_num)]; decide +kernel)
theorem hok321_53 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 53 L1.T321.h_53 :=
  hok_of O 53 _ (by rw [hO 53 (by norm_num)]; decide +kernel)
theorem hok321_54 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 54 L1.T321.h_54 :=
  hok_of O 54 _ (by rw [hO 54 (by norm_num)]; decide +kernel)
theorem hok321_55 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 55 L1.T321.h_55 :=
  hok_of O 55 _ (by rw [hO 55 (by norm_num)]; decide +kernel)
theorem hok321_56 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 56 L1.T321.h_56 :=
  hok_of O 56 _ (by rw [hO 56 (by norm_num)]; decide +kernel)
theorem hok321_57 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 57 L1.T321.h_57 :=
  hok_of O 57 _ (by rw [hO 57 (by norm_num)]; decide +kernel)
theorem hok321_58 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 58 L1.T321.h_58 :=
  hok_of O 58 _ (by rw [hO 58 (by norm_num)]; decide +kernel)
theorem hok321_59 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 59 L1.T321.h_59 :=
  hok_of O 59 _ (by rw [hO 59 (by norm_num)]; decide +kernel)
theorem hok321_60 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 60 L1.T321.h_60 :=
  hok_of O 60 _ (by rw [hO 60 (by norm_num)]; decide +kernel)
theorem hok321_61 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 61 L1.T321.h_61 :=
  hok_of O 61 _ (by rw [hO 61 (by norm_num)]; decide +kernel)
theorem hok321_62 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 62 L1.T321.h_62 :=
  hok_of O 62 _ (by rw [hO 62 (by norm_num)]; decide +kernel)
theorem hok321_63 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 63 L1.T321.h_63 :=
  hok_of O 63 _ (by rw [hO 63 (by norm_num)]; decide +kernel)
theorem hok321_64 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 64 L1.T321.h_64 :=
  hok_of O 64 _ (by rw [hO 64 (by norm_num)]; decide +kernel)
theorem hok321_65 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 65 L1.T321.h_65 :=
  hok_of O 65 _ (by rw [hO 65 (by norm_num)]; decide +kernel)
theorem hok321_66 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 66 L1.T321.h_66 :=
  hok_of O 66 _ (by rw [hO 66 (by norm_num)]; decide +kernel)
theorem hok321_67 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 67 L1.T321.h_67 :=
  hok_of O 67 _ (by rw [hO 67 (by norm_num)]; decide +kernel)
theorem hok321_68 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 68 L1.T321.h_68 :=
  hok_of O 68 _ (by rw [hO 68 (by norm_num)]; decide +kernel)
theorem hok321_69 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 69 L1.T321.h_69 :=
  hok_of O 69 _ (by rw [hO 69 (by norm_num)]; decide +kernel)
theorem hok321_70 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 70 L1.T321.h_70 :=
  hok_of O 70 _ (by rw [hO 70 (by norm_num)]; decide +kernel)
theorem hok321_71 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 71 L1.T321.h_71 :=
  hok_of O 71 _ (by rw [hO 71 (by norm_num)]; decide +kernel)
theorem hok321_72 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 72 L1.T321.h_72 :=
  hok_of O 72 _ (by rw [hO 72 (by norm_num)]; decide +kernel)
theorem hok321_73 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 73 L1.T321.h_73 :=
  hok_of O 73 _ (by rw [hO 73 (by norm_num)]; decide +kernel)
theorem hok321_74 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 74 L1.T321.h_74 :=
  hok_of O 74 _ (by rw [hO 74 (by norm_num)]; decide +kernel)
theorem hok321_75 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 75 L1.T321.h_75 :=
  hok_of O 75 _ (by rw [hO 75 (by norm_num)]; decide +kernel)
theorem hok321_76 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 76 L1.T321.h_76 :=
  hok_of O 76 _ (by rw [hO 76 (by norm_num)]; decide +kernel)
theorem hok321_77 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 77 L1.T321.h_77 :=
  hok_of O 77 _ (by rw [hO 77 (by norm_num)]; decide +kernel)
theorem hok321_78 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 78 L1.T321.h_78 :=
  hok_of O 78 _ (by rw [hO 78 (by norm_num)]; decide +kernel)
theorem hok321_79 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 79 L1.T321.h_79 :=
  hok_of O 79 _ (by rw [hO 79 (by norm_num)]; decide +kernel)
theorem hok321_80 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 80 L1.T321.h_80 :=
  hok_of O 80 _ (by rw [hO 80 (by norm_num)]; decide +kernel)
theorem hok321_81 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 81 L1.T321.h_81 :=
  hok_of O 81 _ (by rw [hO 81 (by norm_num)]; decide +kernel)
theorem hok321_82 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 82 L1.T321.h_82 :=
  hok_of O 82 _ (by rw [hO 82 (by norm_num)]; decide +kernel)
theorem hok321_83 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 83 L1.T321.h_83 :=
  hok_of O 83 _ (by rw [hO 83 (by norm_num)]; decide +kernel)
theorem hok321_84 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 84 L1.T321.h_84 :=
  hok_of O 84 _ (by rw [hO 84 (by norm_num)]; decide +kernel)
theorem hok321_85 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 85 L1.T321.h_85 :=
  hok_of O 85 _ (by rw [hO 85 (by norm_num)]; decide +kernel)
theorem hok321_86 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 86 L1.T321.h_86 :=
  hok_of O 86 _ (by rw [hO 86 (by norm_num)]; decide +kernel)
theorem hok321_87 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 87 L1.T321.h_87 :=
  hok_of O 87 _ (by rw [hO 87 (by norm_num)]; decide +kernel)
theorem hok321_88 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 88 L1.T321.h_88 :=
  hok_of O 88 _ (by rw [hO 88 (by norm_num)]; decide +kernel)
theorem hok321_89 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 89 L1.T321.h_89 :=
  hok_of O 89 _ (by rw [hO 89 (by norm_num)]; decide +kernel)
theorem hok321_90 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 90 L1.T321.h_90 :=
  hok_of O 90 _ (by rw [hO 90 (by norm_num)]; decide +kernel)
theorem hok321_91 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 91 L1.T321.h_91 :=
  hok_of O 91 _ (by rw [hO 91 (by norm_num)]; decide +kernel)
theorem hok321_92 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 92 L1.T321.h_92 :=
  hok_of O 92 _ (by rw [hO 92 (by norm_num)]; decide +kernel)
theorem hok321_93 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 93 L1.T321.h_93 :=
  hok_of O 93 _ (by rw [hO 93 (by norm_num)]; decide +kernel)
theorem hok321_94 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 94 L1.T321.h_94 :=
  hok_of O 94 _ (by rw [hO 94 (by norm_num)]; decide +kernel)
theorem hok321_95 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 95 L1.T321.h_95 :=
  hok_of O 95 _ (by rw [hO 95 (by norm_num)]; decide +kernel)
theorem hok321_96 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 96 L1.T321.h_96 :=
  hok_of O 96 _ (by rw [hO 96 (by norm_num)]; decide +kernel)
theorem hok321_97 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 97 L1.T321.h_97 :=
  hok_of O 97 _ (by rw [hO 97 (by norm_num)]; decide +kernel)
theorem hok321_98 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 98 L1.T321.h_98 :=
  hok_of O 98 _ (by rw [hO 98 (by norm_num)]; decide +kernel)
theorem hok321_99 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 99 L1.T321.h_99 :=
  hok_of O 99 _ (by rw [hO 99 (by norm_num)]; decide +kernel)
theorem hok321_100 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 100 L1.T321.h_100 :=
  hok_of O 100 _ (by rw [hO 100 (by norm_num)]; decide +kernel)
theorem hok321_101 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 101 L1.T321.h_101 :=
  hok_of O 101 _ (by rw [hO 101 (by norm_num)]; decide +kernel)
theorem hok321_102 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 102 L1.T321.h_102 :=
  hok_of O 102 _ (by rw [hO 102 (by norm_num)]; decide +kernel)
theorem hok321_103 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 103 L1.T321.h_103 :=
  hok_of O 103 _ (by rw [hO 103 (by norm_num)]; decide +kernel)
theorem hok321_104 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 104 L1.T321.h_104 :=
  hok_of O 104 _ (by rw [hO 104 (by norm_num)]; decide +kernel)
theorem hok321_105 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 105 L1.T321.h_105 :=
  hok_of O 105 _ (by rw [hO 105 (by norm_num)]; decide +kernel)
theorem hok321_106 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 106 L1.T321.h_106 :=
  hok_of O 106 _ (by rw [hO 106 (by norm_num)]; decide +kernel)
theorem hok321_107 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 107 L1.T321.h_107 :=
  hok_of O 107 _ (by rw [hO 107 (by norm_num)]; decide +kernel)
theorem hok321_108 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 108 L1.T321.h_108 :=
  hok_of O 108 _ (by rw [hO 108 (by norm_num)]; decide +kernel)
theorem hok321_109 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 109 L1.T321.h_109 :=
  hok_of O 109 _ (by rw [hO 109 (by norm_num)]; decide +kernel)
theorem hok321_110 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 110 L1.T321.h_110 :=
  hok_of O 110 _ (by rw [hO 110 (by norm_num)]; decide +kernel)
theorem hok321_111 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 111 L1.T321.h_111 :=
  hok_of O 111 _ (by rw [hO 111 (by norm_num)]; decide +kernel)
theorem hok321_112 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 112 L1.T321.h_112 :=
  hok_of O 112 _ (by rw [hO 112 (by norm_num)]; decide +kernel)
theorem hok321_113 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 113 L1.T321.h_113 :=
  hok_of O 113 _ (by rw [hO 113 (by norm_num)]; decide +kernel)
theorem hok321_114 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 114 L1.T321.h_114 :=
  hok_of O 114 _ (by rw [hO 114 (by norm_num)]; decide +kernel)
theorem hok321_115 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 115 L1.T321.h_115 :=
  hok_of O 115 _ (by rw [hO 115 (by norm_num)]; decide +kernel)
theorem hok321_116 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 116 L1.T321.h_116 :=
  hok_of O 116 _ (by rw [hO 116 (by norm_num)]; decide +kernel)
theorem hok321_117 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 117 L1.T321.h_117 :=
  hok_of O 117 _ (by rw [hO 117 (by norm_num)]; decide +kernel)
theorem hok321_118 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 118 L1.T321.h_118 :=
  hok_of O 118 _ (by rw [hO 118 (by norm_num)]; decide +kernel)
theorem hok321_119 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 119 L1.T321.h_119 :=
  hok_of O 119 _ (by rw [hO 119 (by norm_num)]; decide +kernel)
theorem hok321_120 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 120 L1.T321.h_120 :=
  hok_of O 120 _ (by rw [hO 120 (by norm_num)]; decide +kernel)
theorem hok321_121 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 121 L1.T321.h_121 :=
  hok_of O 121 _ (by rw [hO 121 (by norm_num)]; decide +kernel)
theorem hok321_122 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 122 L1.T321.h_122 :=
  hok_of O 122 _ (by rw [hO 122 (by norm_num)]; decide +kernel)
theorem hok321_123 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 123 L1.T321.h_123 :=
  hok_of O 123 _ (by rw [hO 123 (by norm_num)]; decide +kernel)
theorem hok321_124 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 124 L1.T321.h_124 :=
  hok_of O 124 _ (by rw [hO 124 (by norm_num)]; decide +kernel)
theorem hok321_125 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 125 L1.T321.h_125 :=
  hok_of O 125 _ (by rw [hO 125 (by norm_num)]; decide +kernel)
theorem hok321_126 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 126 L1.T321.h_126 :=
  hok_of O 126 _ (by rw [hO 126 (by norm_num)]; decide +kernel)
theorem hok321_127 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 127 L1.T321.h_127 :=
  hok_of O 127 _ (by rw [hO 127 (by norm_num)]; decide +kernel)
theorem hok321_128 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 128 L1.T321.h_128 :=
  hok_of O 128 _ (by rw [hO 128 (by norm_num)]; decide +kernel)
theorem hok321_129 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 129 L1.T321.h_129 :=
  hok_of O 129 _ (by rw [hO 129 (by norm_num)]; decide +kernel)
theorem hok321_130 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 130 L1.T321.h_130 :=
  hok_of O 130 _ (by rw [hO 130 (by norm_num)]; decide +kernel)
theorem hok321_131 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 131 L1.T321.h_131 :=
  hok_of O 131 _ (by rw [hO 131 (by norm_num)]; decide +kernel)
theorem hok321_132 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 132 L1.T321.h_132 :=
  hok_of O 132 _ (by rw [hO 132 (by norm_num)]; decide +kernel)
theorem hok321_133 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 133 L1.T321.h_133 :=
  hok_of O 133 _ (by rw [hO 133 (by norm_num)]; decide +kernel)
theorem hok321_134 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 134 L1.T321.h_134 :=
  hok_of O 134 _ (by rw [hO 134 (by norm_num)]; decide +kernel)
theorem hok321_135 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 135 L1.T321.h_135 :=
  hok_of O 135 _ (by rw [hO 135 (by norm_num)]; decide +kernel)
theorem hok321_136 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 136 L1.T321.h_136 :=
  hok_of O 136 _ (by rw [hO 136 (by norm_num)]; decide +kernel)
theorem hok321_137 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 137 L1.T321.h_137 :=
  hok_of O 137 _ (by rw [hO 137 (by norm_num)]; decide +kernel)
theorem hok321_138 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 138 L1.T321.h_138 :=
  hok_of O 138 _ (by rw [hO 138 (by norm_num)]; decide +kernel)
theorem hok321_139 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 139 L1.T321.h_139 :=
  hok_of O 139 _ (by rw [hO 139 (by norm_num)]; decide +kernel)
theorem hok321_140 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 140 L1.T321.h_140 :=
  hok_of O 140 _ (by rw [hO 140 (by norm_num)]; decide +kernel)
theorem hok321_141 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 141 L1.T321.h_141 :=
  hok_of O 141 _ (by rw [hO 141 (by norm_num)]; decide +kernel)
theorem hok321_142 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 142 L1.T321.h_142 :=
  hok_of O 142 _ (by rw [hO 142 (by norm_num)]; decide +kernel)
theorem hok321_143 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 143 L1.T321.h_143 :=
  hok_of O 143 _ (by rw [hO 143 (by norm_num)]; decide +kernel)
theorem hok321_144 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 144 L1.T321.h_144 :=
  hok_of O 144 _ (by rw [hO 144 (by norm_num)]; decide +kernel)
theorem hok321_145 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 145 L1.T321.h_145 :=
  hok_of O 145 _ (by rw [hO 145 (by norm_num)]; decide +kernel)
theorem hok321_146 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 146 L1.T321.h_146 :=
  hok_of O 146 _ (by rw [hO 146 (by norm_num)]; decide +kernel)
theorem hok321_147 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 147 L1.T321.h_147 :=
  hok_of O 147 _ (by rw [hO 147 (by norm_num)]; decide +kernel)
theorem hok321_148 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 148 L1.T321.h_148 :=
  hok_of O 148 _ (by rw [hO 148 (by norm_num)]; decide +kernel)
theorem hok321_149 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 149 L1.T321.h_149 :=
  hok_of O 149 _ (by rw [hO 149 (by norm_num)]; decide +kernel)
theorem hok321_150 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 150 L1.T321.h_150 :=
  hok_of O 150 _ (by rw [hO 150 (by norm_num)]; decide +kernel)
theorem hok321_151 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 151 L1.T321.h_151 :=
  hok_of O 151 _ (by rw [hO 151 (by norm_num)]; decide +kernel)
theorem hok321_152 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 152 L1.T321.h_152 :=
  hok_of O 152 _ (by rw [hO 152 (by norm_num)]; decide +kernel)
theorem hok321_153 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 153 L1.T321.h_153 :=
  hok_of O 153 _ (by rw [hO 153 (by norm_num)]; decide +kernel)
theorem hok321_154 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 154 L1.T321.h_154 :=
  hok_of O 154 _ (by rw [hO 154 (by norm_num)]; decide +kernel)
theorem hok321_155 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 155 L1.T321.h_155 :=
  hok_of O 155 _ (by rw [hO 155 (by norm_num)]; decide +kernel)
theorem hok321_156 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 156 L1.T321.h_156 :=
  hok_of O 156 _ (by rw [hO 156 (by norm_num)]; decide +kernel)
theorem hok321_157 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 157 L1.T321.h_157 :=
  hok_of O 157 _ (by rw [hO 157 (by norm_num)]; decide +kernel)
theorem hok321_158 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 158 L1.T321.h_158 :=
  hok_of O 158 _ (by rw [hO 158 (by norm_num)]; decide +kernel)
theorem hok321_159 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 159 L1.T321.h_159 :=
  hok_of O 159 _ (by rw [hO 159 (by norm_num)]; decide +kernel)
theorem hok321_160 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 160 L1.T321.h_160 :=
  hok_of O 160 _ (by rw [hO 160 (by norm_num)]; decide +kernel)
theorem hok321_161 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 161 L1.T321.h_161 :=
  hok_of O 161 _ (by rw [hO 161 (by norm_num)]; decide +kernel)
theorem hok321_162 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 162 L1.T321.h_162 :=
  hok_of O 162 _ (by rw [hO 162 (by norm_num)]; decide +kernel)
theorem hok321_163 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 163 L1.T321.h_163 :=
  hok_of O 163 _ (by rw [hO 163 (by norm_num)]; decide +kernel)
theorem hok321_164 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 164 L1.T321.h_164 :=
  hok_of O 164 _ (by rw [hO 164 (by norm_num)]; decide +kernel)
theorem hok321_165 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 165 L1.T321.h_165 :=
  hok_of O 165 _ (by rw [hO 165 (by norm_num)]; decide +kernel)
theorem hok321_166 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 166 L1.T321.h_166 :=
  hok_of O 166 _ (by rw [hO 166 (by norm_num)]; decide +kernel)
theorem hok321_167 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 167 L1.T321.h_167 :=
  hok_of O 167 _ (by rw [hO 167 (by norm_num)]; decide +kernel)
theorem hok321_168 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 168 L1.T321.h_168 :=
  hok_of O 168 _ (by rw [hO 168 (by norm_num)]; decide +kernel)
theorem hok321_169 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 169 L1.T321.h_169 :=
  hok_of O 169 _ (by rw [hO 169 (by norm_num)]; decide +kernel)
theorem hok321_170 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 170 L1.T321.h_170 :=
  hok_of O 170 _ (by rw [hO 170 (by norm_num)]; decide +kernel)
theorem hok321_171 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 171 L1.T321.h_171 :=
  hok_of O 171 _ (by rw [hO 171 (by norm_num)]; decide +kernel)
theorem hok321_172 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 172 L1.T321.h_172 :=
  hok_of O 172 _ (by rw [hO 172 (by norm_num)]; decide +kernel)
theorem hok321_173 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 173 L1.T321.h_173 :=
  hok_of O 173 _ (by rw [hO 173 (by norm_num)]; decide +kernel)
theorem hok321_174 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 174 L1.T321.h_174 :=
  hok_of O 174 _ (by rw [hO 174 (by norm_num)]; decide +kernel)
theorem hok321_175 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 175 L1.T321.h_175 :=
  hok_of O 175 _ (by rw [hO 175 (by norm_num)]; decide +kernel)
theorem hok321_176 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 176 L1.T321.h_176 :=
  hok_of O 176 _ (by rw [hO 176 (by norm_num)]; decide +kernel)
theorem hok321_177 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 177 L1.T321.h_177 :=
  hok_of O 177 _ (by rw [hO 177 (by norm_num)]; decide +kernel)
theorem hok321_178 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 178 L1.T321.h_178 :=
  hok_of O 178 _ (by rw [hO 178 (by norm_num)]; decide +kernel)
theorem hok321_179 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 179 L1.T321.h_179 :=
  hok_of O 179 _ (by rw [hO 179 (by norm_num)]; decide +kernel)
theorem hok321_180 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 180 L1.T321.h_180 :=
  hok_of O 180 _ (by rw [hO 180 (by norm_num)]; decide +kernel)
theorem hok321_181 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 181 L1.T321.h_181 :=
  hok_of O 181 _ (by rw [hO 181 (by norm_num)]; decide +kernel)
theorem hok321_182 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 182 L1.T321.h_182 :=
  hok_of O 182 _ (by rw [hO 182 (by norm_num)]; decide +kernel)
theorem hok321_183 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 183 L1.T321.h_183 :=
  hok_of O 183 _ (by rw [hO 183 (by norm_num)]; decide +kernel)
theorem hok321_184 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 184 L1.T321.h_184 :=
  hok_of O 184 _ (by rw [hO 184 (by norm_num)]; decide +kernel)
theorem hok321_185 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 185 L1.T321.h_185 :=
  hok_of O 185 _ (by rw [hO 185 (by norm_num)]; decide +kernel)
theorem hok321_186 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 186 L1.T321.h_186 :=
  hok_of O 186 _ (by rw [hO 186 (by norm_num)]; decide +kernel)
theorem hok321_187 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 187 L1.T321.h_187 :=
  hok_of O 187 _ (by rw [hO 187 (by norm_num)]; decide +kernel)
theorem hok321_188 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 188 L1.T321.h_188 :=
  hok_of O 188 _ (by rw [hO 188 (by norm_num)]; decide +kernel)
theorem hok321_189 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 189 L1.T321.h_189 :=
  hok_of O 189 _ (by rw [hO 189 (by norm_num)]; decide +kernel)
theorem hok321_190 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 190 L1.T321.h_190 :=
  hok_of O 190 _ (by rw [hO 190 (by norm_num)]; decide +kernel)
theorem hok321_191 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 191 L1.T321.h_191 :=
  hok_of O 191 _ (by rw [hO 191 (by norm_num)]; decide +kernel)
theorem hok321_192 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 192 L1.T321.h_192 :=
  hok_of O 192 _ (by rw [hO 192 (by norm_num)]; decide +kernel)
theorem hok321_193 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 193 L1.T321.h_193 :=
  hok_of O 193 _ (by rw [hO 193 (by norm_num)]; decide +kernel)
theorem hok321_194 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 194 L1.T321.h_194 :=
  hok_of O 194 _ (by rw [hO 194 (by norm_num)]; decide +kernel)
theorem hok321_195 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 195 L1.T321.h_195 :=
  hok_of O 195 _ (by rw [hO 195 (by norm_num)]; decide +kernel)
theorem hok321_196 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 196 L1.T321.h_196 :=
  hok_of O 196 _ (by rw [hO 196 (by norm_num)]; decide +kernel)
theorem hok321_197 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 197 L1.T321.h_197 :=
  hok_of O 197 _ (by rw [hO 197 (by norm_num)]; decide +kernel)
theorem hok321_198 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 198 L1.T321.h_198 :=
  hok_of O 198 _ (by rw [hO 198 (by norm_num)]; decide +kernel)
theorem hok321_199 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 199 L1.T321.h_199 :=
  hok_of O 199 _ (by rw [hO 199 (by norm_num)]; decide +kernel)
theorem hok321_200 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 200 L1.T321.h_200 :=
  hok_of O 200 _ (by rw [hO 200 (by norm_num)]; decide +kernel)
theorem hok321_201 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 201 L1.T321.h_201 :=
  hok_of O 201 _ (by rw [hO 201 (by norm_num)]; decide +kernel)
theorem hok321_202 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 202 L1.T321.h_202 :=
  hok_of O 202 _ (by rw [hO 202 (by norm_num)]; decide +kernel)
theorem hok321_203 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 203 L1.T321.h_203 :=
  hok_of O 203 _ (by rw [hO 203 (by norm_num)]; decide +kernel)
theorem hok321_204 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 204 L1.T321.h_204 :=
  hok_of O 204 _ (by rw [hO 204 (by norm_num)]; decide +kernel)
theorem hok321_205 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 205 L1.T321.h_205 :=
  hok_of O 205 _ (by rw [hO 205 (by norm_num)]; decide +kernel)
theorem hok321_206 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 206 L1.T321.h_206 :=
  hok_of O 206 _ (by rw [hO 206 (by norm_num)]; decide +kernel)
theorem hok321_207 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 207 L1.T321.h_207 :=
  hok_of O 207 _ (by rw [hO 207 (by norm_num)]; decide +kernel)
theorem hok321_208 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 208 L1.T321.h_208 :=
  hok_of O 208 _ (by rw [hO 208 (by norm_num)]; decide +kernel)
theorem hok321_209 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 209 L1.T321.h_209 :=
  hok_of O 209 _ (by rw [hO 209 (by norm_num)]; decide +kernel)
theorem hok321_210 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 210 L1.T321.h_210 :=
  hok_of O 210 _ (by rw [hO 210 (by norm_num)]; decide +kernel)
theorem hok321_211 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 211 L1.T321.h_211 :=
  hok_of O 211 _ (by rw [hO 211 (by norm_num)]; decide +kernel)
theorem hok321_212 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 212 L1.T321.h_212 :=
  hok_of O 212 _ (by rw [hO 212 (by norm_num)]; decide +kernel)
theorem hok321_213 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 213 L1.T321.h_213 :=
  hok_of O 213 _ (by rw [hO 213 (by norm_num)]; decide +kernel)
theorem hok321_214 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 214 L1.T321.h_214 :=
  hok_of O 214 _ (by rw [hO 214 (by norm_num)]; decide +kernel)
theorem hok321_215 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 215 L1.T321.h_215 :=
  hok_of O 215 _ (by rw [hO 215 (by norm_num)]; decide +kernel)
theorem hok321_216 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 216 L1.T321.h_216 :=
  hok_of O 216 _ (by rw [hO 216 (by norm_num)]; decide +kernel)
theorem hok321_217 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 217 L1.T321.h_217 :=
  hok_of O 217 _ (by rw [hO 217 (by norm_num)]; decide +kernel)
theorem hok321_218 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 218 L1.T321.h_218 :=
  hok_of O 218 _ (by rw [hO 218 (by norm_num)]; decide +kernel)
theorem hok321_219 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 219 L1.T321.h_219 :=
  hok_of O 219 _ (by rw [hO 219 (by norm_num)]; decide +kernel)
theorem hok321_220 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 220 L1.T321.h_220 :=
  hok_of O 220 _ (by rw [hO 220 (by norm_num)]; decide +kernel)
theorem hok321_221 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 221 L1.T321.h_221 :=
  hok_of O 221 _ (by rw [hO 221 (by norm_num)]; decide +kernel)
theorem hok321_222 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 222 L1.T321.h_222 :=
  hok_of O 222 _ (by rw [hO 222 (by norm_num)]; decide +kernel)
theorem hok321_223 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 223 L1.T321.h_223 :=
  hok_of O 223 _ (by rw [hO 223 (by norm_num)]; decide +kernel)
theorem hok321_224 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 224 L1.T321.h_224 :=
  hok_of O 224 _ (by rw [hO 224 (by norm_num)]; decide +kernel)
theorem hok321_225 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 225 L1.T321.h_225 :=
  hok_of O 225 _ (by rw [hO 225 (by norm_num)]; decide +kernel)
theorem hok321_226 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 226 L1.T321.h_226 :=
  hok_of O 226 _ (by rw [hO 226 (by norm_num)]; decide +kernel)
theorem hok321_227 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 227 L1.T321.h_227 :=
  hok_of O 227 _ (by rw [hO 227 (by norm_num)]; decide +kernel)
theorem hok321_228 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 228 L1.T321.h_228 :=
  hok_of O 228 _ (by rw [hO 228 (by norm_num)]; decide +kernel)
theorem hok321_229 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 229 L1.T321.h_229 :=
  hok_of O 229 _ (by rw [hO 229 (by norm_num)]; decide +kernel)
theorem hok321_230 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 230 L1.T321.h_230 :=
  hok_of O 230 _ (by rw [hO 230 (by norm_num)]; decide +kernel)
theorem hok321_231 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 231 L1.T321.h_231 :=
  hok_of O 231 _ (by rw [hO 231 (by norm_num)]; decide +kernel)
theorem hok321_232 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 232 L1.T321.h_232 :=
  hok_of O 232 _ (by rw [hO 232 (by norm_num)]; decide +kernel)
theorem hok321_233 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 233 L1.T321.h_233 :=
  hok_of O 233 _ (by rw [hO 233 (by norm_num)]; decide +kernel)
theorem hok321_234 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 234 L1.T321.h_234 :=
  hok_of O 234 _ (by rw [hO 234 (by norm_num)]; decide +kernel)
theorem hok321_235 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 235 L1.T321.h_235 :=
  hok_of O 235 _ (by rw [hO 235 (by norm_num)]; decide +kernel)
theorem hok321_236 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 236 L1.T321.h_236 :=
  hok_of O 236 _ (by rw [hO 236 (by norm_num)]; decide +kernel)
theorem hok321_237 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 237 L1.T321.h_237 :=
  hok_of O 237 _ (by rw [hO 237 (by norm_num)]; decide +kernel)
theorem hok321_238 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 238 L1.T321.h_238 :=
  hok_of O 238 _ (by rw [hO 238 (by norm_num)]; decide +kernel)
theorem hok321_239 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 239 L1.T321.h_239 :=
  hok_of O 239 _ (by rw [hO 239 (by norm_num)]; decide +kernel)
theorem hok321_240 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 240 L1.T321.h_240 :=
  hok_of O 240 _ (by rw [hO 240 (by norm_num)]; decide +kernel)
theorem hok321_241 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 241 L1.T321.h_241 :=
  hok_of O 241 _ (by rw [hO 241 (by norm_num)]; decide +kernel)
theorem hok321_242 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 242 L1.T321.h_242 :=
  hok_of O 242 _ (by rw [hO 242 (by norm_num)]; decide +kernel)
theorem hok321_243 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 243 L1.T321.h_243 :=
  hok_of O 243 _ (by rw [hO 243 (by norm_num)]; decide +kernel)
theorem hok321_244 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 244 L1.T321.h_244 :=
  hok_of O 244 _ (by rw [hO 244 (by norm_num)]; decide +kernel)
theorem hok321_245 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 245 L1.T321.h_245 :=
  hok_of O 245 _ (by rw [hO 245 (by norm_num)]; decide +kernel)
theorem hok321_246 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 246 L1.T321.h_246 :=
  hok_of O 246 _ (by rw [hO 246 (by norm_num)]; decide +kernel)
theorem hok321_247 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 247 L1.T321.h_247 :=
  hok_of O 247 _ (by rw [hO 247 (by norm_num)]; decide +kernel)
theorem hok321_248 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 248 L1.T321.h_248 :=
  hok_of O 248 _ (by rw [hO 248 (by norm_num)]; decide +kernel)
theorem hok321_249 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 249 L1.T321.h_249 :=
  hok_of O 249 _ (by rw [hO 249 (by norm_num)]; decide +kernel)
theorem hok321_250 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 250 L1.T321.h_250 :=
  hok_of O 250 _ (by rw [hO 250 (by norm_num)]; decide +kernel)
theorem hok321_251 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 251 L1.T321.h_251 :=
  hok_of O 251 _ (by rw [hO 251 (by norm_num)]; decide +kernel)
theorem hok321_252 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 252 L1.T321.h_252 :=
  hok_of O 252 _ (by rw [hO 252 (by norm_num)]; decide +kernel)
theorem hok321_253 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 253 L1.T321.h_253 :=
  hok_of O 253 _ (by rw [hO 253 (by norm_num)]; decide +kernel)
theorem hok321_254 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 254 L1.T321.h_254 :=
  hok_of O 254 _ (by rw [hO 254 (by norm_num)]; decide +kernel)
theorem hok321_255 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 255 L1.T321.h_255 :=
  hok_of O 255 _ (by rw [hO 255 (by norm_num)]; decide +kernel)
theorem hok321_256 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 256 L1.T321.h_256 :=
  hok_of O 256 _ (by rw [hO 256 (by norm_num)]; decide +kernel)
theorem hok321_257 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 257 L1.T321.h_257 :=
  hok_of O 257 _ (by rw [hO 257 (by norm_num)]; decide +kernel)
theorem hok321_258 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 258 L1.T321.h_258 :=
  hok_of O 258 _ (by rw [hO 258 (by norm_num)]; decide +kernel)
theorem hok321_259 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 259 L1.T321.h_259 :=
  hok_of O 259 _ (by rw [hO 259 (by norm_num)]; decide +kernel)
theorem hok321_260 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 260 L1.T321.h_260 :=
  hok_of O 260 _ (by rw [hO 260 (by norm_num)]; decide +kernel)
theorem hok321_261 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 261 L1.T321.h_261 :=
  hok_of O 261 _ (by rw [hO 261 (by norm_num)]; decide +kernel)
theorem hok321_262 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 262 L1.T321.h_262 :=
  hok_of O 262 _ (by rw [hO 262 (by norm_num)]; decide +kernel)
theorem hok321_263 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 263 L1.T321.h_263 :=
  hok_of O 263 _ (by rw [hO 263 (by norm_num)]; decide +kernel)
theorem hok321_264 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 264 L1.T321.h_264 :=
  hok_of O 264 _ (by rw [hO 264 (by norm_num)]; decide +kernel)
theorem hok321_265 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 265 L1.T321.h_265 :=
  hok_of O 265 _ (by rw [hO 265 (by norm_num)]; decide +kernel)
theorem hok321_266 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 266 L1.T321.h_266 :=
  hok_of O 266 _ (by rw [hO 266 (by norm_num)]; decide +kernel)
theorem hok321_267 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 267 L1.T321.h_267 :=
  hok_of O 267 _ (by rw [hO 267 (by norm_num)]; decide +kernel)
theorem hok321_268 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 268 L1.T321.h_268 :=
  hok_of O 268 _ (by rw [hO 268 (by norm_num)]; decide +kernel)
theorem hok321_269 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 269 L1.T321.h_269 :=
  hok_of O 269 _ (by rw [hO 269 (by norm_num)]; decide +kernel)
theorem hok321_270 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 270 L1.T321.h_270 :=
  hok_of O 270 _ (by rw [hO 270 (by norm_num)]; decide +kernel)
theorem hok321_271 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 271 L1.T321.h_271 :=
  hok_of O 271 _ (by rw [hO 271 (by norm_num)]; decide +kernel)
theorem hok321_272 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 272 L1.T321.h_272 :=
  hok_of O 272 _ (by rw [hO 272 (by norm_num)]; decide +kernel)
theorem hok321_273 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 273 L1.T321.h_273 :=
  hok_of O 273 _ (by rw [hO 273 (by norm_num)]; decide +kernel)
theorem hok321_274 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 274 L1.T321.h_274 :=
  hok_of O 274 _ (by rw [hO 274 (by norm_num)]; decide +kernel)
theorem hok321_275 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 275 L1.T321.h_275 :=
  hok_of O 275 _ (by rw [hO 275 (by norm_num)]; decide +kernel)
theorem hok321_276 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 276 L1.T321.h_276 :=
  hok_of O 276 _ (by rw [hO 276 (by norm_num)]; decide +kernel)
theorem hok321_277 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 277 L1.T321.h_277 :=
  hok_of O 277 _ (by rw [hO 277 (by norm_num)]; decide +kernel)
theorem hok321_278 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 278 L1.T321.h_278 :=
  hok_of O 278 _ (by rw [hO 278 (by norm_num)]; decide +kernel)
theorem hok321_279 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 279 L1.T321.h_279 :=
  hok_of O 279 _ (by rw [hO 279 (by norm_num)]; decide +kernel)
theorem hok321_280 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 280 L1.T321.h_280 :=
  hok_of O 280 _ (by rw [hO 280 (by norm_num)]; decide +kernel)
theorem hok321_281 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 281 L1.T321.h_281 :=
  hok_of O 281 _ (by rw [hO 281 (by norm_num)]; decide +kernel)
theorem hok321_282 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 282 L1.T321.h_282 :=
  hok_of O 282 _ (by rw [hO 282 (by norm_num)]; decide +kernel)
theorem hok321_283 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 283 L1.T321.h_283 :=
  hok_of O 283 _ (by rw [hO 283 (by norm_num)]; decide +kernel)
theorem hok321_284 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 284 L1.T321.h_284 :=
  hok_of O 284 _ (by rw [hO 284 (by norm_num)]; decide +kernel)
theorem hok321_285 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 285 L1.T321.h_285 :=
  hok_of O 285 _ (by rw [hO 285 (by norm_num)]; decide +kernel)
theorem hok321_286 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 286 L1.T321.h_286 :=
  hok_of O 286 _ (by rw [hO 286 (by norm_num)]; decide +kernel)
theorem hok321_287 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 287 L1.T321.h_287 :=
  hok_of O 287 _ (by rw [hO 287 (by norm_num)]; decide +kernel)
theorem hok321_288 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 288 L1.T321.h_288 :=
  hok_of O 288 _ (by rw [hO 288 (by norm_num)]; decide +kernel)
theorem hok321_289 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 289 L1.T321.h_289 :=
  hok_of O 289 _ (by rw [hO 289 (by norm_num)]; decide +kernel)
theorem hok321_290 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 290 L1.T321.h_290 :=
  hok_of O 290 _ (by rw [hO 290 (by norm_num)]; decide +kernel)
theorem hok321_291 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 291 L1.T321.h_291 :=
  hok_of O 291 _ (by rw [hO 291 (by norm_num)]; decide +kernel)
theorem hok321_292 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 292 L1.T321.h_292 :=
  hok_of O 292 _ (by rw [hO 292 (by norm_num)]; decide +kernel)
theorem hok321_293 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 293 L1.T321.h_293 :=
  hok_of O 293 _ (by rw [hO 293 (by norm_num)]; decide +kernel)
theorem hok321_294 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 294 L1.T321.h_294 :=
  hok_of O 294 _ (by rw [hO 294 (by norm_num)]; decide +kernel)
theorem hok321_295 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 295 L1.T321.h_295 :=
  hok_of O 295 _ (by rw [hO 295 (by norm_num)]; decide +kernel)
theorem hok321_296 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 296 L1.T321.h_296 :=
  hok_of O 296 _ (by rw [hO 296 (by norm_num)]; decide +kernel)
theorem hok321_297 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 297 L1.T321.h_297 :=
  hok_of O 297 _ (by rw [hO 297 (by norm_num)]; decide +kernel)
theorem hok321_298 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 298 L1.T321.h_298 :=
  hok_of O 298 _ (by rw [hO 298 (by norm_num)]; decide +kernel)
theorem hok321_299 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 299 L1.T321.h_299 :=
  hok_of O 299 _ (by rw [hO 299 (by norm_num)]; decide +kernel)
theorem hok321_300 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 300 L1.T321.h_300 :=
  hok_of O 300 _ (by rw [hO 300 (by norm_num)]; decide +kernel)
theorem hok321_301 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 301 L1.T321.h_301 :=
  hok_of O 301 _ (by rw [hO 301 (by norm_num)]; decide +kernel)
theorem hok321_302 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 302 L1.T321.h_302 :=
  hok_of O 302 _ (by rw [hO 302 (by norm_num)]; decide +kernel)
theorem hok321_303 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 303 L1.T321.h_303 :=
  hok_of O 303 _ (by rw [hO 303 (by norm_num)]; decide +kernel)
theorem hok321_304 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 304 L1.T321.h_304 :=
  hok_of O 304 _ (by rw [hO 304 (by norm_num)]; decide +kernel)
theorem hok321_305 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 305 L1.T321.h_305 :=
  hok_of O 305 _ (by rw [hO 305 (by norm_num)]; decide +kernel)
theorem hok321_306 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 306 L1.T321.h_306 :=
  hok_of O 306 _ (by rw [hO 306 (by norm_num)]; decide +kernel)
theorem hok321_307 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 307 L1.T321.h_307 :=
  hok_of O 307 _ (by rw [hO 307 (by norm_num)]; decide +kernel)
theorem hok321_308 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 308 L1.T321.h_308 :=
  hok_of O 308 _ (by rw [hO 308 (by norm_num)]; decide +kernel)
theorem hok321_309 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 309 L1.T321.h_309 :=
  hok_of O 309 _ (by rw [hO 309 (by norm_num)]; decide +kernel)
theorem hok321_310 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 310 L1.T321.h_310 :=
  hok_of O 310 _ (by rw [hO 310 (by norm_num)]; decide +kernel)
theorem hok321_311 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 311 L1.T321.h_311 :=
  hok_of O 311 _ (by rw [hO 311 (by norm_num)]; decide +kernel)
theorem hok321_312 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 312 L1.T321.h_312 :=
  hok_of O 312 _ (by rw [hO 312 (by norm_num)]; decide +kernel)
theorem hok321_313 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 313 L1.T321.h_313 :=
  hok_of O 313 _ (by rw [hO 313 (by norm_num)]; decide +kernel)
theorem hok321_314 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 314 L1.T321.h_314 :=
  hok_of O 314 _ (by rw [hO 314 (by norm_num)]; decide +kernel)
theorem hok321_315 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 315 L1.T321.h_315 :=
  hok_of O 315 _ (by rw [hO 315 (by norm_num)]; decide +kernel)
theorem hok321_316 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 316 L1.T321.h_316 :=
  hok_of O 316 _ (by rw [hO 316 (by norm_num)]; decide +kernel)
theorem hok321_317 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 317 L1.T321.h_317 :=
  hok_of O 317 _ (by rw [hO 317 (by norm_num)]; decide +kernel)
theorem hok321_318 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 318 L1.T321.h_318 :=
  hok_of O 318 _ (by rw [hO 318 (by norm_num)]; decide +kernel)
theorem hok321_319 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 319 L1.T321.h_319 :=
  hok_of O 319 _ (by rw [hO 319 (by norm_num)]; decide +kernel)
theorem hok321_320 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 320 L1.T321.h_320 :=
  hok_of O 320 _ (by rw [hO 320 (by norm_num)]; decide +kernel)
theorem hok321_321 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 321 L1.T321.h_321 :=
  hok_of O 321 _ (by rw [hO 321 (by norm_num)]; decide +kernel)
theorem hok321_322 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 322 L1.T321.h_322 :=
  hok_of O 322 _ (by rw [hO 322 (by norm_num)]; decide +kernel)
theorem hok321_323 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 323 L1.T321.h_323 :=
  hok_of O 323 _ (by rw [hO 323 (by norm_num)]; decide +kernel)
theorem hok321_324 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 324 L1.T321.h_324 :=
  hok_of O 324 _ (by rw [hO 324 (by norm_num)]; decide +kernel)
theorem hok321_325 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 325 L1.T321.h_325 :=
  hok_of O 325 _ (by rw [hO 325 (by norm_num)]; decide +kernel)
theorem hok321_326 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 326 L1.T321.h_326 :=
  hok_of O 326 _ (by rw [hO 326 (by norm_num)]; decide +kernel)
theorem hok321_327 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 327 L1.T321.h_327 :=
  hok_of O 327 _ (by rw [hO 327 (by norm_num)]; decide +kernel)
theorem hok321_328 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 328 L1.T321.h_328 :=
  hok_of O 328 _ (by rw [hO 328 (by norm_num)]; decide +kernel)
theorem hok321_329 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 329 L1.T321.h_329 :=
  hok_of O 329 _ (by rw [hO 329 (by norm_num)]; decide +kernel)
theorem hok321_330 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 330 L1.T321.h_330 :=
  hok_of O 330 _ (by rw [hO 330 (by norm_num)]; decide +kernel)
theorem hok321_331 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 331 L1.T321.h_331 :=
  hok_of O 331 _ (by rw [hO 331 (by norm_num)]; decide +kernel)
theorem hok321_332 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 332 L1.T321.h_332 :=
  hok_of O 332 _ (by rw [hO 332 (by norm_num)]; decide +kernel)
theorem hok321_333 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 333 L1.T321.h_333 :=
  hok_of O 333 _ (by rw [hO 333 (by norm_num)]; decide +kernel)
theorem hok321_334 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 334 L1.T321.h_334 :=
  hok_of O 334 _ (by rw [hO 334 (by norm_num)]; decide +kernel)
theorem hok321_335 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 335 L1.T321.h_335 :=
  hok_of O 335 _ (by rw [hO 335 (by norm_num)]; decide +kernel)
theorem hok321_336 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 336 L1.T321.h_336 :=
  hok_of O 336 _ (by rw [hO 336 (by norm_num)]; decide +kernel)
theorem hok321_337 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 337 L1.T321.h_337 :=
  hok_of O 337 _ (by rw [hO 337 (by norm_num)]; decide +kernel)
theorem hok321_338 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 338 L1.T321.h_338 :=
  hok_of O 338 _ (by rw [hO 338 (by norm_num)]; decide +kernel)
theorem hok321_339 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 339 L1.T321.h_339 :=
  hok_of O 339 _ (by rw [hO 339 (by norm_num)]; decide +kernel)
theorem hok321_340 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 340 L1.T321.h_340 :=
  hok_of O 340 _ (by rw [hO 340 (by norm_num)]; decide +kernel)
theorem hok321_341 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 341 L1.T321.h_341 :=
  hok_of O 341 _ (by rw [hO 341 (by norm_num)]; decide +kernel)
theorem hok321_342 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 342 L1.T321.h_342 :=
  hok_of O 342 _ (by rw [hO 342 (by norm_num)]; decide +kernel)
theorem hok321_343 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 343 L1.T321.h_343 :=
  hok_of O 343 _ (by rw [hO 343 (by norm_num)]; decide +kernel)
theorem hok321_344 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 344 L1.T321.h_344 :=
  hok_of O 344 _ (by rw [hO 344 (by norm_num)]; decide +kernel)
theorem hok321_345 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 345 L1.T321.h_345 :=
  hok_of O 345 _ (by rw [hO 345 (by norm_num)]; decide +kernel)
theorem hok321_346 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 346 L1.T321.h_346 :=
  hok_of O 346 _ (by rw [hO 346 (by norm_num)]; decide +kernel)
theorem hok321_347 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 347 L1.T321.h_347 :=
  hok_of O 347 _ (by rw [hO 347 (by norm_num)]; decide +kernel)
theorem hok321_348 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 348 L1.T321.h_348 :=
  hok_of O 348 _ (by rw [hO 348 (by norm_num)]; decide +kernel)
theorem hok321_349 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 349 L1.T321.h_349 :=
  hok_of O 349 _ (by rw [hO 349 (by norm_num)]; decide +kernel)
theorem hok321_350 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 350 L1.T321.h_350 :=
  hok_of O 350 _ (by rw [hO 350 (by norm_num)]; decide +kernel)
theorem hok321_351 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 351 L1.T321.h_351 :=
  hok_of O 351 _ (by rw [hO 351 (by norm_num)]; decide +kernel)
theorem hok321_352 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 352 L1.T321.h_352 :=
  hok_of O 352 _ (by rw [hO 352 (by norm_num)]; decide +kernel)
theorem hok321_353 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 353 L1.T321.h_353 :=
  hok_of O 353 _ (by rw [hO 353 (by norm_num)]; decide +kernel)
theorem hok321_354 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 354 L1.T321.h_354 :=
  hok_of O 354 _ (by rw [hO 354 (by norm_num)]; decide +kernel)
theorem hok321_355 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 355 L1.T321.h_355 :=
  hok_of O 355 _ (by rw [hO 355 (by norm_num)]; decide +kernel)
theorem hok321_356 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 356 L1.T321.h_356 :=
  hok_of O 356 _ (by rw [hO 356 (by norm_num)]; decide +kernel)
theorem hok321_357 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 357 L1.T321.h_357 :=
  hok_of O 357 _ (by rw [hO 357 (by norm_num)]; decide +kernel)
theorem hok321_358 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 358 L1.T321.h_358 :=
  hok_of O 358 _ (by rw [hO 358 (by norm_num)]; decide +kernel)
theorem hok321_359 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 359 L1.T321.h_359 :=
  hok_of O 359 _ (by rw [hO 359 (by norm_num)]; decide +kernel)
theorem hok321_360 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 360 L1.T321.h_360 :=
  hok_of O 360 _ (by rw [hO 360 (by norm_num)]; decide +kernel)
theorem hok321_361 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 361 L1.T321.h_361 :=
  hok_of O 361 _ (by rw [hO 361 (by norm_num)]; decide +kernel)
theorem hok321_362 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 362 L1.T321.h_362 :=
  hok_of O 362 _ (by rw [hO 362 (by norm_num)]; decide +kernel)
theorem hok321_363 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 363 L1.T321.h_363 :=
  hok_of O 363 _ (by rw [hO 363 (by norm_num)]; decide +kernel)
theorem hok321_364 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 364 L1.T321.h_364 :=
  hok_of O 364 _ (by rw [hO 364 (by norm_num)]; decide +kernel)
theorem hok321_365 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 365 L1.T321.h_365 :=
  hok_of O 365 _ (by rw [hO 365 (by norm_num)]; decide +kernel)
theorem hok321_366 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 366 L1.T321.h_366 :=
  hok_of O 366 _ (by rw [hO 366 (by norm_num)]; decide +kernel)
theorem hok321_367 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 367 L1.T321.h_367 :=
  hok_of O 367 _ (by rw [hO 367 (by norm_num)]; decide +kernel)
theorem hok321_368 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 368 L1.T321.h_368 :=
  hok_of O 368 _ (by rw [hO 368 (by norm_num)]; decide +kernel)
theorem hok321_369 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 369 L1.T321.h_369 :=
  hok_of O 369 _ (by rw [hO 369 (by norm_num)]; decide +kernel)
theorem hok321_370 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 370 L1.T321.h_370 :=
  hok_of O 370 _ (by rw [hO 370 (by norm_num)]; decide +kernel)
theorem hok321_371 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 371 L1.T321.h_371 :=
  hok_of O 371 _ (by rw [hO 371 (by norm_num)]; decide +kernel)
theorem hok321_372 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 372 L1.T321.h_372 :=
  hok_of O 372 _ (by rw [hO 372 (by norm_num)]; decide +kernel)
theorem hok321_373 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 373 L1.T321.h_373 :=
  hok_of O 373 _ (by rw [hO 373 (by norm_num)]; decide +kernel)
theorem hok321_374 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 374 L1.T321.h_374 :=
  hok_of O 374 _ (by rw [hO 374 (by norm_num)]; decide +kernel)
theorem hok321_375 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 375 L1.T321.h_375 :=
  hok_of O 375 _ (by rw [hO 375 (by norm_num)]; decide +kernel)
theorem hok321_376 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 376 L1.T321.h_376 :=
  hok_of O 376 _ (by rw [hO 376 (by norm_num)]; decide +kernel)
theorem hok321_377 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 377 L1.T321.h_377 :=
  hok_of O 377 _ (by rw [hO 377 (by norm_num)]; decide +kernel)
theorem hok321_378 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 378 L1.T321.h_378 :=
  hok_of O 378 _ (by rw [hO 378 (by norm_num)]; decide +kernel)
theorem hok321_379 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 379 L1.T321.h_379 :=
  hok_of O 379 _ (by rw [hO 379 (by norm_num)]; decide +kernel)
theorem hok321_380 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 380 L1.T321.h_380 :=
  hok_of O 380 _ (by rw [hO 380 (by norm_num)]; decide +kernel)
theorem hok321_381 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 381 L1.T321.h_381 :=
  hok_of O 381 _ (by rw [hO 381 (by norm_num)]; decide +kernel)
theorem hok321_382 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 382 L1.T321.h_382 :=
  hok_of O 382 _ (by rw [hO 382 (by norm_num)]; decide +kernel)
theorem hok321_383 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 383 L1.T321.h_383 :=
  hok_of O 383 _ (by rw [hO 383 (by norm_num)]; decide +kernel)
theorem hok321_384 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 384 L1.T321.h_384 :=
  hok_of O 384 _ (by rw [hO 384 (by norm_num)]; decide +kernel)
theorem hok321_385 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 385 L1.T321.h_385 :=
  hok_of O 385 _ (by rw [hO 385 (by norm_num)]; decide +kernel)
theorem hok321_386 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 386 L1.T321.h_386 :=
  hok_of O 386 _ (by rw [hO 386 (by norm_num)]; decide +kernel)
theorem hok321_387 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 387 L1.T321.h_387 :=
  hok_of O 387 _ (by rw [hO 387 (by norm_num)]; decide +kernel)
theorem hok321_388 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 388 L1.T321.h_388 :=
  hok_of O 388 _ (by rw [hO 388 (by norm_num)]; decide +kernel)
theorem hok321_389 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 389 L1.T321.h_389 :=
  hok_of O 389 _ (by rw [hO 389 (by norm_num)]; decide +kernel)
theorem hok321_390 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 390 L1.T321.h_390 :=
  hok_of O 390 _ (by rw [hO 390 (by norm_num)]; decide +kernel)
theorem hok321_391 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 391 L1.T321.h_391 :=
  hok_of O 391 _ (by rw [hO 391 (by norm_num)]; decide +kernel)
theorem hok321_392 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 392 L1.T321.h_392 :=
  hok_of O 392 _ (by rw [hO 392 (by norm_num)]; decide +kernel)
theorem hok321_393 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 393 L1.T321.h_393 :=
  hok_of O 393 _ (by rw [hO 393 (by norm_num)]; decide +kernel)
theorem hok321_394 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 394 L1.T321.h_394 :=
  hok_of O 394 _ (by rw [hO 394 (by norm_num)]; decide +kernel)
theorem hok321_395 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 395 L1.T321.h_395 :=
  hok_of O 395 _ (by rw [hO 395 (by norm_num)]; decide +kernel)
theorem hok321_396 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 396 L1.T321.h_396 :=
  hok_of O 396 _ (by rw [hO 396 (by norm_num)]; decide +kernel)
theorem hok321_397 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 397 L1.T321.h_397 :=
  hok_of O 397 _ (by rw [hO 397 (by norm_num)]; decide +kernel)
theorem hok321_398 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 398 L1.T321.h_398 :=
  hok_of O 398 _ (by rw [hO 398 (by norm_num)]; decide +kernel)
theorem hok321_399 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 399 L1.T321.h_399 :=
  hok_of O 399 _ (by rw [hO 399 (by norm_num)]; decide +kernel)
theorem hok321_400 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 400 L1.T321.h_400 :=
  hok_of O 400 _ (by rw [hO 400 (by norm_num)]; decide +kernel)
theorem hok321_401 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 401 L1.T321.h_401 :=
  hok_of O 401 _ (by rw [hO 401 (by norm_num)]; decide +kernel)
theorem hok321_402 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 402 L1.T321.h_402 :=
  hok_of O 402 _ (by rw [hO 402 (by norm_num)]; decide +kernel)
theorem hok321_403 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 403 L1.T321.h_403 :=
  hok_of O 403 _ (by rw [hO 403 (by norm_num)]; decide +kernel)
theorem hok321_404 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 404 L1.T321.h_404 :=
  hok_of O 404 _ (by rw [hO 404 (by norm_num)]; decide +kernel)
theorem hok321_405 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 405 L1.T321.h_405 :=
  hok_of O 405 _ (by rw [hO 405 (by norm_num)]; decide +kernel)
theorem hok321_406 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 406 L1.T321.h_406 :=
  hok_of O 406 _ (by rw [hO 406 (by norm_num)]; decide +kernel)
theorem hok321_407 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 407 L1.T321.h_407 :=
  hok_of O 407 _ (by rw [hO 407 (by norm_num)]; decide +kernel)
theorem hok321_408 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 408 L1.T321.h_408 :=
  hok_of O 408 _ (by rw [hO 408 (by norm_num)]; decide +kernel)
theorem hok321_409 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 409 L1.T321.h_409 :=
  hok_of O 409 _ (by rw [hO 409 (by norm_num)]; decide +kernel)
theorem hok321_410 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 410 L1.T321.h_410 :=
  hok_of O 410 _ (by rw [hO 410 (by norm_num)]; decide +kernel)
theorem hok321_411 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 411 L1.T321.h_411 :=
  hok_of O 411 _ (by rw [hO 411 (by norm_num)]; decide +kernel)
theorem hok321_412 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 412 L1.T321.h_412 :=
  hok_of O 412 _ (by rw [hO 412 (by norm_num)]; decide +kernel)
theorem hok321_413 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 413 L1.T321.h_413 :=
  hok_of O 413 _ (by rw [hO 413 (by norm_num)]; decide +kernel)
theorem hok321_414 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 414 L1.T321.h_414 :=
  hok_of O 414 _ (by rw [hO 414 (by norm_num)]; decide +kernel)
theorem hok321_415 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 415 L1.T321.h_415 :=
  hok_of O 415 _ (by rw [hO 415 (by norm_num)]; decide +kernel)
theorem hok321_416 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 416 L1.T321.h_416 :=
  hok_of O 416 _ (by rw [hO 416 (by norm_num)]; decide +kernel)
theorem hok321_417 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 417 L1.T321.h_417 :=
  hok_of O 417 _ (by rw [hO 417 (by norm_num)]; decide +kernel)
theorem hok321_418 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 418 L1.T321.h_418 :=
  hok_of O 418 _ (by rw [hO 418 (by norm_num)]; decide +kernel)
theorem hok321_419 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 419 L1.T321.h_419 :=
  hok_of O 419 _ (by rw [hO 419 (by norm_num)]; decide +kernel)
theorem hok321_420 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 420 L1.T321.h_420 :=
  hok_of O 420 _ (by rw [hO 420 (by norm_num)]; decide +kernel)
theorem hok321_421 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 421 L1.T321.h_421 :=
  hok_of O 421 _ (by rw [hO 421 (by norm_num)]; decide +kernel)
theorem hok321_422 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 422 L1.T321.h_422 :=
  hok_of O 422 _ (by rw [hO 422 (by norm_num)]; decide +kernel)
theorem hok321_423 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 423 L1.T321.h_423 :=
  hok_of O 423 _ (by rw [hO 423 (by norm_num)]; decide +kernel)
theorem hok321_424 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 424 L1.T321.h_424 :=
  hok_of O 424 _ (by rw [hO 424 (by norm_num)]; decide +kernel)
theorem hok321_425 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 425 L1.T321.h_425 :=
  hok_of O 425 _ (by rw [hO 425 (by norm_num)]; decide +kernel)
theorem hok321_426 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 426 L1.T321.h_426 :=
  hok_of O 426 _ (by rw [hO 426 (by norm_num)]; decide +kernel)
theorem hok321_427 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 427 L1.T321.h_427 :=
  hok_of O 427 _ (by rw [hO 427 (by norm_num)]; decide +kernel)
theorem hok321_428 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 428 L1.T321.h_428 :=
  hok_of O 428 _ (by rw [hO 428 (by norm_num)]; decide +kernel)
theorem hok321_429 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 429 L1.T321.h_429 :=
  hok_of O 429 _ (by rw [hO 429 (by norm_num)]; decide +kernel)
theorem hok321_430 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 430 L1.T321.h_430 :=
  hok_of O 430 _ (by rw [hO 430 (by norm_num)]; decide +kernel)
theorem hok321_431 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 431 L1.T321.h_431 :=
  hok_of O 431 _ (by rw [hO 431 (by norm_num)]; decide +kernel)
theorem hok321_432 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 432 L1.T321.h_432 :=
  hok_of O 432 _ (by rw [hO 432 (by norm_num)]; decide +kernel)
theorem hok321_433 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 433 L1.T321.h_433 :=
  hok_of O 433 _ (by rw [hO 433 (by norm_num)]; decide +kernel)
theorem hok321_434 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 434 L1.T321.h_434 :=
  hok_of O 434 _ (by rw [hO 434 (by norm_num)]; decide +kernel)
theorem hok321_435 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 435 L1.T321.h_435 :=
  hok_of O 435 _ (by rw [hO 435 (by norm_num)]; decide +kernel)
theorem hok321_436 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 436 L1.T321.h_436 :=
  hok_of O 436 _ (by rw [hO 436 (by norm_num)]; decide +kernel)
theorem hok321_437 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 437 L1.T321.h_437 :=
  hok_of O 437 _ (by rw [hO 437 (by norm_num)]; decide +kernel)
theorem hok321_438 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 438 L1.T321.h_438 :=
  hok_of O 438 _ (by rw [hO 438 (by norm_num)]; decide +kernel)
theorem hok321_439 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 439 L1.T321.h_439 :=
  hok_of O 439 _ (by rw [hO 439 (by norm_num)]; decide +kernel)
theorem hok321_440 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 440 L1.T321.h_440 :=
  hok_of O 440 _ (by rw [hO 440 (by norm_num)]; decide +kernel)
theorem hok321_441 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 441 L1.T321.h_441 :=
  hok_of O 441 _ (by rw [hO 441 (by norm_num)]; decide +kernel)
theorem hok321_442 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 442 L1.T321.h_442 :=
  hok_of O 442 _ (by rw [hO 442 (by norm_num)]; decide +kernel)
theorem hok321_443 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 443 L1.T321.h_443 :=
  hok_of O 443 _ (by rw [hO 443 (by norm_num)]; decide +kernel)
theorem hok321_444 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 444 L1.T321.h_444 :=
  hok_of O 444 _ (by rw [hO 444 (by norm_num)]; decide +kernel)
theorem hok321_445 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 445 L1.T321.h_445 :=
  hok_of O 445 _ (by rw [hO 445 (by norm_num)]; decide +kernel)
theorem hok321_446 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 446 L1.T321.h_446 :=
  hok_of O 446 _ (by rw [hO 446 (by norm_num)]; decide +kernel)
theorem hok321_447 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 447 L1.T321.h_447 :=
  hok_of O 447 _ (by rw [hO 447 (by norm_num)]; decide +kernel)
theorem hok321_448 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 448 L1.T321.h_448 :=
  hok_of O 448 _ (by rw [hO 448 (by norm_num)]; decide +kernel)
theorem hok321_449 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 449 L1.T321.h_449 :=
  hok_of O 449 _ (by rw [hO 449 (by norm_num)]; decide +kernel)
theorem hok321_450 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 450 L1.T321.h_450 :=
  hok_of O 450 _ (by rw [hO 450 (by norm_num)]; decide +kernel)
theorem hok321_451 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 451 L1.T321.h_451 :=
  hok_of O 451 _ (by rw [hO 451 (by norm_num)]; decide +kernel)
theorem hok321_452 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 452 L1.T321.h_452 :=
  hok_of O 452 _ (by rw [hO 452 (by norm_num)]; decide +kernel)
theorem hok321_453 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 453 L1.T321.h_453 :=
  hok_of O 453 _ (by rw [hO 453 (by norm_num)]; decide +kernel)
theorem hok321_454 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 454 L1.T321.h_454 :=
  hok_of O 454 _ (by rw [hO 454 (by norm_num)]; decide +kernel)
theorem hok321_455 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 455 L1.T321.h_455 :=
  hok_of O 455 _ (by rw [hO 455 (by norm_num)]; decide +kernel)
theorem hok321_456 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 456 L1.T321.h_456 :=
  hok_of O 456 _ (by rw [hO 456 (by norm_num)]; decide +kernel)
theorem hok321_457 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 457 L1.T321.h_457 :=
  hok_of O 457 _ (by rw [hO 457 (by norm_num)]; decide +kernel)
theorem hok321_458 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 458 L1.T321.h_458 :=
  hok_of O 458 _ (by rw [hO 458 (by norm_num)]; decide +kernel)
theorem hok321_459 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 459 L1.T321.h_459 :=
  hok_of O 459 _ (by rw [hO 459 (by norm_num)]; decide +kernel)
theorem hok321_460 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 460 L1.T321.h_460 :=
  hok_of O 460 _ (by rw [hO 460 (by norm_num)]; decide +kernel)
theorem hok321_461 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 461 L1.T321.h_461 :=
  hok_of O 461 _ (by rw [hO 461 (by norm_num)]; decide +kernel)
theorem hok321_462 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 462 L1.T321.h_462 :=
  hok_of O 462 _ (by rw [hO 462 (by norm_num)]; decide +kernel)
theorem hok321_463 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 463 L1.T321.h_463 :=
  hok_of O 463 _ (by rw [hO 463 (by norm_num)]; decide +kernel)
theorem hok321_464 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 464 L1.T321.h_464 :=
  hok_of O 464 _ (by rw [hO 464 (by norm_num)]; decide +kernel)
theorem hok321_465 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 465 L1.T321.h_465 :=
  hok_of O 465 _ (by rw [hO 465 (by norm_num)]; decide +kernel)
theorem hok321_466 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 466 L1.T321.h_466 :=
  hok_of O 466 _ (by rw [hO 466 (by norm_num)]; decide +kernel)
theorem hok321_467 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 467 L1.T321.h_467 :=
  hok_of O 467 _ (by rw [hO 467 (by norm_num)]; decide +kernel)
theorem hok321_468 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 468 L1.T321.h_468 :=
  hok_of O 468 _ (by rw [hO 468 (by norm_num)]; decide +kernel)
theorem hok321_469 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 469 L1.T321.h_469 :=
  hok_of O 469 _ (by rw [hO 469 (by norm_num)]; decide +kernel)
theorem hok321_470 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 470 L1.T321.h_470 :=
  hok_of O 470 _ (by rw [hO 470 (by norm_num)]; decide +kernel)
theorem hok321_471 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 471 L1.T321.h_471 :=
  hok_of O 471 _ (by rw [hO 471 (by norm_num)]; decide +kernel)
theorem hok321_472 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 472 L1.T321.h_472 :=
  hok_of O 472 _ (by rw [hO 472 (by norm_num)]; decide +kernel)
theorem hok321_473 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 473 L1.T321.h_473 :=
  hok_of O 473 _ (by rw [hO 473 (by norm_num)]; decide +kernel)
theorem hok321_474 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 474 L1.T321.h_474 :=
  hok_of O 474 _ (by rw [hO 474 (by norm_num)]; decide +kernel)
theorem hok321_475 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 475 L1.T321.h_475 :=
  hok_of O 475 _ (by rw [hO 475 (by norm_num)]; decide +kernel)
theorem hok321_476 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 476 L1.T321.h_476 :=
  hok_of O 476 _ (by rw [hO 476 (by norm_num)]; decide +kernel)
theorem hok321_477 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 477 L1.T321.h_477 :=
  hok_of O 477 _ (by rw [hO 477 (by norm_num)]; decide +kernel)
theorem hok321_478 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 478 L1.T321.h_478 :=
  hok_of O 478 _ (by rw [hO 478 (by norm_num)]; decide +kernel)
theorem hok321_479 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 479 L1.T321.h_479 :=
  hok_of O 479 _ (by rw [hO 479 (by norm_num)]; decide +kernel)
theorem hok321_480 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 480 L1.T321.h_480 :=
  hok_of O 480 _ (by rw [hO 480 (by norm_num)]; decide +kernel)
theorem hok321_481 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 481 L1.T321.h_481 :=
  hok_of O 481 _ (by rw [hO 481 (by norm_num)]; decide +kernel)
theorem hok321_482 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 482 L1.T321.h_482 :=
  hok_of O 482 _ (by rw [hO 482 (by norm_num)]; decide +kernel)
theorem hok321_483 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 483 L1.T321.h_483 :=
  hok_of O 483 _ (by rw [hO 483 (by norm_num)]; decide +kernel)
theorem hok321_484 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 484 L1.T321.h_484 :=
  hok_of O 484 _ (by rw [hO 484 (by norm_num)]; decide +kernel)
theorem hok321_485 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 485 L1.T321.h_485 :=
  hok_of O 485 _ (by rw [hO 485 (by norm_num)]; decide +kernel)
theorem hok321_486 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 486 L1.T321.h_486 :=
  hok_of O 486 _ (by rw [hO 486 (by norm_num)]; decide +kernel)
theorem hok321_487 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 487 L1.T321.h_487 :=
  hok_of O 487 _ (by rw [hO 487 (by norm_num)]; decide +kernel)
theorem hok321_488 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 488 L1.T321.h_488 :=
  hok_of O 488 _ (by rw [hO 488 (by norm_num)]; decide +kernel)
theorem hok321_489 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 489 L1.T321.h_489 :=
  hok_of O 489 _ (by rw [hO 489 (by norm_num)]; decide +kernel)
theorem hok321_490 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 490 L1.T321.h_490 :=
  hok_of O 490 _ (by rw [hO 490 (by norm_num)]; decide +kernel)
theorem hok321_491 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 491 L1.T321.h_491 :=
  hok_of O 491 _ (by rw [hO 491 (by norm_num)]; decide +kernel)
theorem hok321_492 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 492 L1.T321.h_492 :=
  hok_of O 492 _ (by rw [hO 492 (by norm_num)]; decide +kernel)
theorem hok321_493 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 493 L1.T321.h_493 :=
  hok_of O 493 _ (by rw [hO 493 (by norm_num)]; decide +kernel)
theorem hok321_494 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 494 L1.T321.h_494 :=
  hok_of O 494 _ (by rw [hO 494 (by norm_num)]; decide +kernel)
theorem hok321_495 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 495 L1.T321.h_495 :=
  hok_of O 495 _ (by rw [hO 495 (by norm_num)]; decide +kernel)
theorem hok321_496 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 496 L1.T321.h_496 :=
  hok_of O 496 _ (by rw [hO 496 (by norm_num)]; decide +kernel)
theorem hok321_497 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 497 L1.T321.h_497 :=
  hok_of O 497 _ (by rw [hO 497 (by norm_num)]; decide +kernel)
theorem hok321_498 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 498 L1.T321.h_498 :=
  hok_of O 498 _ (by rw [hO 498 (by norm_num)]; decide +kernel)
theorem hok321_499 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 499 L1.T321.h_499 :=
  hok_of O 499 _ (by rw [hO 499 (by norm_num)]; decide +kernel)
theorem hok321_500 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 500 L1.T321.h_500 :=
  hok_of O 500 _ (by rw [hO 500 (by norm_num)]; decide +kernel)
theorem hok321_501 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 501 L1.T321.h_501 :=
  hok_of O 501 _ (by rw [hO 501 (by norm_num)]; decide +kernel)
theorem hok321_502 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 502 L1.T321.h_502 :=
  hok_of O 502 _ (by rw [hO 502 (by norm_num)]; decide +kernel)
theorem hok321_503 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 503 L1.T321.h_503 :=
  hok_of O 503 _ (by rw [hO 503 (by norm_num)]; decide +kernel)
theorem hok321_504 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 504 L1.T321.h_504 :=
  hok_of O 504 _ (by rw [hO 504 (by norm_num)]; decide +kernel)
theorem hok321_505 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 505 L1.T321.h_505 :=
  hok_of O 505 _ (by rw [hO 505 (by norm_num)]; decide +kernel)
theorem hok321_506 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 506 L1.T321.h_506 :=
  hok_of O 506 _ (by rw [hO 506 (by norm_num)]; decide +kernel)
theorem hok321_507 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 507 L1.T321.h_507 :=
  hok_of O 507 _ (by rw [hO 507 (by norm_num)]; decide +kernel)
theorem hok321_508 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 508 L1.T321.h_508 :=
  hok_of O 508 _ (by rw [hO 508 (by norm_num)]; decide +kernel)
theorem hok321_509 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 509 L1.T321.h_509 :=
  hok_of O 509 _ (by rw [hO 509 (by norm_num)]; decide +kernel)
theorem hok321_510 (O : R3RT.SpecO.LabelOrder) (hO : Is321 O) : R3RT.SpecO.HOK O 510 L1.T321.h_510 :=
  hok_of O 510 _ (by rw [hO 510 (by norm_num)]; decide +kernel)

end L5O
