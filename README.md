# Elm Berlin Clock Kata 

[![Build Status](https://travis-ci.org/nickbdyer/elm-berlin.svg?branch=master)](https://travis-ci.org/nickbdyer/elm-berlin)

This repository contains the TDD Kata Berlin Clock. I am using it to
familiarise myself with the syntax of Elm. 

## Running The Test Suite

### Clone the Repo

```
$ git clone git@github.com:nickbdyer/elm-berlin.git
```

### Install Packages

Install [Elm](http://elm-lang.org/).

```
$ cd elm-koans

$ elm-package install
```

### Run Tests

```
$ elm-make --yes --output test.js tests/Tests.elm; node test.js
```
