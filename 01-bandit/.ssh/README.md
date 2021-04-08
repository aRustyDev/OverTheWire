# ssh_config file
## Host Definition
This defines each host or type of host.   
This specific one will apply to ALL hosts
* **HostName** : the IP or URL of the target server
* **Port** : Sets the Port of the target server
* **LogLevel** : I set this to **INFO**, unless I start having issues connecting.
* **IdentityFile** : Specifies the Key file to use, I use this to help keep my personal SSH Keys from getting contaminated.
```bash
Host *
    HostName bandit.labs.overthewire.org
    Port 2220
    LogLevel INFO
    IdentityFile ./.ssh/id_rsa
```

Theres a number of Host definitions in the `config` file that I use to specify the user (banditXX)
```bash
Host lvl-00
    User bandit0  
```  