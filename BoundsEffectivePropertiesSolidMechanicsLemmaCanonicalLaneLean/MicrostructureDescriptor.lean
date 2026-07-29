import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure MicrostructureDescriptorPackage where
  volumeFractions : Prop
  nPointCorrelationFunctions : Prop
  inclusionShape : Prop
  anisotropy : Prop

structure MicrostructureDescriptorEvidence (M : MicrostructureDescriptorPackage) where
  volumeFractionsClosed : M.volumeFractions
  nPointCorrelationFunctionsClosed : M.nPointCorrelationFunctions
  inclusionShapeClosed : M.inclusionShape
  anisotropyClosed : M.anisotropy

def MicrostructureDescriptorClosed (M : MicrostructureDescriptorPackage) : Prop :=
  M.volumeFractions ∧ M.nPointCorrelationFunctions ∧ M.inclusionShape ∧ M.anisotropy

theorem microstructure_descriptor_closed_from_evidence (M : MicrostructureDescriptorPackage) (ev : MicrostructureDescriptorEvidence M) : MicrostructureDescriptorClosed M := by
  exact And.intro ev.volumeFractionsClosed
    (And.intro ev.nPointCorrelationFunctionsClosed
      (And.intro ev.inclusionShapeClosed ev.anisotropyClosed))

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse