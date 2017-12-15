module ApplicationHelper
  def avatar_url(user, size = :original)
    if user.avatar.present?
      user.avatar.url(size)
    elsif user.image
      user.image
    else
      'default_profil_picture.svg'
    end
  end

  def first_office_photos(office, size = :medium)
    return 'default_office_photos.svg' if office.photos.blank? || office.nil?
    office.photos[0].image.url(size) unless office.photos.empty?
  end
end
