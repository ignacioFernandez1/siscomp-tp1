#!/bin/bash

assert_equals () {
  if [ "$1" = "$2" ]; then
    echo -e "$Green $Check_Mark Success $Color_Off"
  else
    echo -e "$Red Failed $Color_Off"
    echo -e "$Red Expected -$1- to equal -$2- $Color_Off"
    Errors=$((Errors  + 1))
    exit 1
  fi
}

# testing suma entera simple
response=$(./calc 2 + 2)
assert_equals "$response" 4

#testing suma binaria simple
response=$(./calc b01 + b01)
assert_equals "$response" "0b10"

#testing resta entera simple
response=$(./calc 5 - 3)
assert_equals "$response" 2

#testing resta binaria simple
response=$(./calc b110 - b10)
assert_equals "$response" "0b100" 