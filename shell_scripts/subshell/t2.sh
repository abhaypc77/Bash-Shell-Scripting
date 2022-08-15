#!/bin/bash

echo "Subshell level  = $BASH_SUBSHELL"

outer_variable=Outer
echo "Main Shell:  outer_variable = $outer_variable"

(
echo "Subshell level INSIDE subshell = $BASH_SUBSHELL"
inner_variable=Inner

echo "Subshell: inner_variable = $inner_variable"
echo "Subshell: outer_variable = $outer_variable"
)

echo
echo

echo "Subshell level = $BASH_SUBSHELL"
echo "Main Shell:  outer_variable = $outer_variable"
echo "Main Shell: inner_variable = $inner_variable"

