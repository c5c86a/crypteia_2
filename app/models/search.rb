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
  attribute :category, String, mapping: { fields: { category: { type: 'string' } } }
  attribute :category_description, String, mapping: { fields: { category_description: { type: 'string' } } }
  attribute :city, String, mapping: { fields: { city: { type: 'string' } } }
  attribute :confidence, Float, mapping: { fields: { confidence: { type: 'float' } } }
  attribute :continent_code, String, mapping: { fields: { continent_code: { type: 'string' } } }
  attribute :location, Float, mapping: { fields: { location: { type: 'double' } } }
  attribute :logid, String, mapping: { fields: { logid: { type: 'string' } } }
  attribute :message, String, mapping: { fields: { message: { type: 'string' } } }
  attribute :source_ids, String, mapping: { fields: { source_ids: { type: 'string' } } }
  attribute :threat_type, String, mapping: { fields: { threat_type: { type: 'string' } } }
  attribute :type, String, mapping: { fields: { type: { type: 'string' } } }
  attribute :type_description, String, mapping: { fields: { type_description: { type: 'string' } } }
  attribute :global_filter_time, String, mapping: { fields: { '&global_filter_time': { type: 'long' } } }
  attribute :logstash_backend, String, mapping: { fields: { '&logstash_backend': { type: 'string' } } }
  attribute :logstash_febe_latency_sec, String, mapping: { fields: { '&logstash_febe_latency_sec': { type: 'string' } } }
  attribute :logstash_frontend, String, mapping: { fields: { '&logstash_frontend': { type: 'string' } } }
  attribute :raw_message_bytesize, Integer, mapping: { fields: { '&raw_message_bytesize': { type: 'integer' } } }
  attribute :vendor_filter_time, Float, mapping: { fields: { '&vendor_filter_time': { type: 'long' } } }
  attribute :id, String, mapping: { fields: { '@id': { type: 'string' } } }
  attribute :srcevent, String, mapping: { fields: { '@srcevent': { type: 'string' } } }
  attribute :timestamp, String, mapping: { fields: { '@timestamp': { type: 'date' } } }
  attribute :vendor, String, mapping: { fields: { '@vendor': { type: 'string' } } }
  attribute :version, Integer, mapping: { fields: { '@version': { type: 'integer' } } }
  alias_attribute :'&global_filter_time', :global_filter_time
  alias_attribute :'&logstash_backend', :logstash_backend
  alias_attribute :'&logstash_febe_latency_sec', :logstash_febe_latency_sec
  alias_attribute :'&logstash_frontend', :logstash_frontend
  alias_attribute :'&raw_message_bytesize', :raw_message_bytesize
  alias_attribute :'&vendor_filter_time', :vendor_filter_time
  alias_attribute :'@id', :id
  alias_attribute :'@srcevent', :srcevent
  alias_attribute :'@timestamp', :timestamp
  alias_attribute :'@vendor', :vendor
  alias_attribute :'@version', :version
end
