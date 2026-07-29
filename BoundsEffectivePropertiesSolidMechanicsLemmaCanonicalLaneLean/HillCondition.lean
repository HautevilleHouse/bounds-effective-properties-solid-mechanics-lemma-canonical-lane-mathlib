import HautevilleHouse.BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.MeanFieldHomogenization

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure HillCondition {S : StrengthDomain} {M : MeanFieldHomogenization S} where
  macroMicroConsistency : Prop
  volumeAverageFormula : Prop
  equivalenceStiffnessCompliance : Prop

structure HillConditionEvidence {S : StrengthDomain} {M : MeanFieldHomogenization S}
    (H : HillCondition S M) where
  macroMicroConsistencyClosed : H.macroMicroConsistency
  volumeAverageFormulaClosed : H.volumeAverageFormula
  equivalenceStiffnessComplianceClosed : H.equivalenceStiffnessCompliance

def HillConditionClosed {S : StrengthDomain} {M : MeanFieldHomogenization S}
    (H : HillCondition S M) : Prop :=
  H.macroMicroConsistency ∧ H.volumeAverageFormula ∧ H.equivalenceStiffnessCompliance

theorem hill_condition_closed_from_evidence
    {S : StrengthDomain} {M : MeanFieldHomogenization S}
    (H : HillCondition S M) (E : HillConditionEvidence H) :
    HillConditionClosed H := by
  exact And.intro E.macroMicroConsistencyClosed
    (And.intro E.volumeAverageFormulaClosed E.equivalenceStiffnessComplianceClosed)

end HautevilleHouse
end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean