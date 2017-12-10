class Photo < ApplicationRecord
  belongs_to :room
  has_many :photos, dependent: :destroy
  has_attached_file :image,
                    styles: {medium: '300x300>', thumb: '100x100>'}
  validates_attachment_content_type :avatar, content_type: %w[image/jpg image/jpeg image/png]
end
