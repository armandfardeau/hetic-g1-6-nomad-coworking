class PagesController < ApplicationController
  def home
    @offices = Office.order('RANDOM()').limit(3)
  end

  def search
    search_places(params[:search])
    @search = @offices_address.ransack(params[:q])
    @offices = @search.result
    @arr_offices = @offices.to_a
    search_availabilities(params[:start_date], params[:end_date])
  end

  def confidentiality
  end
end

private

def search_places(param)
  session[:aiirbnb_search] = param if param.present? && param.strip != ''
  if session[:aiirbnb_search] && session[:aiirbnb_search] != ''
    @offices_address = Office.where(active: true).near(session[:aiirbnb_search], 5, order: 'distance')
  else
    @offices_address = Office.where(active: true).all
  end
end

def search_availabilities(start_date, end_date)
  return if start_date.blank? && end_date.blank?
  start_date = Date.parse(start_date)
  end_date = Date.parse(end_date)
  @offices.each do |office|
    not_available = office.reservations.available(start_date, end_date)
    @arr_offices.delete(office) unless not_available.empty?
  end
end
