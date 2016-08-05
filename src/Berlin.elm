module Berlin exposing (getSingleMinutesLamps, getSingleHoursLamps, getSecondsLamp, getFiveMinutesLamps, getFiveHoursLamps, getClock)


import Date exposing (fromString, Date)
import String


getClock : String -> Result String String
getClock time = 
  Result.map getAllLamps (Date.fromString time)


getAllLamps : Date.Date -> String
getAllLamps date =
  let
      seconds = getSecondsLamp (Date.second date)
      fiveHours = getFiveHoursLamps (Date.hour date)
      hours = getSingleHoursLamps (Date.hour date)
      fiveMinutes = getFiveMinutesLamps (Date.minute date)
      minutes = getSingleMinutesLamps (Date.minute date)
      lamps = [seconds, fiveHours, hours, fiveMinutes, minutes]
  in
      String.join "" lamps


getSecondsLamp : Int -> String
getSecondsLamp numSeconds =
  makeString 1 "Y" (illuminateSeconds numSeconds)


getFiveHoursLamps : Int -> String
getFiveHoursLamps numHours =
  makeString 4 "R" (numHours // 5)


getSingleHoursLamps : Int -> String
getSingleHoursLamps numHours =
  makeString 4 "R" (numHours % 5)


getFiveMinutesLamps : Int -> String
getFiveMinutesLamps numMinutes =
  let
      lampList = String.split "" (makeString 11 "Y" (numMinutes // 5))
      recolouredLights = List.indexedMap replaceColours lampList
  in
      recolouredLights
        |> String.join ""


getSingleMinutesLamps : Int -> String
getSingleMinutesLamps numMinutes =
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
