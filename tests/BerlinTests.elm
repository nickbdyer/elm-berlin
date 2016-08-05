module RomansTests exposing (..)

import Berlin exposing (..)
import ElmTest exposing (..)
import Date

tests =
  suite "Berlin Clock Test"
    [ 
      test 
      "Given a time 00:00:00, the single minutes row has 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getSingleMinutesLamps(0))

    , test 
      "Given a time 00:03:00, the single minutes row has 3 illuminations" 
      <| assertEqual "YYYO" (Berlin.getSingleMinutesLamps(3))

    , test 
      "Given a time 00:05:00, the single minutes row has 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getSingleMinutesLamps(5))

    , test 
      "Given a time 00:00:00, the single hours row has 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getSingleHoursLamps(0))

    , test 
      "Given a time 03:00:00, the single hours row has 3 illuminations" 
      <| assertEqual "RRRO" (Berlin.getSingleHoursLamps(3))

    , test 
      "Given a time 05:00:00, the single hours row has 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getSingleHoursLamps(5))

    , test 
      "Given a time 00:00:00, the seconds lamp has 1 illumination" 
      <| assertEqual "Y" (Berlin.getSecondsLamp(0))

    , test 
      "Given a time 00:00:01, the seconds lamp has 0 illuminations" 
      <| assertEqual "O" (Berlin.getSecondsLamp(1))

    , test 
      "Given a time 00:00:02, the seconds lamp has 1 illumination" 
      <| assertEqual "Y" (Berlin.getSecondsLamp(2))

    , test 
      "Given a time 00:00:59, the seconds lamp has 0 illuminations" 
      <| assertEqual "O" (Berlin.getSecondsLamp(59))

    , test 
      "Given a time 00:00:00, the five minutes lamps have 0 illuminations" 
      <| assertEqual "OOOOOOOOOOO" (Berlin.getFiveMinutesLamps(0))

    , test 
      "Given a time 00:04:00, the five minutes lamps have 0 illuminations" 
      <| assertEqual "OOOOOOOOOOO" (Berlin.getFiveMinutesLamps(4))

    , test 
      "Given a time 00:14:00, the five minutes lamps have 2 illuminations" 
      <| assertEqual "YYOOOOOOOOO" (Berlin.getFiveMinutesLamps(14))

    , test 
      "Given a time 00:59:00, the five minutes lamps have 11 illuminations" 
      <| assertEqual "YYRYYRYYRYY" (Berlin.getFiveMinutesLamps(59))

    , test 
      "Given a time 00:00:00, the five hours lamps have 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getFiveHoursLamps(0))

    , test 
      "Given a time 04:00:00, the five hours lamps have 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getFiveHoursLamps(4))

    , test 
      "Given a time 14:00:00, the five hours lamps have 2 illuminations" 
      <| assertEqual "RROO" (Berlin.getFiveHoursLamps(14))

    , test 
      "Given a time 23:00:00, the five hours lamps have 4 illuminations" 
      <| assertEqual "RRRR" (Berlin.getFiveHoursLamps(23))

    , test 
      "Given a time 00:00:00, the clock will show ROOOOOOOOOOOOOOOOOOOOOOO" 
      <| assertEqual (Ok "YOOOOOOOOOOOOOOOOOOOOOOO") (Berlin.getClock("1970/01/01 00:00:00"))

    , test 
      "Given a time 23:59:59, the clock will show ORRRRRRROYYRYYRYYRYYYYYY" 
      <| assertEqual (Ok "ORRRRRRROYYRYYRYYRYYYYYY") (Berlin.getClock("1970/01/01 23:59:59"))

    , test 
      "Given a time 16:50:06, the clock will show RRRROROOOYYRYYRYYRYOOOOO" 
      <| assertEqual (Ok "YRRROROOOYYRYYRYYRYOOOOO") (Berlin.getClock("1970/01/01 16:50:06"))

    , test 
      "Given a time 11:37:01, the clock will show ORROOROOOYYRYYRYOOOOYYOO" 
      <| assertEqual (Ok "ORROOROOOYYRYYRYOOOOYYOO") (Berlin.getClock("1970/01/01 11:37:01"))

    , test 
      "Given a invalid date string, an error message will be returned" 
      <| assertEqual (Err "Unable to parse 'hello' as a date. Dates must be in the ISO 8601 format.") (Berlin.getClock("hello"))
    ]


main : Program Never
main =
  runSuite tests
