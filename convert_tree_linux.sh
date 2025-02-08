#!/bin/bash
cd $(dirname $0)
git config core.autocrlf input
git rm -rf --cached .
git reset --hard
