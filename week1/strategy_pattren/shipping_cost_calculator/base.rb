module Week1
  module StrategyPattern
    module ShippingCostCalculator
      class Base
        def initialize(weight)
          @weight = weight
        end

        def calculate
          raise NotImplementedError, "sub must implement the calculate method"
        end

        private
        attr_reader :weight
      end
    end
  end
end
