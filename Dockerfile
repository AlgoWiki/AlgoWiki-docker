FROM haskell:8.4.3

RUN apt-get update && \
    apt-get install -y locales zlib1g-dev mime-support && \
    rm -rf /var/lib/apt/lists/*

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8   

RUN useradd -r -m -s /bin/bash -U algowiki

WORKDIR /home/algowiki
COPY gitit gitit
COPY gitit/plugins plugins
RUN chown -R algowiki:algowiki gitit plugins

USER algowiki
RUN cd gitit && \
    cabal update && \
    cabal install && \
    cd .. && \
    rm -rf gitit

EXPOSE 8080
ENTRYPOINT ["./.cabal/bin/gitit", "-f", "config/gitit.conf"]
