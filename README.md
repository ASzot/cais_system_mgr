# CAIS++ GPU Server Manager
Managing scripts and information for the CAIS++ GPU servers 

## Server Connection Info
- Dick: 68.181.99.174
  - Two TitanX GPUs
  - 1TB SSD
  - i7 7700K CPU
  - 32GB RAM
- Bruce: 68.181.99.165
  - Two TitanX GPUs
  - 1TB SSD
  - i7 7700K CPU
  - 32GB RAM


## Usage
If you don't know what you're doing with working on remote machines please see
the "Getting Started" section first.

### General
Please follow these rules.
- Contact Andrew Szot if you need sudo for anything. 
- Running programs:
  - **If you are running a deep learning program always check that nobody else is using the GPU you want to use.** Use the command `nvidia-smi` to check GPU usage.
  - **Only run your programs on one GPU** This may require changing your code a
    little bit. Check this post out for how to use only certain GPUs
    https://github.com/keras-team/keras/issues/6031.
  - The bottleneck of both systems is the CPU. Don't run jobs that hog all of
    the CPU. Be careful about the number of cores you are using on some of the
    sklearn functions.
- Anaconda:
  - Every user shares the **same** Anaconda distribution. That means everyone has
    same environments. So if you're using an environment at the same time as
    someone else watch out for installs. 
  - All servers have a conda environment named `tf` do NOT install any packages
    to this environment. This environment is a base keras/tensorflow
    environment. I hope to keep it updated with everything a project should
    need. 
  - All servers also have a conda environment named `pt` for PyTorch. 
  - Don't use virtualenv or pip install anything without being in a conda
    environment.
- Data
  - The folders that you should be using are `/home/yourusername` (the starting
    directory), `/hdd/datasets` and `/hdd/users/yourusername`.  
  - `/hdd/datasets` is a public place to keep datasets for everyone to use. For
    instance if you want to use the CIFAR dataset first check that it doesn't
    already exist in `/hdd/datasets` and if doesn't download it there so other
    people can use it once you're done. If you're doing some sort of data
    preprocessing and need to save an altered version of a dataset my idea was
    that you would save that to `/hdd/yourusername`. This directory was
    intended to be a place for you to keep datasets specific to you. 

I'm sure problems will come up with people all using the same computer so if
you're having any difficulties just contact me. 

### Getting Started
These GPUs are avaliable for use on CAIS++ projects. The first thing you need
is a user account. If you need a user account just message Andrew Szot on
Slack with the username that you want along with your ssh public key. You
will be able to log into all of the CAIS++ machines with this same account (you
don't need to specify a password because of your ssh key). 

### Connecting to the Machine
**Only read this section if you don't know how to work on a remote
machine**

Now that you have your username you are ready to connect to a
machine. Go to the "servers" section of this README for the list of servers
that you can connect to. Maybe check the "servers" slack channel for
server avaliability. Now you have an IP that you want to connect to.

There are a couple of different ways of actually working and running scripts on
a remote machine. 

The easiest way is to get a SFTP client. This will allow you to transfer files
on your compute to the remote computer over SFTP (file transfer over SSH). For
Mac I recommend [Cyberduck](https://cyberduck.io/?l=en). For Windows I
recommend [Filezilla](https://filezilla-project.org/). You should be able to
connect and see the remote machine file system as well as your own file system
on both of these programs. I am not very familiar with Filezilla but I know
that on Cyberduck you can edit files on the remote computer's filesystem from a
local text editor like sublime or whatever you use. Or you can edit the files
on your computer and then drag and drop them onto the server filesystem. 

I would recommend not downloading big datasets to your personal computer and
then uploading them to the remote machine using SFTP. Use `wget`.

Now that your files are on the server you have to log onto the server to
actually run whatever programs you made and see the output. You have to log
into the server using SSH. If you're on Mac or Linux just use the SSH command
(`ssh yourusername@serverip`). You will then be prompted for your password. Of
course if you want you can add your public key on the remote machine so you
don't have to worry about typing your password every time. On Windows use
[PuTTY](http://www.putty.org/). Now that you're connected remotely to the
server you can use the command line like you normally would. 

An issue you will run into is everytime you close your laptop the SSH session
will close and your program will stop running. We want a way to keep the
program running even when you are logged out. For that use tmux session.
- `tmux` to start a tmux session. 
- Run your script. 
- Close your computer or whatever. 
- Log back in to the remote machine. 
- `tmux ls` to see active tmux sessions. You should see a session from earlier.
- `tmux a -t 0` to attach to the first tmux session from the `tmux ls` list.
- Your program will still be running and you can see the output of it!

