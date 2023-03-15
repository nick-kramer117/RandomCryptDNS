<h1 align="center">Hi there, I`m,
	<a href="https://notabug.org/Nick_Kramer" target="_blank">
	Nick Kramer.
	</a> 
</h1>

<h3 align="center"> Porject:  RandomCryptDNS </h3>

<p align="left">
	*Description: Simple Bash script for randomly selecting DNSCrypt 
		      and DoH server from your personal list.
</p>

`LICENCIA` = **GPLv3**, en la carpeta *src/* hay archivos bajo otras licencias libres.

### How does it work?  ###
* Install or build dnscrypt-proxy.
* Configure dnscrypt-proxy.
* Download this repository.
* Give chmod 777 access rights. ;)
* ListDNS.db sheet, specify actual proxy server 
  (name can be viewed in configuration file: 
  /etc/dnscrypt-proxy/dnscrypt-proxy.toml) and 
  change symbol * to > (change not actual in 
  reverse order).
* After these actions you can run this script.

**IMPORTANT:**The list path must not contain spaces.
  Example list of servers, file "ListDNS.db".
  Information about available public servers is 
  taken from: https://dnscrypt.info/public-servers
