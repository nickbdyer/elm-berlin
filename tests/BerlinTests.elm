module RomansTests exposing (..)

import Berlin exposing (..)
import ElmTest exposing (..)
import Date

tests =
  suite "Berlin Clock Test"
    [ 
      test 
      "Given a time 00:00:00, the single minutes row has 0 illuminations" 
      <| assertEqual 0 (Berlin.getSingleMinutes("1970/01/01 00:00:00"))

    , test 
      "Given a time 00:01:00, the single minutes row has 1 illuminations" 
      <| assertEqual 1 (Berlin.getSingleMinutes("1970/01/01 00:01:00"))

    , test 
      "Given a time 00:02:00, the single minutes row has 2 illuminations" 
      <| assertEqual 2 (Berlin.getSingleMinutes("1970/01/01 00:02:00"))

    , test 
      "Given a time 00:03:00, the single minutes row has 3 illuminations" 
      <| assertEqual 3 (Berlin.getSingleMinutes("1970/01/01 00:03:00"))

    , test 
      "Given a time 00:04:00, the single minutes row has 4 illuminations" 
      <| assertEqual 4 (Berlin.getSingleMinutes("1970/01/01 00:04:00"))

    , test 
      "Given a time 00:05:00, the single minutes row has 0 illuminations" 
      <| assertEqual 0 (Berlin.getSingleMinutes("1970/01/01 00:05:00"))

    , test 
      "Given a time 00:39:00, the single minutes row has 4 illuminations" 
      <| assertEqual 4 (Berlin.getSingleMinutes("1970/01/01 00:39:00"))

    , test 
      "Given a time 00:00:00, the single hours row has 0 illuminations" 
      <| assertEqual 0 (Berlin.getSingleHours("1970/01/01 00:00:00"))

    , test
      "Given a time 01:00:00, the single hours row has 1 illuminations" 
      <| assertEqual 1 (Berlin.getSingleHours("1970/01/01 01:00:00"))

    , test 
      "Given a time 02:00:00, the single hours row has 2 illuminations" 
      <| assertEqual 2 (Berlin.getSingleHours("1970/01/01 02:00:00"))

    , test 
      "Given a time 03:00:00, the single hours row has 3 illuminations" 
      <| assertEqual 3 (Berlin.getSingleHours("1970/01/01 03:00:00"))

    , test 
      "Given a time 04:00:00, the single hours row has 4 illuminations" 
      <| assertEqual 4 (Berlin.getSingleHours("1970/01/01 04:00:00"))

    , test 
      "Given a time 05:00:00, the single hours row has 0 illuminations" 
      <| assertEqual 0 (Berlin.getSingleHours("1970/01/01 05:00:00"))

    , test 
      "Given a time 18:00:00, the single hours row has 4 illuminations" 
      <| assertEqual 3 (Berlin.getSingleHours("1970/01/01 18:00:00"))

    , test 
      "Given a time 00:00:00, the seconds lamp has 1 illumination" 
      <| assertEqual 1 (Berlin.getSeconds("1970/01/01 00:00:00"))

    ]


main : Program Never
main =
  runSuite tests
