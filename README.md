# Workspace Scripts
## A Collection of scripts I used throughout my workday 
Feel free to use, edit and redistribute whatever comes up in this repository

### keep unlocked 
It sets a dot every minute to keep the computer unlocked (and show you online in MS Teams or others) for a given amount of minutes.
(Standard = 180)  

Usage:  
<code>
.\keep-unlocked.ps1 10  #keeps unlocked for ten minutes 
</code>

### ILO Silencer
[The Silence of the Fans](https://www.reddit.com/r/homelab/comments/hix44v/silence_of_the_fans_pt_2_hp_ilo_4_273_now_with/)
Give them some Credits!


This is just a little script I wrote for my HP Server with a custom ILOv4 Firmware 
I have some parts which HP does not recognize so I needed to turn down the fans manually.

This script just ssh´s to the remote host with the given username and then you can turn down the fans remote

I´d recommend adding your ssh key to the ilo instead of pasting your password for every command or rewrite the ssh command that it itself runs the loop. 

Usage:  
<code>
.\ilosilencer.ps1 remoteHost fanCount fanSpeed
</code>

### Remove Jetty Temp
I use VScode Community servers to debug my Java Backends with jetty 
Jetty will create a ton of temporary directories on each startup and does not clean them up properly on termination  
So this script is looking in the appdata/local/temp dir for directories starting with jetty and deletes them all recursivly 

Usage:  
<code>
.\remove-jetty-temp.ps1
</code>