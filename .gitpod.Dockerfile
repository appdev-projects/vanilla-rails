FROM buildpack-deps:focal

### base ###
RUN yes | unminimize \
    && apt-get install -yq \
        zip \
        unzip \
        bash-completion \
        build-essential \
        htop \
        jq \
        less \
        locales \
        man-db \
        nano \
        software-properties-common \
        sudo \
        time \
        vim \
        multitail \
        lsof \
    && locale-gen en_US.UTF-8 \
    && mkdir /var/lib/apt/dazzle-marks \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

ENV LANG=en_US.UTF-8

### Git ###
RUN add-apt-repository -y ppa:git-core/ppa \
    && apt-get install -yq git \
    && rm -rf /var/lib/apt/lists/*

### Gitpod user ###
# '-l': see https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    # passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
ENV HOME=/home/gitpod
WORKDIR $HOME
# custom Bash prompt
RUN { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> .bashrc

### Gitpod user (2) ###
USER gitpod
# use sudo so that user does not get sudo usage info on (the first) login
RUN sudo echo "Running 'sudo' for Gitpod: success" && \
    # create .bashrc.d folder and source it in the bashrc
    mkdir /home/gitpod/.bashrc.d && \
    (echo; echo "for i in \$(ls \$HOME/.bashrc.d/*); do source \$i; done"; echo) >> /home/gitpod/.bashrc

### Ruby ###
LABEL dazzle/layer=lang-ruby
LABEL dazzle/test=tests/lang-ruby.yaml
USER gitpod
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import - \
    && curl -sSL https://rvm.io/pkuczynski.asc | gpg --import - \
    && curl -fsSL https://get.rvm.io | bash -s stable \
    && bash -lc " \
        rvm requirements \
        && rvm install 3.0.0 \
        && rvm use 3.0.0 --default \
        && rvm rubygems current \
        && gem install bundler --no-document \
        && gem install solargraph --no-document" \
    && echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*' >> /home/gitpod/.bashrc.d/70-ruby
RUN echo "rvm_gems_path=/home/gitpod/.rvm" > ~/.rvmrc

USER gitpod
# AppDev stuff
RUN /bin/bash -l -c "gem install htmlbeautifier"
RUN /bin/bash -l -c "gem install rufo"

# WORKDIR /base-rails
# USER root
# Patch shotgun so it works with Ruby 3.0.0
# RUN /bin/bash -l -c "wget  -O hotfix_shotgun 'https://raw.githubusercontent.com/jelaniwoods/dotfiles/master/hotfix_shotgun' && chmod 777 hotfix_shotgun && ./hotfix_shotgun"


WORKDIR /base-rails
USER gitpod

WORKDIR /
WORKDIR /base-rails
COPY Gemfile /base-rails/Gemfile
COPY Gemfile.lock /base-rails/Gemfile.lock
# For some reason, the copied files were owned by root so bundle could not succeed
RUN /bin/bash -l -c "sudo chown -R $(whoami):$(whoami) Gemfile Gemfile.lock"
RUN /bin/bash -l -c "gem install bundler:2.2.3"

RUN /bin/bash -l -c "bundle install"

RUN /bin/bash -l -c "curl https://cli-assets.heroku.com/install.sh | sh"

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN sudo apt-get update && sudo apt-get install -y nodejs yarn postgresql-client
RUN sudo apt-get update && sudo apt-get install -y yarn
RUN sudo apt install -y postgresql postgresql-contrib libpq-dev psmisc lsof
RUN /bin/bash -l -c "sudo service postgresql start"
USER gitpod
RUN echo "rvm use 3.0.0" >> ~/.bashrc
RUN echo "rvm_silence_path_mismatch_check_flag=1" >> ~/.rvmrc
