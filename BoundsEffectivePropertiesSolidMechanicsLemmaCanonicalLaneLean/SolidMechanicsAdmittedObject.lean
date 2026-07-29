import BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.MicrostructureModel

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure SolidMechanicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SolidMechanicsAdmittedObject where
  space : SolidMechanicsSpace
  effectivePropertyBoundsDefined : Prop
  variationalPrincipleSatisfied : Prop
  microstructureModelGiven : Prop
  boundsSatisfied : Prop
  conclusion : boundsSatisfied

structure SolidMechanicsEndgameState where
  object : SolidMechanicsAdmittedObject

def SolidMechanicsWitnessClosed (O : SolidMechanicsAdmittedObject) : Prop :=
  O.boundsSatisfied

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse