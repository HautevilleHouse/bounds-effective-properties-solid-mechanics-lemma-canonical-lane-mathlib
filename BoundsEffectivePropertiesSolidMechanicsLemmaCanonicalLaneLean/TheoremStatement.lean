import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure EffectiveBoundsSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  linearElasticityTensor : Type u
  LameConstants : Type v

structure EffectiveBoundsAdmittedObject where
  space : EffectiveBoundsSpace
  symmetricStiffness : Prop
  positiveDefiniteTensor : Prop
  voigtBound : Prop
  reussBound : Prop
  conclusion : symmetricStiffness ∧ positiveDefiniteTensor ∧ voigtBound ∧ reussBound

def EffectiveBoundsWitnessClosed (O : EffectiveBoundsAdmittedObject) : Prop :=
  O.symmetricStiffness ∧ O.positiveDefiniteTensor ∧ O.voigtBound ∧ O.reussBound

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse