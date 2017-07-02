require 'elasticsearch/model'

class Search < ApplicationRecord
  #require 'elasticsearch-persistence'
  include Elasticsearch::Persistence::Model
  #include Elasticsearch::Model::Callbacks
  include Elasticsearch::DSL

  index_name  Server.indexes.first
  document_type ''

  # should be treated as const
  attr_accessor :type_per_alias
 
  def initialize()
    super
    # keys written per type and then per alphabetic order
    @type_per_alias = {
      "asn": 'string',
      "asn_registry": 'string',
      "category": 'string',
      "category_description": 'string',
      "city": 'string',
      "continent_code": 'string',
      "country": 'string',
      "country_code": 'string',
      "host": 'string',
      "index": 'string',
      "logid": 'string',
      "message": 'string',
      "threat_id": 'string',
      "threat_type": 'string',
      "type": 'string',
      "type_description": 'string',
      "source_ids": 'string',
      "threat_tri": 'float',
      "confidence": 'float',
      "risk": 'double',
      "location": 'double',
      '&global_filter_time': 'long',
      '&logstash_backend': 'string',
      '&logstash_febe_latency_sec': 'string',
      '&logstash_frontend': 'string',
      '&raw_message_bytesize': 'integer',
      '&vendor_filter_time': 'long',
      '@id': 'string',
      '@srcevent': 'string',
      '@timestamp': 'date',
      '@vendor': 'string',
      '@version': 'integer',
    }
    @type_per_alias.each do |reference, t|
      without_prefix = reference
      symbol = without_prefix.to_s
      if reference[0]=='&' or reference[0]=='@'
        without_prefix = reference[1..-1]
        symbol = without_prefix.to_s
      end
      map = {}
      map[reference] = {}
      map[reference]['type'] = t
      type = t
      cast = String
      if type=='float'
        cast = Float
      elsif type=='integer'
        cast = Integer
      elsif type=='long'
        cast = String
      elsif type=='double'
        cast = Float
      end
      self.class.attribute symbol, cast, mapping: { fields: map}
      if reference[0]=='&' or reference[0]=='@'
        self.class.alias_attribute :reference, :without_prefix
      end
    end
  end
end
