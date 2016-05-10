#!/bin/bash

ROLES="datadog gocd_agent gocd_server java kafka nginx php \
    postgresql users_and_groups zookeeper"

C_RED=$(tput setaf 1)
C_GREEN=$(tput setaf 2)
C_RESET=$(tput sgr0)

function info { echo -e "\033[1;33m => $1\033[0m"; }
function ok { echo -e "\033[1;32m => $1\033[0m"; }
function error { echo -e "\033[1;31m => Error: $1\033[0m"; }

function echo_color { echo -e "${2}${1}${C_RESET}"; }
