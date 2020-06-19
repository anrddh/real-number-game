import game.sets.sets_level04 -- hide

namespace xena -- hide

open_locale classical -- hide

variable X : Type --hide

/-
# Chapter 1 : Sets

## Level 5
-/


/-
If `h : ∀ (x : X), x ∈ A → x ∈ B` then `h` is a function which takes
an element of x as input, and a proof that `x ∈ A`, and outputs a proof
that `x ∈ B`. If you want to run this function `h` on some term `x : X`
then any of the following work:

```
have h2 := h x,
replace h := h x,
specialize h x
```

-/

/- Lemma
If $A$ and $B$ are sets of any type $X$, then
$$ A \subseteq B \iff A \cap B = A.$$
-/

theorem subset_iff_intersection_eq (A : set X) (B : set X) : A ⊆ B ↔ A ∩ B = A := 
begin
  rw subset_iff,
  rw eq_iff,
  split,
  { intros h x,
    specialize h x,
    rw mem_inter_iff,
    tauto!
  },
  { intros h x hx,
    specialize h x,
    rw mem_inter_iff at h,
    tauto!,
  }
end

-- begin hide
-- theorem subset_iff_intersection_eq' (A : set X) (B : set X) : A ⊆ B ↔ A ∩ B = A := 
-- begin
--   rw subset_iff,
--   rw eq_iff,
--   apply forall_congr, -- clever trick
--   intro x,
--   rw mem_inter_iff, -- no longer under a binder
--   tauto!
-- end
-- end hide

end xena -- hide