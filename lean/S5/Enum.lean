module
public import R22Port.U_d41d8cd98f00
public import S5.Rec
/-! # Candidate enumeration: `bitsOf`, `pairs`, `candsB`, `candsC` list every set bit -/
@[expose] public section
namespace S5
open BC4 BC5 RootSound

theorem lg2_pow (k : Nat) (hk : k < 512) : lg2 (2 ^ k) = k := by
  have := allLT_spec lg2_fact k hk; simpa using this

def bLoop (f m : Nat) : List Nat :=
  @Nat.rec (fun _ => Nat → List Nat) (fun _ => [])
    (fun _ ih m => cond (Nat.beq m 0) [] (lg2 (Nat.xor m (Nat.land m (Nat.pred m))) :: ih (Nat.land m (Nat.pred m)))) f m

theorem bLoop_succ (f m : Nat) :
    bLoop (f + 1) m = cond (Nat.beq m 0) [] (lg2 (m ^^^ (m &&& (m - 1))) :: bLoop f (m &&& (m - 1))) := rfl

def pLoop (bfirst : Bool) (c : Nat) (tail : List (Nat × Nat)) (f m : Nat) : List (Nat × Nat) :=
  @Nat.rec (fun _ => Nat → List (Nat × Nat)) (fun _ => tail)
    (fun _ ih m => cond (Nat.beq m 0) tail
      (cond bfirst (c, lg2 (Nat.xor m (Nat.land m (Nat.pred m)))) (lg2 (Nat.xor m (Nat.land m (Nat.pred m))), c) ::
        ih (Nat.land m (Nat.pred m)))) f m

theorem pLoop_succ (bfirst : Bool) (c : Nat) (tail : List (Nat × Nat)) (f m : Nat) :
    pLoop bfirst c tail (f + 1) m = cond (Nat.beq m 0) tail
      (cond bfirst (c, lg2 (m ^^^ (m &&& (m - 1)))) (lg2 (m ^^^ (m &&& (m - 1))), c) ::
        pLoop bfirst c tail f (m &&& (m - 1))) := rfl

/-- one step of the enumeration: the lowest bit `k` comes out, `m &&& (m - 1)` keeps the others -/
theorem enum_step (f m : Nat) (hm : m < 2 ^ 512) (hlow : ∀ i, i < 512 - (f + 1) → m.testBit i = false)
    (hm0 : m ≠ 0) : ∃ k, lg2 (m ^^^ (m &&& (m - 1))) = k ∧ m.testBit k = true ∧
      (∀ w, m.testBit w = true → w = k ∨ (m &&& (m - 1)).testBit w = true) ∧
      m &&& (m - 1) < 2 ^ 512 ∧ (∀ i, i < 512 - f → (m &&& (m - 1)).testBit i = false) := by
  obtain ⟨k, hk, hkl⟩ := exists_low_bit hm0
  obtain ⟨hand, hxor⟩ := lowbit_spec hk hkl
  have hk512 : k < 512 := by
    by_contra h
    have := Nat.testBit_lt_two_pow (lt_of_lt_of_le hm (Nat.pow_le_pow_right (by norm_num) (by omega : 512 ≤ k)))
    rw [hk] at this; exact absurd this (by decide)
  have hkf : 512 - (f + 1) ≤ k := by
    by_contra h
    have := hlow k (by omega); rw [hk] at this; exact absurd this (by decide)
  refine ⟨k, by rw [hxor, lg2_pow k hk512], hk, ?_, lt_of_le_of_lt Nat.and_le_left hm, ?_⟩
  · intro w hw
    by_cases e : w = k
    · exact Or.inl e
    · right; rw [hand, hw]; simp [e]
  · intro i hi
    rw [hand]
    by_cases e : i = k
    · simp [e]
    · have : i < k := by omega
      rw [hkl i this]; rfl

