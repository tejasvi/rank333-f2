module
public import R22Port.U_d41d8cd98f00
public import S7.SplitAsm
/-! # Nested split leaves (BranchCheck v7x)

A flat split leaf (`leafSplit_sound'`) cuts every small child of a large node into its own sub-record; a node with many
small children then gives thousands of tiny sub-records.  Here every record (the main record and each sub-record) holds a
bounded number of nodes and may have external subtrees of its own, each the subject of a later record.

Records `recs[k] = (P, a, m, cert)`: the subtree at path `P`, checked by `checkSX` with the external paths
`paths[a .. a+m-1]` (`paths = recs.map (·.1)`), where `k < a`.  The main record is `leafSX R (paths.take m0)`.
* `subOKN_sound`: an accepted record refutes its path, given that its external paths are refuted.
* `nestChk`: the record checks, chunked by `decide` and joined (`nestChk_join`).
* `leafSX_sound`: an accepted main record whose external paths are refuted refutes the leaf.
* `nestSplit_sound`: downward induction over the records. -/
@[expose] public section
namespace BC7x
open BC4 BC5 BC6 BC6s BC7T BC7s
noncomputable section

/-- a nested sub-record: the subtree at path `P` of the leaf with header `R`, certificate `cert`, with external subtrees at
the paths `Q` (DFS order) -/
def subOKN (R : Nat) (P : List Step) (Q : List (List Step)) (cert : Nat) : Bool :=
  let h := hdr R
  let st := walk h.2.1 (mkSSP h.2.1 h.1) h.2.2.2.1 (Nat.pred (Nat.shiftLeft 1 h.1), [], []) P
  Nat.ble h.1 31 && (checkSX 64 h.2.1 (mkSSP h.2.1 h.1) st.1 h.2.2.2.1 st.2.1 st.2.2 h.2.2.1 P.reverse Q cert).1

/-- the records `rs`, the first of them at index `k`: each refers only to later records -/
def nestChk (R : Nat) (paths : List (List Step)) (rs : List (List Step × Nat × Nat × Nat)) (k : Nat) : Bool :=
  @List.rec (List Step × Nat × Nat × Nat) (fun _ => Nat → Bool) (fun _ => true)
    (fun r _ ih k => (Nat.blt k r.2.1 && subOKN R r.1 ((paths.drop r.2.1).take r.2.2.1) r.2.2.2) && ih (Nat.succ k)) rs k

end
end BC7x

namespace S7X
open BC4 BC5 BC6 BC6s BC7s BC7x S5 S6 S7 RootSound Matrix BC7T

/-- the refutation statement at the end of path `P` in the leaf with header `R` (the conclusion of `subOK_sound`) -/
def RefP (R : Nat) (P : List Step) : Prop :=
  ∀ b c, Inv (hdr R).2.1 (hdr R).1 (hdr R).2.2.1 b c
      (walk (hdr R).2.1 (mkSSP (hdr R).2.1 (hdr R).1) (hdr R).2.2.2.1 (Nat.pred (Nat.shiftLeft 1 (hdr R).1), [], []) P).1
      (walk (hdr R).2.1 (mkSSP (hdr R).2.1 (hdr R).1) (hdr R).2.2.2.1 (Nat.pred (Nat.shiftLeft 1 (hdr R).1), [], []) P).2.1
      (walk (hdr R).2.1 (mkSSP (hdr R).2.1 (hdr R).1) (hdr R).2.2.2.1 (Nat.pred (Nat.shiftLeft 1 (hdr R).1), [], []) P).2.2 →
      LGok (hdr R).1 (hdr R).2.2.2.1 b c → False

