module MediaSupport
  extend ActiveSupport::Concern

  module ClassMethods
    def media(*params)

      options = params.extract_options!

      self.class_eval do
        params.each do |param|
          has_one(
            param,
            {
              foreign_key: :media_file_id,
              class_name: "#{self.to_s}::#{param.to_s.classify}",
              dependent: :destroy
            }.merge(options)
          )
          accepts_nested_attributes_for(param, allow_destroy: true)
        end
      end
    end
  end
end
