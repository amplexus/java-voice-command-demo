#!/bin/bash

[ -z "$GOOGLE_API_KEY" ] && echo "set the env variable \$GOOGLE_API_KEY to the value of your Google API key for using the Google Speech API"
[ -z "$GOOGLE_API_KEY" ] && exit 2;

CLASSPATH=$HOME/.m2/repository/org/apache/opennlp/opennlp-maxent/3.0.3/opennlp-maxent-3.0.3.jar:$HOME/.m2/repository/org/apache/opennlp/opennlp-uima/1.5.3/opennlp-uima-1.5.3.jar:$HOME/.m2/repository/org/apache/opennlp/opennlp-tools/1.5.3/opennlp-tools-1.5.3.jar:$HOME/.m2/repository/com/darkprograms/speech/java-speech-api/1.13.0-SNAPSHOT/java-speech-api-1.13.0-SNAPSHOT.jar:$HOME/.m2/repository/net/sourceforge/javaflacencoder/java-flac-encoder/0.3.7/java-flac-encoder-0.3.7.jar:$HOME/.m2/repository/net/sf/jwordnet/jwnl/1.3.3/jwnl-1.3.3.jar:$HOME/.m2/repository/org/json/json/20150729/json-20150729.jar:target/classes

java -Dgoogle-api-key="$GOOGLE_API_KEY" -cp "$CLASSPATH"  net.craigiebabe.voicecommand.VoiceCommandDemo
