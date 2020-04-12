import tactic
variable X : Type

/-
In this level you continue working with sets, while learning some useful
proof techniques. 
This level asks you to prove that the empty set is included in any set.
To do that, we'll follow the advice of P. Halmos in "Naive Set Theory".
That is, to prove something is true about the empty set, prove that it cannot be false.

When starting this level, the goal is:
$$\forall (A : set X), \empty \subseteq A$$
To make progress, you'll need to instantiate a specific set $A$ 
with the "intro" tactic.

Remember now the definition of set inclusion. The goal 
$$ \empty \subseteq A$$
is the same as 
$$ \forall x \in \empty, x \in A.$$
Thus, "change ∀ x ∈ ∅, x ∈ A," on the line after "intro A,".
Time to switch to the meat of the proof. Use the 
"\texttt{by_contradiction}" tactic; 
type "\texttt{by_contradiction hn,}" to introduce the contradiction 
hypothesis "hn" and changes the goal to "false".
 
Next, it is helpful to further change this into a statement that there exists 
a member of the empty set which does not belong to $A$. 
This can be accomplished by
"push_neg at hn,". You sure can bring this home from here by using "cases".

-/

local attribute [instance] classical.prop_decidable --hide
/- Lemma
The empty set is included in any set $A$.... 
-/
theorem empty_set_included : ∀ A : set X, ∅ ⊆ A :=
begin
    intro A, 
    change ∀ x ∈ ∅, x ∈ A,
    by_contradiction hn,
    push_neg at hn,
    cases hn with x h1,
    cases h1 with hf ha,
    exact hf, done
end
