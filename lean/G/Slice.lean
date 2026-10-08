module
public import R22Port.U_d41d8cd98f00
public import G.Gram
/-! # Bit-sliced lists

A list of `n` fields `x_0, ..., x_{n-1} < 2^29` is stored as 29 *slices*: slice `i` has bit `k` equal to bit `i` of `x_k`.
Then `sx S y` has bit `k` equal to `par (x_k &&& y)`: it is the xor of the slices selected by the bits of `y`.  So one parity
test against a whole list is 29 multiplications by 0/1 and 28 xors of `n`-bit numbers, with a stride-1 result (no compaction).
The slices are checked against the stride-32 field packs in phase A (`G.V.compactL` of `(P >>> i) &&& rep32 n`).
-/
@[expose] public section
noncomputable section
namespace G

structure Sl29 where
  s0 : Nat
  s1 : Nat
  s2 : Nat
  s3 : Nat
  s4 : Nat
  s5 : Nat
  s6 : Nat
  s7 : Nat
  s8 : Nat
  s9 : Nat
  s10 : Nat
  s11 : Nat
  s12 : Nat
  s13 : Nat
  s14 : Nat
  s15 : Nat
  s16 : Nat
  s17 : Nat
  s18 : Nat
  s19 : Nat
  s20 : Nat
  s21 : Nat
  s22 : Nat
  s23 : Nat
  s24 : Nat
  s25 : Nat
  s26 : Nat
  s27 : Nat
  s28 : Nat

/-- slice `i` (`i < 29`), `0` otherwise -/
def Sl29.get (S : Sl29) (i : Nat) : Nat :=
  match i with
  | 0 => S.s0 | 1 => S.s1 | 2 => S.s2 | 3 => S.s3 | 4 => S.s4 | 5 => S.s5 | 6 => S.s6 | 7 => S.s7 | 8 => S.s8
  | 9 => S.s9 | 10 => S.s10 | 11 => S.s11 | 12 => S.s12 | 13 => S.s13 | 14 => S.s14 | 15 => S.s15 | 16 => S.s16
  | 17 => S.s17 | 18 => S.s18 | 19 => S.s19 | 20 => S.s20 | 21 => S.s21 | 22 => S.s22 | 23 => S.s23 | 24 => S.s24
  | 25 => S.s25 | 26 => S.s26 | 27 => S.s27 | 28 => S.s28 | _ => 0

/-- `S_i` if bit `i` of `y` is set, else `0` -/
def sel1 (y i S : Nat) : Nat := Nat.mul (bit y i) S

/-- bit `k` = `par (x_k &&& y)` for `y < 2^29` -/
def sx (S : Sl29) (y : Nat) : Nat :=
  Nat.xor (Nat.xor (Nat.xor (Nat.xor (sel1 y 0 S.s0) (sel1 y 1 S.s1)) (Nat.xor (sel1 y 2 S.s2) (sel1 y 3 S.s3)))
    (Nat.xor (Nat.xor (sel1 y 4 S.s4) (sel1 y 5 S.s5)) (Nat.xor (sel1 y 6 S.s6) (sel1 y 7 S.s7))))
  (Nat.xor (Nat.xor (Nat.xor (Nat.xor (sel1 y 8 S.s8) (sel1 y 9 S.s9)) (Nat.xor (sel1 y 10 S.s10) (sel1 y 11 S.s11)))
    (Nat.xor (Nat.xor (sel1 y 12 S.s12) (sel1 y 13 S.s13)) (Nat.xor (sel1 y 14 S.s14) (sel1 y 15 S.s15))))
  (Nat.xor (Nat.xor (Nat.xor (sel1 y 16 S.s16) (sel1 y 17 S.s17)) (Nat.xor (sel1 y 18 S.s18) (sel1 y 19 S.s19)))
    (Nat.xor (Nat.xor (Nat.xor (sel1 y 20 S.s20) (sel1 y 21 S.s21)) (Nat.xor (sel1 y 22 S.s22) (sel1 y 23 S.s23)))
      (Nat.xor (Nat.xor (sel1 y 24 S.s24) (sel1 y 25 S.s25)) (Nat.xor (Nat.xor (sel1 y 26 S.s26) (sel1 y 27 S.s27)) (sel1 y 28 S.s28))))))

/-- `n` bits of `M` from bit `lo` -/
def win (M lo n : Nat) : Nat := Nat.land (Nat.shiftRight M lo) (Nat.sub (Nat.shiftLeft 1 n) 1)

end G
end
