module Week1
  module StrategyPattern
    module ShippingCostCalculator
      class Aramex < Base
        def calculate
          weight * 8 + 10
        end
      end
    end
  end
end

