module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
/-! # Nested split leaves with threaded sub-record slices

In `S7.Nest` record `k` names its sub-records by `(a, m)` and the check re-walks `paths` to `a` for every record, which is
quadratic in the number of records (a 9,815-record leaf: about 0.36 s and 55 MB of kernel memory per record).  The records are
numbered in BFS order of the record tree, so the sub-record ranges are consecutive: record `k`'s range starts where record
`k - 1`'s ends, and the main record's range is `0 .. m0-1`.  Records are `(P, m, cert)`.  The check walks the slices once:
`nestChkT R rest a rs k` carries `rest = paths.drop a` and the running start `a`.
* `nestChkT_spec`: every record `i` passes `subOKN` on its slice, which starts at `a_i > k + i`.
* `nestChkT_join`: chunks of records are joined (`chunkT`: a chunk with its own start offset).
* `nestSplitT_sound'`: the leaf theorem. -/
@[expose] public section
namespace BC7x
open BC4 BC5 BC6 BC6s BC7T BC7s
noncomputable section

/-- records `rs` (path, sub-record count, certificate), the first at index `k`, sub-records starting at `a`; `rest` is
`paths.drop a` -/
def nestChkT (R : Nat) (rs : List (List Step × Nat × Nat)) : List (List Step) → Nat → Nat → Bool :=
  @List.rec (List Step × Nat × Nat) (fun _ => List (List Step) → Nat → Nat → Bool) (fun _ _ _ => true)
    (fun r _ ih rest a k => (Nat.blt k a && subOKN R r.1 (rest.take r.2.1) r.2.2) && ih (rest.drop r.2.1) (a + r.2.1) (Nat.succ k)) rs

end
end BC7x

namespace S7X
open BC4 BC5 BC6 BC6s BC7s BC7x S5 S6 S7 RootSound Matrix BC7T

theorem nestChkT_cons (R : Nat) (r : List Step × Nat × Nat) (rs : List (List Step × Nat × Nat)) (rest : List (List Step))
    (a k : Nat) : nestChkT R (r :: rs) rest a k =
      ((Nat.blt k a && subOKN R r.1 (rest.take r.2.1) r.2.2) && nestChkT R rs (rest.drop r.2.1) (a + r.2.1) (Nat.succ k)) := rfl

/-- the start of record `i`'s range: `a` plus the counts of the records before it -/
def startT (rs : List (List Step × Nat × Nat)) (a i : Nat) : Nat := a + ((rs.take i).map (fun r => r.2.1)).sum

theorem nestChkT_spec (R : Nat) (paths : List (List Step)) : ∀ (rs : List (List Step × Nat × Nat)) (a k : Nat),
    nestChkT R rs (paths.drop a) a k = true → ∀ i (hi : i < rs.length), k + i < startT rs a i ∧
      subOKN R rs[i].1 ((paths.drop (startT rs a i)).take rs[i].2.1) rs[i].2.2 = true := by
  intro rs
  induction rs with
  | nil => intro a k _ i hi; simp at hi
  | cons r rs ih =>
    intro a k h i hi
    rw [nestChkT_cons, Bool.and_eq_true, Bool.and_eq_true, Nat.blt_eq, List.drop_drop] at h
    cases i with
    | zero =>
      simp only [startT, List.take_zero, List.map_nil, List.sum_nil, Nat.add_zero, List.getElem_cons_zero]
      exact ⟨h.1.1, h.1.2⟩
    | succ j =>
      have := ih (a + r.2.1) (Nat.succ k) h.2 j (by simp at hi; omega)
      simp only [List.getElem_cons_succ]
      have hs : startT (r :: rs) a (j + 1) = startT rs (a + r.2.1) j := by
        simp only [startT, List.take_succ_cons, List.map_cons, List.sum_cons]; omega
      rw [hs]
      exact ⟨by omega, this.2⟩

theorem nestChkT_append (R : Nat) : ∀ (l1 l2 : List (List Step × Nat × Nat)) (rest : List (List Step)) (a k : Nat),
    nestChkT R (l1 ++ l2) rest a k =
      (nestChkT R l1 rest a k && nestChkT R l2 (rest.drop ((l1.map (fun r => r.2.1)).sum))
        (a + (l1.map (fun r => r.2.1)).sum) (k + l1.length)) := by
  intro l1
  induction l1 with
  | nil => intro l2 rest a k; simp [nestChkT]
  | cons r l1 ih =>
    intro l2 rest a k
    rw [List.cons_append, nestChkT_cons, nestChkT_cons, ih, List.drop_drop, List.map_cons, List.sum_cons, List.length_cons,
      show a + r.2.1 + (l1.map (fun r => r.2.1)).sum = a + (r.2.1 + (l1.map (fun r => r.2.1)).sum) by omega,
      show Nat.succ k + l1.length = k + (l1.length + 1) by omega]
    simp only [Bool.and_assoc]

/-- the chunk check: records `lo .. lo+m-1`, whose ranges start at `a` -/
noncomputable def chunkT (R : Nat) (paths : List (List Step)) (recs : List (List Step × Nat × Nat)) (lo m a : Nat) : Bool :=
  nestChkT R ((recs.drop lo).take m) (paths.drop a) a lo

theorem chunkT_join (R : Nat) (paths : List (List Step)) (recs : List (List Step × Nat × Nat)) (lo m k a a' : Nat)
    (hlen : lo + m ≤ recs.length) (ha : a' = a + (((recs.drop lo).take m).map (fun r => r.2.1)).sum)
    (h1 : chunkT R paths recs lo m a = true) (h2 : chunkT R paths recs (lo + m) k a' = true) :
    chunkT R paths recs lo (m + k) a = true := by
  unfold chunkT at *
  have hl : ((recs.drop lo).take m).length = m := by simp only [List.length_take, List.length_drop]; omega
  rw [List.take_add, List.drop_drop, nestChkT_append, hl, h1, Bool.true_and, List.drop_drop, ← ha]
  exact h2

/-- **Nested split leaves, threaded slices.** Main record `leafSX R (paths.take m0)`, records from index 0 with ranges from
`m0`. -/
theorem nestSplitT_sound (R : Nat) (recs : List (List Step × Nat × Nat)) (m0 : Nat)
    (hmain : leafSX R ((recs.map Prod.fst).take m0) = true)
    (hrecs : nestChkT R recs ((recs.map Prod.fst).drop m0) m0 0 = true) : NoDecomp (leafT R) (leafN R) (leafDom6 R) := by
  have hspec := nestChkT_spec R (recs.map Prod.fst) recs m0 0 hrecs
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

/-- **Assembled** from the joined chunk checks (`chunkT ... 0 recs.length m0`). -/
theorem nestSplitT_sound' (R : Nat) (recs : List (List Step × Nat × Nat)) (m0 : Nat)
    (hmain : leafSX R ((recs.map Prod.fst).take m0) = true)
    (hall : chunkT R (recs.map Prod.fst) recs 0 recs.length m0 = true) : NoDecomp (leafT R) (leafN R) (leafDom6 R) := by
  refine nestSplitT_sound R recs m0 hmain ?_
  unfold chunkT at hall
  rwa [List.drop_zero, List.take_length] at hall

end S7X
