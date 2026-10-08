module
public import R22Port.U_d41d8cd98f00
public import R3RT.SpecO
public import L5.O321
public import C3.Act
public import S5.Base
/-! # Top/Root321: the root of the `--rord 321` trees (cases (I), (I13); gap G5)

The `--rord 321` order lists codes by rank 3, then 2, then 1, by value within a rank (`RT.O321.vecL`; labels 0..167 rank 3,
168..461 rank 2, 462..510 rank 1). L3's canonical key for it is `labK321` (`labN321 v` = the 321 label of `v` plus 1, from
`LABT321`), so the order is `O = L5O.O321 labK321` (leaf/RT agent's `LabelOrder`).

* `root_321`: **the smallest label of a canonical decomposition is the first label of its rank class**: for a first label
  `l ∉ {0, 168, 462}` no canonical decomposition lies below the node `(2^l, l)`. So the jobs of cases (I) and (I13) are the three
  depth-1 nodes 0 (code 84), 168 (code 10) and 462 (code 1) (`RECIPE.txt` JOBS_I / JOBS_I13).
* The proof is `Top.canon_has0`'s argument for each rank class: the group is transitive on the codes of one rank (witnesses
  `W321`: every code to the first code of its class, checked for all 511 codes by `w_fact`); if the first label `L` of the class
  of the smallest label `l` were missing, the image of the set under the witness would hold `vec L`, whose key is below every key
  of the set, so the image would be lex-smaller. No case predicate is needed. -/
@[expose] public section
namespace Top321
open RootSound R3RT Finset

