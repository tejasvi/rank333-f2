module
/-! # NL.Basic: machine-word data of the native v7 leaf checker (core only, precompilable)

* `M8`: a 512-bit mask as eight `UInt64` words (word `k` = bits `64k .. 64k+63`); the kernel checker's 512-bit `Nat` masks.
* `S9`: nine 18-bit slots as `Nat` scalars (slot `z` = bits `18z .. 18z+17`); the kernel checker's packed 162-bit matrices
  (`P`, `M` of the elimination, `txc18 X`, ...).
* bit reading from a `ByteArray` (LSB first: bit `p` is bit `p % 8` of byte `p / 8`; missing bytes read as 0).

Every function here mirrors a kernel definition; `NLP/*` proves the correspondence. -/
@[expose] public section
namespace NL

/-- a 512-bit mask -/
structure M8 where
  a0 : UInt64
  a1 : UInt64
  a2 : UInt64
  a3 : UInt64
  a4 : UInt64
  a5 : UInt64
  a6 : UInt64
  a7 : UInt64
deriving Inhabited

namespace M8

@[inline] def and (x y : M8) : M8 :=
  ⟨x.a0 &&& y.a0, x.a1 &&& y.a1, x.a2 &&& y.a2, x.a3 &&& y.a3, x.a4 &&& y.a4, x.a5 &&& y.a5, x.a6 &&& y.a6, x.a7 &&& y.a7⟩
@[inline] def or (x y : M8) : M8 :=
  ⟨x.a0 ||| y.a0, x.a1 ||| y.a1, x.a2 ||| y.a2, x.a3 ||| y.a3, x.a4 ||| y.a4, x.a5 ||| y.a5, x.a6 ||| y.a6, x.a7 ||| y.a7⟩
/-- `x` and not `y` (the kernel's `x &&& perp v` when `y = nperp v`) -/
@[inline] def andn (x y : M8) : M8 :=
  ⟨x.a0 &&& ~~~y.a0, x.a1 &&& ~~~y.a1, x.a2 &&& ~~~y.a2, x.a3 &&& ~~~y.a3, x.a4 &&& ~~~y.a4, x.a5 &&& ~~~y.a5,
    x.a6 &&& ~~~y.a6, x.a7 &&& ~~~y.a7⟩
@[inline] def isZero (x : M8) : Bool :=
  (((x.a0 ||| x.a1) ||| (x.a2 ||| x.a3)) ||| ((x.a4 ||| x.a5) ||| (x.a6 ||| x.a7))) == 0

/-- word `k` (`k < 8`) -/
@[inline] def wd (x : M8) (k : Nat) : UInt64 :=
  match k with
  | 0 => x.a0 | 1 => x.a1 | 2 => x.a2 | 3 => x.a3 | 4 => x.a4 | 5 => x.a5 | 6 => x.a6 | _ => x.a7

/-- bit `i` (false for `i ≥ 512`) -/
@[inline] def bit (x : M8) (i : Nat) : Bool :=
  Nat.blt i 512 && ((x.wd (i >>> 6) >>> (i &&& 63).toUInt64) &&& 1) != 0

end M8

/-- `P2[k] = 2^k` (`k < 63`; scalars) -/
def P2 : Array Nat := #[1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216, 33554432, 67108864, 134217728, 268435456, 536870912, 1073741824, 2147483648, 4294967296, 8589934592, 17179869184, 34359738368, 68719476736, 137438953472, 274877906944, 549755813888, 1099511627776, 2199023255552, 4398046511104, 8796093022208, 17592186044416, 35184372088832, 70368744177664, 140737488355328, 281474976710656, 562949953421312, 1125899906842624, 2251799813685248, 4503599627370496, 9007199254740992, 18014398509481984, 36028797018963968, 72057594037927936, 144115188075855872, 288230376151711744, 576460752303423488, 1152921504606846976, 2305843009213693952, 4611686018427387904]
/-- `2^k` for `k < 63` (avoids the runtime's out-of-line `Nat.shiftLeft`) -/
@[inline] def pw (k : Nat) : Nat := P2.getD k 0

/-- de Bruijn constant for the index of an isolated low bit -/
def DBC : UInt64 := 0x03f79d71b4cb0a89
/-- `DBT[((2^k * DBC) mod 2^64) >>> 58] = k` -/
def DBT : Array Nat := #[0, 1, 48, 2, 57, 49, 28, 3, 61, 58, 50, 42, 38, 29, 17, 4, 62, 55, 59, 36, 53, 51, 43, 22, 45, 39,
  33, 30, 24, 18, 12, 5, 63, 47, 56, 27, 60, 41, 37, 16, 54, 35, 52, 21, 44, 32, 23, 11, 46, 26, 40, 15, 34, 20, 31, 10, 25,
  14, 19, 9, 13, 8, 7, 6]

/-- index of the lowest set bit of `w ≠ 0` -/
@[inline] def ctz (w : UInt64) : Nat := DBT.getD (((w ^^^ (w &&& (w - 1))) * DBC) >>> 58).toNat 0

namespace M8

/-- index of the lowest set bit (`x` nonzero) -/
def low (x : M8) : Nat :=
  if x.a0 != 0 then ctz x.a0 else if x.a1 != 0 then 64 + ctz x.a1 else if x.a2 != 0 then 128 + ctz x.a2 else
  if x.a3 != 0 then 192 + ctz x.a3 else if x.a4 != 0 then 256 + ctz x.a4 else if x.a5 != 0 then 320 + ctz x.a5 else
  if x.a6 != 0 then 384 + ctz x.a6 else 448 + ctz x.a7

/-- the lowest set bit cleared (the kernel's `m &&& (m - 1)`) -/
def clrLow (x : M8) : M8 :=
  if x.a0 != 0 then { x with a0 := x.a0 &&& (x.a0 - 1) } else if x.a1 != 0 then { x with a1 := x.a1 &&& (x.a1 - 1) } else
  if x.a2 != 0 then { x with a2 := x.a2 &&& (x.a2 - 1) } else if x.a3 != 0 then { x with a3 := x.a3 &&& (x.a3 - 1) } else
  if x.a4 != 0 then { x with a4 := x.a4 &&& (x.a4 - 1) } else if x.a5 != 0 then { x with a5 := x.a5 &&& (x.a5 - 1) } else
  if x.a6 != 0 then { x with a6 := x.a6 &&& (x.a6 - 1) } else { x with a7 := x.a7 &&& (x.a7 - 1) }

/-- set bits, ascending (the kernel's `bitsOf`, fuel `f`) -/
def bLoop : Nat → M8 → List Nat
  | 0, _ => []
  | f + 1, x => if x.isZero then [] else x.low :: bLoop f x.clrLow

/-- `(c, x)` (`bfirst`) or `(x, c)` pairs over the set bits `x`, ascending, then `tail` (the kernel's `pairs`, fuel `f`) -/
def pLoop (bfirst : Bool) (c : Nat) (tail : List (Nat × Nat)) : Nat → M8 → List (Nat × Nat)
  | 0, _ => tail
  | f + 1, x => if x.isZero then tail else (if bfirst then (c, x.low) else (x.low, c)) :: pLoop bfirst c tail f x.clrLow

/-- delta swap at distance `d` under the word mask `K` (positions with the swapped index bit clear) -/
@[inline] def dsw (w d K : UInt64) : UInt64 := ((w >>> d) &&& K) ||| ((w &&& K) <<< d)
/-- bit `j` of `tw w v` is bit `j ^^^ (v &&& 63)` of `w` -/
@[inline] def tw (w : UInt64) (v : Nat) : UInt64 :=
  let w := if (v &&& 1) != 0 then dsw w 1 0x5555555555555555 else w
  let w := if (v &&& 2) != 0 then dsw w 2 0x3333333333333333 else w
  let w := if (v &&& 4) != 0 then dsw w 4 0x0f0f0f0f0f0f0f0f else w
  let w := if (v &&& 8) != 0 then dsw w 8 0x00ff00ff00ff00ff else w
  let w := if (v &&& 16) != 0 then dsw w 16 0x0000ffff0000ffff else w
  if (v &&& 32) != 0 then dsw w 32 0x00000000ffffffff else w

/-- the translate `{s ^^^ v | s ∈ x}` (`v < 512`; the kernel's `trans`): word `k` of the result is word `k ^^^ (v >>> 6)`
of `x` with its bits permuted by `v &&& 63` -/
def trans (x : M8) (v : Nat) : M8 :=
  let h := Nat.land (Nat.shiftRight v 6) 7
  ⟨tw (x.wd h) v, tw (x.wd (Nat.xor h 1)) v, tw (x.wd (Nat.xor h 2)) v, tw (x.wd (Nat.xor h 3)) v, tw (x.wd (Nat.xor h 4)) v,
    tw (x.wd (Nat.xor h 5)) v, tw (x.wd (Nat.xor h 6)) v, tw (x.wd (Nat.xor h 7)) v⟩

/-- a mask from a `Nat` (bits `≥ 512` dropped); once per domain, not in hot code -/
def ofNat (x : Nat) : M8 :=
  ⟨(x % 2 ^ 64).toUInt64, ((x >>> 64) % 2 ^ 64).toUInt64, ((x >>> 128) % 2 ^ 64).toUInt64, ((x >>> 192) % 2 ^ 64).toUInt64,
    ((x >>> 256) % 2 ^ 64).toUInt64, ((x >>> 320) % 2 ^ 64).toUInt64, ((x >>> 384) % 2 ^ 64).toUInt64,
    ((x >>> 448) % 2 ^ 64).toUInt64⟩

end M8

/-- nine 18-bit slots -/
structure S9 where
  s0 : Nat
  s1 : Nat
  s2 : Nat
  s3 : Nat
  s4 : Nat
  s5 : Nat
  s6 : Nat
  s7 : Nat
  s8 : Nat
deriving Inhabited

namespace S9
@[inline] def xor (x y : S9) : S9 :=
  ⟨x.s0 ^^^ y.s0, x.s1 ^^^ y.s1, x.s2 ^^^ y.s2, x.s3 ^^^ y.s3, x.s4 ^^^ y.s4, x.s5 ^^^ y.s5, x.s6 ^^^ y.s6, x.s7 ^^^ y.s7,
    x.s8 ^^^ y.s8⟩
def zero : S9 := ⟨0, 0, 0, 0, 0, 0, 0, 0, 0⟩
end S9

/-! ## Bit reading -/

/-- byte `i` (0 past the end) -/
@[inline] def byteAt (d : ByteArray) (i : Nat) : Nat := if h : i < d.size then (d.get i h).toNat else 0

/-- `k ≤ 9` bits at bit position `p` (LSB first) -/
@[inline] def rdb (d : ByteArray) (p k : Nat) : Nat :=
  ((byteAt d (p >>> 3) ||| (byteAt d ((p >>> 3) + 1) * 256)) >>> (p &&& 7)) &&& (pw k - 1)

/-- `k ≤ 9` bits at bit position `p` of the window `[.., e)` of `d` (bits at and past `e` read as 0) -/
@[inline] def rdw (d : ByteArray) (e p k : Nat) : Nat := rdb d p (Nat.min k (e - p))

/-- `m` 9-bit values from bit `p` of the window `[.., e)`, and the position after them (the kernel's `rdList`) -/
def rdList (d : ByteArray) (e : Nat) : Nat → Nat → List Nat × Nat
  | 0, p => ([], p)
  | m + 1, p => let r := rdList d e m (p + 9); (rdw d e p 9 :: r.1, r.2)

/-- the value of a byte array, little-endian (bit `p` = bit `p % 8` of byte `p / 8`); used in specifications only -/
def natOfBytes (d : ByteArray) : Nat := d.data.toList.foldr (fun b acc => b.toNat + 256 * acc) 0

/-- 64 bits at bit position `p` -/
@[inline] def rd64 (d : ByteArray) (p : Nat) : UInt64 :=
  (rdb d p 8).toUInt64 ||| ((rdb d (p + 8) 8).toUInt64 <<< 8) ||| ((rdb d (p + 16) 8).toUInt64 <<< 16) |||
  ((rdb d (p + 24) 8).toUInt64 <<< 24) ||| ((rdb d (p + 32) 8).toUInt64 <<< 32) ||| ((rdb d (p + 40) 8).toUInt64 <<< 40) |||
  ((rdb d (p + 48) 8).toUInt64 <<< 48) ||| ((rdb d (p + 56) 8).toUInt64 <<< 56)

/-- 512 bits at bit position `p` -/
def rdM8 (d : ByteArray) (p : Nat) : M8 :=
  ⟨rd64 d p, rd64 d (p + 64), rd64 d (p + 128), rd64 d (p + 192), rd64 d (p + 256), rd64 d (p + 320), rd64 d (p + 384),
    rd64 d (p + 448)⟩

end NL
