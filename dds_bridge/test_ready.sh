#!/bin/bash

while ! tail ~/bridgelog.log | grep -q 'DDS Bridge Ready'; do
    echo "Waiting for DDS Bridge...";
    sleep 3.0
done

sleep 2.0

echo "DDS Bridge READY! Sending ready signal to GGS..."

nc -lkp 8881

echo "GGS container confirmation received."