def LABT321 : ℕ := 0xfff3b9bcce5f2b93fee471d50a7532978dc5e229386a35170943c1e02813fbfdf2793bbdde27137bbdd26933b9dc2636e974b6d92bb5da6cd28934924765b1feec35faed6eb357fcd56a5208f4723751a7d37ef4ba4d1e8b43fa466833e8bcf229139d446710f9b436690b99426632e83cb209039540650ff933f648fb91c863cf87b3d1e71d8dc67e7178ac4e230ff8c31e30a773b610eb833a60b0273c01c8e37fbf5f7ef7cbddeaf3f6381bef177371b6ed75365d2e66bb91a8d371b81a2de67335b8cb6d3218ed96b31186d569b459feb66b2d92c7f4b1180bf61b0178bb5f2e578b75d2d570b35b2c15eb5592b156b157ab556a9f3a9d4aa3f2a8150a74fa7148a34d285309f4b275289b492612e9147251268d45a250e85f1a0d027ff09f1208f3d9e1188b3b224ea72439c1088337204da6a3f9a0f87b33990f07731980e8732f974b6592bf7caa53ee1c0dc6c359449e4d251a0cc64319248e45219047e3d1df6c7237ec8d0c2322f174605b17164585715154505313890a22227134404b0f12438470d11430430b1007c3c1d854261107834160903817ae03ea0e06c3419803fdfcfd7e3edf4f97c7a5efe87b3d430170b055e8f3793c4281309045e0ef0803ddced07035d8eb0602dd4e905025d0e70401c0c0573395c8e30200c040171385c0df6f375b8db6d367cfe66c35dacd56a34fcbe4f1b49a2d067b399be26678596ca64b218fe063317bec461b0983de602fd7ddd5eaf177dc5d2e570b7edad96bda5a2cd64b1587655fd8572b558ab552a7afd6eaf53a7d2e8f439e00
def W321 : ℕ := 0x29dd20004af140004771400019f140003971400043f140004e71400029ce40004ce940004ad980007b8a8000178a80005f8a8000338a80004c7940004aca800047a940007d4a8000475980001cca80005dca800043b940003c4a8000474a800029e94000274a80002aca800019d980002979400023ca80002e4a800019ca800039a940006f4a80006bca800019b940003959800062ca8000664a8000394a800045e94000354a80004579400015ca800054ca800043d98000744a800043ca80004ea940004ab940003a8a80001e8a8000568a8000728a80004e5980004e4a800029d520004ad180004751800019d180003951800043d180004e51800029ca80004cd980004ae94000778a80001b8a80003f8a8000538a80004e7940004cca80004cf14000271d20004d714000173140004df14000333140004c714000270e4000774a80004ba940004d5980001aca80004fb9400053ca80003e4a80004d4a80002d4a8000272940002cca8000171980002dca8000233940002c4a8000170a80003f4a80004be940004f7940001bca80004dd9800052ca8000764a80004dca8000654a80003529400065ca80001539400064ca800033198000644a8000330a80004eb940004aa940003e8a80001a8a8000768a8000528a80004c5980004c4a80004cd18000271520004d518000171180004dd18000331180004c518000270a8000479980007cca8000476940001d4a80003dca800043f940005c4a8000478a80007aca80004b9980004d694000174a80004df9400033ca80005e4a80004b8a800047b140004bb1400028dd200018f140004fb1400043b140003871400028ce40002b8a8000278a800028e9400018d980002f8a8000238a80002879400018ca80003bca80004bf940004f6940001f4a80004f99800072ca8000564a80004f8a800045f9400035ca800045694000154a800074ca800043998000544a8000438a80006a8a80006e8a800038a9400018b94000668a8000628a800038598000384a8000479180004b91800028d5200018d180004f918000439180003851800028ca800029d980004aca8000474a800019e940003979400043ca80004e4a800029ca80004cca8000271980004d4a8000172940004dca8000333940004c4a8000270a8000478a80004b8a800028d9800018e940004f8a8000438a80003879400028ca800029f140002731400028f14000151d2000297140002331400028714000150e400039b940004bca80004f4a800019a940002959800042ca8000464a8000294a800045ca800035394000454a80001529400044ca800023198000444a8000230a80004e8a80004a8a800038b9400018a94000468a8000428a800028598000284a800029d180002711800028d1800015152000295180002311800028518000150a8000399980006eca800067ca800019f9400039694000634a80006a4a8000398a80005eca80004bd980004d79400017ca80004de94000334a80007a4a80004bca800057ca80004bb940004f5980001eca80004fa94000734a80003a4a80004f4a800029f9400027ca80002eca80001999800029694000234a80002a4a8000198a800039b140004bf140004f71400019b14000295d200042f1400046714000294e4000558a8000358a8000758a8000158a800044e9400042d980004479400042ca80005c8a80007c8a80003c8a80001c8a800046a9400042b9400046598000464a8000399180004bd180004f518000199180002955200042d1800046518000294a800045d9800058ca80004779400019ca8000394a800043e94000784a800045ca800068ca80003519800069ca800017394000694a800033294000684a8000350a800047b9400059ca80004559800018ca8000794a800043a94000384a8000454a800029ca80002739400028ca800015198000294a800023294000284a8000150a8000398a8000598a8000798a8000198a800044d9800042e940004679400044ca800045f1400035314000457140001531400044f14000231d200044714000230e4000788a8000588a8000388a8000188a800046b9400042a9400044598000444a800045d1800035118000455180001511800044d180002315200044518000230a80004e9980004af94000570a80001f0a80003b0a8000730a80004e6940004e8a80004cf940004a9980005f0a8000170a80007b0a8000330a80004c6940004a8a8000670a80006f0a80003899800018f940006b0a8000630a800038694000388a80002f0a8000270a800028f94000189980002b0a8000230a800028694000188a80003d0a80007d0a80005d0a80001d0a80004699800042f9400046694000468a8000750a8000350a8000550a8000150a800044f940004299800044694000428a80004eb140004ab1400038b1400018b1400046b1400042b14000285d2000284e40004e9180004a9180003891800018918000469180004291800028552000284a800029dc20004ae140004761400019e140003961400043e140004e61400029cc40004ce14000271c20004d614000172140004de14000332140004c614000270c400047a140004ba1400028dc200018e140004fa1400043a140003861400028cc400029e140002721400028e14000151c2000296140002321400028614000150c400039a140004be140004f61400019a14000295c200042e1400046614000294c400045e1400035214000456140001521400044e14000231c200044614000230c40004ea140004aa1400038a1400018a1400046a1400042a14000285c2000284c400029d420002714200028d420001514200029542000231420002854200000000

