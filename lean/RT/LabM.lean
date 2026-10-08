module
public import R22Port.U_d41d8cd98f00
public import RT.Clos
/-! # Label coordinates for the main search's row table (prof7's `--rord 123` labels)

prof7 numbers the nonzero points of `A` by labels `l < 511` (`vecL l`: the rank-1 matrices by value, then rank 2, then rank 3;
the `#lab` header line of prof7R3's stream, md5 7032e3f4b1969cd3ea1975ae7d13d79e of `#lab 511 v0 .. v510\n`).  `LBM` holds
9 label planes (plane `i`: the labels whose point has bit `i`).  `labMain LBM e`: the row's label mask computed from its dual
vectors; **`labMain_testBit`**: bit `l` of it is bit `vecL l` of the row's point mask `dualM e`. -/
@[expose] public section
set_option exponentiation.threshold 1024
set_option maxRecDepth 100000
namespace RT
open BC4 BC5

def M511 : Nat := 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
/-- `vecL l`: the point of label `l` -/
def VECL : Nat := 0x7d7e9f3f97bbd9ebf4f9bcbe2f0f7bbbdaecf5ba9d3e8f3799cbe56f779bbdd6bf59aad4e9f4ba3d0e7f399acce5f2b93c8e37198bc55faf97bbcddee972b8d9ecd63b157eb95aacd5aa953a8d3e9d4ba54fa7b3a9ccde6b3398cbe5d2b9547a3b1a8cc5e2b1388c3e1d0b853f9fafa7cbdde8f278bbdd8ea74b99cae270b5dacd56a33d9ccd662f978bb5cadd6ab358ab958ab54a9d4aa350a7d3c9d4e23d1c8d461f4f87b3d1d4e873391bcdc6b3519ccc633117cbc5d2e15cac552a7fbfbfcfdfebf3f7fb7c7e1eff6fabd1e7f278fc1dfee76fb1d7eaf4ba1cfe772791c6e2f1387c2e0eff7db9dc6df6bb4d9ecb63aed6eaf51a6d268b419ecee6f3196ca64b218fc76271187c2e130782c0dfefb7abc5daeb73b85bedd6cb5daad365b2586c15eaed6eb157aad4aa14da65269147a35128742a0cfe793b9c4da6932984b659299449e4d2591c8a431f8e46e31168a44a210d86426110783416070280bfdf8fb7c3d9eaf3783b9daeb7439dc8e37037dbcdd6e369b2d369345a0cb6532590c76331588c260afd7aba5c2d968b2582bd5aaa5429948a25026d34994c25d2c954a24d228b452251087432150883409fcfc793c1dcec71381b4d86934194c8613016cb4592c14ca4512813c9c4d2612c9447231148843210f87a3c1d8e872371a8d06632188bc5c2c158a852271309446221087c3c1d0e06832170b05428130883c1c0d0602c15fffc71f81b6d861b016db451681249041200db6c30d809248209004924104803f1c0d8602d14090401b0c04820090401c0c050200c0401
def vecL (l : Nat) : Nat := (VECL >>> (9 * l)) % 512
/-- the 9 label planes, 512 bits each -/
def LBM : Nat := 0x7fffffffffffffffffffffff8000000000000000007fffffffffffffffffffffffffffffffffff80000000000000000000000000000000000001fffe000000007fffffffffff8000000000007fffffffffff8000007fffffffffffffffff8000000000000000007fffffffffffffffff80000000000000000001fe01fe0000007fffff8000007fffff8000007fffff8000007ffffffffffffff8000000007ffffffff8000000007ffffffff8000000007ffffffff80000000001e1e1e1e000007ff8007ff8007ff8007ff8007fff807fff807fff807fffe00007fffe00007fffe00007fffe00007fff800007fff800007fff800007fffff800019998001fe0007807f87807f87f87f87f87f87f80787f80787f807fffe01fe007fe01fe007f801fe007f801fe007f807fe007f807fe007f807f8007ff8007ff819801981e1e00078787ff8787f80787f87f87f87807f8787ff878787e1e1e1e0781e1e1e0787e1e1e078781e1e078787e1e07878781e07878787e07e07e07e07f81818199998066666666666666666666666666667fe6667fe6667ff1999999c67199999c66719999c66671999c66667801e66660781e66660079e71c71c79e795554001540781d55519d5551d57d57d57d57d5556655556619ffe64d955559364d555593556c1541b5506d541b555565999555566599660066679cd36db6596754015414146651aa9d54fcfd1cd49d2fd2fd2ccad51f9fd55555552b595594ad6ac0c15ae34b4d952d055b4156d33553554e06055755d555555552bacb6d35d5414141511155
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

end RT
