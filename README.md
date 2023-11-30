# Docker CircleCI Go

A Golang image for CircleCI. The image also has a few tool baked in that the
official CircleCI image does not have, such as:

* [Kohirens Git-tool-belt]
* [GitHub CLI]

## Status

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/kohirens/docker-circleci-go/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/kohirens/docker-circleci-go/tree/main)

## Build

For Linux, Mac, and Windows do:

```shell
docker compose build --progress plain
```
 or

```shell
docker build --rm --no-cache -t kohirens/circleci-go:dev .
```

Then test with:

```shell
docker run -it --rm  kohirens/circleci-go:dev go version
```

## References

 * [Alpine Add Package from Edge repository](https://stackoverflow.com/questions/52899227/alpine-add-package-from-edge-repository)
