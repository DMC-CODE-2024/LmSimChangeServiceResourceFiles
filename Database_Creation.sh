source ~/.bash_profile

source $commonConfigurationFilePath
dbDecryptPassword=$(java -jar  ${APP_HOME}/encryption_utility/PasswordDecryptor-0.1.jar spring.datasource.password)

mysql  -h$dbIp -P$dbPort -u$dbUsername -p${dbDecryptPassword} $appdbName <<EOFMYSQL


insert ignore into sys_param (description, tag, value, feature_name) SELECT 'The msisdn prefixes used to validate the dump files received from operators. The values can be comma-separated in case of multiple prefixes.', 'msisdnPrefix', '855', 'List Management' FROM dual WHERE NOT EXISTS ( SELECT * FROM sys_param WHERE tag = 'msisdnPrefix');
insert ignore into sys_param (description, tag, value, feature_name) SELECT 'The imsi prefixes used to validate the dump files received from operators. The values can be comma-separated in case of multiple prefixes.', 'imsiPrefix', '456', 'List Management' FROM dual WHERE NOT EXISTS ( SELECT * FROM sys_param WHERE tag = 'imsiPrefix');

insert ignore into cfg_feature_alert (alert_id, description, feature) values ("alert5400", "The Sim Change file not found at path <e> for operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5401", "The Sim Change file <e> does not contain new IMSI header for the operator <process_name>", "Sim_Change_Dump");
insert ignore into cfg_feature_alert (alert_id, description, feature) values ("alert5402", "The Sim Change file <e> does not contain old IMSI header for the operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5403", "The Sim Change file <e> does not contain MSISDN header for the operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5404", "The Sim Change file <e> does not contain sim_change_date header for the operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5405", "The Sim Change file <e> failed for new IMSI prefix validation for the operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5406", "The Sim Change file <e> failed for old IMSI prefix validation for the operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5407", "The Sim Change file <e> failed for msisdn prefix validation for the operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5408", "Null/Non-Numeric values exists in Sim Change file <e> for operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5409", "The Sim Change file <e> failed for uniqueness for new IMSI values for the operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5410", "The Sim Change file <e> failed for uniqueness for old IMSI values for the operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5411", "The process failed for Sim Change with an exception <e> for operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature)  values("alert5001", "The values for either IMSI Prefix or MSISDN prefix is missing in database.", "Sim_Change_Dump" );
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5412", "The Sim Change file <e> failed for unique values for MSISDN for operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5413", "Non-Numeric exists in Sim Change file <e> for operator <process_name>", "Sim_Change_Dump");
insert ignore  into cfg_feature_alert (alert_id, description, feature) values ("alert5414", "The Sim Change file <e> failed for uniqueness of records for operator <process_name>", "Sim_Change_Dump");

EOFMYSQL
