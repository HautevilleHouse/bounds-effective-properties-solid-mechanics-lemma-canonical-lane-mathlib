import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure ElasticModuliPackage where
  stiffnessTensor : Type u
  complianceTensor : Type v
  isotropicBulkModulus : Type w
  isotropicShearModulus : Type x
  tensorSymmetries : Prop
  positiveDefiniteness : Prop

structure ElasticModuliEvidence (E : ElasticModuliPackage) where
  tensorSymmetriesClosed : E.tensorSymmetries
  positiveDefinitenessClosed : E.positiveDefiniteness

def ElasticModuliClosed (E : ElasticModuliPackage) : Prop :=
  E.tensorSymmetries ∧ E.positiveDefiniteness

theorem elastic_moduli_closed_from_evidence (E : ElasticModuliPackage) (ev : ElasticModuliEvidence E) : ElasticModuliClosed E := by
  exact And.intro ev.tensorSymmetriesClosed ev.positiveDefinitenessClosed

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse