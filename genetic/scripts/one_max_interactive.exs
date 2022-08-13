defmodule OneMax do
  @behaviour Problem
  alias Types.Chromosome

  @impl true
  def genotype do
    genes = for _ <- 1..42, do: Enum.random(0..1)
    %Chromosome{genes: genes, size: 42}
  end

  @impl true
  def fitness_function(chromosome) do
    IO.inspect(chromosome)
    fit = IO.get("Rate from 1 to 10 ")
    String.to_integer(fit)
  end

  @impl true
  def terminate?([best | _], generation), do: generation == 1000
end

soln = Genetic.run(OneMax)
IO.write("\n")
IO.inspect(soln)
