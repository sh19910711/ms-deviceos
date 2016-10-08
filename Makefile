ifeq ($(APP_DIR),)
    $(error "APP_DIR is not set")
endif

APP_NAME ?= $(notdir $(APP_DIR))

all: $(APP_NAME).tar

resea/apps/csapp: resea
	./convert-to-resea-app $@ $(APP_DIR)

$(APP_NAME).esp8266.image: $(wildcard api/*) $(wildcard $(APP_DIR)/*) resea/apps/csapp
	cd resea && make ARCH=esp8266 TARGET=kernel APPS="channel-server esp8266-driver csapp" TARGET_FILE=image # XXX
	cp resea/image $@

$(APP_NAME).tar: $(APP_NAME).esp8266.image
	tar cf $@ $^
