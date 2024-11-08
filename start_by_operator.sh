#!/bin/bash

mno=$1

module_name="lm_sim_change"
main_module="list_management"          ## keep it empty "" if there is no main module 
log_level="INFO"        ## INFO, DEBUG, ERROR

########### DO NOT CHANGE ANY CODE OR TEXT AFTER THIS LINE #########

. ~/.bash_profile

build="${module_name}.jar"

status=`ps -ef | grep ${build} | grep ${module_name}_${mno}| grep java`

if [ "${status}" != "" ]  ## Process is currently running
then
  echo "${module_name} for operator $mno already started..."

else  ## No process running
 
  if [ "${main_module}" == "" ]
  then
     build_path="${APP_HOME}/${module_name}_module"
     log_path="${LOG_HOME}/${module_name}_module"
  else
     build_path="${APP_HOME}/${main_module}_module/${module_name}"
     log_path="${LOG_HOME}/${main_module}_module/${module_name}"
  fi

  cd ${build_path}

  ## Starting the process

  echo "Starting ${module_name} module for operator $mno ..."

 java -Dlog4j.configurationFile=file:./log4j2.xml -Dlog_level=${log_level} -Dlog_path=${log_path} -Dmodule_name=${module_name}_${mno} -jar $build --spring.config.location=file:./application_${mno}.properties,file:${commonConfigurationFile} 1>/dev/null 2>${log_path}/${module_name}_${mno}.error &


fi

# java -Dlog4j.configurationFile=file:./log4j2_$1.xml -jar $build --spring.config.location=file:/u01/eirsapp/configuration/configuration.properties,file:./application_$1.properties 1>/dev/null 2>/dev/null &
