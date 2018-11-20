# ROS
source /opt/ros/melodic/setup.bash

# ROS WS
ws_path=${HOME}/rosws
source ${ws_path}/devel/setup.bash

# DOMAIN
export DOMAIN_FOLDER=${ws_path}/src/cnc-turtlebots
export DOMAIN_CONFIG_FOLDER=${DOMAIN_FOLDER}/etc

#fancy prompt that also shows the current git branch
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \[\033[01;31m\]$(__git_ps1 "[%s]")\[\033[01;34m\]\$\[\033[00m\] '
