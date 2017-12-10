module ApplicationHelper
  def avatar_url(user)
    if user.avatar.present?
      user.avatar.url
    else
      'default_profil_picture.svg'
    end
  end
end
