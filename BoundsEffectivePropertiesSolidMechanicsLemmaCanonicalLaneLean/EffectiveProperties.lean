import BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.VoigtReussBounds

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure EffectivePropertiesPackage {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS} where
  effectiveStiffness : Prop
  effectiveCompliance : Prop
  isotropyCondition : Prop
  boundsSatisfied : Prop

structure EffectivePropertiesEvidence {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    (EP : EffectivePropertiesPackage VR) where
  effectiveStiffnessClosed : EP.effectiveStiffness
  effectiveComplianceClosed : EP.effectiveCompliance
  isotropyConditionClosed : EP.isotropyCondition
  boundsSatisfiedClosed : EP.boundsSatisfied

def EffectivePropertiesClosed {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    (EP : EffectivePropertiesPackage VR) : Prop :=
  EP.effectiveStiffness ∧ EP.effectiveCompliance ∧
  EP.isotropyCondition ∧ EP.boundsSatisfied

theorem effective_properties_closed_from_evidence {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    (EP : EffectivePropertiesPackage VR) (Ev : EffectivePropertiesEvidence EP) :
    EffectivePropertiesClosed EP := by
  exact And.intro Ev.effectiveStiffnessClosed
    (And.intro Ev.effectiveComplianceClosed
      (And.intro Ev.isotropyConditionClosed Ev.boundsSatisfiedClosed))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse