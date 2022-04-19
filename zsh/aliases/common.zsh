# gradle
alias gr="./gradlew"
alias grc="gr clean"
alias grb="gr build"
alias grbr="gr bootRun"
alias grbrd="gr build --refresh-dependencies"
alias gri="gr install"
alias grcb="grc && grb"
alias grci="grc && gri"

# git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gbl="git branch --list"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcl="git clone"
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gf="git fetch"
alias ghard="git reset --hard HEAD"
alias gl="git log"
alias glg="git log --oneline --decorate --all --graph"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias gm="git merge"
alias gp="git push"
alias gpf="git push --force"
alias gpl="git pull"
alias gs="git status"
alias gsb="git submodule"
alias gsoft="git reset"
alias gst="git stash"
alias gut="git stash pop"
alias authors="git ls-files | while read f; do git blame -w -M -C -C --line-porcelain \$f | grep -I '^author '; done | sort -f | uniq -ic | sort -n"

# maven
alias mvc="mvn clean"
alias mvi="mvn install"
alias mvci="mvc && mvi"

# python
alias py="python3"
alias python="python3"
alias pip="pip3"
alias pipi="pip install"
alias freeze="pip3 freeze > requirements.txt"
alias requires="pip install -r requirements.txt"
alias pycache="find . -type f -name '*.pyc' -delete && find . -type d -name '__pycache__' -delete"
alias sc="scrapy"
alias scc="scrapy crawl"
alias scs="scrapy shell"
alias server="python3 -m http.server"
alias venv="virtualenv venv && source ./venv/bin/activate"

# other
#alias bat="bat --theme=base16"
alias fox="firefox"

# os/ide specific
alias noidea="find . -type d -name .idea -ls -exec rm -rf {} +"
alias noeclipse="rm -rf .settings .classpath .factorypath .project"
alias nomac="find . -name '.DS_Store' -type f -delete"

# vpn
alias pvpnc="pvpn -c"
alias pvpnd="pvpn -d"
alias pvpnr="pvpn --reconnect"
alias pvpnf="pvpn -f"

# zsh
alias zshdebug="zsh -xv &>> (tee ~/zsh-debug.log 2>/dev/null)"
