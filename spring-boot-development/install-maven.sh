MAVEN_VERSION="3.8.6"
MAVEN_ESUM="f790857f3b1f90ae8d16281f902c689e4f136ebe584aba45e4b1fa66c80cba826d3e0e52fdd04ed44b4c66f6d3fe3584a057c26dfcac544a60b301e6d0f91c26"
MAVEN_BASE_URL="https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries"

echo "installing maven..."

mkdir --parents /usr/share/maven

curl \
  --fail \
  --show-error \
  --location \
  --output-dir /tmp \
  --output apache-maven.tar.gz \
  ${MAVEN_BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz

echo "${MAVEN_ESUM}  /tmp/apache-maven.tar.gz" | sha512sum -c -

tar \
  --extract \
  --gzip \
  --file /tmp/apache-maven.tar.gz \
  --directory /usr/share/maven \
  --strip-components=1 \
  --no-same-owner

rm /tmp/apache-maven.tar.gz

ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
