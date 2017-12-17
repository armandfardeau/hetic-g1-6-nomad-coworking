module UsersHelper
  def nice_display_review_list(office)
    return if office.reviews.blank?
    render partial: 'users/partials/review', locals: {office: office}
  end
end
