FROM centos:7

# change here the versions
ENV RUBY_VERSION 2.0.0.598
ENV GOLANG_VERSION 1.6.2

ENV GOPATH /go

# find URL and SHA1 on https://golang.org/dl/
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 e40c36ae71756198478624ed1bb4ce17597b3c19d243f3f0899bb5740d56212a

# install general pre-requisites
RUN yum install -y epel-release
RUN yum install -y tar git sqlite make gcc gcc-c++ ruby-devel zlib-devel postgresql-devel \
  cmake openssh-client libxml2-devel libxslt-devel nodejs npm curl

# INSTALL RUBY
RUN yum install -y ruby-$RUBY_VERSION
RUN gem install bundler

# INSTALL GO
RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
  && echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
  && tar -C /usr/local -xzf golang.tar.gz \
  && rm golang.tar.gz

ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# prepare go-env
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" "$GOPATH/pkg" && chmod -R 777 "$GOPATH"

# install godep
RUN go get github.com/tools/godep

# install glide
ENV GLIDE_DOWNLOAD_URL https://github.com/Masterminds/glide/releases/download/0.10.2/glide-0.10.2-linux-amd64.tar.gz
ENV GLIDE_DOWNLOAD_SHA256 0eedb7f47ff4d184ab334f8dd8be843f8e98774b6ccd92cbe71a6e6c7a3d5da8

RUN curl -fsSL "$GLIDE_DOWNLOAD_URL" -o glide.tar.gz \
  && echo "$GLIDE_DOWNLOAD_SHA256  glide.tar.gz" | sha256sum -c - \
  && tar -C /usr/local -xzf glide.tar.gz \
  && rm glide.tar.gz

ENV PATH /usr/local/glide:$PATH