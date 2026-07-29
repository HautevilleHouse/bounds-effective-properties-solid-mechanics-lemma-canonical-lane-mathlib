import HautevilleHouse.BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.VariationalPrinciples

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure HSbound {V : VariationalPrinciples} where
  upperBound : Prop
  lowerBound : Prop
  optimalityCondition : Prop

structure HSboundEvidence {V : VariationalPrinciples} (H : HSbound V) where
  upperBoundClosed : H.upperBound
  lowerBoundClosed : H.lowerBound
  optimalityConditionClosed : H.optimalityCondition

def HSboundClosed {V : VariationalPrinciples} (H : HSbound V) : Prop :=
  H.upperBound ∧ H.lowerBound ∧ H.optimalityCondition

theorem hs_bound_closed_from_evidence
    {V : VariationalPrinciples} (H : HSbound V) (E : HSboundEvidence H) :
    HSboundClosed H := by
  exact And.intro E.upperBoundClosed (And.intro E.lowerBoundClosed E.optimalityConditionClosed)

end HautevilleHouse
end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean