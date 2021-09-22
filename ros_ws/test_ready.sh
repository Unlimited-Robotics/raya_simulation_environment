#!/bin/bash

while ! tail ~/connlog.log | grep -q 'You can start planning now!'; do
    sleep 1.0
done

sleep 2.0

echo "Ra-Ya ROS Workspace READY! Sending ready signal to DDS Bridge container..."

nc -lkp 8880

echo "DDS Bridge container confirmation received."
