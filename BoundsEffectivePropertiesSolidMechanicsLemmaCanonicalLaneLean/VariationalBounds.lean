import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure VariationalBoundsPackage where
  voigtUpperBound : Prop
  reussLowerBound : Prop
  hashinShtrikmanUpper : Prop
  hashinShtrikmanLower : Prop
  boundsRelation : Prop

structure VariationalBoundsEvidence (B : VariationalBoundsPackage) where
  voigtUpperBoundClosed : B.voigtUpperBound
  reussLowerBoundClosed : B.reussLowerBound
  hashinShtrikmanUpperClosed : B.hashinShtrikmanUpper
  hashinShtrikmanLowerClosed : B.hashinShtrikmanLower
  boundsRelationClosed : B.boundsRelation

def VariationalBoundsClosed (B : VariationalBoundsPackage) : Prop :=
  B.voigtUpperBound ∧ B.reussLowerBound ∧ B.hashinShtrikmanUpper ∧ B.hashinShtrikmanLower ∧ B.boundsRelation

theorem variational_bounds_closed_from_evidence (B : VariationalBoundsPackage) (ev : VariationalBoundsEvidence B) : VariationalBoundsClosed B := by
  exact And.intro ev.voigtUpperBoundClosed
    (And.intro ev.reussLowerBoundClosed
      (And.intro ev.hashinShtrikmanUpperClosed
        (And.intro ev.hashinShtrikmanLowerClosed ev.boundsRelationClosed)))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse