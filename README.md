# rabbitmq-formula
[![Build Status](https://travis-ci.org/ssplatt/rabbitmq-formula.svg?branch=master)](https://travis-ci.org/ssplatt/rabbitmq-formula)

Manage and configure Rabbitmq via Saltstack Salt.

Install and setup brew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install vagrant with brew:
```
brew install cask
brew cask install vagrant
```

Install test-kitchen:
```
sudo gem install test-kitchen
sudo gem install kitchen-vagrant
sudo gem install kitchen-salt
```

Run a converge on the default configuration:
```
kitchen converge default
```
