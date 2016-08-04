module RomansTests exposing (..)

import Berlin exposing (..)
import ElmTest exposing (..)
import Date

tests =
  suite "Berlin Clock Test"
    [ 
      test 
      "Given a time 00:00:00, the single minutes row has 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getSingleMinutes("1970/01/01 00:00:00"))

    , test 
      "Given a time 00:03:00, the single minutes row has 3 illuminations" 
      <| assertEqual "YYYO" (Berlin.getSingleMinutes("1970/01/01 00:03:00"))

    , test 
      "Given a time 00:05:00, the single minutes row has 0 illuminations" 
      <| assertEqual "OOOO" (Berlin.getSingleMinutes("1970/01/01 00:05:00"))

    , test 
      "Given a time 00:00:00, the single hours row has 0 illuminations" 
      <| assertEqual 0 (Berlin.getSingleHours("1970/01/01 00:00:00"))

    , test 
      "Given a time 03:00:00, the single hours row has 3 illuminations" 
      <| assertEqual 3 (Berlin.getSingleHours("1970/01/01 03:00:00"))

    , test 
      "Given a time 05:00:00, the single hours row has 0 illuminations" 
      <| assertEqual 0 (Berlin.getSingleHours("1970/01/01 05:00:00"))

    , test 
      "Given a time 00:00:00, the seconds lamp has 1 illumination" 
      <| assertEqual 1 (Berlin.getSeconds("1970/01/01 00:00:00"))

    , test 
      "Given a time 00:00:01, the seconds lamp has 0 illuminations" 
      <| assertEqual 0 (Berlin.getSeconds("1970/01/01 00:00:01"))

    , test 
      "Given a time 00:00:02, the seconds lamp has 1 illumination" 
      <| assertEqual 1 (Berlin.getSeconds("1970/01/01 00:00:02"))

    , test 
      "Given a time 00:00:59, the seconds lamp has 0 illuminations" 
      <| assertEqual 0 (Berlin.getSeconds("1970/01/01 00:00:59"))

    , test 
      "Given a time 00:00:00, the five minutes lamps have 0 illuminations" 
      <| assertEqual 0 (Berlin.getFiveMinutes("1970/01/01 00:00:00"))

    , test 
      "Given a time 00:04:00, the five minutes lamps have 0 illuminations" 
      <| assertEqual 0 (Berlin.getFiveMinutes("1970/01/01 00:04:00"))

    , test 
      "Given a time 00:14:00, the five minutes lamps have 2 illuminations" 
      <| assertEqual 2 (Berlin.getFiveMinutes("1970/01/01 00:14:00"))

    , test 
      "Given a time 00:59:00, the five minutes lamps have 11 illuminations" 
      <| assertEqual 11 (Berlin.getFiveMinutes("1970/01/01 00:59:00"))

    , test 
      "Given a time 00:00:00, the five hours lamps have 0 illuminations" 
      <| assertEqual 0 (Berlin.getFiveHours("1970/01/01 00:00:00"))

    , test 
      "Given a time 04:00:00, the five hours lamps have 0 illuminations" 
      <| assertEqual 0 (Berlin.getFiveHours("1970/01/01 04:00:00"))

    , test 
      "Given a time 14:00:00, the five hours lamps have 2 illuminations" 
      <| assertEqual 2 (Berlin.getFiveHours("1970/01/01 14:00:00"))

    , test 
      "Given a time 23:00:00, the five hours lamps have 4 illuminations" 
      <| assertEqual 4 (Berlin.getFiveHours("1970/01/01 23:00:00"))

    ]


main : Program Never
main =
  runSuite tests
