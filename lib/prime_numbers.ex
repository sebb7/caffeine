defmodule PrimeNumbers do
  import Caffeine.Stream, only: [construct: 2]

  def stream do
    stream(2, is_prime_number(2))
  end

  defp stream(n, true) do
    next_n = increment(n)
    rest = fn -> stream(next_n, is_prime_number(next_n)) end
    construct(n, rest)
  end
  defp stream(n, false) do
    next_n = increment(n)
    rest = fn -> stream(next_n, is_prime_number(next_n)) end
    rest.()
  end

  defp is_prime_number(n) do
    (2..n |> Enum.filter(fn a -> rem(n, a) == 0 end) |> length()) == 1
  end

  defp increment(n) do
    n + 1
  end
end
