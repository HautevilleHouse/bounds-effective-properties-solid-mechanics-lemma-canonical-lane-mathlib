import Mathlib.Analysis.Calculus.MeanInequalities

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure StrengthDomain where
  yieldSurface : Type u
  yieldFunction : yieldSurface → ℝ
  convexity : Prop
  closedness : Prop

structure StrengthDomainEvidence (S : StrengthDomain) where
  convexityClosed : S.convexity
  closednessClosed : S.closedness

def StrengthDomainClosed (S : StrengthDomain) : Prop :=
  S.convexity ∧ S.closedness

theorem strength_domain_closed_from_evidence (S : StrengthDomain) (E : StrengthDomainEvidence S) :
    StrengthDomainClosed S := by
  exact And.intro E.convexityClosed E.closednessClosed

end HautevilleHouse
end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean