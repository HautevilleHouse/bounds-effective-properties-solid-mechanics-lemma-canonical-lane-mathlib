import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure VariationalAsymptoticHomogenizationPackage where
  periodicUnitCell : Type u
  localProblemFormulated : Prop
  correctorFunction : Type v
  homogenizedCoefficients : Prop
  convergenceRate : Prop
  boundedCorrectness : Prop

structure VariationalAsymptoticHomogenizationEvidence
    (V : VariationalAsymptoticHomogenizationPackage) where
  localProblemFormulatedClosed : V.localProblemFormulated
  homogenizedCoefficientsClosed : V.homogenizedCoefficients
  convergenceRateClosed : V.convergenceRate
  boundedCorrectnessClosed : V.boundedCorrectness

def VariationalAsymptoticHomogenizationClosed
    (V : VariationalAsymptoticHomogenizationPackage) : Prop :=
  V.localProblemFormulated ∧ V.homogenizedCoefficients ∧
  V.convergenceRate ∧ V.boundedCorrectness

theorem variational_asymptotic_homogenization_closed_from_evidence
    (V : VariationalAsymptoticHomogenizationPackage)
    (E : VariationalAsymptoticHomogenizationEvidence V) :
    VariationalAsymptoticHomogenizationClosed V := by
  exact And.intro E.localProblemFormulatedClosed
    (And.intro E.homogenizedCoefficientsClosed
      (And.intro E.convergenceRateClosed E.boundedCorrectnessClosed))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse