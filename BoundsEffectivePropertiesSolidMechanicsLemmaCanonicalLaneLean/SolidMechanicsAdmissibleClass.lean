import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure SolidMechanicsMaterial where
  elasticModulus : Type u
  poissonRatio : Type v
  phaseVolumeFraction : Prop
  inclusionShape : Prop

structure SolidMechanicsAdmittedObject where
  material : SolidMechanicsMaterial
  isotropicLinearElastic : Prop
  statisticallyIsotropic : Prop
  twoPhaseComposite : Prop
  boundsSatisfied : Prop
  conclusion : boundsSatisfied

structure SolidMechanicsAdmissibleClass where
  object : SolidMechanicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : SolidMechanicsAdmissibleClass) : Prop :=
  (A.object.conclusion) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse