#!/usr/bin/env bats

load ../test_helper

@test "valid Canary" {
  run kubeval "${FIXTURES}/valid.yaml"
  [[ $status -eq 0 ]]
  [[ $output = "PASS - ${FIXTURES}/valid.yaml contains a valid Canary (test.test)" ]]
}

@test "invalid Canary" {
  run kubeval "${FIXTURES}/invalid.yaml"
  [[ $status -eq 1 ]]
  [[ $output = "WARN - ${FIXTURES}/invalid.yaml contains an invalid Canary (test.test) - analysis: analysis is required" ]]
}
