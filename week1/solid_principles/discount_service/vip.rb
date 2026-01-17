module Week1
  module SolidPrinciples
    module DiscountService
      class Vip < Base
        def calculate
          total_price * 0.8
        end
      end
    end
  end
end
