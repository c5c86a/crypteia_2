class SearchController < ApplicationController

  def search
    unless params[:query].blank?
      #@results = Page.search( params[:query] )

    end
  end

  def asdf
    url_key = File.read('.secrets/url').strip
    client = Elasticsearch::Model.client
    client = Elasticsearch::Client.new url: url_key,
    transport_options: {
      ssl: {
        ca_file: 'public/elasticsearch_cert.pem',
      }
    }
    #  byebug
    @response = client.search index:'threatdb_2017.05.26',body:{"query":{"bool":{"must":{"query_string":{"default_field":"threatdb_tri.threat_type","query":"t_spamip"}},"must_not":[],"should":[]}},"from":0,"size":1,"sort":[],"aggs":{}}

    #@result =JSON.parse(JSON.dump(@response.as_json) , object_class:OpenStruct)
    @result = JSON.parse(JSON.dump(@response.as_json))
    @obj = Hashie::Mash.new @result

    #@result2 = JSON.parse(@obj.body.hits.hits.to_json , object_class:OpenStruct)
  end
end
