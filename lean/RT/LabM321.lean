module
public import R22Port.U_d41d8cd98f00
public import RT.Clos
/-! # Label coordinates for the main search's row table in prof7's `--rord 321` label order (G5)

The same definitions as `RT.LabM` (namespace `RT.O321`) for the order rank 3, rank 2, rank 1, by code within a rank
(labels 0..167, 168..461, 462..510; `#lab` md5 fe645fa2e59af6d52695a943909f253f, `rt/lab321vec.json`, generated and
checked against the 123 tables by `rt/mklab321.py`).  **`labMain_testBit`**: bit `l` of `labMain e` is bit `vecL l` of the
row's point mask `dualM e`. -/
@[expose] public section
set_option exponentiation.threshold 1024
set_option maxRecDepth 100000
namespace RT.O321
open BC4 BC5

def M511 : Nat := 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
/-- `vecL l`: the point of label `l` -/
def VECL : Nat := 0x7fff1c7e06db6186c05b6d145a049241048036db0c3602492082401249041200fc7036180b450241006c301208024100703014080301007fdfdfe7eff5f9fbfdbe3f0f7fb7d5e8f3f93c7e0eff73b7d8ebf57a5d0e7f3b93c8e371789c3e17077fbedcee36fb5da6cf65b1d76b757a8d369345a0cf6773798cb6532590c7e3b1388c3e170983c1606ff7dbd5e2ed75b9dc2df6eb65aed569b2d92c360af576b758abd56a550a6d329348a3d1a8943a15067f3c9dce26d34994c25b2c94ca24f2692c8e45218fc7237188b452251086c32130883c1a0b0381405fefc7dbe1ecf579bc1dced75ba1cee471b81bede6eb71b4d969b49a2d065b2992c863b198ac4613057ebd5d2e16cb4592c15ead552a14ca451281369a4ca612e964aa51269145a29128843a190a8441a04fe7e3c9e0ee76389c0da6c349a0ca6430980b65a2c960a652289409e4e26930964a239188a44219087c3d1e0ec74391b8d46833190c45e2e160ac5429138984a23110843e1e0e87034190b8582a14098441e0e06830160afafd3e7f2f77b3d7e9f3797c5e1ef777b5d9eb753a7d1e6f3397cadeef377bad7eb355a9d3e9747a1cfe733599cbe572791c6e33178abf5f2f779bbdd2e571b3d9ac762afd72b559ab552a751a7d3a974a9f4f675399bcd6673197cba572a8f47635198bc56271187c3a170a7f3f5f4f97bbd1e4f177bb1d4e973395c4e16bb59aad467b399acc5f2f176b95bad566b1572b156a953a9546a14fa793a9c47a391a8c3e9f0f67a3a9d0e672379b8d66a33998c6622f978ba5c2b958aa54
def vecL (l : Nat) : Nat := (VECL >>> (9 * l)) % 512
/-- the 9 label planes, 512 bits each -/
def LBM : Nat := 0x7fff800000003fffffffffffffffffffffffffffffffffffc0000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000007f807f8000003fffffffffffffffffc000000000000000003fffffffffffffffffc0000000000000000000ffffffffffff000000000000ffffffffffff0000007878787800003ffffffffc000000003ffffffffc000000003ffffffffc000000003ffffffffc0000000000ffffff000000ffffff000000ffffff000000ffffff66660007f8003ffff00003ffff00003ffff00003ffff00003fffc00003fffc00003fffc00003fffffc0000fff000fff000fff000fff000ffff00ffff00ffff006600660787803ff00ff003ff00ff003fc00ff003fc00ff003fc03ff003fc03ff003fc03fc003ffc003ffc0f00ff0f00ff0ff0ff0ff0ff0ff00f0ff00f0ff00ff6060606666603f0f0f0f03c0f0f0f03c3f0f0f03c3c0f0f03c3c3f0f03c3c3c0f03c3c3c3f03f03f03f03f0f0f0fff0f0ff00f0ff0ff0ff0f00ff0f0fff0f0f055550005501e38cccccce338ccccce3338cccce33338ccce33333c00f333303c0f3333003cf38e38e3cf3cccccccccccccccccccccccccccccffccccffccccff550055050519a6caaaac9b26aaaac9aab60aa0daa836aa0daaaab2cccaaaab32ccb3003333ce69b6db2cb33aaaa33aaaa3aafaafaafaafaaaaccaaaacc33ffcc50505054445555acaaca56b56060ad71a5a6ca9682ada0ab699aa9aaa70302abaaeaaaaaaaa95d65b69aeaa3553aa9f9fa39a93a5fa5fa5995aa3f3faaaaaaaa
/-- labels whose point has odd `<X, v>` -/
def lpar511 (X : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0 (fun i acc => cond (X.testBit i) (acc ^^^ ((LBM >>> (512 * i)) &&& M511)) acc) 9
/-- the label mask of an entry's row (common kernel of its dual vectors), in label coordinates -/
def labMain (e : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) M511 (fun j acc => acc &&& (M511 ^^^ lpar511 (eV e (eD e + j)))) (9 - eD e)

theorem labMain_lt (e : Nat) : labMain e < 2 ^ 511 := by
  have key : ∀ k, (Nat.rec (motive := fun _ => Nat) M511 (fun j acc => acc &&& (M511 ^^^ lpar511 (eV e (eD e + j)))) k) ≤ M511 := by
    intro k
    induction k with
    | zero => exact le_rfl
    | succ k ih => exact le_trans Nat.and_le_left ih
  exact lt_of_le_of_lt (key _) (by decide +kernel)

theorem planes_fact : ∀ l < 511, ∀ i < 9, ((LBM >>> (512 * i)) &&& M511).testBit l = (vecL l).testBit i := by decide +kernel
theorem vecL_lt (l : Nat) : vecL l < 512 := Nat.mod_lt _ (by norm_num)
theorem m511_bit (l : Nat) : M511.testBit l = decide (l < 511) := by
  rw [show M511 = 2 ^ 511 - 1 by decide +kernel]; exact Nat.testBit_two_pow_sub_one 511 l

theorem lpar511_testBit (X l : Nat) (hl : l < 511) :
    (lpar511 X).testBit l = S5.xorBits (vecL l &&& X) 9 := by
  unfold lpar511
  have key : ∀ k, k ≤ 9 → (Nat.rec (motive := fun _ => Nat) 0
      (fun i acc => cond (X.testBit i) (acc ^^^ ((LBM >>> (512 * i)) &&& M511)) acc) k).testBit l = S5.xorBits (vecL l &&& X) k := by
    intro k
    induction k with
    | zero => intro _; simp [S5.xorBits]
    | succ k ih =>
      intro hk
      show (cond (X.testBit k) (Nat.rec (motive := fun _ => Nat) 0
          (fun i acc => cond (X.testBit i) (acc ^^^ ((LBM >>> (512 * i)) &&& M511)) acc) k ^^^ ((LBM >>> (512 * k)) &&& M511))
          (Nat.rec (motive := fun _ => Nat) 0
          (fun i acc => cond (X.testBit i) (acc ^^^ ((LBM >>> (512 * i)) &&& M511)) acc) k)).testBit l =
        xor (S5.xorBits (vecL l &&& X) k) ((vecL l &&& X).testBit k)
      rw [Nat.testBit_and]
      cases hX : X.testBit k
      · rw [cond_false, ih (by omega)]; simp
      · rw [cond_true, Nat.testBit_xor, ih (by omega), planes_fact l hl k (by omega)]; simp
  exact key 9 le_rfl

theorem labMain_testBit (e l : Nat) (hl : l < 511) : (labMain e).testBit l = (dualM e).testBit (vecL l) := by
  have hk := kerM_testBit (fun j => eV e (eD e + j)) (fun j => eV_lt e _) (9 - eD e) (vecL l) (vecL_lt l)
  have key : ∀ k, (Nat.rec (motive := fun _ => Nat) M511 (fun j acc => acc &&& (M511 ^^^ lpar511 (eV e (eD e + j)))) k).testBit l =
      decide (∀ j < k, par (vecL l &&& eV e (eD e + j)) = false) := by
    intro k
    induction k with
    | zero => simp [m511_bit, hl]
    | succ k ih =>
      show ((Nat.rec (motive := fun _ => Nat) M511 (fun j acc => acc &&& (M511 ^^^ lpar511 (eV e (eD e + j)))) k) &&&
        (M511 ^^^ lpar511 (eV e (eD e + k)))).testBit l = _
      rw [Nat.testBit_and, Nat.testBit_xor, ih, m511_bit, lpar511_testBit _ _ hl,
        ← S5.par_eq _ (lt_of_le_of_lt Nat.and_le_left (vecL_lt l))]
      simp only [hl, decide_true, Bool.true_xor]
      by_cases h : ∀ j < k, par (vecL l &&& eV e (eD e + j)) = false
      · cases hp : par (vecL l &&& eV e (eD e + k))
        · simp only [Bool.not_false, Bool.and_true]
          rw [decide_eq_true h, decide_eq_true]
          intro j hj; rcases Nat.lt_succ_iff_lt_or_eq.mp hj with h' | h'
          · exact h j h'
          · rw [h']; exact hp
        · simp only [Bool.not_true, Bool.and_false]
          symm; rw [decide_eq_false_iff_not]; intro h'; rw [h' k (Nat.lt_succ_self k)] at hp; exact absurd hp (by decide)
      · rw [decide_eq_false h, Bool.false_and]
        symm; rw [decide_eq_false_iff_not]; intro h'; exact h (fun j hj => h' j (Nat.lt_succ_of_lt hj))
  rw [show labMain e = Nat.rec (motive := fun _ => Nat) M511 (fun j acc => acc &&& (M511 ^^^ lpar511 (eV e (eD e + j)))) (9 - eD e) from rfl,
    key]
  unfold dualM
  cases h2 : (kerM (fun j => eV e (eD e + j)) (9 - eD e)).testBit (vecL l)
  · rw [decide_eq_false_iff_not]; intro h'; rw [hk.mpr h'] at h2; exact absurd h2 (by decide)
  · rw [decide_eq_true_eq]; exact hk.mp h2

end RT.O321
