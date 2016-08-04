module RomansTests exposing (..)

import Berlin exposing (..)
import ElmTest exposing (..)
import Date

tests =
  suite "Berlin Clock Test"
    [ 
      test 
      "Given a time 00:00:00, the single minutes row has 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getSingleMinutes(0))

    , test 
      "Given a time 00:03:00, the single minutes row has 3 illuminations" 
      <| assertEqual "YYYO" (Berlin.getSingleMinutes(3))

    , test 
      "Given a time 00:05:00, the single minutes row has 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getSingleMinutes(5))

    , test 
      "Given a time 00:00:00, the single hours row has 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getSingleHours(0))

    , test 
      "Given a time 03:00:00, the single hours row has 3 illuminations" 
      <| assertEqual "RRRO" (Berlin.getSingleHours(3))

    , test 
      "Given a time 05:00:00, the single hours row has 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getSingleHours(5))

    , test 
      "Given a time 00:00:00, the seconds lamp has 1 illumination" 
      <| assertEqual "R" (Berlin.getSeconds(0))

    , test 
      "Given a time 00:00:01, the seconds lamp has 0 illuminations" 
      <| assertEqual "O" (Berlin.getSeconds(1))

    , test 
      "Given a time 00:00:02, the seconds lamp has 1 illumination" 
      <| assertEqual "R" (Berlin.getSeconds(2))

    , test 
      "Given a time 00:00:59, the seconds lamp has 0 illuminations" 
      <| assertEqual "O" (Berlin.getSeconds(59))

    , test 
      "Given a time 00:00:00, the five minutes lamps have 0 illuminations" 
      <| assertEqual "OOOOOOOOOOO" (Berlin.getFiveMinutes(0))

    , test 
      "Given a time 00:04:00, the five minutes lamps have 0 illuminations" 
      <| assertEqual "OOOOOOOOOOO" (Berlin.getFiveMinutes(4))

    , test 
      "Given a time 00:14:00, the five minutes lamps have 2 illuminations" 
      <| assertEqual "YYOOOOOOOOO" (Berlin.getFiveMinutes(14))

    , test 
      "Given a time 00:59:00, the five minutes lamps have 11 illuminations" 
      <| assertEqual "YYRYYRYYRYY" (Berlin.getFiveMinutes(59))

    , test 
      "Given a time 00:00:00, the five hours lamps have 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getFiveHours(0))

    , test 
      "Given a time 04:00:00, the five hours lamps have 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getFiveHours(4))

    , test 
      "Given a time 14:00:00, the five hours lamps have 2 illuminations" 
      <| assertEqual "RROO" (Berlin.getFiveHours(14))

    , test 
      "Given a time 23:00:00, the five hours lamps have 4 illuminations" 
      <| assertEqual "RRRR" (Berlin.getFiveHours(23))

    , test 
      "Given a time 00:00:00, the clock will show ROOOOOOOOOOOOOOOOOOOOOOO" 
      <| assertEqual "ROOOOOOOOOOOOOOOOOOOOOOO" (Berlin.getClock("1970/01/01 00:00:00"))

    , test 
      "Given a time 23:59:59, the clock will show ORRRRRRROYYRYYRYYRYYYYYY" 
      <| assertEqual "ORRRRRRROYYRYYRYYRYYYYYY" (Berlin.getClock("1970/01/01 23:59:59"))

    , test 
      "Given a time 16:50:06, the clock will show RRRROROOOYYRYYRYYRYOOOOO" 
      <| assertEqual "RRRROROOOYYRYYRYYRYOOOOO" (Berlin.getClock("1970/01/01 16:50:06"))

    , test 
      "Given a time 11:37:01, the clock will show ORROOROOOYYRYYRYOOOOYYOO" 
      <| assertEqual "ORROOROOOYYRYYRYOOOOYYOO" (Berlin.getClock("1970/01/01 11:37:01"))

    ]


main : Program Never
main =
  runSuite tests
