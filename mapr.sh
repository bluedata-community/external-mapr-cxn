cat << EOF > /etc/yum.repos.d/maprtech.repo
[maprtech]
name=MapR Technologies
baseurl=http://package.mapr.com/releases/v6.1.0/redhat/
enabled=1
gpgcheck=0
protect=1
[maprecosystem]
name=MapR Technologies
baseurl= http://package.mapr.com/releases/MEP/MEP-6.2.0/redhat
enabled=1
gpgcheck=0
protect=1
EOF
yum --enablerepo=extras install epel-release -y
sudo rpm --import http://package.mapr.com/releases/pub/maprgpg.key
sudo yum install mapr-client.x86_64 java-1.8.0-openjdk -y
useradd mapr
/opt/mapr/server/configure.sh -N bd.demo.cluster -c -secure -C 10.20.1.15
cp /bd-fs-mnt/mapr/share/ssl_truststore /opt/mapr/conf
chmod 444 /opt/mapr/conf/ssl_truststore
chown mapr:mapr /opt/mapr/conf/ssl_truststore
