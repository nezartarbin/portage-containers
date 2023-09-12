# coursier
echo "installing Coursier"

# Manual install as gentoo's was not working. Will debug later
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs

chmod +x ./cs
yes | ./cs setup
