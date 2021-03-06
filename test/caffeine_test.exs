defmodule CaffeineTest do
  use ExUnit.Case
  doctest Caffeine

  test "API presence under Stream module" do
    assert Caffeine.Stream.__info__(:functions) == [
             construct: 2,
             construct?: 1,
             filter: 2,
             head: 1,
             map: 2,
             sentinel: 0,
             sentinel?: 1,
             skip: 2,
             tail: 1,
             take: 2
           ]
  end
end
