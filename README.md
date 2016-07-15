# docker-ruby-golang-centos

Docker recipe containing Ruby (with rbenv), Golang (+ godep and glide) on Centos, it includes even some other common libraries, like:

- libraries useful for compile common gems
- nodejs package manager
- tar, git,...
- epel releases
- godep
- glide
- rpbm-build
- ...

See our [Docker Hub repo](https://hub.docker.com/r/inwork/docker-ruby-golang-centos/)

# How to use this image

The version are organized in this way:

- c: Centos version
- g: Golang version
- r: Ruby version

So the combination ```c7-g1.6-r2.0``` means: Centos 7 with Golang 1.6.x and Ruby 2.0.x

````
FROM inwork/docker-ruby-golang-centos:c7-g1.6-r2.0
````

# License

View [license information](http://golang.org/LICENSE) for the golang contained in this image.
View [license information](https://www.ruby-lang.org/en/about/license.txt) for the ruby contained in this image.
View [license information](https://github.com/tools/godep/blob/master/License) for the godep contained in this image.
View [license information](https://github.com/Masterminds/glide/blob/master/LICENSE) for the glide contained in this image.

