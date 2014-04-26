#!/bin/bash

export __dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$#" -ne 2 ]
then
	echo "Usage: ${0} <type> <out_dir>"
	echo "Types: python, java, cpp"
	exit 1
fi

set -x

export __type=${1}
export __out_dir=${2}

# FIXME: escape __type from user hacks!

mkdir -p ${__out_dir}
protoc -I ${__dir} --${__type}_out=${__out_dir} ${__dir}/drivermsg.proto
for __module in $(ls ${__dir}/modules)
do
    protoc -I ${__dir} --${__type}_out=${__out_dir} ${__dir}/modules/${__module}
done
