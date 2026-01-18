module Week1
  module StrategyPattern
    module ShippingCostCalculator
      class Fedex < Base
        def calculate
          weight * 10 + 15
        end
      end
    end
  end
end
