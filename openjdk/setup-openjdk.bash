#openjdk

mkdir -p /etc/portage/package.use
echo "app-text/ghostscript-gpl  cups" >> /etc/portage/package.use/openjdk
MAKEOPTS="-j12" emerge --jobs 12 dev-java/openjdk
