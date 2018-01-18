if [ -z "$1" ]
  then
    echo "Must specify username"
    exit 1
fi

username=$1

sudo userdel -r $1
rm -rf /hdd/users/$1

