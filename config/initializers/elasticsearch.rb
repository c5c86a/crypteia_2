if Rails.application.secrets.PEM.nil?
  require 'dotenv'
  Dotenv.load ".env"
end

File.open('public/elasticsearch_cert.pem', 'w') { |file| file.write(Rails.application.secrets.PEM.gsub(/\\n/, "\n")) }
url_key = Rails.application.secrets['URL']

config = {
  host: url_key,
  transport_options: { ssl: {
    ca_file: 'public/elasticsearch_cert.pem',
     }
    }
   }
Elasticsearch::Persistence.client = Elasticsearch::Client.new(config)
