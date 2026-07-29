import BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure ElasticityTensorPackage where
  domain : Type u
  stiffnessTensor : Type v
  complianceTensor : Type w
  linearElasticity : Prop
  majorSymmetry : Prop
  minorSymmetry : Prop
  positiveDefiniteness : Prop

structure ElasticityTensorEvidence (E : ElasticityTensorPackage) where
  linearElasticityClosed : E.linearElasticity
  majorSymmetryClosed : E.majorSymmetry
  minorSymmetryClosed : E.minorSymmetry
  positiveDefinitenessClosed : E.positiveDefiniteness

def ElasticityTensorClosed (E : ElasticityTensorPackage) : Prop :=
  E.linearElasticity ∧ E.majorSymmetry ∧ E.minorSymmetry ∧ E.positiveDefiniteness

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensorPackage)
    (Ev : ElasticityTensorEvidence E) : ElasticityTensorClosed E := by
  exact And.intro Ev.linearElasticityClosed
    (And.intro Ev.majorSymmetryClosed
      (And.intro Ev.minorSymmetryClosed Ev.positiveDefinitenessClosed))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse