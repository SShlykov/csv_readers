defmodule CsvRdr do
  def read_csv do
    result = "../../test.csv"
      |> Path.expand(__DIR__)
      |> File.stream!
      |> CSV.decode
      |> Enum.to_list()
      |> Enum.map(fn {:ok, data} -> data end)
      |> Enum.reduce(0, fn [a | _tail],acc -> acc + String.to_integer(a) end)

    csv_data = [["result"], [result]]
      |> CSV.encode
      |> Enum.to_list()

    "../test_elixir.csv"
    |> File.write!(csv_data)

  end
end
