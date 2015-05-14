FROM alpine:3.1

ENV PATH=$PATH:/opt/Nim/bin:/root/.nimble/bin

RUN apk update && \
    apk add libc-dev gcc curl libgcc git perl && \
	mkdir -p /opt && cd /opt && \
	git clone https://github.com/Araq/Nim.git && \
	cd Nim && sh build.sh && cd /opt && \
    git clone https://github.com/nim-lang/nimble.git && \
	cd nimble && nim c -r src/nimble install && \
	rm -rf /opt/Nim/csources && rm -rf /opt/Nim/tests && \
	rm -rf /opt/nimble && \
	rm -rf /var/cache/apk/*
	
WORKDIR /src
