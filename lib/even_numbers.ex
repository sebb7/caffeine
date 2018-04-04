defmodule OddNumbers do
  import Caffeine.Stream, only: [construct: 2]

  def stream do
    stream(2)
  end

  defp stream(n) do
    rest = fn -> stream(add_two(n)) end
    construct(n, rest)
  end

  defp add_two(n) do
    n + 2
  end
end
