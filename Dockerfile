FROM centos:7

# change here the versions
ENV RUBY_VERSION 2.0.0.598
ENV GOLANG_VERSION 1.5.2

ENV GOPATH /go

# find URL and SHA1 on https://golang.org/dl/
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA1 cae87ed095e8d94a81871281d35da7829bd1234e

# install general pre-requisites
RUN yum install -y tar git sqlite make gcc gcc-c++ ruby-devel zlib-devel postgresql-devel cmake openssh-client libxml2-devel libxslt-devel epel-release

# INSTALL RUBY
RUN yum install -y ruby-$RUBY_VERSION
RUN gem install bundler

# INSTALL GO
RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
  && echo "$GOLANG_DOWNLOAD_SHA1  golang.tar.gz" | sha1sum -c - \
  && tar -C /usr/local -xzf golang.tar.gz \
  && rm golang.tar.gz

ENV PATH $PATH:/usr/local/go/bin

# prepare go-env
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" "$GOPATH/pkg" && chmod -R 777 "$GOPATH"

# install godep
RUN go get github.com/tools/godep