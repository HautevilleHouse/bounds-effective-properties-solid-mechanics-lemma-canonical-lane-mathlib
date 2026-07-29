import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure HashinShtrikmanBoundsPackage (A : AdmissibleClass) where
  compositeMaterial : Type u
  isotropicConstituents : Prop
  variationalPrinciple : Type v
  bulkModulusBound : Prop
  shearModulusBound : Prop

structure HashinShtrikmanBoundsEvidence {A : AdmissibleClass} (P : HashinShtrikmanBoundsPackage A) where
  variationalPrincipleClosed : Prop
  bulkModulusBoundClosed : P.bulkModulusBound
  shearModulusBoundClosed : P.shearModulusBound

def HashinShtrikmanBoundsClosed {A : AdmissibleClass} (P : HashinShtrikmanBoundsPackage A) : Prop :=
  P.variationalPrinciple ∧ P.bulkModulusBound ∧ P.shearModulusBound

theorem hashin_shtrikman_bounds_closed_from_evidence
    {A : AdmissibleClass} (P : HashinShtrikmanBoundsPackage A)
    (E : HashinShtrikmanBoundsEvidence P) : HashinShtrikmanBoundsClosed P := by
  exact And.intro E.variationalPrincipleClosed
    (And.intro E.bulkModulusBoundClosed E.shearModulusBoundClosed)

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse