#!/usr/bin/env bash

set -e

echo "keep release number: $1"

echo "cleaning up buckets"

rm `ls -t | awk 'NR>$KEEP_RELEASE_NR'`