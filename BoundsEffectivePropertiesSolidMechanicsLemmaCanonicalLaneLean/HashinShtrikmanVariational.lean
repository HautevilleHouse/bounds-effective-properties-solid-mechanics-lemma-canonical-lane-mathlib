import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure HashinShtrikmanVariationalPackage where
  comparisonModulusChoice : Prop
  polarizationFluctuation : Prop
  stationaryCondition : Prop
  optimalBound : Prop
  extremalComposite : Prop

structure HashinShtrikmanVariationalEvidence
    (H : HashinShtrikmanVariationalPackage) where
  comparisonModulusChoiceClosed : H.comparisonModulusChoice
  polarizationFluctuationClosed : H.polarizationFluctuation
  stationaryConditionClosed : H.stationaryCondition
  optimalBoundClosed : H.optimalBound
  extremalCompositeClosed : H.extremalComposite

def HashinShtrikmanVariationalClosed
    (H : HashinShtrikmanVariationalPackage) : Prop :=
  H.comparisonModulusChoice ∧ H.polarizationFluctuation ∧
  H.stationaryCondition ∧ H.optimalBound ∧ H.extremalComposite

theorem hashin_shtrikman_variational_closed_from_evidence
    (H : HashinShtrikmanVariationalPackage)
    (E : HashinShtrikmanVariationalEvidence H) :
    HashinShtrikmanVariationalClosed H := by
  exact And.intro E.comparisonModulusChoiceClosed
    (And.intro E.polarizationFluctuationClosed
      (And.intro E.stationaryConditionClosed
        (And.intro E.optimalBoundClosed E.extremalCompositeClosed)))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse
