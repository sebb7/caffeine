defmodule Factorial do
  import Caffeine.Stream, only: [construct: 2]

  def stream do
    stream(0)
  end

  defp stream(n) do
    rest = fn -> stream(increment(n)) end
    construct(factorial(n), rest)
  end

  defp increment(n) do
    n + 1
  end

  defp factorial(n) do
    factorial(n, 1)
  end

  defp factorial(0, acc) do
    1 * acc
  end
  defp factorial(n, acc) do
    new_acc = n * acc
    factorial(n - 1, new_acc)
  end
end
