import BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.EnergyBounds

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure LemmaStatementsPackage {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    {EP : EffectivePropertiesPackage VR} {EB : EnergyBoundsPackage EP} where
  hashinShtrikmanLemma : Prop
  voigtReussLemma : Prop
  energyMinimizationLemma : Prop
  effectiveBoundsLemma : Prop

structure LemmaStatementsEvidence {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    {EP : EffectivePropertiesPackage VR} {EB : EnergyBoundsPackage EP}
    (L : LemmaStatementsPackage EB) where
  hashinShtrikmanLemmaClosed : L.hashinShtrikmanLemma
  voigtReussLemmaClosed : L.voigtReussLemma
  energyMinimizationLemmaClosed : L.energyMinimizationLemma
  effectiveBoundsLemmaClosed : L.effectiveBoundsLemma

def LemmaStatementsClosed {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    {EP : EffectivePropertiesPackage VR} {EB : EnergyBoundsPackage EP}
    (L : LemmaStatementsPackage EB) : Prop :=
  L.hashinShtrikmanLemma ∧ L.voigtReussLemma ∧
  L.energyMinimizationLemma ∧ L.effectiveBoundsLemma

theorem lemma_statements_closed_from_evidence {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} {V : VariationalFormulationPackage H}
    {HS : HashinShtrikmanBoundsPackage V} {VR : VoigtReussBoundsPackage HS}
    {EP : EffectivePropertiesPackage VR} {EB : EnergyBoundsPackage EP}
    (L : LemmaStatementsPackage EB) (Ev : LemmaStatementsEvidence L) :
    LemmaStatementsClosed L := by
  exact And.intro Ev.hashinShtrikmanLemmaClosed
    (And.intro Ev.voigtReussLemmaClosed
      (And.intro Ev.energyMinimizationLemmaClosed Ev.effectiveBoundsLemmaClosed))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse