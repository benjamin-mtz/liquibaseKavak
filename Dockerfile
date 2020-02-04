FROM ubuntu:latest

LABEL maintainer="Benjamin J. Martinez <benjamin.martinez@kavak.com"

# Install dependencies
RUN apt-get update && apt-get install -y default-jdk curl \
  && java -version
ENV VERSION=3.8.5

RUN curl -L https://github.com/liquibase/liquibase/releases/download/v${VERSION}/liquibase-${VERSION}.tar.gz -o liquibase-core-${VERSION}-bin.tar.gz \
  && tar -xzf liquibase-core-${VERSION}-bin.tar.gz -C /bin \
  && rm liquibase-core-${VERSION}-bin.tar.gz \
  && chmod 777 /bin/liquibase \
  && liquibase --help

CMD ["/bin/bash"]
