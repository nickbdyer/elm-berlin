module Berlin exposing (getSingleMinutes)


import Date exposing (fromString)


getSingleMinutes : String -> Int
getSingleMinutes stringTime =
  Date.fromString stringTime
    |> Result.withDefault (Date.fromTime 0)
    |> Date.minute
    |> moduloFive


modulo =
  (\num mod -> num % mod)

moduloFive =
  (flip modulo) 5
