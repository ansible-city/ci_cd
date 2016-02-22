#!/bin/bash

function info { echo -e "\033[1;33m => $1\033[0m"; }
function ok { echo -e "\033[1;32m => $1\033[0m"; }
function error { echo -e "\033[1;31m => Error: $1\033[0m"; }

ROLES="datadog gocd_agent gocd_server java kafka nginx php \
    postgresql users_and_groups zookeeper"
