#!/usr/bin/env bash
ping -i 2 pepernoot 2>&1 | perl -nle 'print scalar(localtime), " ", $_'

