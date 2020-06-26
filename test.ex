result = "./test.csv"
|> File.read!
|> String.split(["\n", ","])
|> Enum.chunk_every(3,3,:discard)
|> Enum.map(fn data ->
  data
  |> Enum.at(0)
  |> String.to_integer
end)
|> Enum.reduce(0, &(&1 + &2))
|> IO.puts
