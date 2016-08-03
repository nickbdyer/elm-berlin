module Berlin exposing (getSingleMinutes, getSingleHours)


import Date exposing (fromString)


getSingleMinutes : String -> Int
getSingleMinutes stringTime =
  Date.fromString stringTime
    |> Result.withDefault (Date.fromTime 0)
    |> Date.minute
    |> moduloFive


getSingleHours : String -> Int
getSingleHours stringTime =
  Date.fromString stringTime
    |> Result.withDefault (Date.fromTime 0)
    |> Date.hour
    |> moduloFive


modulo =
  (\num mod -> num % mod)

moduloFive =
  (flip modulo) 5
