import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure EffectiveBoundsShapeOptimizationPackage (A : AdmissibleClass) where
  designDomain : Type u
  shapeFunctional : Type v
  complianceLowerBound : Prop
  shapeDerivativeRegularity : Prop
  lagrangeMultiplierExistence : Prop

structure EffectiveBoundsShapeOptimizationEvidence {A : AdmissibleClass} (P : EffectiveBoundsShapeOptimizationPackage A) where
  complianceLowerBoundClosed : P.complianceLowerBound
  shapeDerivativeRegularityClosed : P.shapeDerivativeRegularity
  lagrangeMultiplierExistenceClosed : P.lagrangeMultiplierExistence

def EffectiveBoundsShapeOptimizationClosed {A : AdmissibleClass} (P : EffectiveBoundsShapeOptimizationPackage A) : Prop :=
  P.complianceLowerBound ∧ P.shapeDerivativeRegularity ∧ P.lagrangeMultiplierExistence

theorem effective_bounds_shape_optimization_closed_from_evidence
    {A : AdmissibleClass} (P : EffectiveBoundsShapeOptimizationPackage A)
    (E : EffectiveBoundsShapeOptimizationEvidence P) : EffectiveBoundsShapeOptimizationClosed P := by
  exact And.intro E.complianceLowerBoundClosed
    (And.intro E.shapeDerivativeRegularityClosed E.lagrangeMultiplierExistenceClosed)

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse