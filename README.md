# docker-keepass2

A docker image to run keepass2.

## Why

Using a password vault / manager is a best practice. Good (as in safe) password managers are hard to find ([one of many password managers top](http://lifehacker.com/5529133/five-best-password-managers). In the past I had a lot of issues in trying to put keepass2 running on a mac on top of mono...

## How to install

1. Install docker ;-)
2. Install a X server like [XQuartz](https://www.xquartz.org/)
3. Clone repository: 
```shell
https://github.com/malcata/docker-keepass2.git
```
4. Configure some environment variables, eventually on a bash_profile file:
```shell
# IP calculation example for Mac
export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
export KEEPASS_FOLDER="<some folder>"
xhost + $IP 
```

## Usage
(Missing)

## Contributing

Please follow the Github flow process (branch, commits and pull request)...

## License

The code in this repository, unless otherwise noted, is MIT licensed. See the `LICENSE` file in this repository.

## Credits

For content [Fábio Rehm](http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/)
For form @rcarmo

Read this for the [better way](http://wiki.ros.org/docker/Tutorials/GUI) to do it.