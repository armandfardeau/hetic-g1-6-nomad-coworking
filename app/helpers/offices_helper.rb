module OfficesHelper
  def nice_display_of_carousel(office, size = :original)
    render partial: 'offices/partials/carousel', locals: {office: office, size: size}
  end

  def nice_display_of_google_maps(office, height)
    return if office.latitude.blank?
    render partial: 'offices/partials/google_maps', locals: {office: office, height: height}
  end

  def nice_display_edit_options(action = 'edit')
    return unless controller.action_name == action
    render 'offices/partials/edit_options'
  end

  def nice_display_comments_form(booked, has_review)
    return unless user_signed_in?
    return unless booked.blank? && !has_review
    render 'reviews/form'
  end
end
