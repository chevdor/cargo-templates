# List available commands
_default:
  just --choose --chooser "fzf +s -x --tac --cycle"

_init:
    mkdir -p /tmp/cargo-templates

# Test
test template='cli' *args='': clean _init
	cargo generate --path {{template}} --destination /tmp/cargo-templates {{ args }}

clean:
    rm -rf /tmp/cargo-templates
