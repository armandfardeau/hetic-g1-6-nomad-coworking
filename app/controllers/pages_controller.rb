class PagesController < ApplicationController
  def home
    @rooms = Room.order('RANDOM()').limit(3)
  end

  def search
    search_places(params[:search])
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result
    @arr_rooms = @rooms.to_a
    search_availabilities(params[:start_date], params[:end_date])
  end
end

def search_places(param)
  session[:aiirbnb_search] = param if param.present? && param.strip != ''
  if session[:aiirbnb_search] && session[:aiirbnb_search] != ''
    @rooms_address = Room.where(active: true).near(session[:aiirbnb_search], 5, order: 'distance')
  else
    @rooms_address = Room.where(active: true).all
  end
end

def search_availabilities(start_date, end_date)
  return if start_date.blank? && end_date.blank?
  start_date = Date.parse(start_date)
  end_date = Date.parse(end_date)
  @rooms.each do |room|
    not_available = room.reservations.where('(? <= start_date AND start_date <= ?) OR
            (? <= end_date AND end_date <= ?) OR (start_date < ? AND ? < end_date)', start_date, end_date,
                                            start_date, end_date, start_date, end_date).limit(1)
    if not_available.length > 0
      @arr_rooms.delete(room)
    end
  end
end

