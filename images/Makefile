DOCKER=docker
SRCS=$(addsuffix .s, rapidpro mailroom courier)
BUILDS=$(SRCS:.s=.build)
PUSH=$(SRCS:.s=.push)
REGISTRY_DOMAIN=$(shell jq -r '.domain' registry.json)

all: $(BUILDS) $(PUSH)

build: $(BUILDS)

push: $(PUSH)

%.build:
	$(DOCKER) build \
		--build-arg $(shell echo $* | tr '[a-z]' '[A-Z]')_VERSION=$(shell jq -r '.tag.version' $*/meta.json) \
		-t "$(shell jq -r '.tag.name' $*/meta.json):v$(shell jq -r '.tag.version' $*/meta.json)" \
		-t $(REGISTRY_DOMAIN)/$(shell jq -r '.tag.name' $*/meta.json):v$(shell jq -r '.tag.version' $*/meta.json) \
		-f $*/Dockerfile $*; \
		touch $*/$@

%.push: %.build
	$(DOCKER) push $(REGISTRY_DOMAIN)/$(shell jq -r '.tag.name' $*/meta.json):v$(shell jq -r '.tag.version' $*/meta.json); \
	touch $*/$@

clean:
	-rm -r **/*.build **/*.push

