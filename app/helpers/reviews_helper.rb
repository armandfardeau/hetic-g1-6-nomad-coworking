module ReviewsHelper
  def nice_display_delete_comment(office, review, user = current_user)
    return unless user && user == review.user
    render partial: 'reviews/partials/destroy_link', locals: {office: office, r: review}
  end
end
