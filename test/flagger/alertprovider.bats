#!/usr/bin/env bats

load ../test_helper

@test "valid AlertProvider" {
  run kubeval "${FIXTURES}/valid.yaml"
  [[ $status -eq 0 ]]
  [[ $output = "PASS - ${FIXTURES}/valid.yaml contains a valid AlertProvider (test.test)" ]]
}

@test "invalid AlertProvider" {
  run kubeval "${FIXTURES}/invalid.yaml"
  [[ $status -eq 1 ]]
  [[ $output = "WARN - ${FIXTURES}/invalid.yaml contains an invalid AlertProvider (test.test) - spec.address: Invalid type. Expected: string, given: object" ]]
}
