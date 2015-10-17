#!/bin/bash

# From http://opennlp.apache.org/documentation/1.5.2-incubating/manual/opennlp.html#tools.doccat

[ -z "$1" ] && echo "usage: $0 \"some text\""
[ -z "$1" ] && exit 2

[ -z "$APACHENLP_HOME" ] && APACHENLP_HOME=~/apache-opennlp-1.5.3

[ ! -d "$APACHENLP_HOME" ] && echo "You need to point \$APACHENLP_HOME at your install of Apache NLP - it can be downloaded from http://opennlp.apache.org/"
[ ! -d "$APACHENLP_HOME" ] && exit 2

[ ! -f ./target/classes/trainer.bin ] && echo "You need to build the ./target/classes/trainer.bin file by running ./trainnlp.sh"
[ ! -f ./target/classes/trainer.bin ] && exit -2;

# TEST: Categorises some input text using the model file
echo "$1" | ${APACHENLP_HOME}/bin/opennlp Doccat ./target/classes/trainer.bin
