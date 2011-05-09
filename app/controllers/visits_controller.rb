class VisitsController < ApplicationController

  def update
    if !params[:country].blank?
      UserCountryRelation.update_attributes_by_user_id_and_country_id(current_user.id, params[:country], :visited => params[:visited])
    elsif !params[:countries].blank?
      params[:countries].each do |country|
        UserCountryRelation.update_attributes_by_user_id_and_country_id(current_user.id, country, :visited => params[:visited])
      end
    end

    @from = params.fetch(:from, 'country')
    respond_to do |format|
      format.js
    end
  end
  
end