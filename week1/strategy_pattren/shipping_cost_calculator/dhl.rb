module Week1
  module StrategyPattern
    module ShippingCostCalculator
      class Dhl < Base
        def calculate
          weight * 12 + 20
        end
      end
    end
  end
end
