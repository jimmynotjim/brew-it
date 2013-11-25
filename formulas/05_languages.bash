#
# programming languages
#

# clojure
#install leiningen

# dart
#install dart

# erlang
#install erlang
#install elixir
#install rebar

# go
#install go

# groovy
#install groovy

# haskell
#install haskell-platform

# lua
#install lua

# mono (.net)
# https://gist.github.com/shtirlic/4696903

# node
install node
unlink  node

install homebrew/versions/node08
unlink  node08

# ocaml
#install ocaml

# php
install php55 --without-pear --without-apache --with-pgsql --with-fpm --with-intl
unlink  php55

install php54 --without-pear --without-apache --with-pgsql --with-fpm --with-intl
unlink  php54

install php53 --without-pear --without-apache --with-pgsql --with-fpm --with-intl
unlink  php53

# python
install python

# ruby
install chruby

install ruby-install

ruby-install ruby
ruby-install ruby 1.9.2
ruby-install ruby 1.9.3

chruby ruby-2.0

# rust
#install rust

# scala
#install scala
