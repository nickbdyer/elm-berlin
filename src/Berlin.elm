module Berlin exposing (getSingleMinutes, getSingleHours, getSeconds, getFiveMinutes)


import Date exposing (fromString)


getSingleMinutes : String -> Int
getSingleMinutes stringTime =
  Date.fromString stringTime
    |> Result.withDefault (Date.fromTime 0)
    |> Date.minute
    |> moduloFive


getFiveMinutes : String -> Int
getFiveMinutes stringTime =
  Date.fromString stringTime
    |> Result.withDefault (Date.fromTime 0)
    |> Date.minute
    |> (\y x -> x // y) 5


getSingleHours : String -> Int
getSingleHours stringTime =
  Date.fromString stringTime
    |> Result.withDefault (Date.fromTime 0)
    |> Date.hour
    |> moduloFive


getSeconds : String -> Int
getSeconds stringTime =
  Date.fromString stringTime
    |> Result.withDefault (Date.fromTime 0)
    |> Date.second
    |> iluminateSeconds 


modulo =
  (\num mod -> num % mod)

moduloFive =
  (flip modulo) 5

iluminateSeconds value = 
  case value of
    0 -> 1
    value -> (value + 1) `rem` 2
