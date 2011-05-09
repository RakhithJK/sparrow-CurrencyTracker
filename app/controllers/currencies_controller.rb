class CurrenciesController < ApplicationController
  
  def index

    @currencies = unless params[:like].blank?
      Currency.named_like(params[:like])
    else
      Currency.find(:all)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currencies }
      format.js
    end
  end

  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @currency }
    end
  end

  def update_collect
    @currency = Currency.find(params[:id])
    user_country_relation = UserCountryRelation.find_or_create_by_user_id_and_country_id(current_user.id, @currency.country.id)
    user_country_relation.visited = params[:visited]
    user_country_relation.save
    respond_to do |format|
      format.js
    end
  end
end