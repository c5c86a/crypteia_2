# config/initializers/elasticsearch.rb
# ENV['ELASTICSEARCH_ADDRESS_INT'] is the environment variable
# for the elasticsearch server, replace with IP address if not using ENV
#Page.__elasticsearch__.client = Elasticsearch::Client.new host: 'localhost:3000'

require 'yaml'
require 'elasticsearch/transport'
=begin
config = {
  host: "https://100.100.53.13:443/",
  transport_options: {
    request: { timeout: 5 }
  }
}


config = {
 # host: "https://159.8.53.13:443/",
    host: '159.8.53.13',
    port: '443',
    user: 'kteam',
    password: 'draewjUgbksIjcv19epwhpkcpnzieqkn',
    scheme: 'https',
  transport_options: {
    request: { timeout: 300 }
  }
}

=end


=begin

config = {
 # host: "https://159.8.53.13:443/",
    host: '159.8.53.13',
    port: '443',
    user: 'kteam',
    password: 'draewjUgbksIjcv19epwhpkcpnzieqkn',
    scheme: 'https',
  transport_options: {
    ssl: {
      ca_path: '/public/',
      ca_file: '/public/elasticsearch_cert.pem'
     } ,
    request: { timeout: 300 }
  }
}

#if File.exists?("config/elasticsearch.yml")
#  config.merge!(YAML.load_file("config/elasticsearch.yml")[Rails.env].symbolize_keys)
#end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)

=end
#connection = Faraday.new 'https://example.com', :ssl => {:verify => false}
client = Elasticsearch::Model.client
client = Elasticsearch::Client.new url: 'https://kteam:draewjUgbksIjcv19epwhpkcpnzieqkn@159.8.53.13:443',
                          transport_options: {
                          ssl: {
                            ca_file: 'public/elasticsearch_cert.pem',
                             }
                            }

response =client.perform_request 'GET', '_cluster/health' 
=begin

URL: https://159.8.53.13:443/
User: kteam
Pass: draewjUgbksIjcv19epwhpkcpnzieqkn
=end
