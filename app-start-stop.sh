#!/bin/bash

sudo su - tomcat

# get hostname
export HOST=$(hostname)
export PARAMETER_NAME="/parameter/ec2/tomcatHome/${HOST}"

echo 'Getting TOMCAT_HOME from SSM'

# get tomcat home from ssm param against hostname
#export TOMCAT_HOME =  aws ssm get-parameter --name "/parameter/ec2/tomcatHome/"$HOST_NAME --profile ec2-role --region us-west-2
export TOMCAT_HOME=$(aws ssm get-parameter --name ${PARAMETER_NAME} --query "Parameter.Value" --profile ec2-role --region us-west-2)

echo ${TOMCAT_HOME}

# copy war file from /tmp to tomcat_home/webapps folder
mv /tmp/$WAR_FILE_NAME ${TOMCAT_HOME}/webapps/

# Stop Tomcat
${TOMCAT_HOME}/bin/app-shutdown.sh

# Wait for Tomcat to fully start (adjust the sleep duration based on your application's startup time)
sleep 60

# Start Tomcat
${TOMCAT_HOME}/bin/app-startup.sh

# Wait for Tomcat to fully start (adjust the sleep duration based on your application's startup time)
sleep 60



# Additional commands or configurations after Tomcat has started can be added here
# For example, you might want to tail the catalina.out log file for debugging:
# tail -f $TOMCAT_HOME/logs/catalina.out