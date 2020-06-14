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

## Example pipeline

![gocd_pipeline](https://user-images.githubusercontent.com/11514346/84599383-8be41080-ae69-11ea-952c-51f2ad97f4eb.PNG)

### Toolchain
1. Planning - `OWASP ASVS`
2. CI/CD - `Go CD` 
3. secret-check - `trufflehog`
4. SCA - `safety`
5. SAST - `bandit`
6. DAST - `nikto`
7. Container Vulnerability Analysis - `trivy`
8. Vulnerability Manager - `DefectDojo`
9. Monitoring - `Slack`
10. Environment - `AWS`

### DefectDojo slack integration
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
