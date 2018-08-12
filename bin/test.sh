#!/bin/sh

hanami db prepare || exit 1
rspec || exit 1
bundle audit update || exit 1
bundle audit check || exit 1

# RuboCop is currently disabled because of issue with ruby-2.5:alpine image
# 1. https://github.com/docker-library/ruby/issues/196
# 2. https://github.com/rubocop-hq/rubocop/issues/5341
# rubocop -DS --force-exclusion -c .rubocop.yml -d -E
