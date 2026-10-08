module
public import NN.Dead
/-! # NN.Stat: the static data of an item check, from Nat constants (core only)

`mkIStat c2tN conf1N hN sufN vec rk3 gl`: L1's tables (`buildStatics`, checked by `staticsOK`), the kinds tables (`buildK`: label
codes `vec`, odd-pairing masks and the code → label map built from them), the X tier's cap-2 rows (`XT.prepC2`) and the order's
hyperplane masks (`npWOf vec`, the W8 form of `npOf`).  `NNP.Stat` turns facts about the constants into the premises of the item
theorems. -/
@[expose] public section
namespace NN

/-- the label codes of an order from its packed table (`R3RT.vecL`, `RT.O321.vecL`: field `l` of 9 bits) -/
def vecOf (V : Nat) : Array Nat := (Array.range 511).map fun l => (V >>> (9 * l)) % 512

/-- `3 rk X` from RootSound's packed rank table `RKT` (`rkOf X = (RKT >>> 2X) % 4`) -/
def rk3Of (RKT : Nat) : ByteArray := ByteArray.mk ((Array.range 512).map fun X => (3 * ((RKT >>> (2 * X)) % 4)).toUInt8)

/-- the invertible 3×3 matrices from C3's bit table `GLM` (`C3.isGL P = GLM.testBit P`) -/
def glOf (GLM : Nat) : ByteArray := ByteArray.mk ((Array.range 512).map fun P => if GLM.testBit P then (1 : UInt8) else 0)

/-- case (II): window `[14, 22]`, rank-1 labels `0..48` (`--rord 123`), TYPE records on -/
def cfgII : Cfg := ⟨14, 22, 0, 49, true⟩
/-- case (I): window `[0, 12]`, rank-1 labels `462..510` (`--rord 321`) -/
def cfgI : Cfg := ⟨0, 12, 462, 511, false⟩
/-- case (I13): window `[13, 13]` -/
def cfgI13 : Cfg := ⟨13, 13, 462, 511, false⟩

/-- the X tier's hyperplane masks of a label-code table -/
def npWOf (vec : Array Nat) : Array XT.W8 := (Array.range 512).map fun X => XT.W8.ofLimbs (npOf vec X) 0

/-- the static data of an item check -/
def mkIStat (c2tN : Array Nat) (conf1N : Nat) (hN sufN : Array Nat) (vec : Array Nat) (rk3 gl : ByteArray) : IStat :=
  let st := buildStatics c2tN conf1N hN sufN rk3
  { st, ks := buildK vec rk3 gl, c2W := XT.prepC2 st.c2t, npW := npWOf vec }

end NN
