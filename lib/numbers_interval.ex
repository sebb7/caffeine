defmodule NumbersInterval do
  import Caffeine.Stream, only: [construct: 2]

  def stream(stop, stop) do
    [stop | fn -> [] end]
  end
  def stream(start, stop) do
    rest = fn -> stream(increment(start), stop) end
    construct(start, rest)
  end

  defp increment(n) do
    n + 1
  end
end
