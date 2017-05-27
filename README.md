Setup
----------------

To setup locally, the following instructions have worked at ubuntu 16.10:

```bash
gem install rails -v 5.0

sudo apt-get install -y libpq-dev

sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-common
sudo apt-get install -y postgresql-9.5 libpq-dev

git clone https://github.com/nicosmaris/crypteia_2.git
rake db:migrate RAILS_ENV=development

bundle install
rake db:migrate

rails server
```

