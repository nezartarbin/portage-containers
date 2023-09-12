SPRING_VERSION="2.7.4"
SPRING_URL="https://repo.spring.io/artifactory/release/org/springframework/boot/spring-boot-cli/${SPRING_VERSION}/spring-boot-cli-${SPRING_VERSION}-bin.tar.gz"
DOWNLOAD_NAME="spring-boot-cli-${SPRING_VERSION}-bin.tar.gz"

echo "installing spring cli..."

curl \
  --fail \
  --show-error \
  --location \
  --output-dir /tmp \
  --output ${DOWNLOAD_NAME} \
  ${SPRING_URL}

tar \
  --extract \
  --gzip \
  --verbose \
  --directory /usr/local/ \
  --file \
    /tmp/${DOWNLOAD_NAME} \
    spring-${SPRING_VERSION}/bin/spring \
    spring-${SPRING_VERSION}/lib/spring-boot-cli-${SPRING_VERSION}.jar \
  --strip-components=1

rm /tmp/${DOWNLOAD_NAME}
