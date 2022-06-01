#!/bin/bash

AR=( $(git branch --format="%(refname:short)"|tac) )
git branch -d ${AR[$1 - 1]}
