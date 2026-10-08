module
public import R22Port.U_d41d8cd98f00
public import HC.RRFact
public import HC.Pad
public import RT.Cls_e490x
/-! # Assembly of the capacity-table hypothesis `hcls` (item 5 of `leaf2/HCLS.md`)

Every class `c < 496` of a class table `CL` takes one of three routes (decided by the kernel per class):
* **zero**: `cLB CL c = 0` (an unused slot of an IP table); `Fact _ 0` is trivial.
* **RR**: `cLB CL c ≤ rrLB c`; `rr_fact_one` (RR's claim for element `c`, `K_c ⊆ span wang_table[c]`) and `fact_mono`.
* **raised**: `rrLB c < cLB CL c`; a certificate `RaiseCert CL c`: either the bound itself (census, ...), or an E1 refutation
  of exactly `cLB - 1` first factors outside an IP subspace `Em`, a hyperplane over `Em` (`oneOK`) and a symmetry
  `(t, P, Q)` with `(t, P, Q)(K_c) ⊆ Em` (`mapsTo`); `pad` then `fact_transport`.
  When the IP is built on `K_c` itself (as the existing IPs are: `E1.IP_e490x.Em = kM Cls_e490x.CL 490`), the E1
  statement alone suffices (`raise_of_e1K`): `Fact K_c 1` comes from RR's bound.

* `hcls_gen`: the generic theorem.
* **`hcls_K3eD`**: the main search's table.  Hypotheses: RR's table (`RRAll`, proved in `HC.RRTable`) and, for each of
  the 111 raised classes `RAISED_K3eD` (a list checked against the table), the E1 statement of its IP on `K_c`.
* `hcls_all`: from `c < 496` to every `c`, for IP tables without slots past 495 (`hcls` of `E1.OK_*.…_sound`).
* `hcls_e490x`: the E1 table of the line 490 (C3d + 468/474), 91 raised classes `RAISED_e490x`. -/
@[expose] public section
set_option exponentiation.threshold 50000
namespace HC
open RT FullTable

/-! ## Certificates for raised classes -/

/-- a raised class's certificate -/
def RaiseCert (CL c : Nat) : Prop :=
  Fact (kM CL c) (cLB CL c) ∨
  ∃ Em X : Nat, ∃ t : Bool, ∃ P Q : Nat, E1Concl Em (cLB CL c - 1) ∧ oneOK Em X = true ∧
    C3.isGL P = true ∧ C3.isGL Q = true ∧ mapsTo t P Q Em (kM CL c) = true

theorem raise_fact {CL c : Nat} (hlb : 1 ≤ cLB CL c) (h : RaiseCert CL c) : Fact (kM CL c) (cLB CL c) := by
  rcases h with h | ⟨Em, X, t, P, Q, hE, h1, hP, hQ, hmap⟩
  · exact h
  · have h2 := pad hE (fact_one' h1)
    rw [Nat.sub_add_cancel hlb] at h2
    exact fact_transport' hP hQ hmap h2

/-- every element but the whole space has a positive RR bound -/
def posN (n : Nat) : Bool := Nat.rec (motive := fun _ => Bool) true (fun c b => b && Nat.blt 0 (rrLB (c + 1))) n

theorem pos_rec (n : Nat) (h : posN n = true) : ∀ c < n, 0 < rrLB (c + 1) := by
  unfold posN at h
  induction n with
  | zero => intro c hc; exact absurd hc (Nat.not_lt_zero c)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true (fun c b => b && Nat.blt 0 (rrLB (c + 1))) n &&
        Nat.blt 0 (rrLB (n + 1))) = true := h
    rw [Bool.and_eq_true] at h'
    intro c hc
    rcases Nat.lt_succ_iff_lt_or_eq.mp hc with hlt | heq
    · exact ih h'.1 c hlt
    · subst heq; simpa using h'.2

theorem posN_495 : posN 495 = true := by decide +kernel

theorem rr_pos {c : Nat} (h0 : 0 < c) (hc : c < 496) : 0 < rrLB c := by
  have := pos_rec 495 posN_495 (c - 1) (by omega)
  rwa [Nat.sub_add_cancel h0] at this

/-- **a raised class whose IP is built on `K_c` itself**: the E1 statement suffices -/
theorem raise_of_e1K {CL c : Nat} (hc : c < 496) (hsub : subSpan (kM CL c) (wang_table[c]!) = true) (hrr : RRAll)
    (hlt : rrLB c < cLB CL c) (h0 : 0 < c) (hE : E1Concl (kM CL c) (cLB CL c - 1)) : RaiseCert CL c := by
  left
  have h1 : Fact (kM CL c) 1 :=
    fact_mono (rr_pos h0 hc) (fun _ _ h => h) (rr_fact_one (kM CL c) c hc hsub (hrr c hc))
  have h2 := pad hE h1
  rwa [Nat.sub_add_cancel (by omega)] at h2

/-! ## The generic assembly -/

/-- per class: an unused slot, or `K_c ⊆ span wang_table[c]` -/
def okSub (CL c : Nat) : Bool := (cLB CL c == 0) || subSpan (kM CL c) (wang_table[c]!)

def subZN (CL n : Nat) : Bool := Nat.rec (motive := fun _ => Bool) true (fun c b => b && okSub CL c) n

theorem subZ_rec (CL n : Nat) (h : subZN CL n = true) : ∀ c < n, okSub CL c = true := by
  unfold subZN at h
  induction n with
  | zero => intro c hc; exact absurd hc (Nat.not_lt_zero c)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true (fun c b => b && okSub CL c) n && okSub CL n) = true := h
    rw [Bool.and_eq_true] at h'
    intro c hc
    rcases Nat.lt_succ_iff_lt_or_eq.mp hc with hlt | heq
    · exact ih h'.1 c hlt
    · subst heq; exact h'.2

