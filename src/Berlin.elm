module Berlin exposing (getSingleMinutes, getSingleHours, getSeconds, getFiveMinutes, getFiveHours, getClock)


import Date exposing (fromString, Date)
import String


getClock : String -> String
getClock time = 
  let 
      lamps = [getSeconds, getFiveHours, getSingleHours, getFiveMinutes, getSingleMinutes]
  in
      List.map (\x -> x time) lamps
        |> String.join ""


getSeconds : String -> String
getSeconds time =
  getClockRow time Date.second illuminateSeconds
    |> makeString 1 "R"


getFiveHours : String -> String
getFiveHours time =
  getClockRow time Date.hour divideFive
    |> makeString 4 "R"


getSingleHours : String -> String
getSingleHours time =
  getClockRow time Date.hour moduloFive
    |> makeString 4 "R"


getFiveMinutes : String -> String
getFiveMinutes time =
  let
      numLightsOn = getClockRow time Date.minute divideFive
      lampList = String.split "" (makeString 11 "Y" numLightsOn)
      recolouredLights = List.indexedMap replaceColours lampList
  in
      recolouredLights
        |> String.join ""


getSingleMinutes : String -> String
getSingleMinutes time =
  getClockRow time Date.minute moduloFive
    |> makeString 4 "Y"


replaceColours : Int -> String -> String
replaceColours lampNumber lampColour =
  let
      redLightPositions = [2, 5, 8]
  in
      if (List.member lampNumber redLightPositions) && lampColour == "Y" then
        "R"
      else
        lampColour


getClockRow : String -> (Date -> Int) -> (Int -> Int) -> Int
getClockRow time extractTimeUnit calculateNumberOfIlluminatedLights =
  let 
      parsedTime = Date.fromString time
  in
      parsedTime
        |> Result.withDefault (Date.fromTime 0) 
        |> extractTimeUnit
        |> calculateNumberOfIlluminatedLights


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
