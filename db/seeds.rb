# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Setting.delete_all
s = Setting.new
s.preferences = {"index":"0","country":"1","country_code":"0","threat_id":"1","host":"1","threat_tri":"0","risk":"0","asn":"0","asn_registry":"0",
  "category":"0","category_description":"0","city":"0", "confidence":"0","continent_code":"0","location":"0","logid":"0",
  "message":"0","source_ids":"0","threat_type":"0","type":"0",
  "type_description":"0","global_filter_time":"0","lgstash_backend":"0","logstash_febe_latency_sec":"0",
  "logstash_frontend":"0","raw_message_bytesize":"0","vendor_filter_time":"0","id":"0","srcevent":"0","timestamp":"0","vendor":"0","version":"0"}
  s.save
