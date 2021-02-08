# CentOS 7 Container Image for Ansible Testing

This Dockerfile builds a CentOS 7 based container, capable to use `systemd`, mainly for Ansible role testing.

# Tags

> Tags are used to distinguish between Ansible versions and builds (e.g., testing vs stable).

- `latest`: Latest stable version of Ansible.

# How to build locally

1. Install [Docker](https://docs.docker.com/engine/install/).
2. Clone the repository: 

   ```shell
   git clone https://github.com/chzerv/centos7-systemd-ansible.git
   ```
3. `cd` into the directory and run `docker build -t centos7-systemd-ansible .`

> `docker` can be substituted for any other container engine, e.g., [Podman](https://podman.io/getting-started/installation.html).

# How to use

1. Install [Docker](https://docs.docker.com/engine/install/).

2. Pull this image from _Docker hub_: 

    ```shell
    docker pull chzerv/centos7-systemd-ansible:latest
    ``` 
    If you built the image locally, feel free to use it instead.

3. Run a container:

   ```shell
   docker run -d --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro centos7-systemd-ansible:latest
   ```

4. Run Ansible inside that container:

   ```shell
   docker exec -it $container_id ansible --version
   ```

# Notes

This image is used for testing Ansible roles and playbooks locally and/or in CI, hence, security is not
a concern. It is not intended or recommended to use this image in production environments.
