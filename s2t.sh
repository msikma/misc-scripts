#!/usr/bin/env bash

USAGE="usage: s2t.sh \033[4mpattern\033[0m \033[4mspaces\033[0m (e.g. \033[32ms2t.sh *.php 4\033[0m)"
EXPLANATION="Converts tabs to spaces for all files in a directory tree."
ERROR=0

# Check if we have a first argument.
if [[ -z "$1" ]]; then
    echo -e $USAGE
    echo -e $EXPLANATION
    echo -e "\033[31merror: enter a file pattern, e.g. \"*.php\"\033[0m"
    exit 1
fi
# We require that the first argument starts with "*."
if [[ $1 != \*\.* ]]; then
    echo -e $USAGE
    echo -e $EXPLANATION
    echo -e "\033[31merror: enter a file pattern that starts with \"*.\", e.g. \"*.php\"\033[0m"
    exit 3
fi
# We also require a second argument for number of spaces.
if [[ -z "$2" ]]; then
    echo -e $USAGE
    echo -e $EXPLANATION
    echo -e "\033[31merror: enter the number of spaces to use, e.g. 4\033[0m"
    exit 2
fi
# Second argument should be a number.
if ! [[ $2 =~ ^-?[0-9]+$ ]]; then
    echo -e $USAGE
    echo -e $EXPLANATION
    echo -e "\033[31merror: second argument is not an int\033[0m"
    exit 4
fi

# Perform substitution.
find . -name "$1" ! -type d -exec bash -c 'expand -t 4 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
exit 0
