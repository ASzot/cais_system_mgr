#!/bin/bash
if [ -z "$1" ]
  then
    echo "Must specify username"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "Must specify host username"
    exit 1
fi

rand_pass=$(openssl rand -base64 9)
echo $rand_pass
username=$1
# List all servers here.

declare -a servers=('68.181.99.173' '68.181.99.165')
for i in "${servers[@]}"
do
  echo "$i"

  read -p "Continue [Y/n]?" confirm

  while [[ $confirm = [yY] ]]
  do
    ssh -t $2@$i "cd cais_system_mgr && git fetch origin master && sh ~/cais_system_mgr/create_users.sh $username $rand_pass"
    read -p "Continue [Y/n]?" confirm
  done

done

echo $rand_pass
