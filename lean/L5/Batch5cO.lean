module
public import R22Port.U_d41d8cd98f00
public import L5.Batch5O
public import R3RT.ChainO
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
/-! # The chained batch checker `batch5TDc` (R3RT/ChainO.lean): `∀ O Ω, Batch5TDcSpec O Ω`

`batch5TDc'_sound`: `L5O.batch5TD'_sound` with the stack invariant carried through: a passing chained batch from valid frames
gives `BatchOK` and, at its end (`stackEq st stOut`, so `stOut` is the computed final stack), valid output frames. -/
noncomputable section
namespace L5O
open E1S Finset R3RT.Spec RootSound BC4 BC5 Classical L5
variable {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop}

theorem batch5TDc'_sound (tab : ℕ → ℕ) (hT : R3RT.SpecO.TabOK O Ω tab) (stOut : List (ℕ × ℕ × ℕ × ℕ × ℕ)) :
    ∀ (nodes : List Node5) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)),
    (∀ f ∈ st, R3RT.SpecO.FrameOK O Ω f.1 f.2.1 f.2.2.1 f.2.2.2.1 f.2.2.2.2) →
    (∀ x ∈ nodes, R3RT.SpecO.C2OK O Ω ((x.2.2.2.1 >>> 8) % 512) x.1 ∧ R3RT.SpecO.HOK O ((x.2.2.2.1 >>> 8) % 512) x.2.1) →
    R3RT.batch5TDc' tab stOut st nodes = true → R3RT.SpecO.BatchOK O Ω st nodes ∧ R3RT.SpecO.StackOK O Ω stOut := by
  intro nodes
  induction nodes with
  | nil =>
    intro st hst _ hb
    simp only [R3RT.batch5TDc'] at hb
    rw [R3RT.stackEq_eq] at hb
    subst hb
    exact ⟨by simp [R3RT.SpecO.BatchOK], hst⟩
  | cons x rest ih =>
    intro st hst hnodes hb
    obtain ⟨c2, h, suf, hdr, r2, r1, r0, ks⟩ := x
    have hx := hnodes (c2, h, suf, hdr, r2, r1, r0, ks) (List.mem_cons_self ..)
    simp only at hx
    have hrest : ∀ y ∈ rest, R3RT.SpecO.C2OK O Ω ((y.2.2.2.1 >>> 8) % 512) y.1 ∧ R3RT.SpecO.HOK O ((y.2.2.2.1 >>> 8) % 512) y.2.1 :=
      fun y hy => hnodes y (List.mem_cons_of_mem _ hy)
    have hpop : Nat.land hdr 255 = hdr % 256 := by
      rw [land_eq, show (255 : ℕ) = 2 ^ 8 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
    simp only [R3RT.batch5TDc'] at hb
    rw [hpop] at hb
    show R3RT.SpecO.BatchOK O Ω st ((c2, h, suf, hdr, r2, r1, r0, ks) :: rest) ∧ R3RT.SpecO.StackOK O Ω stOut
    simp only [R3RT.SpecO.BatchOK]
    rcases hd : List.drop (hdr % 256) st with _ | ⟨⟨S, D, N, U, dP⟩, st'⟩
    · rw [hd] at hb; exact absurd hb (by simp)
    · rw [hd] at hb
      simp only at hb ⊢
      have hF : R3RT.SpecO.FrameOK O Ω S D N U dP := by
        have := hst (S, D, N, U, dP) (List.mem_of_mem_drop (i := hdr % 256) (a := (S, D, N, U, dP)) (by rw [hd]; simp))
        exact this
      have hcap : ∀ y, capT tab y < 256 := fun y => (hT y).1
      obtain ⟨b2, hk2, hb2⟩ := foldR_sem tab 2 _ r2 0 0 0 0 (fun y _ => hcap y) hb
      obtain ⟨b1, hk1, hb1⟩ := foldR_sem tab 1 _ r1 _ _ _ 0 (fun y _ => hcap y) hk2
      obtain ⟨b0, hk0, hb0⟩ := foldR_sem tab 0 _ r0 _ _ _ 0 (fun y _ => hcap y) hk1
      simp only [Bool.and_eq_true, Nat.beq_eq] at hk0
      obtain ⟨⟨⟨⟨hbad, hc2'⟩, hc1'⟩, hc0'⟩, hn5⟩ := hk0
      obtain ⟨hb1z, _⟩ := hb0 hbad
      obtain ⟨hb2z, hcap1⟩ := hb1 hb1z
      obtain ⟨_, hcap2⟩ := hb2 hb2z
      have hn2 : r2.length = (hdr >>> 52) % 1024 := by rw [← n5n2_eq]; unfold n5n2; omega
      have hn1 : r1.length = (hdr >>> 32) % 1024 := by rw [← n5n1_eq]; unfold n5n1; omega
      have hnV : r0.length = (hdr >>> 22) % 1024 := by rw [← n5nV_eq]; unfold n5nV; omega
      have hm : Nat.add (Nat.land (Nat.shiftRight hdr 22) 1023)
          (Nat.add (Nat.land (Nat.shiftRight hdr 32) 1023) (Nat.land (Nat.shiftRight hdr 52) 1023)) =
          r0.length + r1.length + r2.length := by
        rw [nadd_eq, nadd_eq, hnV, hn1, hn2, ← n5nV_eq, ← n5n1_eq, ← n5n2_eq]; unfold n5nV n5n1 n5n2; ring
      rw [hm] at hn5
      set MB := ((0 * 2 ^ (512 * r2.length) + PK tab r2) * 2 ^ (512 * r1.length) + PK tab r1) * 2 ^ (512 * r0.length) +
        PK tab r0 with hMB
      set E := ((0 * 2 ^ (8 * r2.length) + QK tab 2 r2) * 2 ^ (8 * r1.length) + QK tab 1 r1) * 2 ^ (8 * r0.length) +
        QK tab 0 r0 with hE
      have hrecok := rec_ok tab hT hdr r2 r1 r0 hn2 hn1 hnV hcap2 hcap1 MB E rfl rfl
      have hMBlt : MB < 2 ^ (512 * (r0.length + r1.length + r2.length)) := by
        have hPK : ∀ L : List ℕ, PK tab L < 2 ^ (512 * L.length) := fun L =>
          pk_lt 512 _ _ (fun s _ => lt_trans (Nat.mod_lt _ (by positivity)) (by norm_num))
        rw [hMB]
        have h2 := hPK r2; have h1 := hPK r1; have h0 := hPK r0
        calc _ = PK tab r0 + 2 ^ (512 * r0.length) * (PK tab r1 + 2 ^ (512 * r1.length) * PK tab r2) := by ring
          _ < 2 ^ (512 * r0.length) + 2 ^ (512 * r0.length) * (PK tab r1 + 2 ^ (512 * r1.length) * PK tab r2) := by omega
          _ = 2 ^ (512 * r0.length) * (PK tab r1 + 2 ^ (512 * r1.length) * PK tab r2 + 1) := by ring
          _ ≤ 2 ^ (512 * r0.length) * (2 ^ (512 * r1.length) * 2 ^ (512 * r2.length)) := by
              apply Nat.mul_le_mul_left
              calc PK tab r1 + 2 ^ (512 * r1.length) * PK tab r2 + 1
                  ≤ 2 ^ (512 * r1.length) + 2 ^ (512 * r1.length) * PK tab r2 := by omega
                _ = 2 ^ (512 * r1.length) * (PK tab r2 + 1) := by ring
                _ ≤ 2 ^ (512 * r1.length) * 2 ^ (512 * r2.length) := Nat.mul_le_mul_left _ (by omega)
          _ = 2 ^ (512 * (r0.length + r1.length + r2.length)) := by rw [← pow_add, ← pow_add]; ring_nf
      have hlo := rec_lo hdr MB E (r0.length + r1.length + r2.length) hMBlt
      have hlast : ((Nat.lor (Nat.land hdr 18446744073709551615)
          (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 (r0.length + r1.length + r2.length)))) 64)) >>> 8) % 512 =
          (hdr >>> 8) % 512 := low_field _ _ 8 9 hlo (by norm_num)
      obtain ⟨D', hF', hK, hk⟩ := node5_spec S D N U dP c2 h suf _ ks _ hF (by rw [hlast]; exact hx.1)
        (by rw [hlast]; exact hx.2) hrecok hn5
      rw [hlast] at hF' hK hk
      have hst' : ∀ f ∈ (S ||| 2 ^ ((hdr >>> 8) % 512), D', N ||| c2, U + h, dP + 1) :: (S, D, N, U, dP) :: st',
          R3RT.SpecO.FrameOK O Ω f.1 f.2.1 f.2.2.1 f.2.2.2.1 f.2.2.2.2 := by
        intro f hf
        rw [List.mem_cons] at hf
        rcases hf with rfl | hf
        · exact hF'
        · rw [List.mem_cons] at hf
          rcases hf with rfl | hf
          · exact hF
          · exact hst f (List.mem_of_mem_drop (i := hdr % 256) (a := f) (by rw [hd]; exact List.mem_cons_of_mem _ hf))
      obtain ⟨hB, hS⟩ := ih _ hst' hrest hk
      exact ⟨⟨hK, D', hF', hB⟩, hS⟩

theorem batch5TDc_spec : R3RT.SpecO.Batch5TDcSpec O Ω := by
  intro tab st nodes stOut hT hst hnodes hb
  exact batch5TDc'_sound tab hT stOut nodes st hst hnodes hb

theorem batch5TDc_specO : ∀ (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop), R3RT.SpecO.Batch5TDcSpec O Ω :=
  fun O Ω => batch5TDc_spec (O := O) (Ω := Ω)

end L5O
