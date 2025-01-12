# Dev container for Visual Code

> **Important:**
> **- Extract SSH public keys from ~/.ssh/id_ed25519.pub and set it on GitHub**
> **- Set variables defined with `ARG` at the top of Dockerfile**

## Start a shell in container:


```bash
 docker build -t devcontainer .
```

and then :

```
docker run -it devcontainer /bin/zsh
```

## Open devcontainer in Visual Code

Ctrl Shift + P and then "Open folder in dev container"

Then clone git repositories, generate virtualenvs etc.