/-- **Nested records.** -/
theorem subOKN_sound (R : Nat) (P : List Step) (Q : List (List Step)) (cert : Nat) (h : subOKN R P Q cert = true)
    (HQ : ∀ P' ∈ Q, RefP R P') : RefP R P := by
  unfold subOKN at h
  rw [Bool.and_eq_true, Nat.ble_eq] at h
  intro b c hinv hlg
  exact checkSX_sound (hdr R).2.1 (hdr R).1 (hdr R).2.2.1 (hdr R).2.2.2.1 h.1 _ Q HQ 64 _ _ _ P.reverse Q cert
    (fun P' hP' => hP') (by rw [List.reverse_reverse]) h.2 b c hinv hlg

theorem nestChk_cons (R : Nat) (paths : List (List Step)) (r : List Step × Nat × Nat × Nat)
    (rs : List (List Step × Nat × Nat × Nat)) (k : Nat) :
    nestChk R paths (r :: rs) k =
      ((Nat.blt k r.2.1 && subOKN R r.1 ((paths.drop r.2.1).take r.2.2.1) r.2.2.2) && nestChk R paths rs (Nat.succ k)) :=
  rfl

theorem nestChk_append (R : Nat) (paths : List (List Step)) : ∀ (l1 l2 : List (List Step × Nat × Nat × Nat)) (k : Nat),
    nestChk R paths (l1 ++ l2) k = (nestChk R paths l1 k && nestChk R paths l2 (k + l1.length)) := by
  intro l1
  induction l1 with
  | nil => intro l2 k; simp [nestChk]
  | cons r l1 ih =>
    intro l2 k
    rw [List.cons_append, nestChk_cons, nestChk_cons, ih, List.length_cons,
      show Nat.succ k + l1.length = k + (l1.length + 1) by omega]
    simp only [Bool.and_assoc]

/-- the chunk check: records `a .. a+m-1` -/
noncomputable def nestChkR (R : Nat) (paths : List (List Step)) (recs : List (List Step × Nat × Nat × Nat)) (a m : Nat) : Bool :=
  nestChk R paths ((recs.drop a).take m) a

theorem nestChk_join (R : Nat) (paths : List (List Step)) (recs : List (List Step × Nat × Nat × Nat)) (a m k : Nat)
    (hlen : a + m ≤ recs.length) (h1 : nestChkR R paths recs a m = true) (h2 : nestChkR R paths recs (a + m) k = true) :
    nestChkR R paths recs a (m + k) = true := by
  unfold nestChkR at *
  have hl : ((recs.drop a).take m).length = m := by simp only [List.length_take, List.length_drop]; omega
  rw [List.take_add, List.drop_drop, nestChk_append, hl, h1, Bool.true_and]
  exact h2

theorem nestChk_spec (R : Nat) (paths : List (List Step)) : ∀ (rs : List (List Step × Nat × Nat × Nat)) (k : Nat),
    nestChk R paths rs k = true → ∀ i (hi : i < rs.length), k + i < rs[i].2.1 ∧
      subOKN R rs[i].1 ((paths.drop rs[i].2.1).take rs[i].2.2.1) rs[i].2.2.2 = true := by
  intro rs
  induction rs with
  | nil => intro k _ i hi; simp at hi
  | cons r rs ih =>
    intro k h i hi
    rw [nestChk_cons, Bool.and_eq_true, Bool.and_eq_true, Nat.blt_eq] at h
    cases i with
    | zero => exact ⟨by simpa using h.1.1, h.1.2⟩
    | succ j =>
      have := ih (Nat.succ k) h.2 j (by simp at hi; omega)
      simp only [List.getElem_cons_succ]
      exact ⟨by omega, this.2⟩

theorem mem_slice {α : Type} (l : List α) (a m : Nat) (x : α) (h : x ∈ (l.drop a).take m) :
    ∃ i, i < m ∧ ∃ (hi : a + i < l.length), x = l[a + i] := by
  obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem h
  simp only [List.length_take, List.length_drop] at hi
  refine ⟨i, by omega, by omega, ?_⟩
  simp [List.getElem_take, List.getElem_drop]

/-- **Main records, general form.** -/
theorem leafSX_sound (R : Nat) (paths : List (List Step)) (hmain : leafSX R paths = true)
    (H : ∀ P ∈ paths, RefP R P) : NoDecomp (leafT R) (leafN R) (leafDom6 R) := by
  rintro ⟨b, c, hbc, hd⟩
  rw [leafSX_eq] at hmain
  set R1 := sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R with hR1
  set dm := Nat.beq (rd 1 R1) 0 with hdm
  set lg := Nat.beq (rd 1 (sk 1 R1)) 1 && dm with hlg
  set RS := rkSum (leafT R) (leafN R) with hRS
  have epred : Nat.pred (Nat.shiftLeft 1 (leafN R)) = 2 ^ leafN R - 1 := by
    show 1 <<< leafN R - 1 = _; rw [Nat.one_shiftLeft]
  rw [epred] at hmain
  rw [Bool.and_eq_true, Nat.ble_eq, Bool.or_eq_true] at hmain
  obtain ⟨hn, hmain⟩ := hmain
  have hfull : lg = true → leafDom6 R = ALLNZ := by
    intro hl
    have hd' : dm = true := by rw [hlg, Bool.and_eq_true] at hl; exact hl.2
    show cond dm ALLNZ _ = ALLNZ
    rw [hd', cond_true]
  have hdfull : lg = true → ∀ X, X < 512 → ALLNZ.testBit X = true →
      TX (toM3 X) = ∑ t ∈ (Finset.range (leafN R)).filter (fun t => par (aT (leafT R) t &&& X) = true),
        vecMulVec (nv (b t)) (nv (c t)) := by
    intro hl X hX hX'
    exact hd X hX (by rw [hfull hl]; exact hX')
  rcases hmain with h | h
  · rw [Bool.and_eq_true, Nat.blt_eq] at h
    obtain ⟨hl, hlt⟩ := h
    have := (lg_root (leafT R) (leafN R) b c hbc (hdfull hl)).1
    omega
  · have hlgok : LGok (leafN R) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0) b c := by
      cases hl : lg
      · rw [cond_false]; exact lgok_zero _ b c hbc
      · rw [cond_true]
        exact (lg_root (leafT R) (leafN R) b c hbc (hdfull hl)).2
    have hH : ∀ P ∈ paths, ∀ b c, Inv (leafT R) (leafN R) (leafDom6 R) b c
        (walk (leafT R) (mkSSP (leafT R) (leafN R)) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0)
          (2 ^ leafN R - 1, [], []) P).1
        (walk (leafT R) (mkSSP (leafT R) (leafN R)) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0)
          (2 ^ leafN R - 1, [], []) P).2.1
        (walk (leafT R) (mkSSP (leafT R) (leafN R)) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0)
          (2 ^ leafN R - 1, [], []) P).2.2 →
        LGok (leafN R) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0) b c → False := by
      intro P hP b' c' hinv' hlg'
      have hs := H P hP
      unfold RefP at hs
      have e : Nat.pred (Nat.shiftLeft 1 (hdr R).1) = 2 ^ leafN R - 1 := epred
      rw [e] at hs
      exact hs b' c' hinv' hlg'
    exact checkSX_sound (leafT R) (leafN R) (leafDom6 R) _ hn (2 ^ leafN R - 1, [], []) paths hH 64 _ [] []
      [] _ _ (fun P hP => hP) rfl h b c (S5.inv_root _ _ _ b c hbc hd) hlgok

