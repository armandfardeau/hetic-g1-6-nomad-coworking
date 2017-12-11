module UsersHelper
  def nice_display_review_list(room)
    return if room.reviews.blank?
    render partial: 'users/partials/review', locals: {room: room}
  end
end
