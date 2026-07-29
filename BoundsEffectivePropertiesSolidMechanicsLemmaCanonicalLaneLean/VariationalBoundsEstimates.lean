import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure VariationalBoundsEstimatesPackage where
  strainEnergy : Type u
  trialStrainFields : Type v
  complementaryEnergy : Type w
  trialStressFields : Type x
  minimumPotentialEnergyPrinciple : Prop
  minimumComplementaryEnergyPrinciple : Prop
  hashinShtrikmanVariationalPrinciple : Prop
  polarizationField : Type y

structure VariationalBoundsEstimatesEvidence (P : VariationalBoundsEstimatesPackage) where
  minimumPotentialEnergyPrincipleClosed : P.minimumPotentialEnergyPrinciple
  minimumComplementaryEnergyPrincipleClosed : P.minimumComplementaryEnergyPrinciple
  hashinShtrikmanVariationalPrincipleClosed : P.hashinShtrikmanVariationalPrinciple

def VariationalBoundsEstimatesClosed (P : VariationalBoundsEstimatesPackage) : Prop :=
  P.minimumPotentialEnergyPrinciple ∧
  P.minimumComplementaryEnergyPrinciple ∧
  P.hashinShtrikmanVariationalPrinciple

theorem variational_bounds_estimates_closed_from_evidence
    (P : VariationalBoundsEstimatesPackage)
    (E : VariationalBoundsEstimatesEvidence P) :
    VariationalBoundsEstimatesClosed P := by
  exact And.intro E.minimumPotentialEnergyPrincipleClosed
    (And.intro E.minimumComplementaryEnergyPrincipleClosed
      E.hashinShtrikmanVariationalPrincipleClosed)

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse
