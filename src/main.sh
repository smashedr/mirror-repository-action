#!/usr/bin/env bash

set -e

echo "Running: ${0} as: $(whoami) in: $(pwd)"

echo "---------- GITHUB ----------"

echo "GITHUB_REF: ${GITHUB_REF}"
#echo "GITHUB_BASE_REF: ${GITHUB_BASE_REF}"
#echo "GITHUB_HEAD_REF: ${GITHUB_HEAD_REF}"
#echo "GITHUB_REF_NAME: ${GITHUB_REF_NAME}"
#echo "GITHUB_REPOSITORY: ${GITHUB_REPOSITORY}"
#echo "GITHUB_RUN_NUMBER: ${GITHUB_RUN_NUMBER}"
#echo "GITHUB_RUN_ATTEMPT: ${GITHUB_RUN_ATTEMPT}"
echo "GITHUB_REPOSITORY: ${GITHUB_REPOSITORY}"
echo "GITHUB_REPOSITORY_OWNER: ${GITHUB_REPOSITORY_OWNER}"

echo "---------- INPUTS ----------"

[[ -n "${INPUT_URL}" ]] && REMOTE_URL="${INPUT_URL}"
#echo "REMOTE_URL: ${REMOTE_URL}"
if [ -z "${INPUT_URL}" ];then
    HOST="${INPUT_HOST:?err}"
    echo "HOST: ${HOST}"
    OWNER="${INPUT_USER:-${GITHUB_REPOSITORY_OWNER}}"
    echo "OWNER: ${OWNER}"
    REPO="${INPUT_REPO:-$(echo "${GITHUB_REPOSITORY}" | awk -F'/' '{print $2}')}"
    echo "REPO: ${REPO}"
    REMOTE_URL="${HOST}/${OWNER}/${REPO}"
fi

echo -e "REMOTE_URL: \u001b[33;1m${REMOTE_URL}"

USERNAME="${INPUT_USERNAME:-${OWNER}}"
echo "USERNAME: ${USERNAME}"

echo "debug 1"
echo "INPUT_PASSWORD: ${INPUT_PASSWORD}"

PASSWORD="${INPUT_PASSWORD:?err}"
echo "PASSWORD: ${PASSWORD}"

echo "debug 2"
pwd
ls -lah

GIT_HOST=$(echo "${REMOTE_URL}" | awk -F'/' '{print $3}')
echo "GIT_HOST: ${GIT_HOST}"

git config --global --add safe.directory "$(pwd)"

git config --global credential.helper cache
git credential approve <<EOF
protocol=https
host=${GIT_HOST}
username=${USERNAME}
password=${PASSWORD}
EOF

#git clone https://codeberg.org/shaner/private.git
#ls -lah private

git status
git branch
git remote -v

BRANCH="$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)"
echo "BRANCH: ${BRANCH}"

git remote add mirror "${REMOTE_URL}" "${BRANCH}"

echo -e "\u001b[32;1mFinished Success."
