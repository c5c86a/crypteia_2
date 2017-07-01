class SearchController < ApplicationController
  before_action :require_admin ,only: [:edit,:update,:destroy]
  require 'elasticsearch/persistence/model'
  require 'elasticsearch/dsl'

  def settings


  end

  def index
    #Search.connection
    #@Search = Search.search(query: { match: {country_code: params[:q]}}) unless params[:q].nil?
    # if !params[:q] && !params[:country]
    #   @Search = Search.all(size:50)# unless params[:q].nil?
    # else
    if params[:q]
      @Search = Search.search(query: { match: {threat_id: params[:q]}},size:10) unless params[:q].nil?
    else
      @Search = Search.search(query: { match: {country: params[:country]}},size:10) unless params[:country].nil?
    end
    # end
    #byebug
    @setting = Hashie::Mash.new Setting.first.preferences
    @single = Setting.first

    @search1 = Search.search(query:{match_all:{}},size:10,sort:['threat_tri': { "order": "desc" } ])
    @search_country = Search.search(size:0,aggs:{'group_by_country':{'terms':{'field':'country.raw'}}})
    @search_by_tri = Search.search(size:0,aggs:{'group_by_country':{'terms':{'field':'country.raw','order':{'average_threat_tri':'desc'}},aggs:{'average_threat_tri':{avg:{'field':'threat_tri'}}}}})

    @attr = []
    @setting =Setting.first.preferences
    @attr = @setting.to_a.select{|a| a.last == "1"}.map {|m| m.first}    # => byebug
    #byebug
  end

  def show
    @setting = Hashie::Mash.new Setting.first.preferences
    @single = Setting.first
    @Search = Search.search(query:{match: {_id: params[:id]}}).first
    @threat_history = []
    Server.indexes.each do |index|
      Search.index_name = index
      @threat_history << Search.search(query:{match: {threat_id: @Search.threat_id}}).first
    end
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
      location:  params[:location].to_f,
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
    if current_user
      unless current_user.is_admin
        flash[:error] = "You must be an administrator in to access this section"
        redirect_to root_path
      end
    else
      flash[:error] = "You must be an logged in to access this section"
      redirect_to root_path
    end
  end

end
