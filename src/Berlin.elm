module Berlin exposing (getSingleMinutes, getSingleHours, getSeconds, getFiveMinutes, getFiveHours, getClock)


import Date exposing (fromString, Date)
import String


getClock : String -> String
getClock time = 
  let 
      parsedTime = Date.fromString time |> Result.withDefault (Date.fromTime 0) 
      seconds = getSeconds (Date.second parsedTime)
      fiveHours = getFiveHours (Date.hour parsedTime)
      hours = getSingleHours (Date.hour parsedTime)
      fiveMinutes = getFiveMinutes (Date.minute parsedTime)
      minutes = getSingleMinutes (Date.minute parsedTime)

      lamps = [seconds, fiveHours, hours, fiveMinutes, minutes]
  in
      lamps
        |> String.join ""


getSeconds : Int -> String
getSeconds numSeconds =
   illuminateSeconds numSeconds
    |> makeString 1 "Y"


getFiveHours : Int -> String
getFiveHours numHours =
    makeString 4 "R" (numHours // 5)


getSingleHours : Int -> String
getSingleHours numHours =
    makeString 4 "R" (numHours % 5)


getFiveMinutes : Int -> String
getFiveMinutes numMinutes =
  let
      lampList = String.split "" (makeString 11 "Y" (numMinutes // 5))
      recolouredLights = List.indexedMap replaceColours lampList
  in
      recolouredLights
        |> String.join ""


getSingleMinutes : Int -> String
getSingleMinutes numMinutes =
    makeString 4 "Y" (numMinutes % 5)


replaceColours : Int -> String -> String
replaceColours lampNumber lampColour =
  let
      redLightPositions = [2, 5, 8]
  in
      if (List.member lampNumber redLightPositions) && lampColour == "Y" then
        "R"
      else
        lampColour


makeString : Int -> String -> Int -> String
makeString numLightsTotal lightPattern numLightsOn =
  let 
      numLightsOff = numLightsTotal - numLightsOn
      offLights = List.repeat numLightsOff "O"
      onLights = List.repeat numLightsOn lightPattern
      totalLights = onLights ++ offLights
  in
      String.join "" totalLights


illuminateSeconds value = 
  case value of
    0 -> 1
    _ -> (value + 1) % 2
