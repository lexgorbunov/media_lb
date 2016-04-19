class Gallery < ActiveRecord::Base
  has_many   :photos, dependent: :destroy, inverse_of: :gallery
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: :all_blank

  PARAMS = [
    :title,
    :is_published,
    photos_attributes: Photo::PARAMS + [:_destroy],
  ]

  belongs_to :user

  scope :published, -> (flag = true) { where(is_published: flag) }

  validates :title, presence: true
  validates :user, presence: true

end
