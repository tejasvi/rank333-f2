module
public import R22Port.U_d41d8cd98f00
public import R6.Funs
/-! # v6 ⇒ v6s refinement: the rank-1 claim

`rank1` with its six outer `let`s (`P`, `r`, `lm`, `rm`, `y0`, `g0`) turned into parameters (`rank1b`, copied from each
checker), so the case split works on variables. -/
@[expose] public section
namespace BC6
open BC4 BC6
local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)
noncomputable section
/-- the body of `BC6.rank1` after its outer `let`s -/
def rank1b (X b0 c0 P r lm rm y0 g0 : Nat) : R1 :=
  sel (bit lm b0)
    (sel (bit rm c0)
      (sel (par (Nat.land c0 y0))
        ⟨Nat.sub r 1, Nat.land lm (perp g0), Nat.land rm (perp y0), P, true⟩
        ⟨r, lm, rm, corrP P g0 y0, true⟩)
      (let k := firstPar (kb18 X) c0
       let x0 := Nat.xor y0 (sel (par (Nat.land c0 y0)) k 0)
       ⟨r, lm, Nat.lor (Nat.land rm (perp x0)) (trans (Nat.land rm (nperp x0)) c0), corrP P g0 x0,
        par (Nat.land k c0) ∧ᵇ bit (kerm X) k⟩))
    (sel (bit rm c0)
      (let l := firstPar (lkb18 X) b0
       let z := Nat.xor g0 (sel (par (Nat.land g0 b0)) l 0)
       ⟨r, Nat.lor (Nat.land lm (perp g0)) (trans (Nat.land lm (nperp g0)) b0), rm, corrP P z y0,
        par (Nat.land l b0) ∧ᵇ bit (lkerm X) l⟩)
      (let k := firstPar (kb18 X) c0
       let l := firstPar (lkb18 X) b0
       let b1 := Nat.xor y0 (sel (par (Nat.land g0 b0)) 0 k)
       ⟨Nat.succ r, Nat.lor lm (trans lm b0), Nat.lor rm (trans rm c0), corrP (corrP P l b1) g0 k,
        par (Nat.land k c0) ∧ᵇ bit (kerm X) k ∧ᵇ par (Nat.land l b0) ∧ᵇ bit (lkerm X) l⟩))
end
end BC6

namespace BC6s
open BC4
noncomputable section
/-- the body of `BC6s.rank1` after its outer `let`s -/
def rank1b (X b0 c0 P r lm rm y0 g0 : Nat) : R1 :=
  cond (BC5.bit lm b0)
    (cond (BC5.bit rm c0)
      (cond (BC5.par (Nat.land c0 y0))
        ⟨Nat.sub r 1, Nat.land lm (BC5.perp g0), Nat.land rm (BC5.perp y0), P, true⟩
        ⟨r, lm, rm, corrP P g0 y0, true⟩)
      (let k := firstPar (kb18 X) c0
       let x0 := Nat.xor y0 (cond (BC5.par (Nat.land c0 y0)) k 0)
       ⟨r, lm, Nat.lor (Nat.land rm (BC5.perp x0)) (trans (Nat.land rm (BC5.nperp x0)) c0), corrP P g0 x0,
        BC5.par (Nat.land k c0) && BC5.bit (kerm X) k⟩))
    (cond (BC5.bit rm c0)
      (let l := firstPar (lkb18 X) b0
       let z := Nat.xor g0 (cond (BC5.par (Nat.land g0 b0)) l 0)
       ⟨r, Nat.lor (Nat.land lm (BC5.perp g0)) (trans (Nat.land lm (BC5.nperp g0)) b0), rm, corrP P z y0,
        BC5.par (Nat.land l b0) && BC5.bit (lkerm X) l⟩)
      (let k := firstPar (kb18 X) c0
       let l := firstPar (lkb18 X) b0
       let b1 := Nat.xor y0 (cond (BC5.par (Nat.land g0 b0)) 0 k)
       ⟨Nat.succ r, Nat.lor lm (trans lm b0), Nat.lor rm (trans rm c0), corrP (corrP P l b1) g0 k,
        BC5.par (Nat.land k c0) && BC5.bit (kerm X) k && BC5.par (Nat.land l b0) && BC5.bit (lkerm X) l⟩))
end
end BC6s

namespace R6
open BC4

/-- v6's rank-1 result as v6s's -/
def r1s (q : BC6.R1) : BC6s.R1 := ⟨q.rk, q.lm, q.rm, q.P, q.ok⟩

theorem rank1_6 (X b0 c0 : Nat) : BC6.rank1 X b0 c0 = BC6.rank1b X b0 c0 (BC6.rootP X) (BC6.rootRk X) (BC6.rlm X)
    (BC6.rrm X) (BC6.xof (BC6.rootP X) b0) (BC6.gof (BC6.rootP X) c0) := rfl
theorem rank1_5 (X b0 c0 : Nat) : BC6s.rank1 X b0 c0 = BC6s.rank1b X b0 c0 (BC6s.rootP X) (BC6s.rootRk X) (BC5.rlm X)
    (BC5.rrm X) (BC5.xof (BC6s.rootP X) b0) (BC5.gof (BC6s.rootP X) c0) := rfl

theorem rank1b_eq (X b0 c0 P r lm rm y0 g0 : Nat) :
    r1s (BC6.rank1b X b0 c0 P r lm rm y0 g0) = BC6s.rank1b X b0 c0 P r lm rm y0 g0 := by
  unfold BC6.rank1b BC6s.rank1b
  simp only [bit_eq, par_eq, perp_eq, nperp_eq, firstPar_eq, kb18_eq, lkb18_eq, corrP_eq, trans_eq, kerm_eq, lkerm_eq,
    sel_eq, cond_and]
  cases BC5.bit lm b0 <;> cases BC5.bit rm c0 <;> cases BC5.par (Nat.land c0 y0) <;>
    simp only [condT, condF, r1s, Bool.and_assoc]

theorem rank1_eq (X b0 c0 : Nat) : r1s (BC6.rank1 X b0 c0) = BC6s.rank1 X b0 c0 := by
  rw [rank1_6, rank1_5, rank1b_eq, rootP_eq, rootRk_eq, rlm_eq, rrm_eq, xof_eq, gof_eq]

end R6
