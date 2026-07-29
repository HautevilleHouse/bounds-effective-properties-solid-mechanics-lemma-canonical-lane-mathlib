import BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean.Homogenization

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean

structure VariationalFormulationPackage {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} where
  energyFunctional : Type u
  minimizationProblem : Prop
  eulerLagrangeEquations : Prop
  saddlePointFormulation : Prop

structure VariationalFormulationEvidence {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} (V : VariationalFormulationPackage H) where
  minimizationProblemClosed : V.minimizationProblem
  eulerLagrangeEquationsClosed : V.eulerLagrangeEquations
  saddlePointFormulationClosed : V.saddlePointFormulation

def VariationalFormulationClosed {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} (V : VariationalFormulationPackage H) : Prop :=
  V.minimizationProblem ∧ V.eulerLagrangeEquations ∧ V.saddlePointFormulation

theorem variational_formulation_closed_from_evidence {E : ElasticityTensorPackage}
    {H : HomogenizationPackage E} (V : VariationalFormulationPackage H)
    (Ev : VariationalFormulationEvidence V) : VariationalFormulationClosed V := by
  exact And.intro Ev.minimizationProblemClosed
    (And.intro Ev.eulerLagrangeEquationsClosed Ev.saddlePointFormulationClosed)

end BoundsEffectivePropertiesSolidMechanicsLemmaCanonicalLaneLean
end HautevilleHouse