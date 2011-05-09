class CountriesController < ApplicationController
  
  def index

    @countries = unless params[:like].blank?
      Country.named_like(params[:like])
    else
      Country.find(:all)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
      format.js
    end
  end

  def update_visit
    @country = Country.find(params[:id])
    user_country_relation = UserCountryRelation.find_or_create_by_user_id_and_country_id(current_user.id, @country.id)
    user_country_relation.visited = params[:visited]
    user_country_relation.save
    respond_to do |format|
      format.js
    end
  end

  def show
    @country = Country.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @country }
    end
  end

  
end