theorem bLoop_mem : ∀ (f m : Nat), m < 2 ^ 512 → (∀ i, i < 512 - f → m.testBit i = false) →
    ∀ w, m.testBit w = true → w ∈ bLoop f m := by
  intro f
  induction f with
  | zero =>
    intro m hm hlow w hw
    exfalso
    by_cases hw5 : w < 512
    · rw [hlow w (by omega)] at hw; exact absurd hw (by decide)
    · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hm (Nat.pow_le_pow_right (by norm_num) (by omega)))] at hw
      exact absurd hw (by decide)
  | succ f ih =>
    intro m hm hlow w hw
    rw [bLoop_succ]
    have hm0 : m ≠ 0 := by intro e; rw [e, Nat.zero_testBit] at hw; exact absurd hw (by decide)
    have hb : Nat.beq m 0 = false := by
      cases h : Nat.beq m 0
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true h) hm0
    rw [hb, cond_false]
    obtain ⟨k, hlg, _, hsplit, hlt, hlow'⟩ := enum_step f m hm hlow hm0
    rw [hlg]
    rcases hsplit w hw with e | h
    · rw [e]; exact List.mem_cons_self
    · exact List.mem_cons_of_mem _ (ih _ hlt hlow' w h)

theorem bitsOf_mem (m : Nat) (hm : m < 2 ^ 512) (w : Nat) (hw : m.testBit w = true) : w ∈ bitsOf m :=
  bLoop_mem 512 m hm (fun i hi => by omega) w hw

theorem pLoop_mem (bfirst : Bool) (c : Nat) (tail : List (Nat × Nat)) : ∀ (f m : Nat), m < 2 ^ 512 →
    (∀ i, i < 512 - f → m.testBit i = false) →
    (∀ p ∈ tail, p ∈ pLoop bfirst c tail f m) ∧
    (∀ w, m.testBit w = true → cond bfirst (c, w) (w, c) ∈ pLoop bfirst c tail f m) := by
  intro f
  induction f with
  | zero =>
    intro m hm hlow
    refine ⟨fun p hp => hp, fun w hw => ?_⟩
    exfalso
    by_cases hw5 : w < 512
    · rw [hlow w (by omega)] at hw; exact absurd hw (by decide)
    · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hm (Nat.pow_le_pow_right (by norm_num) (by omega)))] at hw
      exact absurd hw (by decide)
  | succ f ih =>
    intro m hm hlow
    rw [pLoop_succ]
    by_cases hm0 : m = 0
    · have hb : Nat.beq m 0 = true := by rw [hm0]; rfl
      rw [hb, cond_true]
      refine ⟨fun p hp => hp, fun w hw => ?_⟩
      rw [hm0, Nat.zero_testBit] at hw; exact absurd hw (by decide)
    · have hb : Nat.beq m 0 = false := by
        cases h : Nat.beq m 0
        · rfl
        · exact absurd (Nat.eq_of_beq_eq_true h) hm0
      rw [hb, cond_false]
      obtain ⟨k, hlg, _, hsplit, hlt, hlow'⟩ := enum_step f m hm hlow hm0
      rw [hlg]
      obtain ⟨ih1, ih2⟩ := ih _ hlt hlow'
      refine ⟨fun p hp => List.mem_cons_of_mem _ (ih1 p hp), fun w hw => ?_⟩
      rcases hsplit w hw with e | h
      · rw [e]; exact List.mem_cons_self
      · exact List.mem_cons_of_mem _ (ih2 w h)

theorem pairs_mem (bfirst : Bool) (c m : Nat) (tail : List (Nat × Nat)) (hm : m < 2 ^ 512) :
    (∀ p ∈ tail, p ∈ pairs bfirst c m tail) ∧
    (∀ w, m.testBit w = true → cond bfirst (c, w) (w, c) ∈ pairs bfirst c m tail) :=
  pLoop_mem bfirst c tail 512 m hm (fun i hi => by omega)

