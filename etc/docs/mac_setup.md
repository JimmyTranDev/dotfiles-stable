# Mac Setup

## Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## SDKMAN

```bash
curl -s "https://get.sdkman.io" | bash

```

## Npm Global Packages

```bash
pnpm i -g markserv
```

## Oh my Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Add copilot to the Github CLI

gh extension install github/gh-copilot

## yabai + skhd

skhd --restart-service
yabai --start-service

## Fnm install

fnm use 20 | yes

## Disabling sip

1. the Mac into Recovery Mode (hold down command+R during startup).

2. Go to the Utilities menu and open Terminal and type: csrutil disable. This will disable SIP (System Integrity Protection).

3. Reboot into the OS.

4. Open the integrated terminal and type:

```bash
sudo su
cd /var/db/ConfigurationProfiles
rm -rf *
mkdir Settings
touch Settings/.profilesAreInstalled
```
