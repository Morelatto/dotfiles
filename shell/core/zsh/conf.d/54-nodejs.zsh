#\!/usr/bin/env zsh
# NPM
if (( $+commands[npm] )); then
    alias n='npm'
    alias ni='npm install'
    alias nid='npm install --save-dev'
    alias nu='npm uninstall'
    alias nup='npm update'
    alias nr='npm run'
    alias ns='npm start'
    alias nt='npm test'
    alias nb='npm run build'
    alias nd='npm run dev'
    alias nl='npm list'
    alias nout='npm outdated'
    alias naudit='npm audit'
    alias nauditf='npm audit fix'
    alias nfresh='rm -rf node_modules package-lock.json && npm install'
    alias nuke='rm -rf node_modules'
    alias nci='npm ci'
    alias npub='npm publish'
    alias nlink='npm link'
    alias nunlink='npm unlink'
    alias ncache='npm cache clean --force'
fi

# Bun
if (( $+commands[bun] )); then
    alias bi='bun install'
    alias ba='bun add'
    alias bad='bun add -d'
    alias brm='bun remove'
    alias brun='bun run'
    alias bx='bunx'
    alias bt='bun test'
    alias bup='bun update'
    alias bdev='bun run dev'
    alias bstart='bun run start'
    alias bbuild='bun run build'

    smart_install() {
        if [[ -f "bun.lockb" ]]; then
            echo "Using bun..."
            bun install
        elif [[ -f "package-lock.json" ]]; then
            echo "Using npm..."
            npm ci
        elif [[ -f "yarn.lock" ]]; then
            echo "Using yarn..."
            yarn install --frozen-lockfile
        elif [[ -f "package.json" ]]; then
            echo "No lock file, using bun..."
            bun install
        else
            echo "No package.json found"
            return 1
        fi
    }
    alias si='smart_install'
fi
