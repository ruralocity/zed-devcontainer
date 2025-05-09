# zed-devcontainer

Experimental setup for making dev containers easier to use outside of VS Code.
The name suggests Zed, but theoretically and eventually should work with any IDE
or editor of your choosing.

## Getting started

You'll need Docker installed and running, of course, along with the
`devcontainer` package (available through Homebrew if you're using a Mac like
me).

Current setup also requires `jq` on the host to capture the Docker container ID
and save it for future use. If you want to use the Just recipes you'll also need
`just`, or you can read through them in `justfile` and copy/paste into your
terminal.

View the currently available Just recipes:

```shell
just list
```

I've included a small Sinatra web application for the purpose of testing port
forwarding. Unlike VS Code, you'll need to explicitly set `appPort` in your
`.devcontainer/devcontainer.json` file. That's done for you here.

Start up the devcontainer:

```shell
just dc-up
```

Then shell into the running container, install the dependencies, and run the server:

```shell
just dc-shell

bundle
ruby server.rb
```

Back in your host, hit <http://localhost:4567> in your favorite HTTP client. It should work! Or at least, it does on my machine!

To delete the devcontainer, back in your host, run

```shell
just dc-down
```

## For later

- First off, this represents less than an hour of work, so there may be better
ways to do these things. It's hard to know for sure since the `devcontainer-cli`
docs are sparse.
- I know Zed has a "tasks" feature that may be handier than my `just` recipes; I
just haven't dug into that feature yet.
- The current recipes are a small set of what I'd potentially want--quickly
rebuilding containers with/without cache comes to mind.
- Need a better place to store the running devcontainer's ID, or figure out how
to get the necessary information to spin down a devcontainer some other way
(since `devcontainer down` is not a thing).

## Other notes

- I cheated and used VS Code to create the initial devcontainer config files,
but otherwise used Zed for this project.
