# devops-recipe-vagrant-master-slave-template

With the help of this template you will be able to deploy VM's on your local using vagrant

This are the components as part of deployment

_______________________
|                     |
|	Leader-1          |
|	RAM:512           |
|	IP:10.1.42.11     |
|   SSH_PORT:22011    |
|_____________________|
_______________________
|                     |
|	Worker-1    	  |
|	RAM:512			  |
|	IP:10.1.42.12     |
|   SSH_PORT:22012	  |
|_____________________|
_______________________
|                     |
|	Worker-1    	  |
|	RAM:512			  |	
|	IP:10.1.42.13     |
|   SSH_PORT:22013	  |
|_____________________|
_______________________
|                     |
|	Worker-1    	  |
|	RAM:512			  |
|	IP:10.1.42.14     |
|   SSH_PORT:22014	  |
|_____________________|

## Vagrant Provisioning

**Requirements**

- Ansible
- Vagrant
- [Vagrant::Hostupdater](https://github.com/cogitatio/vagrant-hostsupdater)

**Running**
setup.sh will install required tools
 `./setup.sh`

copy you public ssh key so that you can access it from your local

`cp ~/.ssh/id_rsa.pub .`

Run `vagrant status`
```
Leader                    not created (virtualbox)
Slave1                    not created (virtualbox)
Slave2                    not created (virtualbox)
Slave3                    not created (virtualbox)
```

Run `Vagrant up`

Now check status by running  `vagaant status`

```
Leader                    Running (virtualbox)
Slave1                    Running (virtualbox)
Slave2                    Running (virtualbox)
Slave3                    Running (virtualbox)
```

Run `vagrant ssh-config Leader`

To check the details of ssh configuration e.g. IP and port

