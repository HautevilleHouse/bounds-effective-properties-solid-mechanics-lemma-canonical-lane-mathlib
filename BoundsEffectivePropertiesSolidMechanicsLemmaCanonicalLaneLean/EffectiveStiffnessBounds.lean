import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure EffectiveStiffnessBoundsPackage where
  boundsLemmaProven : Prop
  appliedToSpecificMicrostructure : Prop
  lowerBoundAchievable : Prop
  upperBoundAchievable : Prop

structure EffectiveStiffnessBoundsEvidence (L : EffectiveStiffnessBoundsPackage) where
  boundsLemmaProvenClosed : L.boundsLemmaProven
  appliedToSpecificMicrostructureClosed : L.appliedToSpecificMicrostructure
  lowerBoundAchievableClosed : L.lowerBoundAchievable
  upperBoundAchievableClosed : L.upperBoundAchievable

def EffectiveStiffnessBoundsClosed (L : EffectiveStiffnessBoundsPackage) : Prop :=
  L.boundsLemmaProven ∧ L.appliedToSpecificMicrostructure ∧ L.lowerBoundAchievable ∧ L.upperBoundAchievable

theorem effective_stiffness_bounds_closed_from_evidence (L : EffectiveStiffnessBoundsPackage) (ev : EffectiveStiffnessBoundsEvidence L) : EffectiveStiffnessBoundsClosed L := by
  exact And.intro ev.boundsLemmaProvenClosed
    (And.intro ev.appliedToSpecificMicrostructureClosed
      (And.intro ev.lowerBoundAchievableClosed ev.upperBoundAchievableClosed))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse