# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Setting.delete_all
s = Setting.new
s.preferences = {"index_v":"1","country_v":"0","country_code_v":"0","threat_id_v":"0","host_v":"0","threat_tri_v":"0","risk_v":"0","asn_v":"0","asn_registry_v":"0"}
s.save
