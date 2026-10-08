module
/-! # R22N.Rec: proved compiler implementations of `Bool.rec` / `List.rec` for module-land code (native/infra, 2026-10-07)

Module copy of the prototype's `NativeRec` (native/src/NativeRec.lean).  The code generator rejects raw `Bool.rec` / `List.rec`;
the `@[csimp]` lemmas below are PROVED equalities, so the compiler substitutes structurally recursive code while the kernel and
every proof see the original recursors.  Needed by the `#rttable(w)` dispatchers (`Bool.rec` trees) of the R22D data copies. -/
@[expose] public section
universe u v
namespace R22N

def boolRecImpl {motive : Bool → Sort u} (f : motive false) (t : motive true) (b : Bool) : motive b :=
  match b with | false => f | true => t

@[csimp] theorem bool_rec_eq_impl : @Bool.rec = @boolRecImpl := by
  funext motive f t b; cases b <;> rfl

def listRecImpl {α : Type v} {motive : List α → Sort u} (nil : motive [])
    (cons : (a : α) → (l : List α) → motive l → motive (a :: l)) : (l : List α) → motive l
  | [] => nil
  | a :: l => cons a l (listRecImpl nil cons l)

@[csimp] theorem list_rec_eq_impl : @List.rec = @listRecImpl := by
  funext α motive nil cons l
  induction l with
  | nil => rfl
  | cons a l ih => simp only [listRecImpl]; rw [← ih]

end R22N
