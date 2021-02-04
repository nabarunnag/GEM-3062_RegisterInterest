#!/bin/bash
#develop
export GFSH=/home/nabarun/Development/geodeDevelopement/geode/geode-assembly/build/install/apache-geode/bin/gfsh
#9.9.5
#export GFSH=/home/nabarun/Downloads/pivotal-gemfire-9.9.5/bin/gfsh
#9.10
#export GFSH=/home/nabarun/Downloads/pivotal-gemfire-9.10.5/bin/gfsh
#1.13.1
#export GFSH=/home/nabarun/Downloads/apache-geode-1.13.1/bin/gfsh

export server_xml=/home/nabarun/Development/GEM-3062_RegisterInterest/cacheXML/server.xml

rm -Rf locator* server*

function start_locator() {
	echo [`date '+%F %T'`]: "Starting locators..."
	$GFSH -e "start locator --name=locator1 --port=10334 --J=-Dgemfire.locators[10334] --J=-Dgemfire.jmx-manager-start=true --J=-Dgemfire.jmx-manager-port=1080 --J=-Dgemfire.jmx-manager-http-port=7070"
	echo [`date '+%F %T'`]: "Started locators!"
}

function start_servers() {
	echo [`date '+%F %T'`]: "Starting servers..."
	$GFSH -e "connect --locator=localhost[10334]" -e "start server --name=server1 --locators=localhost[10334] --server-port=40404 --cache-xml-file=$server_xml"
	$GFSH -e "connect --locator=localhost[10334]" -e "start server --name=server2 --locators=localhost[10334] --server-port=40405 --cache-xml-file=$server_xml"
	echo [`date '+%F %T'`]: "Started servers!"
}

function put_entry() {
	echo [`date '+%F %T'`]: "Putting an entry..."
	$GFSH -e "connect --locator=localhost[10334]" -e "put --region=/People --key=('key1') --value('value1')" -e "put --region=/People --key=('key1') --value=('value2')" -e "put --region --key=('key1') --value=('value2')"
	echo [`date '+%F %T'`]: "Puts completed!"
}

start_locator

start_servers




