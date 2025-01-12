FROM ubuntu:20.04

ARG USER="bruno"
ARG USER_EMAIL="brunopiaggiok@gmail.com"
ARG GIT_USER_NAME="brunopk"

# Install tzdata to avoid being stuck (More info: https://askubuntu.com/questions/1447996/trying-to-build-a-docker-image-from-ubuntu-18-04-base-image-but-gets-stuck-at-c)
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get update && apt-get install --yes --no-install-recommends \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev  

# Install developments tools and other packages
RUN apt-get update && \
    apt install  --yes --no-install-recommends sudo \
    git \
    zsh \
    curl \
    vim \ 
    ssh \
    ca-certificates 

# Python dev dependencies (More info: https://github.com/pyenv/pyenv/wiki#suggested-build-environment)
RUN apt-get update && apt install  --yes --no-install-recommends \   
    build-essential \
    libssl-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncursesw5-dev \
    xz-utils \ 
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev

# Update the package list, install sudo, create a non-root user, and grant password-less sudo permissions
RUN adduser --disabled-password --gecos "" ${USER} && \
    echo '${USER} ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    mkdir /workspaces && chown ${USER}:${USER} workspaces


# Set the non-root user as the default user
USER ${USER}

RUN ssh-keygen -t ed25519 -C "${USER_EMAIL}" -f ~/.ssh/id_ed25519 

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

RUN curl https://pyenv.run | bash && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc

RUN git config --global user.email "${USER_EMAIL}}" && \
  git config --global user.name "${GIT_USER_FULLNAME}"

WORKDIR /workspaces