#!/bin/bash
set -x
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
  mkdir -p $log_path
  echo "Starting ${module_name} module for operator $mno ..."

 java -Dlog4j.configurationFile=file:./log4j2.xml -Dlog.level=${log_level} -Dlog.path=${log_path} -Dmodule.name=${module_name}_${mno} -jar $build --spring.config.location=file:./application_${mno}.properties,file:${commonConfigurationFile} 1>/dev/null 2>>${log_path}/${module_name}_${mno}.error &

fi
