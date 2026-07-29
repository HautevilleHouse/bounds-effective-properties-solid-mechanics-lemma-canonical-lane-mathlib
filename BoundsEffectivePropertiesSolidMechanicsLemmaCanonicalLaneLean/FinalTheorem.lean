import canonicalLaneMathlib.AdmissibleClass
import BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.BridgeLemmas
import BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

def ConstrainedBoundsEffectivePropertiesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bounds_effective_properties_endgame (A : AdmissibleClass) :
    ConstrainedBoundsEffectivePropertiesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse
