# gocd_demo

Tested on Ubuntu 18.04

![Alt text](/gocd.png)

## Installation
```
git clone <this repository link>
cd gocd_demo
sudo bash setup.sh
```

## Instructions

Running above commands should have started a gocd server and agent for you.


Check using following command
```
docker ps
```

Open up a browser and input your ubuntu host ip, with gocd run port (8153 for http, 8154 for https)
```
<ubuntu host ip>:8153
OR
<ubuntu host ip>:8154
```

Run the pipes you see, configure them, mix and match to create your pipelines.
