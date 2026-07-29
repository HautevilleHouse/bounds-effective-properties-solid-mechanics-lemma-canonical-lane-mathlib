import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure PlateReissnerMindlinBoundsPackage (A : AdmissibleClass) where
  plateThickness : ℝ
  transverseShearCorrection : Prop
  bendingStiffnessBound : Prop
  shearStiffnessBound : Prop
  midplaneStrainRegularity : Prop

structure PlateReissnerMindlinBoundsEvidence {A : AdmissibleClass} (P : PlateReissnerMindlinBoundsPackage A) where
  bendingStiffnessBoundClosed : P.bendingStiffnessBound
  shearStiffnessBoundClosed : P.shearStiffnessBound
  midplaneStrainRegularityClosed : P.midplaneStrainRegularity

def PlateReissnerMindlinBoundsClosed {A : AdmissibleClass} (P : PlateReissnerMindlinBoundsPackage A) : Prop :=
  P.bendingStiffnessBound ∧ P.shearStiffnessBound ∧ P.midplaneStrainRegularity

theorem plate_reissner_mindlin_bounds_closed_from_evidence
    {A : AdmissibleClass} (P : PlateReissnerMindlinBoundsPackage A)
    (E : PlateReissnerMindlinBoundsEvidence P) : PlateReissnerMindlinBoundsClosed P := by
  exact And.intro E.bendingStiffnessBoundClosed
    (And.intro E.shearStiffnessBoundClosed E.midplaneStrainRegularityClosed)

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse