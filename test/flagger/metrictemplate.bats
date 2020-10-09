#!/usr/bin/env bats

load ../test_helper

@test "valid MetricTemplate" {
  run kubeval "${FIXTURES}/valid.yaml"
  [[ $status -eq 0 ]]
  [[ $output = "PASS - ${FIXTURES}/valid.yaml contains a valid MetricTemplate (test.test)" ]]
}

@test "invalid MetricTemplate" {
  run kubeval "${FIXTURES}/invalid.yaml"
  [[ $status -eq 1 ]]
  [[ $output = "WARN - ${FIXTURES}/invalid.yaml contains an invalid MetricTemplate (test.test) - query: query is required" ]]
}
