import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure EffectiveBoundsPackage where
  phaseField : Type u
  elasticModulus : Type v
  inclusionVolumeFraction : Prop
  effectiveStiffnessTensor : Type w
  variationalBound : Prop
  polarizationField : Type u
  comparisonMedium : Type u
  hashinShtrikmanBound : Prop
  hashinShtrikmanBoundTerm : hashinShtrikmanBound

structure EffectiveBoundsEvidence (P : EffectiveBoundsPackage) where
  inclusionVolumeFractionClosed : P.inclusionVolumeFraction
  variationalBoundClosed : P.variationalBound
  hashinShtrikmanBoundClosed : P.hashinShtrikmanBound

def EffectiveBoundsClosed (P : EffectiveBoundsPackage) : Prop :=
  P.inclusionVolumeFraction ∧ P.variationalBound ∧ P.hashinShtrikmanBound

theorem effective_bounds_closed_from_evidence (P : EffectiveBoundsPackage)
    (E : EffectiveBoundsEvidence P) : EffectiveBoundsClosed P := by
  exact And.intro E.inclusionVolumeFractionClosed
    (And.intro E.variationalBoundClosed E.hashinShtrikmanBoundClosed)

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse
