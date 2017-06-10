class Search < ApplicationRecord
  #require 'elasticsearch-persistence'
  include Elasticsearch::Persistence::Model
  #include Elasticsearch::Model::Callbacks
  include Elasticsearch::DSL
  index_name 'threatdb_2017.06.10'
  document_type ''



  attribute :index , String , mapping: { fields: { index: {type: 'string'}}}
  attribute :country , String , mapping: { fields: { country: {type: 'string'}}}
  attribute :country_code , String , mapping: { fields: { country_code: {type: 'string'}}}
  attribute :threat_id , String , mapping: { fields: { threat_id: {type: 'string'}}}
  attribute :host , String , mapping: { fields: { host: {type: 'string'}}}
  attribute :threat_tri , Float , mapping: { fields: { threat_tri: {type: 'double'}}}
  attribute :risk , Float ,mapping: { fields: { risk: {type: 'float'}}}
  attribute :asn , String ,mapping: { fields: { asn: {type: 'string'}}}
  attribute :asn_registry , String ,mapping: { fields: { asn_registry: {type: 'string'}}}
end
