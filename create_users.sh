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

create_user_account () {
  username=$1
  password=$2

  sudo adduser $username --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
  echo "$username:$password" | sudo chpasswd
  mkdir -p /hdd/users/$username
}

create_user_account $1 $2

sudo chown -R $USER:$USER /home/$1/
