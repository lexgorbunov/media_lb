class Photo::Image < MediaFile
  belongs_to :owner, foreign_key: :media_file_id, inverse_of: :image, class_name: Photo.name

  validates_attachment_content_type :file, content_type: %w(image/jpg image/jpeg image/png)

  def get_styles
    {
      _80x80:   { geometry: '80x80#' },
    }
  end
end
