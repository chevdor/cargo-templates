# List available commands
_default:
  just --choose --chooser "fzf +s -x --tac --cycle"

_init:
  mkdir -p /tmp/cargo-templates

# Test
test template='cli' *args='': clean _init
  #!/usr/bin/env bash
  cargo generate --path {{template}} --destination /tmp/cargo-templates {{ args }} --name aaa
  cd /tmp/cargo-templates/aaa
  cargo check
  git config --local commit.gpgsign false
  git add .; git commit -a -m "Initial commit"
  cargo publish --dry-run

test_web template='cli' *args='': clean _init
  #!/usr/bin/env bash
  cargo generate --destination /tmp/cargo-templates --git https://github.com/chevdor/cargo-templates.git {{template}}  --name bbb {{ args }}
  cd /tmp/cargo-templates/bbb
  cargo check
  git config --local commit.gpgsign false
  git add .; git commit -a -m "Initial commit"
  cargo publish --dry-run

clean:
  rm -rf /tmp/cargo-templates

# Generate the readme as .md
md:
	#!/usr/bin/env bash
	asciidoctor -b docbook -a leveloffset=+1 -o - README_src.adoc | pandoc   --markdown-headings=atx --wrap=preserve -t markdown_strict -f docbook - > README.md
