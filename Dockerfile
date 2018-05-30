FROM elixir:1.6.5
RUN mix local.hex --force
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez

WORKDIR /app/naming_service/
COPY .  /app/naming_service/

RUN mix deps.get
RUN mix compile
EXPOSE 4000
CMD mix phx.server
