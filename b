#!/bin/bash

if [ "$#" -eq  "0" ]
then
   CUR_BR=$(git rev-parse --abbrev-ref HEAD)
   export AR=( $(git branch --format="%(refname:short)"|tac) )
   COUNTER=0

   for KEY in ${!AR[@]}
   do
      let COUNTER=COUNTER+1
      export b$COUNTER=${AR[$KEY]}
      [[ ${AR[$KEY]} == $CUR_BR ]] && echo -n '* ' || echo -n '  '
      echo [\$b$COUNTER] ${AR[$KEY]}
   done
else
    git co ${AR[$1 - 1]}
fi
