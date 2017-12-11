module ApplicationHelper
  def avatar_url(user)
    if user.avatar.present?
      user.avatar.url
    else
      'default_profil_picture.svg'
    end
  end

  def first_room_photos(room, size = :medium)
    return 'default_room_photos.svg' if room.photos.blank? || room.nil?
    if room.photos.length > 0
      room.photos[0].image.url(size)
    end
  end
end
