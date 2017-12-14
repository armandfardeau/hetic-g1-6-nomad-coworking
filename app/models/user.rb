class User < ApplicationRecord
  has_many :reservations, dependent: :delete_all
  has_many :rooms, dependent: :destroy
  has_many :reviews, dependent: :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :fullname, presence: true, length: {maximum: 65}

  has_attached_file :avatar,
                    styles: {medium: '300x300>', thumb: '100x100>'},
                    default_url: '/assets/images/default_profil_picture.svg'
  validates_attachment_content_type :avatar, content_type: %w[image/jpg image/jpeg image/png]

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email).first
    return user if user.present?
    where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
      u.fullname = auth.info.name
      u.provider = auth.provider
      u.uid = auth.uid
      u.email = auth.info.email
      u.image = auth.info.image
      u.password = Devise.friendly_token[0, 20]
    end
  end
end