theorem cmS_le (bb : Nat) (l : List (Bool × Nat × Nat)) : ∀ m, cmS bb l m ≤ m := by
  induction l with
  | nil => intro m; exact le_rfl
  | cons sd l ih =>
    intro m
    have e : cmS bb (sd :: l) m = cmS bb l (cond (bit sd.2.1 bb) m (m &&& sd.2.2)) := rfl
    rw [e]
    refine le_trans (ih _) ?_
    cases bit sd.2.1 bb
    · rw [cond_false]; exact Nat.and_le_left
    · rw [cond_true]
theorem bmS_le (cc : Nat) (l : List (Bool × Nat × Nat)) : ∀ m, bmS cc l m ≤ m := by
  induction l with
  | nil => intro m; exact le_rfl
  | cons sd l ih =>
    intro m
    have e : bmS cc (sd :: l) m = bmS cc l (cond (bit sd.2.2 cc) m (m &&& sd.2.1)) := rfl
    rw [e]
    refine le_trans (ih _) ?_
    cases bit sd.2.2 cc
    · rw [cond_false]; exact Nat.and_le_left
    · rw [cond_true]
theorem cmT_le (bb : Nat) (l : List Rec) : ∀ m, cmT bb l m ≤ m := by
  induction l with
  | nil => intro m; exact le_rfl
  | cons r l ih => intro m; exact le_trans (ih _) Nat.and_le_left
theorem bmT_le (cc : Nat) (l : List Rec) : ∀ m, bmT cc l m ≤ m := by
  induction l with
  | nil => intro m; exact le_rfl
  | cons r l ih => intro m; exact le_trans (ih _) Nat.and_le_left

theorem candsB_mem (part : List Rec) (ss : List (Bool × Nat × Nat)) (cb : Nat) (hcb : cb < 2 ^ 512) (bb w : Nat) :
    ∀ bs : List Nat, bb ∈ bs → (cmS bb ss (cmT bb part cb)).testBit w = true → (bb, w) ∈ candsB part ss cb bs := by
  intro bs
  induction bs with
  | nil => intro h; exact absurd h List.not_mem_nil
  | cons b' bs ih =>
    intro hb hw
    have e : candsB part ss cb (b' :: bs) = pairs true b' (cmS b' ss (cmT b' part cb)) (candsB part ss cb bs) := rfl
    rw [e]
    have hlt : ∀ b'', cmS b'' ss (cmT b'' part cb) < 2 ^ 512 :=
      fun b'' => lt_of_le_of_lt (le_trans (cmS_le _ _ _) (cmT_le _ _ _)) hcb
    rcases List.mem_cons.mp hb with h | h
    · subst h; exact (pairs_mem true bb _ _ (hlt bb)).2 w hw
    · exact (pairs_mem true b' _ _ (hlt b')).1 _ (ih h hw)

theorem candsC_mem (part : List Rec) (ss : List (Bool × Nat × Nat)) (bm : Nat) (hbm : bm < 2 ^ 512) (cc w : Nat) :
    ∀ cs : List Nat, cc ∈ cs → (bmS cc ss (bmT cc part bm)).testBit w = true → (w, cc) ∈ candsC part ss bm cs := by
  intro cs
  induction cs with
  | nil => intro h; exact absurd h List.not_mem_nil
  | cons c' cs ih =>
    intro hc hw
    have e : candsC part ss bm (c' :: cs) = pairs false c' (bmS c' ss (bmT c' part bm)) (candsC part ss bm cs) := rfl
    rw [e]
    have hlt : ∀ c'', bmS c'' ss (bmT c'' part bm) < 2 ^ 512 :=
      fun c'' => lt_of_le_of_lt (le_trans (bmS_le _ _ _) (bmT_le _ _ _)) hbm
    rcases List.mem_cons.mp hc with h | h
    · subst h; exact (pairs_mem false cc _ _ (hlt cc)).2 w hw
    · exact (pairs_mem false c' _ _ (hlt c')).1 _ (ih h hw)

end S5
