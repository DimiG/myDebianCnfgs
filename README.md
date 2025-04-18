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
2.  Add user as `root` by:  
```
adduser new-user           # add user command
usermod -aG sudo new-user  # add your new user into sudo group
```
3.  Clone the current `repository` onto *fresh Debian server*, copy files from `root` folder into `root` home directory and other files (except sys_cnfgs and .git) into `user` root directory.  
4.  Try user as `root` by:  
```
su - new-user
```
5.  If everything is **OK** logout and login as `new-user`.  
6.  Then change `SSH` port onto new one (*ex. 2020*) and disable `root` login for `ssh` via `sshd_config` file:  
```
Port 2020
PermitRootLogin no
```
7.  Check from other terminal if U still have access to `server`. If **YES** you may `logoff` and `login` again.

### myDebianCnfgs folders

* `root`: This folder is intended for the [BASH][bash] shell configuration files of the Linux [Debian][debian] `root` user.  
* `sys_cnfgs`: This folder contains the Linux [Debian][debian] system configuration files, as well as user configuration files located in the `/etc` folder.  
* `.vim`: This folder contains a simplified configuration of the [Vim][vim] editor.  

`All`: **NOTE**
* Download the newly installed [Debian][debian] distribution and use these files instead of the installed ones.
I will try to automate this task a bit in the future.

***Requires :*** Fresh installed [Debian][debian] **Linux** [distro][distro].

`To be continued...`

### License

This code has been written by **©2025 DG**

[debian]:https://en.wikipedia.org/wiki/Debian
[bash]:https://en.wikipedia.org/wiki/Bash_(Unix_shell)
[zsh]:https://en.wikipedia.org/wiki/Z_shell
[distro]:https://en.wikipedia.org/wiki/Linux_distribution
[vim]:https://en.wikipedia.org/wiki/Vim_(text_editor)
