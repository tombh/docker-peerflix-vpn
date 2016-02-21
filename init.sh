#!/usr/bin/env sh

# Fail the entire script if any command fails
set -e

if [ $# -eq 0 ]; then
  echo "No arguments supplied"
  exit 1
fi

peerflix $1
