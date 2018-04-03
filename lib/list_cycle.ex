defmodule ListCycle do
  import Caffeine.Stream, only: [construct: 2]

  def stream(list) when is_list(list) do
    used_list = []
    stream(list, used_list)
  end

  defp stream([head | tail], used_list) do
    new_used_list = add_element_to_list(head, used_list)
    rest = fn -> stream(tail, new_used_list) end
    construct(head, rest)
  end

  defp stream([], fully_used_list) do
    new_list = reverse_list(fully_used_list)
    stream(new_list)
  end

  defp add_element_to_list(element, list) do
    [element | list]
  end

  defp reverse_list(list) do
    Enum.reverse(list)
  end
end
