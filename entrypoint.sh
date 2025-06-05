#!/bin/sh
set -e

# Base command arguments for Wetty
COMMAND_ARGS="--port ${WETTY_PORT} --base ${WETTY_BASE_PATH}"

# Add username and password if both are provided
if [ -n "${WETTY_USER}" ] && [ -n "${WETTY_PASSWORD}" ]; then
  COMMAND_ARGS="${COMMAND_ARGS} --user ${WETTY_USER} --pass ${WETTY_PASSWORD}"
  echo "Wetty starting with basic authentication enabled for user: ${WETTY_USER}"
else
  echo "Wetty starting without basic authentication."
fi

# The final argument to wetty is the command it should serve (e.g., "ssh")
# "$@" allows passing additional arguments to the WETTY_COMMAND if needed from docker-compose command.
exec wetty ${COMMAND_ARGS} "${WETTY_COMMAND}" "$@"
