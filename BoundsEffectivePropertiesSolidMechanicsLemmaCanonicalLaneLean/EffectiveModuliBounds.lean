import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure EffectiveModuliBoundsPackage where
  compositeType : String
  volumeFraction : ℝ
  matrixShearModulus : ℝ
  matrixBulkModulus : ℝ
  inclusionShearModulus : ℝ
  inclusionBulkModulus : ℝ
  hashinShtrikmanLowerShear : Prop
  hashinShtrikmanUpperShear : Prop
  hashinShtrikmanLowerBulk : Prop
  hashinShtrikmanUpperBulk : Prop
  voigtReussBounds : Prop

structure EffectiveModuliBoundsEvidence (P : EffectiveModuliBoundsPackage) where
  hashinShtrikmanLowerShearClosed : P.hashinShtrikmanLowerShear
  hashinShtrikmanUpperShearClosed : P.hashinShtrikmanUpperShear
  hashinShtrikmanLowerBulkClosed : P.hashinShtrikmanLowerBulk
  hashinShtrikmanUpperBulkClosed : P.hashinShtrikmanUpperBulk
  voigtReussBoundsClosed : P.voigtReussBounds

def EffectiveModuliBoundsClosed (P : EffectiveModuliBoundsPackage) : Prop :=
  P.hashinShtrikmanLowerShear ∧ P.hashinShtrikmanUpperShear ∧
  P.hashinShtrikmanLowerBulk ∧ P.hashinShtrikmanUpperBulk ∧
  P.voigtReussBounds

theorem effective_moduli_bounds_closed_from_evidence
    (P : EffectiveModuliBoundsPackage) (E : EffectiveModuliBoundsEvidence P) :
    EffectiveModuliBoundsClosed P := by
  exact And.intro E.hashinShtrikmanLowerShearClosed
    (And.intro E.hashinShtrikmanUpperShearClosed
      (And.intro E.hashinShtrikmanLowerBulkClosed
        (And.intro E.hashinShtrikmanUpperBulkClosed E.voigtReussBoundsClosed)))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse
