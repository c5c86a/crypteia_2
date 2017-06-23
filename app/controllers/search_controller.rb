class SearchController < ApplicationController
 before_action :require_admin ,only: [:edit,:update,:destroy]
  require 'elasticsearch/persistence/model'
  require 'elasticsearch/dsl'

  def settings


  end

  def index
    #Search.connection
    #@Search = Search.search(query: { match: {country_code: params[:q]}}) unless params[:q].nil?
    if !params[:q]
      @Search = Search.search(query: { match: {country_code: 'eth'}})# unless params[:q].nil?
    else
      @Search = Search.search(query: { match: {country_code: params[:q]}}) unless params[:q].nil?

    end

    @setting = Hashie::Mash.new Setting.first.preferences
    @single = Setting.first
  end

  def edit
    @Search = Search.search(query:{match: {_id: params[:id]}}).first
  end


  def update
    @s = Search.search(query:{match: {_id: params[:id]}}).first
    @s.update_attributes(
    threat_id: params[:threat_id],
    asn_registry: params[:asn_registry],
    threat_tri: params[:threat_tri].to_f,
    risk: params[:risk].to_f,
    country:  params[:country],
    asn:  params[:asn],


    confidence:  params[:confidence],
    continent_code:  params[:continent_code],
    location:  params[:location],
    logid:  params[:logid],
    message:  params[:message],
    source_ids:  params[:source_ids],
    threat_type:  params[:threat_type],
    type:  params[:continent_code],
    type_description:  params[:type_description],

    global_filter_time:  params[:global_filter_time],
    logstash_backend:  params[:logstash_backend],
    logstash_febe_latency_sec:  params[:logstash_febe_latency_sec],
    logstash_frontend:  params[:logstash_frontend],
    raw_message_bytesize:  params[:raw_message_bytesize],
    vendor_filter_time:  params[:vendor_filter_time],
    id:  params[:id],
    srcevent:  params[:srcevent],
    timestamp:  params[:timestamp],
    vendor:  params[:vendor],
    version:  params[:version]
    )
    flash[:success] = 'Record successfully updated!'
    redirect_to search_index_path
  end


  def destroy
    begin
      @s = Search.search(query:{match: {_id: params[:id]}}).first
      @s.destroy
      flash[:success] = 'Record successfully deleted!'  if @s.destroyed?


    rescue

    end
    redirect_to search_index_path

  end
  private

  def require_admin
   unless current_user.is_admin
        flash[:error] = "You must be an administrator in to access this section"
        redirect_to root_path
   end
  end

end
