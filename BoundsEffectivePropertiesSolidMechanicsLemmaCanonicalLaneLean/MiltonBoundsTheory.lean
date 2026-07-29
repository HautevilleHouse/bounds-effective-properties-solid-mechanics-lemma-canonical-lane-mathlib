import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure MiltonBoundsTheoryPackage where
  translationMethod : Prop
  optimalBounds : Prop
  threePointBounds : Prop
  microstructuralParameter : ℝ
  threePointLowerShear : Prop
  threePointUpperShear : Prop
  threePointLowerBulk : Prop
  threePointUpperBulk : Prop

structure MiltonBoundsTheoryEvidence (P : MiltonBoundsTheoryPackage) where
  translationMethodClosed : P.translationMethod
  optimalBoundsClosed : P.optimalBounds
  threePointBoundsClosed : P.threePointBounds
  threePointLowerShearClosed : P.threePointLowerShear
  threePointUpperShearClosed : P.threePointUpperShear
  threePointLowerBulkClosed : P.threePointLowerBulk
  threePointUpperBulkClosed : P.threePointUpperBulk

def MiltonBoundsTheoryClosed (P : MiltonBoundsTheoryPackage) : Prop :=
  P.translationMethod ∧ P.optimalBounds ∧ P.threePointBounds ∧
  P.threePointLowerShear ∧ P.threePointUpperShear ∧
  P.threePointLowerBulk ∧ P.threePointUpperBulk

theorem milton_bounds_theory_closed_from_evidence
    (P : MiltonBoundsTheoryPackage) (E : MiltonBoundsTheoryEvidence P) :
    MiltonBoundsTheoryClosed P := by
  exact And.intro E.translationMethodClosed
    (And.intro E.optimalBoundsClosed
      (And.intro E.threePointBoundsClosed
        (And.intro E.threePointLowerShearClosed
          (And.intro E.threePointUpperShearClosed
            (And.intro E.threePointLowerBulkClosed
              E.threePointUpperBulkClosed)))))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse
