defmodule NaturalNumbers do
  import Caffeine.Stream, only: [construct: 2]

  def stream do
    stream(0)
  end

  defp stream(n) do
    rest = fn -> stream(increment(n)) end
    construct(n, rest)
  end

  defp increment(n) do
    n + 1
  end
end
