defmodule FileLines do
  import Caffeine.Stream, only: [construct: 2]

  def stream(path) do
    file_pid = open_file_form_path(path) 
    do_stream(file_pid)
  end

  defp do_stream(pid) do
    text_chunk = read_text_chunk(pid)
    case text_chunk do
      :eof ->
        File.close(pid)
        []
      _ -> 
        rest = fn -> do_stream(pid) end
        construct(text_chunk, rest)
    end
  end

  defp open_file_form_path(path) do
    {:ok, file_pid} = File.open(path, [:read])
    file_pid
  end

  defp read_text_chunk(pid) do
    IO.binread(pid, 40)
  end
end
