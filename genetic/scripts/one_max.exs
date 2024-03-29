defmodule OneMax do
  @behaviour Problem
  alias Types.Chromosome

  @impl true
  def genotype do
    genes = for _ <- 1..42, do: Enum.random(0..1)
    %Chromosome{genes: genes, size: 42}
  end

  @impl true
  def fitness_function(chromosome), do: Enum.sum(chromosome.genes)

  @impl true
  def terminate?([best | _], generation), do: generation == 1000
end

soln = Genetic.run(OneMax)
IO.write("\n")
IO.inspect(soln)

# genotype = fn -> for _ <- 1..1000, do: Enum.random(0..1) end
# fitness_function = fn chromosome -> Enum.sum(chromosome) end
# max_fitness = 1000

# soln = Genetic.run(fitness_function, genotype, max_fitness)

# IO.write("\n")
# IO.inspect(soln)
