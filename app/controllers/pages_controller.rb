require 'elasticsearch/persistence'
class PagesController < ApplicationController
  include Elasticsearch::Model


  def do
    Page.__elasticsearch__.client =  Elasticsearch::Client.new url: URL_KEY,
    transport_options: {
      ssl: {
        ca_file: 'public/elasticsearch_cert.pem',
      }
    }

    repository = Elasticsearch::Persistence::Repository.new
    repository.client = Page.__elasticsearch__.client


  end
end
