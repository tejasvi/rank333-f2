module
public meta import R22D.Load
/-! # NN.Load: a module-land loader for one cap-1 table (native/node)

`#nn_conf1 N "file"`: `def N : Nat` = the cap-1 conflict table (slot 511) of an L1 `c2t` file, built with infra's `R22D.Load`
helpers (`natLE`, `defNat`: the same bytes and the same Nat literal as the kernel track's loaders; exposed and compiled). -/
public meta section
open Lean Elab Command
namespace NN.Load

elab "#nn_conf1 " n:ident p:str : command => liftCoreM do
  let b ← IO.FS.readBinFile p.getString
  let tab := 511 * 64
  R22D.Load.defNat n.getId (R22D.Load.natLE b (511 * tab) (512 * tab))

end NN.Load
