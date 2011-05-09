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

end