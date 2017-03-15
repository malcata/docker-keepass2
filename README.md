# docker-keepass2

A docker file to run keepass2.

## Why

Using a password vault / manager is a security best practice.
Good password managers are hard to find ([one of many password managers top](http://lifehacker.com/5529133/five-best-password-managers). In the past I had a lot of issues in trying to run keepass2 on a mac on top of mono...

## How to install

1. Install docker ;-)
2. If not already available, install a X server like [XQuartz](https://www.xquartz.org/) and allow connections from network clients.
3. Clone repository: 
```shell
https://github.com/malcata/docker-keepass2.git
```
4. Configure required environment variables, eventually on a bash_profile file:
```shell
# IP example for Mac based on interface en1
$ export IP=$(ifconfig en1 | grep inet | awk '$1=="inet" {print $2}')
# Folder for the database file
$ export KEEPASS_FOLDER="<some folder>"
# Authorize the X Client IP
$ xhost + $IP 
```

## Usage

1. Build the container image:
```shell
$ make build
```

2. Run the container:
```shell
$ make run
```

Check the [Makefile](https://raw.githubusercontent.com/malcata/docker-keepass2/master/Makefile) for further details.

## Contributing

Please follow the Github flow process (branch, commits and pull request)...

## License

The code in this repository, unless otherwise noted, is MIT licensed. See the `LICENSE` file in this repository.

## Credits

Content inspiration: [Fábio Rehm](http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/).

Form inspiration: @rcarmo.

Read this for a [better way](http://wiki.ros.org/docker/Tutorials/GUI).