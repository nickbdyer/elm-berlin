module Berlin exposing (getSingleMinutes, getSingleHours, getSeconds, getFiveMinutes, getFiveHours)


import Date exposing (fromString)
import String exposing (repeat)


getSingleMinutes : String -> String
getSingleMinutes stringTime =
  getRow stringTime Date.minute moduloFive
    |> makeString 4 "Y"
 

getFiveMinutes : String -> Int
getFiveMinutes stringTime =
  getRow stringTime Date.minute divideFive


getSingleHours : String -> Int
getSingleHours stringTime =
  getRow stringTime Date.hour moduloFive
    

getFiveHours : String -> Int
getFiveHours stringTime =
  getRow stringTime Date.hour divideFive


getSeconds : String -> Int
getSeconds stringTime =
  getRow stringTime Date.second illuminateSeconds


getRow stringTime unitFunction mathsFunction =
  Date.fromString stringTime
    |> Result.withDefault (Date.fromTime 0)
    |> unitFunction
    |> mathsFunction


makeString : Int -> String -> Int -> String
makeString numLightsTotal lightPattern numLightsOn =
  List.repeat numLightsTotal "O"
    |> List.drop numLightsOn
    |> List.append (List.repeat numLightsOn lightPattern) 
    |> String.join ""


divideFive =
  (\divisor num -> num // divisor) 5

moduloFive =
  (\mod num -> num % mod) 5

illuminateSeconds value = 
  case value of
    0 -> 1
    value -> (value + 1) `rem` 2
