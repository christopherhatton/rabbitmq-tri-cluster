# Rabbitmq Three Node Cluster
This Vagrant box configures three nodes for use with Rabbitmq built upon CentOS from the following Vagrant image:
https://atlas.hashicorp.com/landregistry/boxes/centos

## Prerequisite
* Virtualbox
* Vagrant

## Start the environment
`vagrant up`

On starting the environment the `install.sh` script will configure the environment:
- run yum update
- install rabbitmq
- copy over the .erlang.cookie (from node one via the vagrant folder to node two then three)
- change the owner of the cookie
- start the rabbitmq-server `systemctl start rabbitmq-server`
- stop the RabbitMQ application i.e. `rabbitmqctl stop_app`
- join the node to the cluster `rabbitmqctl join_cluster rabbit@a`


## Failover Tutorial
After cloning the repo to your machine start the virtual machines:

`vagrant up`

To access the nodes:

To access the first node: `vagrant ssh A`

To access the second node: `vagrant ssh B`

To access the third node: `vagrant ssh C`


## Further Information

I used the following as resources:

https://www.rabbitmq.com/clustering.html



## Issues

Where's the fun in telling you :)
