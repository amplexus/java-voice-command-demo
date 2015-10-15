# java-voice-command-demo

A java application demonstrating how to accept voice input and interpret what was said. Uses google voice and the apache opennlp text classification library

The Google API key is obtained per instructions here: https://stackoverflow.com/questions/26485531/google-speech-api-v2

When you obtain your API key, assign it to an environment variable $GOOGLE_API_KEY before running the script discussed below.

Once you've built this app, you should be able to run it using the run.sh script found in the top level directory.

The app will listen on your microphone for a few seconds before sending whatever it hears to Google for recognition, and will display Google's response. It will also display the "command" it thinks you said. 

The only commands it understands are "forward", "backwards", "left" and "right". However there are many ways you can say the commands - for example "go forward", "move forward", "head in a forward direction" and various other permutations. 

Google is used to convert what you said to plain text, and Apache OpenNLP is used to determine which "command" you issued.
