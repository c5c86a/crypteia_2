class SearchController < ApplicationController
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
    #byebug
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
      asn:  params[:asn]
    )
    # if @s.save
    #   #byebug
    #sleep 3
    flash[:success] = 'Record successfully updated!'
    redirect_to search_index_path
    # else
    #   sleep 3
    #   flash[:warning] = 'Something went wrong'
    #   redirect_to search_index_path
    # end
  end


  def destroy
    begin
      @s = Search.search(query:{match: {_id: params[:id]}}).first
      #@s.destroy
      #

      @s.destroy
      flash[:success] = 'Record successfully deleted!'  if @s.destroyed?


    rescue

    end
    #sleep 3
    redirect_to search_index_path

  end

end
