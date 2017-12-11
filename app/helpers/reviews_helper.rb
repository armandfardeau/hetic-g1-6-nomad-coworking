module ReviewsHelper
  def nice_display_delete_comment(room, review, user = current_user)
    return unless user && user == review.user
    render partial: 'reviews/partials/destroy_link', locals: {room: room, r: review}
  end
end
