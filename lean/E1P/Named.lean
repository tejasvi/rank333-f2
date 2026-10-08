module
public import R22Port.U_d41d8cd98f00
public import E1P.Check
/-! # The checker's definitions in the named form

`E1P/Check.lean` writes its checker with the per-operation macros (the kernel takes no delta step per operation). The
proofs read the checker through these `rfl` lemmas, whose right sides are the definitions written with the named
operations (`E1P.rd`, `E1P.fsum`, …). -/
@[expose] public section
namespace E1PS
open E1P ECTP
local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)

theorem kidC12_named (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (code d pl MV MVR l : Nat) (ihl : Nat → Nat → Bool) (s : Bool × Nat × Nat × Nat) :
    E1P.kidC12 ih C RTb H code d pl MV MVR l ihl s = (sel (Nat.beq code 1)
    (sel (Nat.beq (rd 1 s.2.2.2) 0)
      (Nat.blt (wout s.2.1 0 l) (Nat.sub C.R (Nat.succ d)) ∧ᵇ ihl (Nat.succ l) (sk 1 s.2.2.2))
      (Nat.ble 1 (Nat.sub (Nat.add (Nat.sub C.R (Nat.succ d)) (fsum (Nat.land (Nat.add MV (one l))
          (fmask (rmask RTb (rd 12 (sk 1 s.2.2.2))))))) (rcap RTb (rd 12 (sk 1 s.2.2.2)))) ∧ᵇ
       Nat.blt (wout s.2.1 (rmask RTb (rd 12 (sk 1 s.2.2.2))) l)
         (Nat.sub (Nat.add (Nat.sub C.R (Nat.succ d)) (fsum (Nat.land (Nat.add MV (one l))
          (fmask (rmask RTb (rd 12 (sk 1 s.2.2.2))))))) (rcap RTb (rd 12 (sk 1 s.2.2.2)))) ∧ᵇ
       ihl (Nat.succ l) (sk 13 s.2.2.2)))
    (sel (Nat.beq (rd 24 s.2.2.2) 0)
      (stEq (rd 946 (sk (Nat.mul 946 (rd 8 (sk 24 s.2.2.2))) H)) (Nat.succ d) l
          (Nat.lor pl (Nat.shiftLeft l (Nat.mul 8 d))) s.2.1 ∧ᵇ ihl (Nat.succ l) (sk 32 s.2.2.2))
      (ih (Nat.succ d) l (Nat.lor pl (Nat.shiftLeft l (Nat.mul 8 d))) (Nat.add MV (one l)) (Nat.add MVR (oner l))
          s.2.1 s.2.2.1 (rd (rd 24 s.2.2.2) (sk 24 s.2.2.2)) ∧ᵇ
        ihl (Nat.succ l) (sk (Nat.add 24 (rd 24 s.2.2.2)) s.2.2.2)))) := by
  unfold E1P.kidC12; rfl

theorem kidStep_named (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (d pl MV MVR UF UFR : Nat) (ihl : Nat → Nat → Bool) (l S : Nat) :
    E1P.kidStep ih C RTb H d pl MV MVR UF UFR ihl l S = (sel (Nat.beq (rd 2 S) 0)
    (Nat.beq (fld UF l) 0 ∧ᵇ ihl (Nat.succ l) (sk 2 S))
    (sel (Nat.beq (rd 2 S) 3)
      (Nat.blt (Nat.add MVR (oner l))
          (imgR (C.GP (rd 11 (sk 2 S))) (Nat.lor pl (Nat.shiftLeft l (Nat.mul 8 d))) (Nat.succ d)) ∧ᵇ
        ihl (Nat.succ l) (sk 11 (sk 2 S)))
      (Nat.ble 1 (fld UF l) ∧ᵇ
        (sats RTb (rd 6 (sk 2 S)) (Nat.add MV (one l)) (Nat.sub UF (one l)) (Nat.sub UFR (oner l)) (sk 6 (sk 2 S))).1 ∧ᵇ
        kidC12 ih C RTb H (rd 2 S) d pl MV MVR l ihl
          (sats RTb (rd 6 (sk 2 S)) (Nat.add MV (one l)) (Nat.sub UF (one l)) (Nat.sub UFR (oner l)) (sk 6 (sk 2 S)))))) := by
  unfold E1P.kidStep; rfl

theorem cutOK_named (C : Ctx) (RTb kind cut cj rem MV UF' : Nat) (hd : Bool) (BC T UFR' RS : Nat) :
    E1P.cutOK C RTb kind cut cj rem MV UF' hd BC T UFR' RS = (sel (Nat.beq kind 0) (Nat.ble C.N cut)
    (sel (Nat.beq kind 1)
      (Nat.ble 1 (Nat.sub (Nat.add rem (fsum (Nat.land MV (fmask (rmask RTb cj))))) (rcap RTb cj)) ∧ᵇ
       Nat.blt (wout UF' (rmask RTb cj) cut) (Nat.sub (Nat.add rem (fsum (Nat.land MV (fmask (rmask RTb cj))))) (rcap RTb cj)))
      (sel (Nat.beq kind 2) (Nat.blt (wout UF' 0 cut) rem)
        (hd ∧ᵇ Nat.blt (Nat.add BC (deficit T UFR' cut)) RS)))) := by
  unfold E1P.cutOK; rfl

theorem branchT_named (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (d pos pl MV MVR UFR rem cut kind cj : Nat) (hd : Bool) (du : Nat × Nat × Nat) (fx : Bool × Nat × Nat × Nat) :
    E1P.branchT ih C RTb H d pos pl MV MVR UFR rem cut kind cj hd du fx = ((@Bool.rec (fun _ => Bool) true
    (Nat.ble (Nat.add (Nat.mul rem SC) (dot MVR du.2.1)) (Nat.add du.1 (deficit du.2.1 UFR pos))) hd) ∧ᵇ fx.1 ∧ᵇ
    cutOK C RTb kind cut cj rem MV fx.2.1 hd du.1 du.2.1 fx.2.2.1 (Nat.add (Nat.mul rem SC) (dot MVR du.2.1)) ∧ᵇ
    kids ih C RTb H (Nat.sub (sel (Nat.ble C.N cut) C.N cut) pos) d pl MV MVR fx.2.1 fx.2.2.1 pos fx.2.2.2) := by
  unfold E1P.branchT; rfl

theorem nodeStep_named (C : Ctx) (RTb H : Nat) (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool)
    (d pos pl MV MVR UF UFR S : Nat) :
    E1P.nodeStep C RTb H ih d pos pl MV MVR UF UFR S = (sel (Nat.beq (rd 2 S) 0)
    (Nat.beq (Nat.sub C.R d) 0 ∧ᵇ BC7.leafS (leafRec C.R C.VT C.DOM pl (sk 2 S)))
    (Nat.ble 1 (Nat.sub C.R d) ∧ᵇ
      sel (Nat.beq (rd 2 S) 1)
        (Nat.blt (Nat.add (rdual RTb (rd 6 (sk 2 S)) (sk 6 (sk 2 S))).1 (deficit (rdual RTb (rd 6 (sk 2 S)) (sk 6 (sk 2 S))).2.1 UFR pos))
          (Nat.add (Nat.mul (Nat.sub C.R d) SC) (dot MVR (rdual RTb (rd 6 (sk 2 S)) (sk 6 (sk 2 S))).2.1)))
        (branchT ih C RTb H d pos pl MV MVR UFR (Nat.sub C.R d) (rd 8 (sk 2 S)) (rd 2 (sk 8 (sk 2 S))) (rd 12 (sk 10 (sk 2 S)))
          (brHd (sk 2 S)) (brDu RTb (sk 2 S))
          (sel (brHd (sk 2 S))
            (fixes (rd 8 (brDu RTb (sk 2 S)).2.2) (brDu RTb (sk 2 S)).2.1
              (Nat.sub (Nat.add (brDu RTb (sk 2 S)).1 (deficit (brDu RTb (sk 2 S)).2.1 UFR pos))
                (Nat.add (Nat.mul (Nat.sub C.R d) SC) (dot MVR (brDu RTb (sk 2 S)).2.1)))
              UF UFR (sk 8 (brDu RTb (sk 2 S)).2.2))
            (true, UF, UFR, brS4 (sk 2 S)))))) := by
  unfold E1P.nodeStep; rfl

theorem glue_named (r Sc : Nat) :
    E1P.glue r Sc = (Nat.beq (rd 1 Sc) 1 ∧ᵇ Nat.beq (rd (Nat.add 778 (Nat.mul 8 (rd 5 r))) (sk 1 Sc)) r) := by
  unfold E1P.glue; rfl

theorem glue0_named (r Sc : Nat) :
    E1P.glue0 r Sc = (Nat.beq (rd 1 Sc) 0 ∧ᵇ Nat.beq (rd (Nat.add 13 (Nat.mul 8 (rd 5 r))) (sk 1 Sc)) (rd (Nat.add 13 (Nat.mul 8 (rd 5 r))) r)) := by
  unfold E1P.glue0; rfl

theorem satsM_named (RTb n MV S : Nat) :
    E1P.satsM RTb n MV S = (Nat.rec (motive := fun _ => Bool → Nat → Nat → Nat → Bool × Nat × Nat × Nat) (fun ok M MR S => (ok, M, MR, S))
    (fun _ ih ok M MR S =>
      ih (ok ∧ᵇ Nat.beq (fsum (Nat.land MV (fmask (rmask RTb (rd 12 S))))) (rcap RTb (rd 12 S)))
        (Nat.lor M (rmask RTb (rd 12 S))) (Nat.lor MR (rmaskr RTb (rd 12 S))) (sk 12 S)) n true 0 0 S) := by
  unfold E1P.satsM; rfl

theorem satsZ_named (UF UFR : Nat) (r : Bool × Nat × Nat × Nat) :
    E1P.satsZ UF UFR r = ((r.1, Nat.land UF (Nat.xor FMALL (fmask r.2.1)), Nat.land UFR (Nat.xor FMALL (fmask r.2.2.1)), r.2.2.2)) := by
  unfold E1P.satsZ; rfl

theorem rdual_named (RTb k S : Nat) :
    E1P.rdual RTb k S = (Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat × Nat × Nat) (fun BC T S => (BC, T, S))
    (fun _ ih BC T S => ih (Nat.add BC (Nat.mul (rd 36 (sk 12 S)) (rcap RTb (rd 12 S))))
      (Nat.add T (Nat.mul (rd 36 (sk 12 S)) (spread (rmask RTb (rd 12 S))))) (sk 48 S)) k 0 0 S) := by
  unfold E1P.rdual; rfl

theorem fixes_named (n T gap UF UFR S : Nat) :
    E1P.fixes n T gap UF UFR S = (Nat.rec (motive := fun _ => Bool → Nat → Nat → Nat → Bool × Nat × Nat × Nat) (fun ok UF UFR S => (ok, UF, UFR, S))
    (fun _ ih ok UF UFR S =>
      let l := rd 8 S
      let nu := rd 3 (sk 8 S)
      let u := fld UF l
      let t := fld T l
      ih (ok ∧ᵇ Nat.ble (Nat.succ SC) t ∧ᵇ Nat.ble (Nat.succ nu) u ∧ᵇ Nat.ble (Nat.succ gap) (Nat.mul (Nat.succ nu) (Nat.sub t SC)))
        (Nat.sub UF (Nat.mul (Nat.sub u nu) (one l))) (Nat.sub UFR (Nat.mul (Nat.sub u nu) (oner l))) (sk 11 S)) n true UF UFR S) := by
  unfold E1P.fixes; rfl

theorem imgR_named (gp pl m : Nat) :
    E1P.imgR gp pl m = (Nat.rec (motive := fun _ => Nat → Nat → Nat) (fun acc _ => acc)
    (fun _ ih acc pl => ih (Nat.add acc (oner (Nat.land (Nat.shiftRight gp (Nat.mul 8 (rd 8 pl))) 255))) (sk 8 pl)) m 0 pl) := by
  unfold E1P.imgR; rfl

theorem mvOf_named (d pl : Nat) :
    E1P.mvOf d pl = (Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat × Nat) (fun MV MVR _ => (MV, MVR))
    (fun _ ih MV MVR pl => ih (Nat.add MV (one (rd 8 pl))) (Nat.add MVR (oner (rd 8 pl))) (sk 8 pl)) d 0 0 pl) := by
  unfold E1P.mvOf; rfl

end E1PS
