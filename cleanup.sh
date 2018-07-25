#!/bin/bash
# via https://medium.com/@waxzce/keeping-macos-clean-this-is-my-osx-brew-update-cli-command-6c8f12dc1731
ruby link-manual-installs-to-homebrew.rb
brew update
brew upgrade
brew prune
brew cleanup -s
brew cask cleanup
#now diagnotic
brew doctor > doctor.txt
brew missing
# Dump a list of installed apps and push to https://gist.github.com/rodcul/89cfc1c4c08171b21de1acc9989639db
echo "Homebrew cleanup finished"
brew bundle dump -f
git commit -m "`date`" Brewfile
git push
echo "Pushed Brewfile to github"
echo "Upgrading apm packages"
apm upgrade -c false
echo "Upgrading Apple Store apps"
mas upgrade
echo "Updating npm"
npm update -g
echo "Updating gems"
gem update
# echo "and pip ? pip freeze — local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs pip install -U"
terminal-notifier -message "Finished!" -title "Cleanup script"
