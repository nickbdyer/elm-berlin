module Berlin exposing (getSingleMinutes, getSingleHours, getSeconds, getFiveMinutes, getFiveHours)


import Date exposing (fromString, Date)
import String


getSingleMinutes : String -> String
getSingleMinutes stringTime =
  getRow stringTime Date.minute moduloFive
    |> makeString 4 "Y"
 

getFiveMinutes : String -> String
getFiveMinutes stringTime =
  let
    numLightsOn = getRow stringTime Date.minute divideFive
    lampList = String.split "" (makeString 11 "Y" numLightsOn)
    recolouredLights = List.indexedMap replaceColours lampList
  in
    recolouredLights
      |> String.join ""


replaceColours : Int -> String -> String
replaceColours lampNumber lampColour =
  let
    redLightPositions = [2, 5, 8]
  in
    if (List.member lampNumber redLightPositions) && lampColour == "Y" then
      "R"
    else
      lampColour


getSingleHours : String -> String
getSingleHours stringTime =
  getRow stringTime Date.hour moduloFive
    |> makeString 4 "R"
    

getFiveHours : String -> String
getFiveHours stringTime =
  getRow stringTime Date.hour divideFive
    |> makeString 4 "R"


getSeconds : String -> String
getSeconds stringTime =
  getRow stringTime Date.second illuminateSeconds
    |> makeString 1 "R"


getRow : String -> (Date -> Int) -> (Int -> Int) -> Int
getRow stringTime unitFunction mathsFunction =
  Date.fromString stringTime
    |> Result.withDefault (Date.fromTime 0)
    |> unitFunction
    |> mathsFunction


makeString : Int -> String -> Int -> String
makeString numLightsTotal lightPattern numLightsOn =
  let 
      numLightsOff = numLightsTotal - numLightsOn
      offLights = List.repeat numLightsOff "O"
      onLights = List.repeat numLightsOn lightPattern
      totalLights = onLights ++ offLights
  in
      String.join "" totalLights


divideFive =
  (\divisor num -> num // divisor) 5

moduloFive =
  (\mod num -> num % mod) 5

illuminateSeconds value = 
  case value of
    0 -> 1
    value -> (value + 1) `rem` 2
