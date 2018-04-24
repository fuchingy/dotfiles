#!/bin/bash
#set -x

echo "# Lookup Changelist"
echo "  * Print changelist history"
echo "    > p4log -l"
echo "    > p4log"
echo "  * Print changelists between 2 CL"
echo "    > p4 changes ./...@1234,1238"

echo "# Lookup Client"
echo "    > p4 client -o"
