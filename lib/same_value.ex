defmodule SameValue do
  import Caffeine.Stream, only: [construct: 2]

  def stream() do
    rest = fn -> stream() end
    construct(3.14, rest)
  end

end
