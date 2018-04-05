#!/bin/bash
# via https://medium.com/@waxzce/keeping-macos-clean-this-is-my-osx-brew-update-cli-command-6c8f12dc1731
brew update
brew upgrade
brew cleanup -s
brew cask cleanup
#now diagnotic
brew doctor
brew missing
# Dump a list of installed apps and push to https://gist.github.com/rodcul/89cfc1c4c08171b21de1acc9989639db
brew bundle dump -f
git commit -m "`date`" Brewfile
git push
apm upgrade -c false
/opt/bin/updateCCTF.sh && terminal-notifier -message “git pull done :-)” -title “CCTF up to date”
echo “you can hit mas upgrade to upgrade theses apps from the app store:”
mas outdated
echo “install with: mas upgrade”
npm update -g
echo “did you think to launch gem update “
echo “and pip ? pip freeze — local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs pip install -U “
