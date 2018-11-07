#!/bin/sh

hanami db prepare || exit 1
rspec || exit 1
bundle audit update || exit 1
bundle audit check || exit 1
rubocop -DS --force-exclusion -c .rubocop.yml -d -E || exit 1
