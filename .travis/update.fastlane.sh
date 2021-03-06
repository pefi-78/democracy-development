#!/bin/bash

# Usage description
usage() { echo "Usage: $0 [-d <string>]" 1>&2; exit 1; }

# Parse Options
while getopts ":d:" o; do
    case "${o}" in
        d)
            directory=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${directory}" ]; then
    usage
fi

cd client/${directory}
gem update --system
bundle install
bundle update fastlane
cd ../../