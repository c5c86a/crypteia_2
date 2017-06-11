class SettingsController < ApplicationController

  def new

  end

  def index

  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    byebug
    if @setting.update_attributes(setting_params)
      flash[:success] = 'Updated Successfully'
      redirect_to root_path
    end
  end


  private


  #settings_params

  def setting_params
    params.require(:setting).permit(:index_v,:country_v,:country_code_v,:threat_tri_v,:host_v,:threat_id_v,:risk_v,:asn_v,:asn_registry_v,preferences:{})
  end


end
