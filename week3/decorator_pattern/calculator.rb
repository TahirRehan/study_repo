module Week3
  module DecoratorPattern
    class Calculator < BaseOrder
      def initialize(order)
        @order = order
      end

      def cost
        order.cost
      end

      private
      attr_reader :order
    end
  end
end
