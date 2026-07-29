import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.EffectivePropertiesPackage

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  VoigtReussBoundsClosed A.object.voigtReuss

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.voigtReussEvidence.voigtBoundDerivedClosed

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse