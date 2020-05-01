# docker-ubuntu_x11playground
SSH login-able and X11 forward-able Ubuntu Docker container. This will be base image of development environment.

## Usage

1. Start X Server on your client computer.
1. Start container on the server by `docker-compose up -d`.
1. Then run `ssh -Yp 8022 root@example.com` to login to the container.
1. You can try `xcalc &` for check X11 working well.
