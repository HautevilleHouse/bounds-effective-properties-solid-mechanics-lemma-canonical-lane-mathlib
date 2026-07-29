import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure SolidMechanicsLemmaPackage where
  representativeVolumeElement : Type u
  effectiveStiffnessDefined : Prop
  variationalPrinciple : Prop
  optimalLowerBound : Prop
  optimalUpperBound : Prop
  recoverabilityComposite : Prop

structure SolidMechanicsLemmaEvidence (L : SolidMechanicsLemmaPackage) where
  effectiveStiffnessDefinedClosed : L.effectiveStiffnessDefined
  variationalPrincipleClosed : L.variationalPrinciple
  optimalLowerBoundClosed : L.optimalLowerBound
  optimalUpperBoundClosed : L.optimalUpperBound
  recoverabilityCompositeClosed : L.recoverabilityComposite

def SolidMechanicsLemmaClosed (L : SolidMechanicsLemmaPackage) : Prop :=
  L.effectiveStiffnessDefined ∧ L.variationalPrinciple ∧
  L.optimalLowerBound ∧ L.optimalUpperBound ∧ L.recoverabilityComposite

theorem solid_mechanics_lemma_closed_from_evidence
    (L : SolidMechanicsLemmaPackage)
    (E : SolidMechanicsLemmaEvidence L) :
    SolidMechanicsLemmaClosed L := by
  exact And.intro E.effectiveStiffnessDefinedClosed
    (And.intro E.variationalPrincipleClosed
      (And.intro E.optimalLowerBoundClosed
        (And.intro E.optimalUpperBoundClosed E.recoverabilityCompositeClosed)))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse
