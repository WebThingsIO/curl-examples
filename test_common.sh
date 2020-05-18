#!/usr/bin/env bats

source ./common.sh

JSON='{"jwt": "hello world"}'
@test "test hello world returned" {
    hello=$(get_value)
    [[ ${hello} == "hello world" ]]
}

URL='http://hello-world.com'
@test "test http://hello-world.com returned" {
    url=$(get_url)
    [[ ${url} == "http://hello-world.com" ]]
}