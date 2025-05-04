#!/bin/bash
set -e

mkdir -p .qa/phpstan

if [ ! -f .qa/phpstan/phpstan.neon ]; then
    cp /src/default/phpstan.neon .qa/phpstan/phpstan.neon
fi

CONFIG_FILE="${PHPSTAN_CONFIG:-.qa/phpstan/phpstan.neon}"
MEMORY_LIMIT="${PHPSTAN_MEMORY_LIMIT:-1G}"

/app/phpstan.phar analyse \
    --configuration="$CONFIG_FILE" \
    --memory-limit="$MEMORY_LIMIT" \
    --ansi
