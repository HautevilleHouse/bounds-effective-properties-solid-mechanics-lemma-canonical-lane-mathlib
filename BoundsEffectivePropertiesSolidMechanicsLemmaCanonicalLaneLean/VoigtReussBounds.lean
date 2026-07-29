import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure VoigtReussBoundsPackage (A : AdmissibleClass) where
  constituentStiffnesses : Type u
  volumeFractions : Type v
  voigtUpperBound : Prop
  reussLowerBound : Prop
  mixtureRuleConsistency : Prop

structure VoigtReussBoundsEvidence {A : AdmissibleClass} (P : VoigtReussBoundsPackage A) where
  voigtUpperBoundClosed : P.voigtUpperBound
  reussLowerBoundClosed : P.reussLowerBound
  mixtureRuleConsistencyClosed : P.mixtureRuleConsistency

def VoigtReussBoundsClosed {A : AdmissibleClass} (P : VoigtReussBoundsPackage A) : Prop :=
  P.voigtUpperBound ∧ P.reussLowerBound ∧ P.mixtureRuleConsistency

theorem voigt_reuss_bounds_closed_from_evidence
    {A : AdmissibleClass} (P : VoigtReussBoundsPackage A)
    (E : VoigtReussBoundsEvidence P) : VoigtReussBoundsClosed P := by
  exact And.intro E.voigtUpperBoundClosed
    (And.intro E.reussLowerBoundClosed E.mixtureRuleConsistencyClosed)

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse