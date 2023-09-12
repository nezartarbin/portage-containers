mkdir --parents /etc/portage/repos.conf

cp /tmp/gentoo-mirror.conf /etc/portage/repos.conf/gentoo-mirror.conf

echo "MAKEOPTS=\"-j12\"" >> /etc/portage/make.conf
echo "ACCEPT_LICENSE=\"*\"" >> /etc/portage/make.conf

emerge-webrsync
emerge --sync
emerge --jobs 10 --oneshot sys-apps/portage
emerge --jobs 10 -vuUDN @world
