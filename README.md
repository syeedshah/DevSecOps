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

## DefectDojo slack integration
**Slack**

1. Create a Slack app if you don't already have one, or select an existing app that you've created.
https://api.slack.com/apps
2. Click on the OAuth & permissions tab in the left sidebar.
3. Below Bot token scopes, select scopes as listed for Defect Dojo. Then click on Add an OAuth scope.
https://defectdojo.readthedocs.io/en/latest/features.html?highlight=slack#slack-integration
4. Click on the App Home tab in the left sidebar to view the bot user and the configuration that you’ve added.

**Defect DOJO**
1. Configuration -> System Settings -> Check Enable Slack Notification
2. Create token from, for a bot from https://api.slack.com/tokens
3. Add Slack API Token and Channel Name and Slack username
4. Configuration -> Notifications -> Enable all events in Global and Personal Scope
