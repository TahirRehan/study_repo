module Week1
  module SolidPrinciples
    module DiscountService
      class Base
        def initialize(total_price)
          @total_price = total_price
        end

        def calculate
          raise NotImplementedError, "sub must implement the calculate method"
        end

        private
        attr_reader :total_price
      end
    end
  end
end
