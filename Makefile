ASSETS := $(shell yq e '.assets.[].src' manifest.yaml)
ASSET_PATHS := $(addprefix assets/,$(ASSETS))
VERSION := $(shell yq e ".version" manifest.yaml)
IPFS_SRC := $(shell find ./go-ipfs)
S9PK_PATH=$(shell find . -name ipfs.s9pk -print)

# delete the target of a rule if it has changed and its recipe exits with a nonzero exit status
.DELETE_ON_ERROR:

all: verify

verify: ipfs.s9pk $(S9PK_PATH)
	embassy-sdk verify s9pk $(S9PK_PATH)

clean:
	rm -f image.tar
	rm -f ipfs.s9pk

ipfs.s9pk: manifest.yaml assets/compat/config_spec.yaml assets/compat/config_rules.yaml image.tar instructions.md $(ASSET_PATHS)
	embassy-sdk pack

image.tar: Dockerfile docker_entrypoint.sh check-web.sh
	DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build --tag start9/ipfs/main:$(VERSION) --platform=linux/arm64 -o type=docker,dest=image.tar .
