# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Setting.delete_all
s = Setting.new
s.preferences = {"index_v":"1","country_v":"1","country_code_v":"0","threat_id_v":"0","host_v":"0","threat_tri_v":"0","risk_v":"0","asn_v":"0","asn_registry_v":"0",
  "category_v":"0","category_description_v":"0","city_v":"0", "confidence_v":"0","continent_code_v":"0","location_v":"0","logid_v":"0",
  "message":"0","source_ids_v":"0","threat_type_v":"0","type_v":"0",
  "type_description_v":"0","global_filter_time_v":"0","lgstash_backend_v":"0","logstash_febe_latency_sec_v":"0",
  "logstash_frontend_v":"0","raw_message_bytesize_v":"0","vendor_filter_time_v":"0","id_v":"0","srcevent_v":"0","timestamp_v":"0","vendor_v":"0","version_v":"0"}
  s.save
