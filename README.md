myDebianCnfgs
=============
The repository contains the configuration files necessary to configure the [Debian][debian] [distribution][distro] for my tasks.

Project description
-------------------

### HOWTO

1.  Install [ZSH][zsh] on **Debian** as `root` by:  
```
apt update && apt install zsh zsh-autosuggestions zsh-syntax-highlighting
```
2.  I prefer **DON'T USE** **[sudo][sudo]** and use **[doas][doas]** instead. Install it by:  
```
apt install doas
```
3.  If you prefer you can create `doas.conf` file inside `/etc` folfer to control [doas][doas]:  
```
permit nopass keepenv :sudo
permit nopass :sudo as root cmd /usr/sbin/poweroff
permit nopass :sudo as root cmd /usr/sbin/reboot
```
4.  Add user as `root` by:  
```
adduser new-user           # add user command
```
```
usermod -aG sudo new-user  # add your new user into sudo group
```
5.  Clone the current `repository` onto *fresh Debian server*, copy files from `root` folder into `root` home directory and other files (except sys_cnfgs and .git) into `user` root directory.  
6.  Try user as `root` by:  
```
su - new-user
```
7.  If everything is **OK** logout and login as `new-user`.  
8.  Then change `SSH` port onto new one (*ex. 2020*) and disable `root` login for `ssh` via `sshd_config` file:  
```
Port 2020
PermitRootLogin no
```
9.  Now restart the `ssh server` as `root` by:  
```
systemctl restart sshd.service
```
10.  Connect from other `ssh` terminal and check if **U** still have access to `server`. If **YES** you may `logoff` and `login` again as `user`.  
11. For security reasons I suggest lock down the `ROOT` account by: `passwd -l root` and **DO NOT** login as `ROOT`.

### myDebianCnfgs folders

* `.vim`: This folder contains a simplified configuration of the [Vim][vim] editor.  
* `root`: This folder is intended for the [BASH][bash] shell configuration files of the Linux [Debian][debian] `root` user.  
* `sys_cnfgs`: This folder contains the Linux [Debian][debian] system configuration files, as well as user configuration files located in the `/etc` folder.  

`All`: **NOTE**
* Download the newly installed [Debian][debian] distribution and use these files instead of the installed ones.  
**Remember** *If U changed the ssh config port DO IT (!) when connect the server* by your ssh client.
* To login as `root` from `user` use: `doas su -` command.  
If you have `app-shells/bash-completion` installed add into `~/.bashrc`:  
```
complete -F _root_command doas
```
* Alternative that *doesn't require* `app-shells/bash-completion`. However this *doesn't complete arguments*, among other things:  
```
complete -cf doas
```
**P.S.** I will try to automate this task a bit in the future.

***Requires :*** Fresh installed [Debian][debian] **Linux** [distro][distro].

`To be continued...`

### License

This code has been written by **©2025 DG**

[debian]:https://en.wikipedia.org/wiki/Debian
[bash]:https://en.wikipedia.org/wiki/Bash_(Unix_shell)
[zsh]:https://en.wikipedia.org/wiki/Z_shell
[distro]:https://en.wikipedia.org/wiki/Linux_distribution
[vim]:https://en.wikipedia.org/wiki/Vim_(text_editor)
[sudo]:https://en.wikipedia.org/wiki/Sudo
[doas]:https://wiki.gentoo.org/wiki/Doas
