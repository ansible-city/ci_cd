#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
. ${DIR}/base.sh

function main {
    for role in ${ROLES}; do
        info "Checking ${role}"
        print_branches ${role}
    done
}

function print_branches {
    local role=$1
    local CHECK_DEVELOP="x"
    local CHECK_MASTER="x"
    local hash_master=""
    local hash_develop=""

    git --git-dir=${DIR}/../${role}/.git fetch --prune
    BRANCHES=`git --git-dir=${DIR}/../${role}/.git branch -a`
    ORIGIN=`echo "${BRANCHES}" \
        | grep "remotes/origin" \
        | sed 's/remotes\/origin\/\(.*\)/\1/'`

    hash_v10=`git --git-dir=${DIR}/../${role}/.git log -n1 --format=%h v1.0`

    echo "${ORIGIN}" | grep develop &> /dev/null
    if [ $? -eq 0 ]; then
        CHECK_DEVELOP="✔";
        hash_develop=`git --git-dir=${DIR}/../${role}/.git log -n1 --format=%h origin/develop`
    fi

    echo "${ORIGIN}" | grep master &> /dev/null
    if [ $? -eq 0 ]; then
        CHECK_MASTER="✔";
        hash_master=`git --git-dir=${DIR}/../${role}/.git log -n1 --format=%h origin/master`
    fi

    echo "
|  master | ${CHECK_MASTER} | ${hash_master}
| develop | ${CHECK_DEVELOP} | ${hash_develop}
|    v1.0 | - | ${hash_v10}
"
}

main "$@"
