#!/bin/sh
elm-make tests/BerlinTests.elm --yes --output tests.js && node tests.js

