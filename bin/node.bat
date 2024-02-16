@ECHO OFF
docker run -it --rm -w /app -v %cd%://app node:latest node %*
