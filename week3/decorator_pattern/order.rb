module Week3
  module DecoratorPattern
    class Order < BaseOrder
      def initialize(base_price)
        @base_price = base_price
      end

      def cost
        base_price
      end

      private
      attr_reader :base_price
    end
  end
end
