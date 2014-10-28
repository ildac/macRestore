# Simple script to jumpStart a fresh osx installation
# Use Homebrew, Homebrew cask, macup, just run after 
# finising the installation.
# 
# Inspired by: http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac?utm_source=hackernewsletter&utm_medium=email&utm_term=fav
# 
# Written by Marco Da Col
# on 04/10/2014

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Tap repos
brew tap homebrew/dupes
brew tap homebrew/binary
brew tap homebrew/science

# Update homebrew recipes
brew update

# Binaries directly from Homebrew
binaries=(
  coreutils
  findutils
  bash
  homebrew/dupes/grep
  python
  node
  git
  zsh
  wget
  exercism
  r
)

# to configure exercism go to help.exercism.io

# Add here the zsh configuration, if needed...
echo "installing ho-my-zsh..."
curl -L http://install.ohmyz.sh | sh

echo "installing binaries..."
brew install ${binaries[@]}

# Installing brew-cask for normal mac app
echo "installing brew-cask..."
brew install caskroom/cask/brew-cask

# Update cask recepies
brew cask update

# Apps
apps=(
  adapter
  appcleaner
  caffeine
  coconutBattery
  copy
  dash	
  dropbox
  evernote
  freeplane
  gimp
  google-chrome
  yed
  mysqlworkbench
  spotify
  skype
  subtitles
  telegram
  textmate
  the-unarchiver
  toggldesktop
  totalterminal
  utorrent
  vagrant
  virtualbox
  vlc
  
  mactex
  lyx
  androidstudio
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

echo "all app installed, you just need to get iWork, iLife from the AppStore"

# Add install some fonts CHECK ME OUT!
brew tap caskroom/fonts

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# Cleanup the mess
brew cleanup
brew cask cleanup

# At this point we have to go to setup the backup with macup
# First we need to login in the Dropbox account
# Try to do it with DropBoxCli
http://www.dropboxwiki.com/tips-and-tricks/using-the-official-dropbox-command-line-interface-cli#Installation

echo "At this point, you need con open your dropbox and start the file sync."
echo "When the sync is done thanks to mackup I will restore all your app settings"
echo "Did the sync of mackup folder end? [Enter when ready]"
read answer

# Macup
# Install
pip install mackup

# Restore from DropBox
mackup restore 