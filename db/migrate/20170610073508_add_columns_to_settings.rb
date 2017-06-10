class AddColumnsToSettings < ActiveRecord::Migration[5.1]
  def change
   add_column :settings, :index_v, :boolean , :default => false
    add_column :settings, :country_v, :boolean , :default => false
    add_column :settings, :country_code_v, :boolean , :default => false
    add_column :settings, :threat_id_v, :boolean , :default => false
    add_column :settings, :host_v, :boolean , :default => false
    add_column :settings, :threat_tri_v, :boolean , :default => false
    add_column :settings, :risk_v, :boolean , :default => false
    add_column :settings, :asn_v, :boolean , :default => false
    add_column :settings, :asn_registry_v, :boolean , :default => false
  end
end
