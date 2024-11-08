#!/bin/bash
mno=$1

module_name="lm_sim_change"

process=$module_name.jar

pid=`ps -ef | grep $process | grep java | grep ${module_name}_${mno} | grep -v grep | awk '{print $2}'`

if [ "$pid" == "" ]
then

  echo "No process running for $module_name of operator $mno !!!"

else
  kill $pid
  echo "PID $pid for process $module_name of operator $mno is stopped !"

fi
