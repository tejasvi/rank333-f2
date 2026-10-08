module
public import R22Port.U_d41d8cd98f00
public import RT.Sound
/-! # Rows in label coordinates: the bridge from the verified row table (RT, vector-indexed masks) to the L1 checkers
(label-indexed masks, prof7 label order `--rord 123`: rank 1, rank 2, rank 3, by vector value within a rank).

* `vecL l`: the vector of label `l < 511` (table `VECL`); `vecL_fact`: nonzero and injective on labels.
* `perpL v`: the labels `l` with `vecL l` orthogonal to `v` (split tables `NPLL`, `NPHL`, as RT's `perp`); `perpL_bit` by a decided
  table fact over all 512 x 511 pairs.
* `labM e`: the label mask of entry `e`'s row, the common kernel of its dual vectors in label coordinates;
  **`labM_spec`**: `(labM e).testBit l = (dualM e).testBit (vecL l)` for every label `l < 511`.  With `RT.K3eD.row_valid` this
  binds a row cited by id to its label mask and cap.  (When RT stores a verified label mask per entry, checkers use that instead:
  the R3RT checker takes the row interface as parameters.) -/
@[expose] public section
set_option exponentiation.threshold 1024
namespace R3RT
open BC4 BC5 RT

def VECL : Nat := 0x7d7e9f3f97bbd9ebf4f9bcbe2f0f7bbbdaecf5ba9d3e8f3799cbe56f779bbdd6bf59aad4e9f4ba3d0e7f399acce5f2b93c8e37198bc55faf97bbcddee972b8d9ecd63b157eb95aacd5aa953a8d3e9d4ba54fa7b3a9ccde6b3398cbe5d2b9547a3b1a8cc5e2b1388c3e1d0b853f9fafa7cbdde8f278bbdd8ea74b99cae270b5dacd56a33d9ccd662f978bb5cadd6ab358ab958ab54a9d4aa350a7d3c9d4e23d1c8d461f4f87b3d1d4e873391bcdc6b3519ccc633117cbc5d2e15cac552a7fbfbfcfdfebf3f7fb7c7e1eff6fabd1e7f278fc1dfee76fb1d7eaf4ba1cfe772791c6e2f1387c2e0eff7db9dc6df6bb4d9ecb63aed6eaf51a6d268b419ecee6f3196ca64b218fc76271187c2e130782c0dfefb7abc5daeb73b85bedd6cb5daad365b2586c15eaed6eb157aad4aa14da65269147a35128742a0cfe793b9c4da6932984b659299449e4d2591c8a431f8e46e31168a44a210d86426110783416070280bfdf8fb7c3d9eaf3783b9daeb7439dc8e37037dbcdd6e369b2d369345a0cb6532590c76331588c260afd7aba5c2d968b2582bd5aaa5429948a25026d34994c25d2c954a24d228b452251087432150883409fcfc793c1dcec71381b4d86934194c8613016cb4592c14ca4512813c9c4d2612c9447231148843210f87a3c1d8e872371a8d06632188bc5c2c158a852271309446221087c3c1d0e06832170b05428130883c1c0d0602c15fffc71f81b6d861b016db451681249041200db6c30d809248209004924104803f1c0d8602d14090401b0c04820090401c0c050200c0401
def vecL (l : Nat) : Nat := Nat.mod (Nat.shiftRight VECL (Nat.mul 9 l)) 512
def NPLL : Nat := 0x5519d5284fb5284fd31b31b31801b32b54cb2d34cb16ab98aa5d29ec12b5d7a8c0b35e4cc79331e7fe4f333d4ab33532d2cb34b5296a291ced3559940cd7c2cb04b3487cb348349b4e34e34e34cb6634cb1e78619e3df2cd3ef0432cd3ef34e38d2673499cd26734cb1c66734cb66267079e61e07bd0e271d8e018d54d86d39e484c84b51ae4fd3284ce4ce4cd54d57e01ad34cb2d5b3ecdf36b64b9472682c4d5f2eb1caac72ab2ab2aaaa81fe550abb4cb52d2b5b944aab4520d9558c3d6ad19e619e1e619e1e619e19e19e19e00619e78619e7870679867c60e79867c618f9867c619f1867c619e79ffe619e007fe619e0787e7038fc781874cd41992c7f8337fb34e29d34e29b57d57d57e67cccd32b4cb52b4e73201339b58758b29b1d9592a982ab60aad81983732db2cd34d2cb4ad34ccce7658db734c0cc00cc282b362d52e1ad52e52fd2852852852ad19d2ad619e07e1cc6b54a73632b54a73529214bfb52fed4bfb52ad6467952ad61a7961f861999ccc93b646994d814d9393e62e2ae2d37c829b54e2a82a82ab32aa9867d2d2ad52aaa7546aad1520debae4b54c6b2d7adb5eb6d4cd52ab4e798528b5d2ad52ab52a5356d2a2b58c158d696d57f807f87807f87807f87f87f87f87f87f80787f80781fe01fe007fe01fe007fe01fe007f801fe007f801fe007f807fe007f807fe001ffe001ffe198019878780529e52d7c832d04854e34e34e079b4d32cb4d54cb368b586b45aa80df355afd6dead59cb4672d19f86312d3acd34b4d2aab34ccb2e8a571b0d4ad8158d4e5b4b0334cf8334cfcc9cc9cc9cc9ccb361ccb3618019e643ecd320f7c2cd320f4c9d933874ce1d33874cb3627874cb31e3877fe6199e7c309c76389f9954cc1f4a1e4fcb034a9d63053503363363352cd28679d2ccb3552520d3ed6ce558a6c6fabacbecec9b2b26cacad354b4af9862d14bccb32aacb2593aad542d8c14d95a4f2d1e619e1e619e19e19e19e19e19e60799e60799e6000e798679c18f98679c19f18679c19e70679c19e607e1e19e67861e19e67ff9e0e3f1c061f8cd55980b5e7834f834b1ae54b62e32852852861fcb354acb332acc992c1f2d9cd9946ac9c9a747349fad37eb4df9e0492cdcab54ccccccd54cb2c99626dc93338d418d5b1b336552a9e552a9aafaafaafaafaad51e2ad51e667f99b2754ab931b354ab932aec0aa1b2a86caa1b2ad51a7992ad519b99198019e79b2cedb1a6e6cc00cc0a0a6629ad652cfb05635365505505534aad601fad2ad52ad4b94a74aa94c13f5a9ccb52752afd5abf56acb52cb549fe02a955aad52ad555454b6aca54d940d94f0f557807f87807f87f87f87f87f87f80787f80787f807fffe01fe007fe01fe007f801fe007f801fe007f807fe007f807fe007f807f8007ff8007ff819801981e1e002d1e2d50484d57c82b64b64b6781cb54d4b352b4b4e94b874a5ad7edecb5a828df5359b4c66d31987e30d33ab2b4cb32ad4b4b352e95a91b12b4c19594c9dccb7cb4b004b4b04b1cb64b64b64b4b1e4b4b6607e1e1c212d2def7bd2d2def4b6392c674b19d2c674b4b638674b4b19c67781e1e607c2f6276276180d4d598cd9e304b7ccd1d1c82b57cb1cb1cb2d4ad0181d54b4b52a4ded2136c9ab8b926fd44ca12ece4ab392acd2b554aafe7e2aeabcb4b2d52b246c4ad4bd39594c0ddc8ad61e1e199e1e19e61e19e19e19e1e781e1e001e1e078f878787c1f078787c1e0f8787c1e1f0787c1e1e061fe1e1e7f9fe1e1e7807e0fc0fc07e06d4d5818cd9f84b784b362e2b31ae4d02d02d01e7b4b2b2ccb4d2cb18d21ed39ca6747529ce5946ca9fd2b7f4adfe1848d2dcd4d4b32ccb2d4b4cc989d8dc8ccd94c194dc9cb31ad2d662d2d62d7ad02d02d02d2d61ad2d19e1879e338b4b4731ccb4b4732d120b5fb2d7ecb5fb2d2d1b8792d2d1e4791e781e199b3313b1b918d580d58d8de6562d1aab7b7ae4d31ad7ad7ad4b2d2e7e7aaad2d2d55474b8aaaeb2120ba9b35538b2a82daa0b6ab4d2d4b498182d6b5ad2d2d2b555ab56ad5aac0c0c0c888d5078787ff8787f80787f87f87f87807f8787ff878787e1e1e1e0781e1e1e0787e1e1e078781e1e078787e1e07878781e07878787e07e07e07e07f8181819999802a99aaafcfcaafcfac9cc9cc9ff9ccacacccaacccc975599545d560c0d55d056c14d5e33478cd1e0064ecd3d35334ad2d533334b2975d71cf2cb40141550454b7b3337fb3337b31b31b31b31b33319b33319ff9999bc0cccc0f03ccccc0f331d8cd873361ccd8733331d987333361d870066661e7bcf1c71c71e01555401541e37ccfb329a9b7ab2fb49b49b4aacaaf9f9aab3332adac0cc0d6b1b5958c6853ad40ceb632ad8cab5532b54a860652f4bb333552cb5a6baaaabac14154144512d66666666666666666666666666667fe6667fe6667ff1999999c67199999c66719999c66671999c66667801e66660781e66660079e71c71c79e795554001540784cffccc9a9acc9a9cafaafaaf99fb34acab34caab366cc00cd9b279594c9b62758d4985536154d866036ccdb535332ccb3553332ce69a6db6cb21540154505331d55519d5551d57d57d57d57d5556655556619ffe64d955559364d555593556c1541b5506d541b555565999555566599660066679cd36db6596754015414146651aa9d54fcfd1cd49d2fd2fd2ccad51f9fd55555552b595594ad6ac0c15ae34b4d952d055b4156d33553554e06055755d555555552bacb6d35d541414151115500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
def NPHL : Nat := 0x7fffff8007ff8000007ffffff8000007f80007f80001ffffffffe00007fffe000000001ffffffff8000000007ffff80007ffffffffff8000079861fffe0007fffff8000000000007fffff8000007ffffffffffffffffffff8000000000000000007ffffffff8000000007fffffffffffffffff80000000001e01e1fe000007ff8007ff8000007ff8007ff80007f80007fffff807fffe00007fffe000000001ffff80001ffff80007ffff80007ffffffff800007fffff800019867fe1fe0000000000000007fffffffffffffffffffffff8000000000000000000000007fffffffffffffffffffffffffffffffffff8000000000000000000001fffe0000007ff8000007fffff8000007ff80007fffff8000007fffffe000000001ffffffffe000000001ffff80007ffffffff8000000007ffffffffff800018787e1ffe0000000007fffff8000007fffffffffff8000007fffff8000000007ffffffff8000000007fffffffffffffffff8000000007ffffffff800000000001e1fe1e000000007ff8007ff8007ff8007ffffff807fff807fff8000001ffff80001ffff80001ffff80001ffffffff800007fff800007fff800007fffff800006666001fe0007fffffffffffffffffffffff8000000000000000007fffffffffffffffffffffffffffffffffff80000000000000000000000000000000000001fffe000000007ff8000007ff8007fffff8007fff8000007f80007fffffe000000001ffff80001ffffffffe00007fff8000000007ffff80007ffffffffff8000186781fffe0000000007fffffffffff8000000000007fffffffffff8000000007fffffffffffffffff8000000000000000007fffffffffffffffff800000000001fe01fe000000007ff8007fffff8007ff80000007f80007fffff8000001ffff80001ffffffffe00007fffe000000007ffff80007ffffffff800007fffff800006799fe1fe0007fffffffffff8000000000007fffffffffff8000007fffffffffffffffff8000000000000000007fffffffffffffffff80000000000000000001fe01fe0000000007fffff8000007fffff80000007fffff8000007f80001ffffffffe000000001ffffffffe000000007ffffffff8000000007ffffffffff800007879e1ffe0007fffff8000007fffff8000007fffff8000007ffffffffffffff8000000007ffffffff8000000007ffffffff8000000007ffffffff80000000001e1e1e1e000007ff8007ff8007ff8007ff8007fff807fff807fff807fffe00007fffe00007fffe00007fffe00007fff800007fff800007fff800007fffff800019998001fe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
def M511 : Nat := 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
def nperpL (v : Nat) : Nat :=
  Nat.xor (Nat.land (Nat.shiftRight NPLL (Nat.mul 512 (Nat.land v 31))) M511) (Nat.land (Nat.shiftRight NPHL (Nat.mul 512 (Nat.shiftRight v 5))) M511)
def perpL (v : Nat) : Nat := Nat.xor M511 (nperpL v)
/-- the common kernel of `n` vectors `f j`, as a label mask -/
def kerL (f : Nat → Nat) (n : Nat) : Nat := Nat.rec (motive := fun _ => Nat) M511 (fun j S => S &&& perpL (f j)) n
/-- the label mask of entry `e`'s row (the common kernel of its dual vectors `d .. 8`) -/
def labM (e : Nat) : Nat := kerL (fun j => eV e (eD e + j)) (9 - eD e)

theorem m511_eq : M511 = 2 ^ 511 - 1 := by decide +kernel
theorem m511_bit (l : Nat) : M511.testBit l = decide (l < 511) := by rw [m511_eq]; exact Nat.testBit_two_pow_sub_one 511 l
theorem vecL_lt (l : Nat) : vecL l < 512 := Nat.mod_lt _ (by norm_num)

theorem nperpL_fact : S5.allLT 512 (fun v => S5.allLT 511 (fun l => (nperpL v).testBit l == par (vecL l &&& v))) = true := by
  decide +kernel
theorem vecL_fact : S5.allLT 511 (fun l => !(vecL l == 0) && S5.allLT l (fun k => !(vecL k == vecL l))) = true := by
  decide +kernel

theorem nperpL_bit (v l : Nat) (hv : v < 512) (hl : l < 511) : (nperpL v).testBit l = par (vecL l &&& v) := by
  have := S5.allLT_spec (S5.allLT_spec nperpL_fact v hv) l hl; simpa using this

theorem perpL_bit (v l : Nat) (hv : v < 512) (hl : l < 511) : (perpL v).testBit l = !par (vecL l &&& v) := by
  show (Nat.xor M511 (nperpL v)).testBit l = _
  rw [show Nat.xor M511 (nperpL v) = M511 ^^^ nperpL v from rfl, Nat.testBit_xor, m511_bit, nperpL_bit v l hv hl]; simp [hl]

theorem vecL_ne_zero (l : Nat) (hl : l < 511) : vecL l ≠ 0 := by
  have h := S5.allLT_spec vecL_fact l hl
  simp only [Bool.and_eq_true, Bool.not_eq_true', beq_eq_false_iff_ne] at h
  exact h.1
theorem vecL_inj (k l : Nat) (hk : k < 511) (hl : l < 511) (h : vecL k = vecL l) : k = l := by
  rcases Nat.lt_trichotomy k l with hkl | hkl | hkl
  · have h2 := S5.allLT_spec vecL_fact l hl
    simp only [Bool.and_eq_true, Bool.not_eq_true', beq_eq_false_iff_ne] at h2
    have h3 := S5.allLT_spec h2.2 k hkl
    simp only [Bool.not_eq_true', beq_eq_false_iff_ne] at h3
    exact absurd h h3
  · exact hkl
  · have h2 := S5.allLT_spec vecL_fact k hk
    simp only [Bool.and_eq_true, Bool.not_eq_true', beq_eq_false_iff_ne] at h2
    have h3 := S5.allLT_spec h2.2 l hkl
    simp only [Bool.not_eq_true', beq_eq_false_iff_ne] at h3
    exact absurd h.symm h3

theorem kerL_testBit (f : Nat → Nat) (hf : ∀ j, f j < 512) (n l : Nat) (hl : l < 511) :
    (kerL f n).testBit l = true ↔ ∀ j < n, par (vecL l &&& f j) = false := by
  unfold kerL
  induction n with
  | zero =>
    simp only [Nat.rec_zero]
    rw [m511_bit]; simp only [hl, decide_true, true_iff]; intro j hj; exact absurd hj (Nat.not_lt_zero j)
  | succ n ih =>
    show (Nat.rec (motive := fun _ => Nat) M511 (fun j S => S &&& perpL (f j)) n &&& perpL (f n)).testBit l = true ↔ _
    rw [Nat.testBit_and, Bool.and_eq_true, ih, perpL_bit _ _ (hf n) hl, Bool.not_eq_true']
    constructor
    · rintro ⟨h1, h2⟩ j hj
      rcases Nat.lt_succ_iff_lt_or_eq.mp hj with h | h
      · exact h1 j h
      · rw [h]; exact h2
    · intro h; exact ⟨fun j hj => h j (Nat.lt_succ_of_lt hj), h n (Nat.lt_succ_self n)⟩

/-- **The bridge**: entry `e`'s label mask has label `l` iff its vector mask has `vecL l`. -/
theorem labM_spec (e l : Nat) (hl : l < 511) : (labM e).testBit l = (dualM e).testBit (vecL l) := by
  have hf : ∀ j, (fun j => eV e (eD e + j)) j < 512 := fun j => eV_lt _ _
  apply Bool.eq_iff_iff.mpr
  unfold labM dualM
  rw [kerL_testBit _ hf _ l hl, kerM_testBit _ hf _ (vecL l) (vecL_lt l)]

end R3RT
