class Photo < ActiveRecord::Base
  include MediaSupport

  media :image, inverse_of: :owner

  belongs_to :gallery

  PARAMS = [
    :id,
    :gallery_id,
    :link,
    image_attributes: [:id, :file, :_destroy]
  ]

  validates :image, presence: true
  validates :link, format: { with: URI.regexp }
end
