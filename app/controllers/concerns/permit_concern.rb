module PermitConcern
  extend ActiveSupport::Concern

  module ClassMethods
    private
    # DSL
    # Разрешить передачу параметров из params
    # @param [Hash] attributes
    def permit(attributes)
      attributes = attributes.symbolize_keys
      @permitter = ->(params_scope, controller) do
        (params_scope.present? ? controller.params.require(params_scope) : controller.params).permit(*attributes[params_scope])
      end
    end

    # Получает ключи из массива параметров для strong_params
    #
    # @return [Array<Symbol>]
    #
    def param_keys(model_params)
      model_params.flat_map{ |i| i.is_a?(Hash) ? i.try(:keys) : i  }
    end
  end

  # Возвращает разрешенные параметы
  # @param [Symbol] params_scope Массив с параметрами, например: :post для params[:post]
  def permitted_params(params_scope = nil)
    params = self.class.instance_variable_get(:@permitter).call(params_scope.try(:to_sym), self)

    # Дополнительная фильтрация параметров на уровне контроллера
    yield(params) if block_given?

    params
  end
end
