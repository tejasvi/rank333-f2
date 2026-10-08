module
public import R22Port.U_d41d8cd98f00
public import HC.Asm
public import HC.Ladder
public import RT.SoundN
/-! # Per-class certificates shared by all class tables, and the table assembly from `(class, bound)` pairs

The raised classes of the different class tables overlap (`K3eD`: 111; the line-490 table: 91, among them 468 and 474 at
20).  A certificate for "class `c` has bound `lb`" is produced once (an E1 run on the IP of `c`) and serves every table
that has `c` at `lb`.  So the certificates are stated on a canonical mask per class, `KC c` (the `K3eD` class table's
subspace, which is RR's `span wang_table[c]` for every `c`, `subAll_K3eD`):

* `ClassLB c lb := Fact (KC c) lb`.
* `classLB_of_e1`: from an E1 statement on an IP subspace `Em` with `KC c ⊆ Em` (one `Nat` operation, `subMask`), e.g.
  `Em = KC c`; `Fact Em 1` from a hyperplane witness.  `classLB_of_e1K`: on `KC c` itself, `Fact (KC c) 1` from RR.
* `classLB_of_table`: a bound in RR's vocabulary (`TableAtLeast`, e.g. `Proto403`); `classLB_of_ladder`: the census
  route's `R23.LB` (ladder form).
* `hcls_pairs CL RL`: a table whose raised classes are exactly the pairs `RL` (`pairsN`, decide), whose used slots lie in
  `KC c` (`kcN`, decide) and in RR's spans (`subZN`), has its capacity table from `RRAll` and `∀ p ∈ RL, ClassLB p.1 p.2`.
`gen_ipasm.py` writes one module per table (`HC/T_<table>.lean`) on top of this. -/
@[expose] public section
namespace HC
open RT FullTable

/-- the canonical subspace of class `c` (the `K3eD` table; `KC 0` is the whole space) -/
def KC (c : Nat) : Nat := kM K3eD_Cls.CL c

/-- **class `c` has bound `lb`** -/
def ClassLB (c lb : Nat) : Prop := Fact (KC c) lb

/-- `m ⊆ m'` below 512, as one `Nat` operation -/
def subMask (m m' : Nat) : Bool := Nat.land (Nat.land m (Nat.xor BC4.M512 m')) BC4.M512 == 0

