class SettingsController < ApplicationController
before_action :require_admin
  def new

  end

  def index

  end

  def edit
    @setting = Setting.find(params[:id])
    @hash = Hashie::Mash.new @setting.preferences
  end

  def update
    @setting = Setting.find(params[:id])
    #byebug
    if @setting.update_attributes(setting_params)
      flash[:success] = 'Updated Successfully'
      redirect_to root_path
    end
  end


  private


  #settings_params

  def setting_params
    params.require(:setting).permit(:index_v,:country_v,:country_code_v,:threat_tri_v,
    :host_v,:threat_id_v,:risk_v,:asn_v,:asn_registry_v,:confidence_v,:continent_code_v,:location_v,:logid_v,
    :message_v,:source_ids_v,:threat_type_v,:type_v,:type_description_v,:global_filter_time_v,:logstash_backend_v,
    :logstash_febe_latency_sec_v,:logstash_frontend_v,:raw_message_bytesize_v,:vendor_filter_time_v,:id_v,
    :srcevent_v,:timestamp_v,:vendor_v,:version_v,preferences:{})
  end


def require_admin
 unless current_user.is_admin
      flash[:error] = "You must be an administrator in to access this section"
      redirect_to root_path
 end
end

end
