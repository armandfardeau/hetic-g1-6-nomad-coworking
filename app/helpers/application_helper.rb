module ApplicationHelper
  def avatar_url(user)
    if user.avatar.present?
      user.avatar.url
    elsif user.image
      user.image
    else
      'default_profil_picture.svg'
    end
  end

  def first_room_photos(room, size = :medium)
    return 'default_room_photos.svg' if room.photos.blank? || room.nil?
    room.photos[0].image.url(size) unless room.photos.empty?
  end
end
