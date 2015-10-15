#!/bin/bash

# From http://opennlp.apache.org/documentation/1.5.2-incubating/manual/opennlp.html#tools.doccat

[ -z "$APACHENLP_HOME" ] && APACHENLP_HOME=~/apache-opennlp-1.5.3

[ ! -d "$APACHENLP_HOME" ] && echo "You need to point \$APACHENLP_HOME at your install of Apache NLP - it can be downloaded from http://opennlp.apache.org/"
[ ! -d "$APACHENLP_HOME" ] && exit

# TRAIN: Reads trainer.txt and writes to trainer.bin
${APACHENLP_HOME}/bin/opennlp DoccatTrainer -lang en -data ./src/main/resources/trainer.txt -model ./target/classes/trainer.bin