/-- **Nested split leaves.** An accepted main record and accepted records, each referring only to later ones. -/
theorem nestSplit_sound (R : Nat) (recs : List (List Step × Nat × Nat × Nat)) (m0 : Nat)
    (hmain : leafSX R ((recs.map Prod.fst).take m0) = true)
    (hrecs : nestChk R (recs.map Prod.fst) recs 0 = true) : NoDecomp (leafT R) (leafN R) (leafDom6 R) := by
  have hspec := nestChk_spec R (recs.map Prod.fst) recs 0 hrecs
  have href : ∀ j, ∀ k (hk : k < recs.length), recs.length - k ≤ j → RefP R recs[k].1 := by
    intro j
    induction j with
    | zero => intro k hk h; omega
    | succ j ih =>
      intro k hk hj
      obtain ⟨hlt, hok⟩ := hspec k hk
      apply subOKN_sound R _ _ _ hok
      intro P' hP'
      obtain ⟨i, _, hi, rfl⟩ := mem_slice _ _ _ _ hP'
      simp only [List.length_map] at hi
      simp only [List.getElem_map]
      exact ih _ hi (by omega)
  apply leafSX_sound R _ hmain
  intro P hP
  obtain ⟨i, _, hi, rfl⟩ := mem_slice _ 0 m0 P (by simpa using hP)
  simp only [List.length_map, Nat.zero_add] at hi ⊢
  simp only [List.getElem_map]
  exact href _ i hi le_rfl

/-- **Nested split leaf, assembled** from the joined chunk checks. -/
theorem nestSplit_sound' (R : Nat) (recs : List (List Step × Nat × Nat × Nat)) (m0 : Nat)
    (hmain : leafSX R ((recs.map Prod.fst).take m0) = true)
    (hall : nestChkR R (recs.map Prod.fst) recs 0 recs.length = true) : NoDecomp (leafT R) (leafN R) (leafDom6 R) := by
  refine nestSplit_sound R recs m0 hmain ?_
  unfold nestChkR at hall
  rwa [List.drop_zero, List.take_length] at hall

end S7X
