#\!/usr/bin/env zsh
# Java Development - Java, Maven, Gradle

# Java Development
if (( $+commands[java] )); then
    alias jv='java -version'
    alias jc='javac'

    if (( $+commands[mvn] )); then
        alias m='mvn'
        alias mci='mvn clean install'
        alias mc='mvn clean'
        alias mt='mvn test'
    fi

    if (( $+commands[gradle] )); then
        alias gr='gradle'
        alias grb='gradle build'
        alias grc='gradle clean'
        alias grt='gradle test'
    fi
fi

