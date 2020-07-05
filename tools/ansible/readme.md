## ATTN (for Ubuntu 18.04):
Follow these directions to install Ansible on your personal Ubuntu machine to be able to use Ansible to configure your deployment server (ie, where your host your FFXI server).

##Setting Up Personal Computer

 **Install Ansible**
 
First we need to install Ansible on our personal computer, then we will run playbooks from our personal computer to configure our server (or any number of servers).

 `$ sudo apt update`

 `$ sudo apt upgrade -y`

 `$ sudo apt install software-properties-common`
 
 `$ sudo apt-add-repository --yes --update ppa:ansible/ansible`
 
 `$sudo apt install ansible`
 
 **Install Python Passlib (optional)**
 
 This is only required to support the provision-user playbook. If you don't want to use that script, then you can pass on this step.
 
 `$ sudo apt update -y`
 
 `$ sudo apt install -y python-passlib`
 
 **Setup our SSH Keys**
 
 We will want to setup our server for password login with SSH (it just makes things easier).
 
 `$ ssh-keygen -t rsa -b 4096 -C "email@whatever.com"` (put your email in here)
 
 Presumably you were given a root user or a user with sudo and a password when you setup your server **(recommend not using root but a user with sudo permission)**.
 
 `$ ssh-copy-id user@address` (put your user and address, and then you will be prompted for a password)
 
 **Updating our local Ansible host file**
 
 Using your favorite text editor, open `tools/ansible/hosts`
 
 Scroll down to the bottom and see:

> [xiserver]
> {{ your server }} ansible_user={{ user }}

You'll want to change this to match your information, ie the user you setup an ssh key for above. For example, rebirth's looks like this

> [xiserver]
> 51.81.32.201 ansible_user=ubuntu

For you, it will be whatever user you added your ssh key to in the above step.

 ##[Playbook: provision-user.yaml]
 
 **Provisioning a new user**
  
 You may want to setup a development user or a non-root user on your server.
 For example, our developers have ssh users on our server and then use sshfs to mount the server filesystem
 on their local computer. This allows us to collaborate quickly / easily if need be, plus it provides an extra layer
 backup for files.
 
 For creating new users on the server, this playbook will help you do that.
 
 From the ansible directory(`cd tools/ansible/`), run the command below. 
 
 `ansible-playbook -i hosts provision-user.yaml`