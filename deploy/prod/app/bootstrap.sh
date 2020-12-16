#!/bin/bash
#
SERVICE="weblate"
ENV="prod"
USER="msaqibhashmi"
INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
HOSTNAME="$SERVICE-$ENV-web-v1.aws.$INSTANCE_ID"

# Add User
adduser -m $USER
usermod -aG adm $USER
usermod -aG wheel $USER
usermod -aG systemd-journal $USER
mkdir -p /home/$USER/.ssh

cat << "EOF" | tee /home/$USER/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJgvqHf4yvRUwsThQc6MvT8zLBEP8ixknm0NcMUaVn0n+OLnLc1zWlTRehk86CH1vLiHQEz47PbAMgiDKpTeVWYt/rlRagUMFdOB7Ry4b5v7q9orniGZQ9XNz2MIOFnkDEGeEmxSCv6x23uzXmASRKYkfdBVvh1gV/R3gnjfNhf//C00thMrJ0MyfQ0VeDNds4Vw0uc5bi7rw9QAKjdvsxuD3yclrpTzQnlDZZDr0J3I8Wq6VuCbQseQrXyqcXspyy9mZtj8eIOvq1U+vvoBswqarkWo1o8CQw0930MK36VsGTfO/GDdBDDKoy8W8OVRHwMEXQZ2xTXeaG6joyw18/ msaqibhashmi-ssh-pubKey
EOF

chmod 700 /home/$USER/.ssh
chmod 600 /home/$USER/.ssh/authorized_keys
chown -R $USER:$USER /home/$USER
echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/power-users
chage -m 0 -M -1 -I -1 -E -1 $USER

# Hostname
cat > /etc/hostname << EOF
$HOSTNAME
EOF

hostnamectl set-hostname $HOSTNAME

# SSH Port Change
sed -i '/^#Port/c\Port 10786' /etc/ssh/sshd_config
systemctl restart sshd

# Iptables
#
service iptables stop
iptables -P INPUT ACCEPT 
iptables -P FORWARD ACCEPT 
iptables -P OUTPUT ACCEPT
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -s 172.16.0.0/12 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -s 110.93.203.98/32 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -s 110.93.203.99/32 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -s 110.93.203.100/32 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -s 172.111.188.188/32 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -s 192.142.211.178/32 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -s 110.93.203.98/32 -p tcp -m tcp --dport 10786 -j ACCEPT
iptables -A INPUT -s 110.93.203.99/32 -p tcp -m tcp --dport 10786 -j ACCEPT
iptables -A INPUT -s 110.93.203.100/32 -p tcp -m tcp --dport 10786 -j ACCEPT
iptables -A INPUT -s 172.111.188.188/32 -p tcp -m tcp --dport 10786 -j ACCEPT
iptables -A INPUT -s 192.142.211.178/32 -p tcp -m tcp --dport 10786 -j ACCEPT
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT 
iptables -P INPUT DROP
service iptables save
systemctl restart iptables
