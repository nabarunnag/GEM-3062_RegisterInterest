#!/bin/bash

#develop
export GFSH=/home/nabarun/Development/geodeDevelopement/geode/geode-assembly/build/install/apache-geode/bin/gfsh
#9.9
#export GFSH=/home/nabarun/Downloads/pivotal-gemfire-9.9.5/bin/gfsh
#9.10
#export GFSH=/home/nabarun/Downloads/pivotal-gemfire-9.10.5/bin/gfsh
#1.13
#export GFSH=/home/nabarun/Downloads/apache-geode-1.13.1/bin/gfsh

function put_entry() {
        echo [`date '+%F %T'`]: "Putting an entry..."
        $GFSH -e "connect --locator=localhost[10334]" -e "put --region=/People --key=('key1') --value=('value1')" -e "put --region=/People --key=('key1') --value=('value2')" -e "put --region=/People --key=('key1') --value=('value2')"
        echo [`date '+%F %T'`]: "Puts completed!"
}

put_entry


