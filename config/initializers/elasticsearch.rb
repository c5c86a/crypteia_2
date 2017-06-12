#require 'elasticsearch-persistence'
File.open('public/elasticsearch_cert.pem', 'w') { |file| file.write(Rails.application.secrets.PEM.gsub(/\n/, "\n")) }
url_key = Rails.application.secrets['URL']
puts url_key

config = {
  host: url_key,
  transport_options: { ssl: {
    ca_file: 'public/elasticsearch_cert.pem',
     }
    }
   }


Elasticsearch::Persistence.client = Elasticsearch::Client.new(config)
