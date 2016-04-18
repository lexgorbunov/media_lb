module Paperclip
  class Attachment
    def default_style
      @options[:default_style].respond_to?(:call) ? @options[:default_style].call(self.instance.file) : @options[:default_style]
    end

    def url(style_name = default_style, options = {})
      @options[:url] = @options[:url].respond_to?(:call) ? @options[:url].call(self.instance.file) : @options[:url]
      if options == true || options == false # Backwards compatibility.
        @url_generator.for(style_name, default_options.merge(:timestamp => options))
      else
        @url_generator.for(style_name, default_options.merge(options))
      end
    end

    def default_options
      {
        timestamp: @options[:use_timestamp],
        escape: @options[:escape_url]
      }
    end
  end
end
