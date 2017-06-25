class Server < ApplicationRecord
  include Elasticsearch::Persistence::Model

  def self.client
    Elasticsearch::Persistence.client
  end


  def self.indexes      
    Server.client.cat.indices(h: 'index', format: 'json', index: 'threatdb*', s: 'index').map {|x| x['index']}.sort.reverse!
  end
end
