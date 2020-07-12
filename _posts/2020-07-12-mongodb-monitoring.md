---
layout: post
title: MongoDB Monitoring
subtitle: FILL THIS UP
category: [drafts] 
bigimg: 
- "/img/*.jpg" : "draft image"
tags: [drafts]
secret: false
---

DRAFT  

## Table Of Contents
{:.no_toc}
---
- TOC
{:toc}

## Queries

- db.currentOp()
- db.serverStatus()
- mongostat
- mongotop
- /var/mongodb/mongod.log
- db.aggregate([{$indexStats:{}}])
- rs.status()
- db.stats()
- db.collStats()



## mongodb collcan/slow-query/serverStatus in aws cloudwatch

### aws
- create log group and streams in cloudwatch
- create interface endpoint in vpc

### check mongodb logs enabled
sudo tail -f /var/log/mongodb/mongod.log

### setup pip3, deps and supervisor
type pip3
sudo apt install python3-pip
export LC_ALL=C
pip3 install boto3 pymongo

type supervisord
pip3 install supervisor
echo_supervisord_conf > supervisord.conf
vi supervisord.conf

### write the scripts

https://gist.github.com/FlameFractal/71c448fc7ae179f28d0451dc034fbbe6

vi mongodb-cloudwatch-logs.py
sudo python3 mongodb_logs_cloudwatch.py
vi mongodb-cloudwatch-status.py
sudo python3 mongodb_serverStatus_cloudwatch.py

### manage supervisor
sudo tail -f /var/log/mongodb/mongod.log | grep COLLSCAN

supervisord -c supervisord.conf
supervisorctl status
sudo supervisorctl -c supervisord.conf stop all
ps aux | grep 'supervisor\|monitoring'
sudo kill -s SIGTERM $(supervisorctl pid)
supervisorctl tail -50 mongodb-cloudwatch-status stderr
supervisorctl tail -50 mongodb-cloudwatch-logs stderr

### aws
- create metric filters
- create widgets in dashboard



## ec2 memory monitoring using cloudwatch agent

### download/install
sudo wget https://s3.ap-southeast-1.amazonaws.com/amazoncloudwatch-agent-ap-southeast-1/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
mkdir ~/.aws; vi ~/.aws/credentials; vi ~/.aws/config;

### configure options using wizard
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
sudo vi  /opt/aws/amazon-cloudwatch-agent/bin/config.json
less /opt/aws/amazon-cloudwatch-agent/doc/amazon-cloudwatch-agent-schema.json 

### start agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s
service amazon-cloudwatch-agent status



## grafana

- install grafana in kube cluster (either with prometheus-operator)
- add data source cloudwatch
- expose grafana using nginx or elb

### nginx way

grafana.sociolla.info ---(route53)--> 3.x.x.x --(ec2)--> prod-bastion --(nginx)--> worker-node-ip:grafana-port

### load balancer way

create elb service and attach external ip to route53

## mongodb log rotation (disk full)

```
sudo service mongod stop
sudo rm /var/log/mongodb/mongod.log
sudo service mongod start
sudo service mongod status
```

better alternative - let's look at log rotation

### Manually

`db.adminCommand({})` or `/bin/kill -SIGUSR1 $(pidof mongod)`


### Automatically (using linux logrotate utility)

- ensure these values in /etc/mongod.conf

```
    systemLog:
        destination: file
        logAppend: true
        logRotate: reopen
        path: /var/log/mongodb/mongod.log
    processManagement:
        pidFilePath: /var/run/mongodb/mongod.pid
```

- ensure the folders exist with correct permissions of user and group. 
- if your installation is not using `processManagement.pidFilePath`, use `$(pidof mongod)` in postRotate script

```
    pidof mongod
    sudo vi /etc/mongod.conf
    chown mongodb:mongodb /var/log/mongodb/
    chown mongodb:mongodb /var/run/mongodb/
```


- add to /etc/logrotate.d/mongod.conf

```
    sudo touch /etc/logrotate.d/mongod.conf
    sudo vi /etc/logrotate.d/mongod.conf
```

```
/var/log/mongodb/mongod.log {
  daily
  size 100M
  rotate 10
  dateext
  missingok
  compress
  delaycompress
  notifempty
  create 600 mongodb mongodb
  sharedscripts
  postrotate
    /bin/kill -SIGUSR1 $(pidof mongod) >/dev/null 2>&1
  endscript
}
```

- adjust logs monitoring python script to follow logRotated file
- restart mongodb service
- test logrotation and logs script

```
supervisorctl tail -50 mongodb-cloudwatch-logs stderr
vi monitoring-mongodb/mongodb-cloudwatch-logs.py 
kill -s SIGTERM $(supervisorctl pid)
supervisord -c monitoring-mongodb/supervisord.conf 
supervisorctl status

ls -lah /var/log/mongodb/
sudo service mongod stop
sudo service mongod start 
sudo service mongod status

sudo logrotate --force /etc/logrotate.d/mongod.conf
ls -lah /var/log/mongodb/
sudo tail -f /var/log/mongodb/mongod.log | grep COLLSCAN
```


if doing on a primary member of the replicaset, may need to reconfigure the set

```
rs.config()
rs.status()
rs.stepDown()
```


verify logrotate has run

```
cat /var/lib/logrotate/status | grep 'mongod.log'
ls -lah /var/log/mongodb/
```

### Options

- reopen vs rename
- create vs copytruncate
- pidof vs pidFilePath

here we chose the first ones
