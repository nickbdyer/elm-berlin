module RomansTests exposing (..)

import Berlin exposing (..)
import ElmTest exposing (..)
import Date

tests =
  suite "Berlin Clock Test"
    [ 
      test 
      "Given a time 00:00:00, the single minutes row has 0 illuminations" 
      <| assertEqual 0 (Berlin.getSingleMinutes("00:00:00"))

    ]


main : Program Never
main =
  runSuite tests
