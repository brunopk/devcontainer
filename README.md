# Dev container for Visual Code

> **Important:**
>
> **- Extract SSH public keys from ~/.ssh/id_ed25519.pub and set it on GitHub**
>
> **- Set variables defined with `ARG` at the top of Dockerfile**

## Start a shell in container

```bash
 docker build -t devcontainer .
```

and then :

```
docker run -it devcontainer /bin/zsh
```

## Usage in Visual Code

1. Start the container with `docker` command:

    ```bash
    docker run -it devcontainer /bin/zsh
    ```

    Clone git repositories, generate virtualenvs and all required tools for development.

2. Run container in Visual Code: Ctrl Shift + P and then "Open folder in dev container"
3. 

The container is created with a workspaces directory intended to contain repositories and projects.

## Useful tips

In order to allow a container to connect with host add the following entry to the `runArgs` array in devcontainer.json:

```--add-host host.docker.internal:host-gateway```

Then the container will be allowed to access the host machine through the **host.docker.internal** IP address
