#!/bin/bash

#set -x

export __dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file_to_change in $(cd ..; find ./ -name *.proto | grep -v $(basename ${__dir}))
do
	export file_to_copy=$(find ${__dir} -name $(basename ${file_to_change}))
	if [ -n "${file_to_copy}" ]
	then
		echo "cp ${file_to_copy} ../${file_to_change}"
		cp ${file_to_copy} ../${file_to_change}
	fi
done
