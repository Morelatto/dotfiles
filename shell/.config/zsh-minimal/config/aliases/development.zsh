#!/usr/bin/env zsh
# Development aliases - Docker, Python, Gradle, Maven, etc.

# Docker aliases
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcuf='docker-compose up -d --force-recreate'
alias dcd='docker-compose down'
alias dcs='docker-compose stop'
alias dcc="docker-compose config"
alias dcp='docker-compose pull'
alias dcl='docker-compose logs --tail=100 -f'
alias deit='docker exec -it'
alias dci='docker inspect'
alias dim='docker images'
alias dip='docker image prune -f'
alias dl='docker logs'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dr='docker restart'
alias drit='docker run -it'
alias drm='docker rm'
alias ds='docker start'
alias dsp='docker system prune --all'
alias lzd='lazydocker'

# Python aliases
alias py='python3'
alias venv='virtualenv venv && source ./venv/bin/activate'
alias pyi='pyenv install'
alias pi='pip install'
alias pu='pip uninstall'
alias pupg='pip install --upgrade pip'
alias pfr='pip freeze > requirements.txt'
alias pre='pip install -r requirements.txt'

# Poetry (Python package manager)
alias pt='poetry'
alias pa='poetry add'
alias pad='poetry add --group dev'
alias pb='poetry build'
alias pl='poetry lock'
alias prm='poetry remove'
alias pupd='poetry update'
alias pti='poetry install'
alias pid='poetry install --with=dev'
alias ptr='poetry run'

# Python tools
alias pyc='pycharm'
alias pysrv='python3 -m http.server'
alias pycol='pygmentize -l pytb'
alias jup='jupyter notebook'
alias note='jupyter notebook'
alias color='pygmentize -l pytb'

# Scrapy
alias sc='scrapy'
alias scc='scrapy crawl'
alias scs='scrapy shell'

# Gradle aliases
alias grd='./gradlew'
alias grdc='./gradlew clean'
alias grdb='./gradlew build'
alias grdr='./gradlew bootRun'
alias grdbr='./gradlew build --refresh-dependencies'
alias grdi='./gradlew install'
alias grdcb='grdc && grdb'
alias grdci='grdc && grdi'

# Maven aliases
alias mvc='mvn clean'
alias mvi='mvn install'
alias mvci='mvc && mvi'

# GPT/AI aliases
alias gpt='sgpt'
alias gpt3='sgpt --model gpt-3.5-turbo-0125'
alias gpt4='sgpt --model gpt-4o'
alias gsh='sgpt --shell'
alias gpc='sgpt --code'