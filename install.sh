#!/usr/bin/env bash

if [[ $(id -u) != '0' ]]; then
  echo "You must run $0 as root!"
  exit 1
fi

cat << HOSTS_FILE >> /etc/hosts
192.168.33.11 node1 A
192.168.33.22 node2 B
192.168.33.33 node3 C
192.168.33.100 failover_ip Z
HOSTS_FILE

yum -q -y update
yum -q -y install rabbitmq-server.noarch

#Copy over the erland.cookie


if [ "$2" = "node1" ]; then
  systemctl start rabbitmq-server
  cp /var/lib/rabbitmq/.erlang.cookie /vagrant/erland.cookie
  rabbitmqctl cluster_status
fi

if [ "$2" = "node2" ]; then
  cp  /vagrant/erland.cookie /var/lib/rabbitmq/.erlang.cookie
  chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
  systemctl start rabbitmq-server
  rabbitmqctl stop_app
  rabbitmqctl join_cluster rabbit@a
fi

if [ "$2" = "node3" ]; then
  cp  /vagrant/erland.cookie /var/lib/rabbitmq/.erlang.cookie
  chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
  systemctl start rabbitmq-server
  rabbitmqctl stop_app
  rabbitmqctl join_cluster rabbit@a
fi
