module Week1
  module SolidPrinciples
    module DiscountService
      class Seasonal < Base
        def calculate
          total_price * 0.9
        end
      end
    end
  end
end
