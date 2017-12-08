FROM ubuntu:17.04

# set locale
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    locales \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo en_US.UTF-8 UTF-8 > /etc/locale.gen \
  && locale-gen \
  && update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# cpp dev tools
RUN  apt-get update && apt-get install -y --no-install-recommends \
	bash \
    clang \
    clang-format-3.8 \
    make \
    vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# vim
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libc-dev \
    lua5.2 \
    lua5.2-dev \
    luajit \
    ctags \
    gcc \
    global \
    ncurses-dev \
    tmux \
    python3 \
    git \
    zsh \
  && apt-get clean


# add dev user
RUN adduser dev --disabled-password --gecos "" \
  && echo "ALL ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && chown -R dev:dev /home/dev
USER dev
ENV HOME /home/dev

RUN git config --global http.sslVerify false

# install plugins
COPY .vim $HOME/.vim
COPY .vimrc $HOME/.vimrc
COPY .tmux.conf $HOME/.tmux.conf


RUN git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

COPY .zshrc $HOME/.zshrc
COPY .zdirs $HOME/.zdirs

# tmux plugin manager
RUN git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

#tmuxifier
RUN git clone https://github.com/jimeh/tmuxifier.git $HOME/.tmuxifier

RUN git clone https://github.com/bhilburn/powerlevel9k.git $HOME/.oh-my-zsh/custom/themes/powerlevel9k
RUN chmod -r .vim 777 && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

RUN vim +PluginInstall +qall

# bash
COPY .bashrc $HOME/.bashrc
COPY .bashrc $HOME/.bash_prompt

WORKDIR ${HOME}
CMD ["/bin/zsh"]