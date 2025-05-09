# List available commands when no command provided
default:
    @just --list

# Start a devcontainer and shell in
dc-start:
    just dc-up
    just dc-shell

# Build the dev container
dc-up:
    devcontainer up --workspace-folder=. | grep '^{' | jq -r '.containerId' > container-id
    cat container-id

# Stop (delete) the running devcontainer
dc-down:
    docker rm -f $(cat container-id)
    rm container-id

# Shell into the running devcontainer
dc-shell:
    devcontainer exec --workspace-folder=. /bin/bash
