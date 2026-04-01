# Template-Samba4-AD
This is my personale Samba4 AD Template for Zabbix 7.4.8.
Tested on Debian 13, zabbix agent2, zabbix 7.4.8.

# Agent configuration
1) Copy samba4_ad.conf to zabbix_agent2.d folder and restart it:

```
cp samba4_ad.conf /etc/zabbix/zabbix_agent2.d/samba4_ad.conf
systemctl restart zabbix-agent2
```

4) Allow 'zabbix' user to run all commands without password:

```
cp zabbix-sudoers /etc/sudoers.d/zabbix
chmod 440 /etc/sudoers.d/zabbix
```

5) copy `samba4_ad.sh` to /usr/local/bin:

```
cp samba4_ad.sh /usr/local/bin/samba4_ad.sh
chmod 755 /usr/local/bin/samba4_ad.sh
```
