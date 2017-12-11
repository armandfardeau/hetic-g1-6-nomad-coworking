module RoomsHelper
  def nice_display_of_carousel(room, size = :original)
    render partial: 'rooms/partials/carousel', locals: {room: room, size: size}
  end

  def nice_display_of_google_maps(room, height)
    render partial: 'rooms/partials/google_maps', locals: {room: room, height: height}
  end
end
