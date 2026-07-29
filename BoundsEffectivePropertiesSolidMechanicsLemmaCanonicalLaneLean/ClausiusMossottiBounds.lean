import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure ClausiusMossottiBoundsPackage where
  polarizability : ℝ
  depolarizationFactor : ℝ
  inclusionShape : String
  diluteLimitShear : Prop
  diluteLimitBulk : Prop
  maxwellGarnettShear : Prop
  maxwellGarnettBulk : Prop

structure ClausiusMossottiBoundsEvidence (P : ClausiusMossottiBoundsPackage) where
  diluteLimitShearClosed : P.diluteLimitShear
  diluteLimitBulkClosed : P.diluteLimitBulk
  maxwellGarnettShearClosed : P.maxwellGarnettShear
  maxwellGarnettBulkClosed : P.maxwellGarnettBulk

def ClausiusMossottiBoundsClosed (P : ClausiusMossottiBoundsPackage) : Prop :=
  P.diluteLimitShear ∧ P.diluteLimitBulk ∧
  P.maxwellGarnettShear ∧ P.maxwellGarnettBulk

theorem clausius_mossotti_bounds_closed_from_evidence
    (P : ClausiusMossottiBoundsPackage)
    (E : ClausiusMossottiBoundsEvidence P) :
    ClausiusMossottiBoundsClosed P := by
  exact And.intro E.diluteLimitShearClosed
    (And.intro E.diluteLimitBulkClosed
      (And.intro E.maxwellGarnettShearClosed E.maxwellGarnettBulkClosed))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse
