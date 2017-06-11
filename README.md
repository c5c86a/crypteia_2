# To setup locally

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
