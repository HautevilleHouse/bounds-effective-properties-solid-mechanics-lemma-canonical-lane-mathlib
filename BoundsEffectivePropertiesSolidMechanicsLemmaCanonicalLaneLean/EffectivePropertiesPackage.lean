import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure StrainTensor where
  components : Matrix (Fin 3) (Fin 3) ℝ
  symmetric : Prop

definition StrainTensor.symmetric := StrainTensor.symmetric

structure StressTensor where
  components : Matrix (Fin 3) (Fin 3) ℝ
  symmetric : Prop

definition StressTensor.symmetric := StressTensor.symmetric

structure ConstitutiveLaw where
  stiffness : Matrix (Fin 6) (Fin 6) ℝ
  compliance : Matrix (Fin 6) (Fin 6) ℝ
  positiveDefinite : Prop

definition ConstitutiveLaw.positiveDefinite := ConstitutiveLaw.positiveDefinite

structure EffectivePropertyBounds where
  lowerBound : ℝ
  upperBound : ℝ
  lowerBoundClosed : Prop
  upperBoundClosed : Prop

definition EffectivePropertyBounds.closed (b : EffectivePropertyBounds) : Prop := b.lowerBoundClosed ∧ b.upperBoundClosed

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse