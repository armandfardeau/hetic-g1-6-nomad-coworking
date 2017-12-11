module RoomsHelper
  def nice_display_of_carousel(room, size = :original)
    render partial: 'rooms/partials/carousel', locals: {room: room, size: size}
  end

  def nice_display_of_google_maps(room, height)
    render partial: 'rooms/partials/google_maps', locals: {room: room, height: height}
  end

  def nice_display_edit_options(action = 'edit')
    return unless controller.action_name == action
    render 'rooms/partials/edit_options'
  end

  def nice_display_comments_form(booked, has_review)
    return unless booked.blank? && !has_review
    render 'reviews/form'
  end
end
