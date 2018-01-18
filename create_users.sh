#!/bin/bash
# First argument is username to create.

if [ -z "$1" ]
  then
    echo "Must specify username"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "Must specify password"
    exit 1
fi


#rand_pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)

create_user_account () {
  username=$1
  password=$2

  sudo adduser $username --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
  echo "$username:$password" | sudo chpasswd
  mkdir /hdd/users/$username
}

create_user_account $1 $2
