# cargo-templates

Here is how to test one template:

    just test cli

## Usage

### Interactive

    cargo generate --git https://github.com/chevdor/cargo-templates \
        --destination /projects/

### Non Interactive

    cargo generate --git https://github.com/chevdor/cargo-templates <cli|lib|parity-lib> \
        --destination /projects/ \
        --name foobar \
        # The following only applies to the cli
        --define clap=true
