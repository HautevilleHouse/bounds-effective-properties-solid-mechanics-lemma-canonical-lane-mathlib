import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure MiltonBoundsPackage where
  twoPointCorrelation : Type u
  threePointCorrelation : Type v
  microstructureParameter : Prop
  improvedLowerBound : Prop
  improvedUpperBound : Prop
  translationMethodApplied : Prop

structure MiltonBoundsEvidence (M : MiltonBoundsPackage) where
  twoPointCorrelationClosed : M.twoPointCorrelation
  threePointCorrelationClosed : M.threePointCorrelation
  microstructureParameterClosed : M.microstructureParameter
  improvedLowerBoundClosed : M.improvedLowerBound
  improvedUpperBoundClosed : M.improvedUpperBound
  translationMethodAppliedClosed : M.translationMethodApplied

def MiltonBoundsClosed (M : MiltonBoundsPackage) : Prop :=
  M.twoPointCorrelation ∧ M.threePointCorrelation ∧ M.microstructureParameter ∧
  M.improvedLowerBound ∧ M.improvedUpperBound ∧ M.translationMethodApplied

theorem milton_bounds_closed_from_evidence (M : MiltonBoundsPackage)
    (E : MiltonBoundsEvidence M) : MiltonBoundsClosed M := by
  exact And.intro E.twoPointCorrelationClosed
    (And.intro E.threePointCorrelationClosed
      (And.intro E.microstructureParameterClosed
        (And.intro E.improvedLowerBoundClosed
          (And.intro E.improvedUpperBoundClosed E.translationMethodAppliedClosed))))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse