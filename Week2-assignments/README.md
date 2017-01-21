# Week 2 - Hands-on assignmnets

Easy wins - Target is to create very simple reporting tool

## What is the problem to solve?

Have you ever replaced a broken switch with new one in a rack full of cables and the switch somewhere in the middle? Been there, seen that but still can't help you in the dirty work. However, my goal is to help you a bit still. 

What if you can have a reporting tool with following features:
* Collects Switchport status information (Up or Down) before and after replacement and shows the difference?
* Collects MAC-address table of the switch before and after replacement and shows the difference?

With this utility you will very quickly see:
* if all cables are plugged in as they were before changes
* if all cables are plugged in to the switchport they were before changes

## How to get MAC-address tables out from the devices?

I think the easiest way to get MAC-address tables in Ansible is using NAPALM. However I discovered a bug in NAPALM and need to wait for fix: [https://github.com/napalm-automation/napalm-ios/issues/104](https://github.com/napalm-automation/napalm-ios/issues/104)