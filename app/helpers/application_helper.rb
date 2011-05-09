module ApplicationHelper

  def filter_tag url, params = {}
    params[:id] = 'filter'
    params[:'data-url'] = url
    params[:placeholder] = 'start typing' if params[:placeholder].blank?
    text_field_tag 'like', '', params
  end

end
