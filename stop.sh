#!/bin/bash

echo "Stoping lm_sim_change module for all operator....."

## Stop for cellcard operator ##
./stop_by_operator.sh cc

## Stop for smart operator ##
./stop_by_operator.sh sm

## Stop for seatel operator ##
./stop_by_operator.sh st

## Stop for metfone operator ##
./stop_by_operator.sh vt

