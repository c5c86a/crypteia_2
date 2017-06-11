[![Build Status](https://travis-ci.org/nicosmaris/crypteia_2.png?branch=master)](https://travis-ci.org/nicosmaris/crypteia_2)
[![codecov.io](https://codecov.io/github/nicosmaris/crypteia_2/coverage.svg?branch=master)](https://codecov.io/github/nicosmaris/crypteia_2?branch=master)
[heroku](https://crypteia2.herokuapp.com/)

# To setup locally

Before starting, make sure that you have the local files mentioned at the bottom of the .gitignore file.
To setup locally, the following instructions have worked at ubuntu 16.10:

## Install postgres

sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-common
sudo apt-get install postgresql-9.5 libpq-dev

sudo -u postgres createuser `whoami` -s

## Setup DB


bundle install  
rake db:create  
rake db:migrate  

rails c  
$>s = Setting.new  
%>s.save  
%>exit

rails s  
