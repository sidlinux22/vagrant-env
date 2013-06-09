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
#Put the autosign config in Master VM 
echo "*.$domain" >>/etc/puppet/autosign.conf

#Installing Puppet Master

rpm -Uvh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/5/i386/epel-release-5-4.noarch.rpm
yum -y install puppet-server				
# Move the puppet modules from shared folder to where they should be
cp -rf /vagrant/modules/ /vagrant/manifests/ /etc/puppet/ 
/etc/init.d/puppetmaster start