/-- **one class**: its route (zero / RR / raised with a certificate) -/
theorem class_fact (CL : Nat) (hsub : subZN CL 496 = true) (hrr : RRAll) (c : Nat) (hc : c < 496)
    (hraise : rrLB c < cLB CL c → RaiseCert CL c) : Fact (kM CL c) (cLB CL c) := by
  have hok := subZ_rec CL 496 hsub c hc
  unfold okSub at hok
  by_cases h0 : cLB CL c = 0
  · rw [h0]; intro n av b c' _ _; exact Nat.zero_le _
  · have hs : subSpan (kM CL c) (wang_table[c]!) = true := by simpa [h0] using hok
    by_cases hr : cLB CL c ≤ rrLB c
    · exact fact_mono hr (fun _ _ h => h) (rr_fact_one (kM CL c) c hc hs (hrr c hc))
    · exact raise_fact (by omega) (hraise (by omega))

/-- one class whose IP (if raised) is built on `K_c`: the E1 statement suffices -/
theorem class_factK (CL : Nat) (hsub : subZN CL 496 = true) (hrr : RRAll) (hz : cLB CL 0 = 0) (c : Nat) (hc : c < 496)
    (hraise : rrLB c < cLB CL c → E1Concl (kM CL c) (cLB CL c - 1)) : Fact (kM CL c) (cLB CL c) := by
  refine class_fact CL hsub hrr c hc (fun hlt => ?_)
  have h0 : 0 < c := by
    rcases Nat.eq_zero_or_pos c with e | e
    · subst e; rw [hz] at hlt; exact absurd hlt (Nat.not_lt_zero _)
    · exact e
  have hok := subZ_rec CL 496 hsub c hc
  unfold okSub at hok
  have hs : subSpan (kM CL c) (wang_table[c]!) = true := by
    have : cLB CL c ≠ 0 := by omega
    simpa [this] using hok
  exact raise_of_e1K hc hs hrr hlt h0 (hraise hlt)

/-- **The capacity table from RR's table and one certificate per raised class.** -/
theorem hcls_gen (CL : Nat) (hsub : subZN CL 496 = true) (hrr : RRAll)
    (hraise : ∀ c < 496, rrLB c < cLB CL c → RaiseCert CL c) : ∀ c < 496, Fact (kM CL c) (cLB CL c) :=
  fun c hc => class_fact CL hsub hrr c hc (hraise c hc)

/-- the generic assembly when every raised class's IP is built on `K_c` (the E1 statements only) -/
theorem hcls_genK (CL : Nat) (hsub : subZN CL 496 = true) (hrr : RRAll) (hz : cLB CL 0 = 0)
    (hraise : ∀ c < 496, rrLB c < cLB CL c → E1Concl (kM CL c) (cLB CL c - 1)) :
    ∀ c < 496, Fact (kM CL c) (cLB CL c) :=
  fun c hc => class_factK CL hsub hrr hz c hc (hraise c hc)

/-! ## Raised-class lists, checked against the tables -/

/-- the raised classes of `CL` are exactly the members of `l` (below 496) -/
def raisedN (CL : Nat) (l : List Nat) (n : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun c b => b && (Nat.blt (rrLB c) (cLB CL c) == l.contains c)) n

theorem raised_rec (CL : Nat) (l : List Nat) (n : Nat) (h : raisedN CL l n = true) :
    ∀ c < n, rrLB c < cLB CL c → c ∈ l := by
  unfold raisedN at h
  induction n with
  | zero => intro c hc; exact absurd hc (Nat.not_lt_zero c)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true
        (fun c b => b && (Nat.blt (rrLB c) (cLB CL c) == l.contains c)) n &&
        (Nat.blt (rrLB n) (cLB CL n) == l.contains n)) = true := h
    rw [Bool.and_eq_true] at h'
    intro c hc hlt
    rcases Nat.lt_succ_iff_lt_or_eq.mp hc with hl | heq
    · exact ih h'.1 c hl hlt
    · subst heq
      have h2 := h'.2
      rw [beq_iff_eq, show Nat.blt (rrLB c) (cLB CL c) = true from Nat.blt_eq.mpr hlt] at h2
      exact List.contains_iff_mem.mp h2.symm

