#!/bin/bash

wget -q -O - https://get.docker.io/gpg | apt-key add -
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
apt-get update -qq
apt-get install -q -y --force-yes lxc-docker
apt-get install -q -y lxc
cp /tmp/docker /etc/default/docker
apt-get update -qq
apt-get install -q -y linux-image-generic-lts-raring
apt-get install -q -y linux-headers-generic-lts-raring dkms
echo 'Downloading VBox Guest Additions...'
wget -q http://dlc.sun.com.edgesuite.net/virtualbox/4.2.12/VBoxGuestAdditions_4.2.12.iso
echo -e 'mount -o loop,ro /home/vagrant/VBoxGuestAdditions_4.2.12.iso /mnt
echo yes | /mnt/VBoxLinuxAdditions.run
umount /mnt
rm /root/guest_additions.sh; ' > /root/guest_additions.sh
chmod 700 /root/guest_additions.sh
sed -i -E 's#^exit 0#[ -x /root/guest_additions.sh ] \&\& /root/guest_additions.sh#' /etc/rc.local
echo 'Installation of VBox Guest Additions is proceeding in the background.'
echo '"vagrant reload" can be used in about 2 minutes to activate the new guest additions.'
shutdown -r +1

