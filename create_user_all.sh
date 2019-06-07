#!/bin/bash
if [ -z "$1" ]
  then
    echo "Must specify username"
    exit 1
fi

rand_pass=$(openssl rand -base64 9)
echo $rand_pass
username=$1
# List all servers here.

declare -a servers=('seg@seg.cais.plus' 'fault@fault.cais.plus')
for i in "${servers[@]}"
do
  echo "$i"

  read -p "Continue [Y/n]?" confirm

  while [[ $confirm = [yY] ]]
  do
    ssh -t $i "cd cais_system_mgr && git fetch origin master && sh ~/cais_system_mgr/create_users.sh $username $rand_pass"
    read -p "Continue [Y/n]?" confirm
  done

done

echo $rand_pass