/-- the 111 raised classes of `K3eD` (`leaf2/HCLS.md`) -/
def RAISED_K3eD : List Nat := [150, 159, 185, 202, 203, 204, 205, 206, 207, 212, 213, 218, 232, 234, 236, 237, 239, 242,
  244, 245, 246, 267, 279, 281, 284, 291, 292, 295, 297, 298, 300, 303, 304, 311, 313, 317, 318, 321, 324, 334, 335, 336,
  338, 339, 343, 355, 356, 361, 364, 365, 369, 370, 371, 374, 378, 379, 382, 384, 386, 387, 390, 391, 392, 394, 395, 401,
  402, 404, 406, 407, 408, 418, 420, 421, 422, 423, 425, 426, 435, 436, 438, 439, 441, 443, 444, 445, 446, 447, 448, 450,
  451, 454, 455, 456, 458, 460, 463, 464, 465, 469, 470, 471, 472, 473, 475, 476, 479, 485, 487, 490, 492]

theorem raised_K3eD : raisedN K3eD_Cls.CL RAISED_K3eD 496 = true := by decide +kernel
theorem subZ_K3eD : subZN K3eD_Cls.CL 496 = true := by decide +kernel
theorem z_K3eD : cLB K3eD_Cls.CL 0 = 0 := by decide +kernel

/-- **`hcls` for the main search's table `K3eD`**, from RR's table and the E1 statement of each raised class's IP
(built on the class representative `K_c`, with `R_c = lb_c - 1` factors outside it). -/
theorem hcls_K3eD (hrr : RRAll)
    (hraise : ∀ c ∈ RAISED_K3eD, E1Concl (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c - 1)) :
    ∀ c < 496, Fact (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c) :=
  hcls_genK _ subZ_K3eD hrr z_K3eD (fun c hc hlt => hraise c (raised_rec _ _ 496 raised_K3eD c hc hlt))

/-- **`hcls` for `K3eD`, general certificates** (census facts, IPs on other representatives, ...). -/
theorem hcls_K3eD_cert (hrr : RRAll) (hraise : ∀ c ∈ RAISED_K3eD, RaiseCert K3eD_Cls.CL c) :
    ∀ c < 496, Fact (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c) :=
  hcls_gen _ subZ_K3eD hrr (fun c hc hlt => hraise c (raised_rec _ _ 496 raised_K3eD c hc hlt))

/-! ## IP tables: every slot -/

theorem cLB_big {CL c : Nat} (hbig : CL < 2 ^ (96 * 496)) (hc : 496 ≤ c) : cLB CL c = 0 := by
  unfold cLB
  rw [Nat.shiftRight_eq_div_pow, Nat.div_eq_of_lt (lt_of_lt_of_le hbig (Nat.pow_le_pow_right (by norm_num) (by omega)))]

/-- from the classes below 496 to every slot (the form of `hcls` in `E1.OK_*.…_sound`), for tables without slots past 495 -/
theorem hcls_all {CL : Nat} (hbig : CL < 2 ^ (96 * 496)) (h : ∀ c < 496, Fact (kM CL c) (cLB CL c)) :
    ∀ c, Fact (kM CL c) (cLB CL c) := by
  intro c
  by_cases hc : c < 496
  · exact h c hc
  · rw [cLB_big hbig (by omega)]; intro n av b c' _ _; exact Nat.zero_le _

/-- the 91 raised classes of the line-490 table `Cls_e490x` (C3d + 468/474) -/
def RAISED_e490x : List Nat := [150, 159, 185, 202, 203, 204, 205, 206, 207, 210, 212, 213, 218, 232, 234, 236, 237, 239,
  240, 241, 242, 244, 245, 246, 267, 281, 291, 295, 297, 298, 303, 304, 311, 313, 317, 324, 334, 335, 336, 338, 339, 343,
  355, 356, 361, 363, 364, 365, 369, 370, 371, 374, 375, 379, 382, 384, 386, 387, 390, 392, 394, 395, 399, 400, 401, 402,
  403, 404, 405, 406, 407, 408, 409, 426, 438, 443, 444, 445, 446, 447, 454, 456, 463, 464, 465, 468, 469, 471, 473, 474,
  476]

theorem raised_e490x : raisedN Cls_e490x.CL RAISED_e490x 496 = true := by decide +kernel
theorem subZ_e490x : subZN Cls_e490x.CL 496 = true := by decide +kernel
theorem z_e490x : cLB Cls_e490x.CL 0 = 0 := by decide +kernel
theorem big_e490x : Cls_e490x.CL < 2 ^ (96 * 496) := by decide +kernel

/-- **`hcls` for the line-490 IP table** (the hypothesis of `E1.OK_e490x.e490x_sound`). -/
theorem hcls_e490x (hrr : RRAll)
    (hraise : ∀ c ∈ RAISED_e490x, E1Concl (kM Cls_e490x.CL c) (cLB Cls_e490x.CL c - 1)) :
    ∀ c, Fact (kM Cls_e490x.CL c) (cLB Cls_e490x.CL c) :=
  hcls_all big_e490x
    (hcls_genK _ subZ_e490x hrr z_e490x (fun c hc hlt => hraise c (raised_rec _ _ 496 raised_e490x c hc hlt)))

end HC