theorem subMask_spec {m m' : Nat} (h : subMask m m' = true) : ∀ w < 512, m.testBit w = true → m'.testBit w = true := by
  intro w hw hm
  have h0 : Nat.land (Nat.land m (Nat.xor BC4.M512 m')) BC4.M512 = 0 := by simpa only [subMask, beq_iff_eq] using h
  have hb := congrArg (fun x => Nat.testBit x w) h0
  simp only [Nat.zero_testBit] at hb
  have hM : BC4.M512.testBit w = true := by rw [RT.m512_bit]; simp [hw]
  change ((m &&& (BC4.M512 ^^^ m')) &&& BC4.M512).testBit w = false at hb
  rw [Nat.testBit_and, Nat.testBit_and, Nat.testBit_xor, hM, hm] at hb
  cases e : m'.testBit w
  · rw [e] at hb; exact absurd hb (by decide)
  · rfl

/-- an E1 statement on an IP subspace `Em ⊇ KC c` (with a hyperplane over `Em`) certifies the class -/
theorem classLB_of_e1 {c lb Em X : Nat} (hlb : 1 ≤ lb) (hE : E1Concl Em (lb - 1)) (h1 : oneOK Em X = true)
    (hsub : subMask (KC c) Em = true) : ClassLB c lb := by
  have h2 := pad hE (fact_one' h1)
  rw [Nat.sub_add_cancel hlb] at h2
  exact fact_mono le_rfl (subMask_spec hsub) h2

/-- an E1 statement on an IP subspace that a symmetry `(t, P, Q)` maps `KC c` into -/
theorem classLB_of_e1_sym {c lb Em X : Nat} {t : Bool} {P Q : Nat} (hlb : 1 ≤ lb) (hE : E1Concl Em (lb - 1))
    (h1 : oneOK Em X = true) (hP : C3.isGL P = true) (hQ : C3.isGL Q = true) (hmap : mapsTo t P Q Em (KC c) = true) :
    ClassLB c lb := by
  have h2 := pad hE (fact_one' h1)
  rw [Nat.sub_add_cancel hlb] at h2
  exact fact_transport' hP hQ hmap h2

/-- an E1 statement on `KC c` itself, for a class with a positive RR bound (`Fact (KC c) 1` from RR's claim) -/
theorem classLB_of_e1K {c lb : Nat} (hrr : RRAll) (h0 : 0 < c) (hc : c < 496) (hlb : 1 ≤ lb)
    (hE : E1Concl (KC c) (lb - 1)) : ClassLB c lb := by
  have hs : subSpan (KC c) (wang_table[c]!) = true := sub_rec K3eD_Cls.CL 496 subAll_K3eD c hc
  have h1 : Fact (KC c) 1 := fact_mono (rr_pos h0 hc) (fun _ _ h => h) (rr_fact_one (KC c) c hc hs (hrr c hc))
  have h2 := pad hE h1
  rwa [Nat.sub_add_cancel hlb] at h2

/-- a class bound in RR's own vocabulary (e.g. `FullTable.Proto403.table_403_at_least_18`, Farkas leaves on RR facts) -/
theorem classLB_of_table {c lb : Nat} (hc : c < 496) (hal : TableAtLeast (conditions_of_element c) lb) : ClassLB c lb :=
  rr_fact_one (KC c) c hc (sub_rec K3eD_Cls.CL 496 subAll_K3eD c hc) hal

/-- a class bound in RR's ladder form (the census route's `R23.C<c>.lower : R23.LB rowsE lb`, whose body is `LadderLB`) -/
theorem classLB_of_ladder {c lb : Nat} {rows : List Nat} (hred : rows.all (fun r => WangLadder.redBy rows r == 0) = true)
    (hsmall : ∀ r ∈ rows, r < 512) (hsub : subSpan (KC c) rows = true) (h : LadderLB rows lb) : ClassLB c lb :=
  fact_of_ladder hred hsmall (KC c) hsub h

/-- certificates are monotone in the bound -/
theorem classLB_mono {c lb lb' : Nat} (h : ClassLB c lb') (hle : lb ≤ lb') : ClassLB c lb :=
  fact_mono hle (fun _ _ h => h) h

/-! ## Tables from `(class, bound)` pairs -/

/-- class `c`'s slot of `CL` is unused or inside `KC c` -/
def kcOK (CL c : Nat) : Bool := (cLB CL c == 0) || subMask (kM CL c) (KC c)

def kcN (CL n : Nat) : Bool := Nat.rec (motive := fun _ => Bool) true (fun c b => b && kcOK CL c) n

theorem kc_rec (CL n : Nat) (h : kcN CL n = true) : ∀ c < n, kcOK CL c = true := by
  unfold kcN at h
  induction n with
  | zero => intro c hc; exact absurd hc (Nat.not_lt_zero c)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true (fun c b => b && kcOK CL c) n && kcOK CL n) = true := h
    rw [Bool.and_eq_true] at h'
    intro c hc
    rcases Nat.lt_succ_iff_lt_or_eq.mp hc with hlt | heq
    · exact ih h'.1 c hlt
    · subst heq; exact h'.2

/-- the raised classes of `CL` (bound above RR's) are exactly the classes of `RL`, each with its table bound -/
def pairsN (CL : Nat) (RL : List (Nat × Nat)) (n : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true
    (fun c b => b && (!(Nat.blt (rrLB c) (cLB CL c)) || RL.contains (c, cLB CL c))) n

theorem pairs_rec (CL : Nat) (RL : List (Nat × Nat)) (n : Nat) (h : pairsN CL RL n = true) :
    ∀ c < n, rrLB c < cLB CL c → (c, cLB CL c) ∈ RL := by
  unfold pairsN at h
  induction n with
  | zero => intro c hc; exact absurd hc (Nat.not_lt_zero c)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true
        (fun c b => b && (!(Nat.blt (rrLB c) (cLB CL c)) || RL.contains (c, cLB CL c))) n &&
        (!(Nat.blt (rrLB n) (cLB CL n)) || RL.contains (n, cLB CL n))) = true := h
    rw [Bool.and_eq_true] at h'
    intro c hc hlt
    rcases Nat.lt_succ_iff_lt_or_eq.mp hc with hl | heq
    · exact ih h'.1 c hl hlt
    · subst heq
      have h2 := h'.2
      rw [show Nat.blt (rrLB c) (cLB CL c) = true from Nat.blt_eq.mpr hlt] at h2
      simpa using h2

/-- **a class table from RR's table and one `ClassLB` certificate per raised `(class, bound)` pair** -/
theorem hcls_pairs (CL : Nat) (RL : List (Nat × Nat)) (hsub : subZN CL 496 = true) (hkc : kcN CL 496 = true)
    (hpairs : pairsN CL RL 496 = true) (hrr : RRAll) (hcert : ∀ p ∈ RL, ClassLB p.1 p.2) :
    ∀ c < 496, Fact (kM CL c) (cLB CL c) := by
  intro c hc
  refine class_fact CL hsub hrr c hc (fun hlt => Or.inl ?_)
  have hk := kc_rec CL 496 hkc c hc
  unfold kcOK at hk
  have hm : subMask (kM CL c) (KC c) = true := by
    have : cLB CL c ≠ 0 := by omega
    simpa [this] using hk
  exact fact_mono le_rfl (subMask_spec hm) (hcert _ (pairs_rec CL RL 496 hpairs c hc hlt))

/-- the distinct-factor form for one class (`FactN R`) -/
theorem factN_pairs (CL : Nat) (RL : List (Nat × Nat)) (hsub : subZN CL 496 = true) (hkc : kcN CL 496 = true)
    (hpairs : pairsN CL RL 496 = true) (hrr : RRAll) (hcert : ∀ p ∈ RL, ClassLB p.1 p.2) (R c : Nat) (hc : c < 496) :
    FactN R (kM CL c) (cLB CL c) :=
  fact_factN R (hcls_pairs CL RL hsub hkc hpairs hrr hcert c hc)

end HC
