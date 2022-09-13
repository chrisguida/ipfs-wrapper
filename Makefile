ASSETS := $(shell yq e '.assets.[].src' manifest.yaml)
VERSION := $(shell yq e ".version" manifest.yaml)
IPFS_SRC := $(shell find ./go-ipfs)
S9PK_PATH=$(shell find . -name ipfs.s9pk -print)
TS_FILES := $(shell find . -name \*.ts )

# delete the target of a rule if it has changed and its recipe exits with a nonzero exit status
.DELETE_ON_ERROR:

all: verify

install: all
	embassy-cli package install ipfs.s9pk

verify: ipfs.s9pk $(S9PK_PATH)
	embassy-sdk verify s9pk $(S9PK_PATH)

clean:
	rm -f image.tar
	rm -f ipfs.s9pk

ipfs.s9pk: manifest.yaml image.tar instructions.md scripts/embassy.js
	embassy-sdk pack

image.tar: Dockerfile docker_entrypoint.sh check-web.sh nginx.conf
	DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build --tag start9/ipfs/main:$(VERSION) --platform=linux/arm64 -o type=docker,dest=image.tar .

scripts/embassy.js: $(TS_FILES)
	deno bundle scripts/embassy.ts scripts/embassy.js
