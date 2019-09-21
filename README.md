# AlgoWiki
This repository contains a Docker image for running [AlgoWiki](https://github.com/AlgoWiki/AlgoWiki).

## Preparation
Make sure you have the latest version of AlgoWiki checked out:
```
$ git submodule update --init
```

Pull the AlgoWiki Docker image:
```
$ sudo docker pull suprdewd/algowiki
```

Review the configuration in the `config` directory, and adjust to your liking.

## Running
Run the following command to start AlgoWiki:
```
$ sudo docker run --rm \
       -v $(pwd)/config:/home/algowiki/config \
       -v $(pwd)/wikidata:/home/algowiki/wikidata \
       -p 8080 \
       suprdewd/algowiki
```

Now you can navigate to [http://localhost:8080/](http://localhost:8080/) in your browser.

