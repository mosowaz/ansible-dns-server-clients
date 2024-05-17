## DNS Server installation and configuration

Run the following commands to install bind9 packages
```
$ sudo apt update && sudo apt dist-upgrade -y
$ sudo apt install bind9 bind9utils dnsutils
```

Modify the name.conf configuration file to include your zones
```
$ sudo vim /etc/bind/named.conf
```
Copy items in named.conf into this file.

Create zone file (Forward and Reverse), and fill them with the respective files.
```
$ sudo vim /etc/bind/mytechlab.com
```
and
```
$ sudo vim /etc/bind/10.0.0.rev
```

## Modify the resolv.conf file in each server

`$ sudo vim /etc/resolv.conf`

Fill the resolv.conf file with the contents bellow
```
nameserver 10.0.0.10
nameserver 8.8.8.8
search mytechlab.com
```

Verify DNS service is working by pinging each node with thier hostname
i.e ping master1, ping haproxy

Or you can use the "host",  "dig", and "nslookup" utility


