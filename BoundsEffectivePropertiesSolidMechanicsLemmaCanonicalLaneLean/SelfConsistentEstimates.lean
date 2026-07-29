import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure SelfConsistentEstimatesPackage where
  inclusionShape : String
  matrixBehavior : Prop
  selfConsistentEquationShear : Prop
  selfConsistentEquationBulk : Prop
  differentialScheme : Prop
  moriTanakaEstimate : Prop

structure SelfConsistentEstimatesEvidence (P : SelfConsistentEstimatesPackage) where
  matrixBehaviorClosed : P.matrixBehavior
  selfConsistentEquationShearClosed : P.selfConsistentEquationShear
  selfConsistentEquationBulkClosed : P.selfConsistentEquationBulk
  differentialSchemeClosed : P.differentialScheme
  moriTanakaEstimateClosed : P.moriTanakaEstimate

def SelfConsistentEstimatesClosed (P : SelfConsistentEstimatesPackage) : Prop :=
  P.matrixBehavior ∧ P.selfConsistentEquationShear ∧
  P.selfConsistentEquationBulk ∧ P.differentialScheme ∧
  P.moriTanakaEstimate

theorem self_consistent_estimates_closed_from_evidence
    (P : SelfConsistentEstimatesPackage)
    (E : SelfConsistentEstimatesEvidence P) :
    SelfConsistentEstimatesClosed P := by
  exact And.intro E.matrixBehaviorClosed
    (And.intro E.selfConsistentEquationShearClosed
      (And.intro E.selfConsistentEquationBulkClosed
        (And.intro E.differentialSchemeClosed
          E.moriTanakaEstimateClosed)))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse
