class RemoveFieldsFromSettings < ActiveRecord::Migration[5.1]
  def change
    remove_column :settings, :index_v
    remove_column :settings, :country_v
    remove_column :settings, :country_code_v
    remove_column :settings, :threat_id_v
    remove_column :settings, :host_v
    remove_column :settings, :threat_tri_v
    remove_column :settings, :risk_v
    remove_column :settings, :asn_v
    remove_column :settings, :asn_registry_v
  end
end
