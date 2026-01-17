module Week1
  module SolidPrinciples
    module DiscountService
      class Coupon < Base
        def calculate
          total_price - 20
        end
      end
    end
  end
end
