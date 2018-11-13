# Elixir + Phoenix

FROM elixir:1.7.3

ENV HEX_UNSAFE_HTTPS=1 \
    NODE_TLS_REJECT_UNAUTHORIZED=0

# Install debian packages
RUN apt-get update && \
    apt-get install --yes build-essential inotify-tools fish

# Install Phoenix packages
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

# Install node
RUN curl -skL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh && \
    echo 'Acquire::https::deb.nodesource.com::Verify-Peer "false";' >> /etc/apt/apt.conf.d/my.conf && \
    echo 'Acquire::https::deb.nodesource.com::Verify-Host "false";' >> /etc/apt/apt.conf.d/my.conf && \
    sed -i.bak "s/curl -s/curl -sk/g" nodesource_setup.sh && \
    grep curl nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install nodejs

COPY config.fish /root/.config/fish/config.fish

VOLUME /app
WORKDIR /app

EXPOSE 4000

ENTRYPOINT fish
