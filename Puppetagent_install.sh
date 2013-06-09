masterip=192.168.1.10
agentip=192.168.1.11
domain="vagrantenv.com"
dns="8.8.8.8"

# Disable Iptables
service iptables save
service iptables stop
chkconfig iptables off

# Update /etc/hosts with master and agent's details
echo "$masterip  puppet puppet.$domain" >>/etc/hosts		
echo "$agentip  client  client.$domain" >>/etc/hosts
echo "search $domain" >/etc/resolv.conf			 	
echo "nameserver $dns" >>/etc/resolv.conf

#Install puppet 

rpm -Uvh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/5/i386/epel-release-5-4.noarch.rpm
yum install puppet -y
# Update /etc/hosts with master and agent's details
echo "server = puppet.$domain" >>/etc/puppet/puppet.conf 	 
/etc/init.d/puppet start					
