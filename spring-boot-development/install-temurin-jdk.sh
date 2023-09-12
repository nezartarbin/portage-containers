JDK_BINARY_URL="https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.4.1%2B1/OpenJDK17U-jdk_x64_alpine-linux_hotspot_17.0.4.1_1.tar.gz"
JDK_ESUM="1a1706304c26da0d8d2e05127c5aa7dba00e5401b2c0228c8ae894d2812beee0"

echo "installing openjdk temurin 17..."

curl \
  --fail \
  --show-error \
  --location \
  --output openjdk.tar.gz \
  --output-dir /tmp \
  ${JDK_BINARY_URL}

echo "${JDK_ESUM} */tmp/openjdk.tar.gz" | sha256sum -c -

mkdir --parents $JAVA_HOME

tar --extract \
  --file /tmp/openjdk.tar.gz \
  --directory $JAVA_HOME \
  --strip-components=1 \
  --no-same-owner

rm /tmp/openjdk.tar.gz
