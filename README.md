# docker-ruby-golang-centos
Docker recipe containing Ruby, Golang (+ godep) on Centos, it includes even some other common libraries, like:

- libraries useful for compile common gems
- nodejs package manager
- tar, git,...
- epel releases
- godep
- glide
- ...

The Ruby, Golang and Centos version are easy to change if needed.

See our [Docker Hub repo](https://hub.docker.com/r/inwork/docker-ruby-golang-centos/)


# How to use this image

````
FROM inwork/docker-ruby-golang-centos:1.6.2
````

# License

View [license information](http://golang.org/LICENSE) for the golang contained in this image.
View [license information](https://www.ruby-lang.org/en/about/license.txt) for the ruby contained in this image.
View [license information](https://github.com/tools/godep/blob/master/License) for the godep contained in this image.
View [license information](https://github.com/Masterminds/glide/blob/master/LICENSE) for the glide contained in this image.

