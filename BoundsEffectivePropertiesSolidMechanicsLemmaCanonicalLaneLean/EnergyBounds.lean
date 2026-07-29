import BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.EffectiveProperties

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure EnergyBoundsPackage {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    {EP : EffectivePropertiesPackage VR} where
  strainEnergy : Prop
  complementaryEnergy : Prop
  boundInequality : Prop
  equalityCondition : Prop

structure EnergyBoundsEvidence {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    {EP : EffectivePropertiesPackage VR} (EB : EnergyBoundsPackage EP) where
  strainEnergyClosed : EB.strainEnergy
  complementaryEnergyClosed : EB.complementaryEnergy
  boundInequalityClosed : EB.boundInequality
  equalityConditionClosed : EB.equalityCondition

def EnergyBoundsClosed {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    {EP : EffectivePropertiesPackage VR} (EB : EnergyBoundsPackage EP) : Prop :=
  EB.strainEnergy ∧ EB.complementaryEnergy ∧
  EB.boundInequality ∧ EB.equalityCondition

theorem energy_bounds_closed_from_evidence {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    {EP : EffectivePropertiesPackage VR} (EB : EnergyBoundsPackage EP)
    (Ev : EnergyBoundsEvidence EB) : EnergyBoundsClosed EB := by
  exact And.intro Ev.strainEnergyClosed
    (And.intro Ev.complementaryEnergyClosed
      (And.intro Ev.boundInequalityClosed Ev.equalityConditionClosed))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse