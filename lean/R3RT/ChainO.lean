module
public import R22Port.U_d41d8cd98f00
public import R3RT.L1v5
public import R3RT.SpecO
/-! # The chained batch checker `batch5TDc` (gap G4: batch boundaries; kinds REQUESTS 9)

`batch5TDc tab st nodes stOut` is `batch5TD` whose last case compares the computed final stack with the literal `stOut` (the next
batch's input stack, or the next one-node declaration's). Its contract `Batch5TDcSpec`: from valid input frames (`StackOK st`) a
passing batch gives `BatchOK` and valid output frames (`StackOK stOut`). With `KD.frames_chain` every batch of a segment then starts
from valid frames, beginning with the segment root's (`KD.rootFrame_ok`). Stated over the label order and universe of spec
revision 6a; the proof follows `L5O.batch5TD'_sound` with the stack invariant (leaf/RT agent). -/
@[expose] public section
noncomputable section
namespace R3RT

/-- equality of two frame stacks -/
def stackEq : List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × Nat) → Bool
  | [], [] => true
  | (a, b, c, d, e) :: r, (a', b', c', d', e') :: r' =>
    Nat.beq a a' && Nat.beq b b' && Nat.beq c c' && Nat.beq d d' && Nat.beq e e' && stackEq r r'
  | _, _ => false

theorem stackEq_eq : ∀ (s t : List (Nat × Nat × Nat × Nat × Nat)), stackEq s t = true ↔ s = t
  | [], [] => by simp [stackEq]
  | [], _ :: _ => by simp [stackEq]
  | _ :: _, [] => by simp [stackEq]
  | (a, b, c, d, e) :: r, (a', b', c', d', e') :: r' => by
    simp only [stackEq, Bool.and_eq_true, Nat.beq_eq, stackEq_eq r r', List.cons.injEq, Prod.mk.injEq]
    tauto

def batch5TDc' (tab : Nat → Nat) (stOut : List (Nat × Nat × Nat × Nat × Nat)) :
    List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × List Nat × List Nat × List Nat × List Nat) → Bool
  | st, [] => stackEq st stOut
  | st, (c2, h, suf, hdr, r2, r1, r0, ks) :: rest =>
    match List.drop (Nat.land hdr 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      let nV := Nat.land (Nat.shiftRight hdr 22) 1023
      let n1 := Nat.land (Nat.shiftRight hdr 32) 1023
      let n2 := Nat.land (Nat.shiftRight hdr 52) 1023
      let m := Nat.add nV (Nat.add n1 n2)
      foldR tab 2 r2 0 0 0 0 (fun MB2 E2 b2 c2' =>
        foldR tab 1 r1 MB2 E2 b2 0 (fun MB1 E1 b1 c1' =>
          foldR tab 0 r0 MB1 E1 b1 0 (fun MB E bad c0' =>
            Nat.beq bad 0 && Nat.beq c2' n2 && Nat.beq c1' n1 && Nat.beq c0' nV &&
            node5 S D N U dP c2 h suf
              (Nat.lor (Nat.land hdr 18446744073709551615) (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 m))) 64)) ks
              (fun S' D' N' U' => batch5TDc' tab stOut ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest))))

/-- **the chained batch checker**: `batch5TD` plus the comparison of the final stack with `stOut` -/
def batch5TDc (tab : Nat → Nat) (st : List (Nat × Nat × Nat × Nat × Nat))
    (nodes : List (Nat × Nat × Nat × Nat × List Nat × List Nat × List Nat × List Nat)) (stOut : List (Nat × Nat × Nat × Nat × Nat)) : Bool :=
  batch5TDc' tab stOut st nodes

end R3RT

namespace R3RT.SpecO
variable (O : LabelOrder) (Ω : Spec.Dec22 → Prop)

/-- every frame of the stack is valid -/
def StackOK (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)) : Prop := ∀ f ∈ st, FrameOK O Ω f.1 f.2.1 f.2.2.1 f.2.2.2.1 f.2.2.2.2

/-- **`batch5TDc`'s contract**: valid input frames give `BatchOK` and valid output frames -/
def Batch5TDcSpec : Prop :=
  ∀ (tab : ℕ → ℕ) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)) (nodes : List Spec.Node5) (stOut : List (ℕ × ℕ × ℕ × ℕ × ℕ)),
    TabOK O Ω tab → StackOK O Ω st →
    (∀ x ∈ nodes, C2OK O Ω ((x.2.2.2.1 >>> 8) % 512) x.1 ∧ HOK O ((x.2.2.2.1 >>> 8) % 512) x.2.1) →
    batch5TDc tab st nodes stOut = true → BatchOK O Ω st nodes ∧ StackOK O Ω stOut

/-- chaining a run of batches whose output stacks are the next inputs (as `KD.frames_chain`) -/
theorem stacks_chain (stk : ℕ → List (ℕ × ℕ × ℕ × ℕ × ℕ)) (h0 : StackOK O Ω (stk 0))
    (hstep : ∀ k, StackOK O Ω (stk k) → StackOK O Ω (stk (k + 1))) : ∀ k, StackOK O Ω (stk k) := by
  intro k; induction k with
  | zero => exact h0
  | succ k ih => exact hstep k ih

end R3RT.SpecO
end
