class Photo < ApplicationRecord
  belongs_to :office
  has_attached_file :image,
                    styles: {medium: '300x300>', thumb: '100x100>'}
  validates_attachment_content_type :image, content_type: %w[image/jpg image/jpeg image/png]
end
