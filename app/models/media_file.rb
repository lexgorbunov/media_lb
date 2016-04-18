class MediaFile < ActiveRecord::Base
  self.inheritance_column = :class_name

  has_attached_file(
    :file,
    processors:    proc { |instance| instance.get_processors },
    styles:        proc { |instance| instance.instance.get_styles }
    # default_url:   proc { |file| file.instance.class.get_default_url }
    # path:          proc { |file| file.instance.get_path },
    # url:           proc { |file| file.instance.get_url }
  )

  delegate :url, to: :file
  delegate :path, to: :file

  class << self
    def get_default_style
      :original
    end
  end

  # override it.
  # = Example
  #   <tt>{ thumb: { geometry: '100x100#' } }</tt>
  def get_styles
    {}
  end

  # @return [Array<Symbol>]
  def get_processors
    [:thumbnail]
  end

  private
  def randomize_file_name
    return if file_file_name.nil?
    if file_file_name_changed?
      extension = File.extname(file_file_name).downcase
      self.file.instance_write(:file_name, "#{SecureRandom.hex}#{extension}")
    end
  end
end
