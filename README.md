# ElixirChat

This sample application demonstrates how an Elixir application on the Phoenix
framework might look.

It happens to be a simple chatroom using Phoenix's Channels -- a thin
abstraction over websockets to allow for flexible sending and consumption of
messages between different technologies. But the main purpose of this
application is to demonstrate how an Elixir app can be constructed, built
into a release, and deployed.

To start your Phoenix server, do the following steps. See below if you get
any SSL or certificate errors.

* Install dependencies with `mix deps.get`
* Install Node.js dependencies with `cd assets && npm install && cd ..`
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your
browser.

## Learn More About Elixir

* [Elixir School](https://elixirschool.com/en/) - Fantastic crash course in
the Elixir language
* [Awesome Elixir](https://github.com/h4cc/awesome-elixir) - Exhaustive list
of Elixir libraries, communities, tools, and learning resources

## Learn More About Phoenix

* Official website: http://www.phoenixframework.org/
* Guides: http://phoenixframework.org/docs/overview
* Docs: https://hexdocs.pm/phoenix
* Mailing list: http://groups.google.com/group/phoenix-talk
* Source: https://github.com/phoenixframework/phoenix

## Fix Certificate Issues on QL Network

Because of the way our network is connected to the internet, you may get
errors from npm or hex (Elixir's package manager). The simplest fix is to
ignore the issuer of the certificates that are used for these secure
connections. Try the following:

* Set the `SET_UNSAFE_HTTPS` environment variable to `1`:
    * In bash: `export SET_UNSAFE_HTTPS=1`
    * In fish: `set -x SET_UNSAFE_HTTPS 1`
* Set the `NODE_TLS_REJECTED_UNAUTHORIZED` environment variable to `0`:
    * In bash: `export NODE_TLS_REJECTED_UNAUTHORIZED=0`
    * In fish: `set -x NODE_TLS_REJECTED_UNAUTHORIZED 0`
* These commands may help, too:
    * `npm set strict-ssl false`
    * `npm set strict-ssl -g false`

## Credits

Big thanks to the community and the countless tools we're building on to make
building this app so simple, but also thanks to
[phoenix-chat-example](https://github.com/dwyl/phoenix-chat-example) for the
frontend JavaScript which I have lightly modified.