def labN321 (v : ℕ) : ℕ := C3.fld9 LABT321 v
/-- L3's key for the `--rord 321` order (injective on `ℕ`, as `C3.labK`) -/
def labK321 (v : ℕ) : ℕ := labN321 (v % 512) + 512 * (v / 512)
/-- the `--rord 321` order with its key -/
abbrev O : SpecO.LabelOrder := L5O.O321 labK321

def wT (v : ℕ) : Bool := (W321 >>> (32 * v)).testBit 0
def wP (v : ℕ) : ℕ := (W321 >>> (32 * v + 1)) % 512
def wQ (v : ℕ) : ℕ := (W321 >>> (32 * v + 10)) % 512
/-- the first code of a rank class in the 321 order -/
def tgt (r : ℕ) : ℕ := if r = 3 then 84 else if r = 2 then 10 else 1
/-- the first label of a rank class in the 321 order -/
def firstL (r : ℕ) : ℕ := if r = 3 then 0 else if r = 2 then 168 else 462

/-- every nonzero code is moved to the first code of its rank class by an element of the group -/
theorem w_fact : S5.allLT 511 (fun k => C3.isGL (wP (k + 1)) && C3.isGL (wQ (k + 1)) &&
    (C3.actN (wT (k + 1)) (wP (k + 1)) (wQ (k + 1)) (k + 1) == tgt (rkOf (k + 1)))) = true := by decide +kernel
/-- `labN321` inverts the order: label `l` has key `l + 1`, and every nonzero code is the code of label `key - 1` -/
theorem lab_fact : S5.allLT 511 (fun l => labN321 (RT.O321.vecL l) == l + 1) = true := by decide +kernel
theorem inv_fact : S5.allLT 511 (fun k => RT.O321.vecL (labN321 (k + 1) - 1) == k + 1 && Nat.ble 1 (labN321 (k + 1)) &&
    Nat.blt (labN321 (k + 1)) 512) = true := by decide +kernel
/-- the first label of each rank class has the first code, and the rank classes are label intervals -/
theorem class_fact : S5.allLT 511 (fun l => Nat.ble (firstL (L5O.rk321 l)) l &&
    Nat.ble 1 (L5O.rk321 l) && Nat.ble (L5O.rk321 l) 3) = true := by decide +kernel

theorem w_spec (v : ℕ) (h0 : 0 < v) (h : v < 512) : C3.isGL (wP v) = true ∧ C3.isGL (wQ v) = true ∧
    C3.actN (wT v) (wP v) (wQ v) v = tgt (rkOf v) := by
  have := S5.allLT_spec w_fact (v - 1) (by omega)
  rw [Nat.sub_add_cancel h0] at this
  simp only [Bool.and_eq_true, beq_iff_eq] at this
  exact ⟨this.1.1, this.1.2, this.2⟩

theorem lab_spec (l : ℕ) (hl : l < 511) : labN321 (RT.O321.vecL l) = l + 1 := by
  have := S5.allLT_spec lab_fact l hl; simpa using this

theorem inv_spec (v : ℕ) (h0 : 0 < v) (h : v < 512) :
    RT.O321.vecL (labN321 v - 1) = v ∧ 1 ≤ labN321 v ∧ labN321 v < 512 := by
  have := S5.allLT_spec inv_fact (v - 1) (by omega)
  rw [Nat.sub_add_cancel h0] at this
  simp only [Bool.and_eq_true, beq_iff_eq, Nat.ble_eq, Nat.blt_eq] at this
  exact ⟨this.1.1, this.1.2, this.2⟩

theorem first_spec (r : ℕ) (h1 : 1 ≤ r) (h3 : r ≤ 3) : RT.O321.vecL (firstL r) = tgt r := by
  interval_cases r <;> decide +kernel

