import BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.ElasticityTensor

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure HomogenizationPackage {E : ElasticityTensorPackage} where
  microstructure : Type u
  representativeVolumeElement : Prop
  localProblem : Prop
  homogenizedTensor : Prop
  periodicity : Prop

structure HomogenizationEvidence {E : ElasticityTensorPackage}
    (H : HomogenizationPackage E) where
  representativeVolumeElementClosed : H.representativeVolumeElement
  localProblemClosed : H.localProblem
  homogenizedTensorClosed : H.homogenizedTensor
  periodicityClosed : H.periodicity

def HomogenizationClosed {E : ElasticityTensorPackage}
    (H : HomogenizationPackage E) : Prop :=
  H.representativeVolumeElement ∧ H.localProblem ∧
  H.homogenizedTensor ∧ H.periodicity

theorem homogenization_closed_from_evidence {E : ElasticityTensorPackage}
    (H : HomogenizationPackage E) (Ev : HomogenizationEvidence H) :
    HomogenizationClosed H := by
  exact And.intro Ev.representativeVolumeElementClosed
    (And.intro Ev.localProblemClosed
      (And.intro Ev.homogenizedTensorClosed Ev.periodicityClosed))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse