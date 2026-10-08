module
/-! # R22N.Bin7: binary data in a Lean `String` (native track standard, native/infra, 2026-10-07)

A `String` must be valid UTF-8, so item data travels as **7 payload bits per ASCII character** (byte value < 128):
* payload bit `j` = bit `j % 8` of payload byte `j / 8` (little-endian bit stream);
* character `i` carries payload bits `[7i, 7i + 7)`, bit 0 = least significant; the last character is zero-padded;
* `decode s` returns `⌊7 n / 8⌋` bytes for `n` characters; record framing inside the payload gives the true lengths.
Expansion 8/7.  Encoder: `native/infra/lib/py/bin7.py` (and the same 10 lines in C++).  The decoder needs no proof: checker
conclusions mention only item keys (PROOF_OBJECT.md §7 R2).  Characters ≥ 128 cannot occur in a valid encoding; `decode` uses the low
7 bits of each UTF-8 byte regardless. -/
@[expose] public section
namespace R22N.Bin7

/-- decode the UTF-8 bytes `b` (all < 128) of an encoded string -/
def decodeBytes (b : ByteArray) : ByteArray := Id.run do
  let n := b.size
  let mut out := ByteArray.emptyWithCapacity (7 * n / 8 + 1)
  let mut acc : UInt64 := 0
  let mut nb : UInt64 := 0
  for i in [0:n] do
    acc := acc ||| (((b.get! i).toUInt64 &&& 127) <<< nb)
    nb := nb + 7
    if nb ≥ 8 then
      out := out.push acc.toUInt8
      acc := acc >>> 8
      nb := nb - 8
  return out

def decode (s : String) : ByteArray := decodeBytes s.toUTF8

end R22N.Bin7