theorem class_spec (l : ℕ) (hl : l < 511) : firstL (L5O.rk321 l) ≤ l ∧ 1 ≤ L5O.rk321 l ∧ L5O.rk321 l ≤ 3 := by
  have := S5.allLT_spec class_fact l hl
  simp only [Bool.and_eq_true, Nat.ble_eq] at this
  exact ⟨this.1.1, this.1.2, this.2⟩

theorem labK321_lt (v : ℕ) (h : v < 512) : labK321 v = labN321 v := by
  unfold labK321; rw [Nat.mod_eq_of_lt h, Nat.div_eq_of_lt h]; simp

/-- **the root of the `--rord 321` trees**: for a first label `l ∉ {0, 168, 462}`, no canonical decomposition lies below `(2^l, l)` -/
theorem root_321 (l : ℕ) (hl : l < 511) (hl0 : l ≠ 0) (hl1 : l ≠ 168) (hl2 : l ≠ 462) :
    ∀ A : Spec.Dec22, SpecO.Canon O A → ¬ SpecO.Below O A (2 ^ l) l := by
  intro A hcan hb
  -- A has label l: its code vecL l is some A.av s
  have hhas : SpecO.Has O A l := (hb l hl le_rfl).mpr (by rw [Nat.testBit_two_pow]; simp)
  obtain ⟨_, s, hs⟩ := hhas
  -- no label of A lies below l
  have hlow : ∀ l', l' < l → ¬ SpecO.Has O A l' := by
    intro l' hl' hh
    have := (hb l' (by omega) (by omega)).mp hh
    rw [Nat.testBit_two_pow] at this; simp at this; omega
  -- the rank class of l and its first label L ≤ l
  set r := L5O.rk321 l with hr
  obtain ⟨hLl, hr1, hr3⟩ := class_spec l hl
  set L := firstL r with hL
  have hrk : rkOf (A.av s) = r := by
    rw [hs]; exact ((L5O.O321 labK321).rk_spec l hl).symm
  -- A has label L: otherwise the witness of A.av s makes the set lex-smaller
  have hhasL : SpecO.Has O A L := by
    refine ⟨by omega, ?_⟩
    by_contra hno
    push Not at hno
    set v := A.av s with hv
    have hv0 : 0 < v := Nat.pos_of_ne_zero (A.ne s)
    obtain ⟨hP, hQ, hgv⟩ := w_spec v hv0 (A.lt s)
    set g := C3.actN (wT v) (wP v) (wQ v) with hg
    apply hcan g ⟨wT v, wP v, wQ v, hP, hQ, rfl⟩
    refine ⟨tgt r, ?_, ?_, ?_⟩
    · rw [Finset.mem_image]
      exact ⟨v, Finset.mem_image.mpr ⟨s, Finset.mem_univ _, rfl⟩, by rw [hgv, hrk]⟩
    · intro h1
      obtain ⟨t, _, ht⟩ := Finset.mem_image.mp h1
      exact hno t (by show A.av t = RT.O321.vecL L; rw [ht, hL, first_spec r hr1 hr3])
    · intro x hx hkey
      exfalso
      obtain ⟨t, _, rfl⟩ := Finset.mem_image.mp hx
      have ht0 : 0 < A.av t := Nat.pos_of_ne_zero (A.ne t)
      obtain ⟨hinv, hk1, hk5⟩ := inv_spec (A.av t) ht0 (A.lt t)
      have htg : tgt r < 512 := by unfold tgt; split_ifs <;> norm_num
      change labK321 (A.av t) < labK321 (tgt r) at hkey
      rw [labK321_lt _ (A.lt t), labK321_lt _ htg, ← first_spec r hr1 hr3,
        lab_spec L (by omega)] at hkey
      -- the label of A.av t is below L ≤ l
      exact hlow (labN321 (A.av t) - 1) (by omega) ⟨by omega, t, hinv.symm⟩
  -- so L = l, against the hypothesis
  have hLeq : L = l := by
    by_contra hne
    exact hlow L (lt_of_le_of_ne hLl hne) hhasL
  have : L = 0 ∨ L = 168 ∨ L = 462 := by rw [hL]; unfold firstL; split_ifs <;> simp
  rcases this with h | h | h <;> omega

end Top321
