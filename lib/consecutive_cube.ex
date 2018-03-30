defmodule CubeNumbers do
  import Caffeine.Stream, only: [construct: 2]

  def stream do
    stream(0)
  end

  defp stream(n) do
    new_n = increment(n)
    rest = fn -> stream(new_n) end
    construct(cube(n), rest)
  end

  defp increment(n) do
    n + 1
  end

  defp cube(n) do
    n * n * n
  end
end
