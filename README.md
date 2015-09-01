# Rabbitmq Three Node Cluster
This Vagrant box configures three nodes for use with Rabbitmq
## Prerequisite
* Virtualbox
* Vagrant

## Start the environment
`vagrant up`

On starting the environment the `install.sh` script will configure the environment:
- run yum update
- install rabbitmq
- copy over the .erlang.cookie


## Failover Tutorial
After cloning the repo to your machine start the virtual machines:

`vagrant up`

To access the nodes:

To access the first node: `vagrant ssh A`

To access the second node: `vagrant ssh B`

To access the third node: `vagrant ssh C`

Besure to copy over the .erlang.cookie to the relevant directory

## Further Information

I used the following as resources:

https://www.rabbitmq.com/clustering.html




## Issues

Where's the fun in telling you :)
