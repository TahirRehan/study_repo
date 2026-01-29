module Week3
  module DecoratorPattern
    class OrderService
      def initialize(orders = {})
        @orders = orders
      end

      def apply
        orders.each do |order_name, price|
          order = Order.new(price)
          order = GiftWrap.new(order)
          order = ExpressShipping.new(order)
          order = Insurance.new(order)
          puts "Cost of #{order_name} is: #{order.cost}"
        end
      end

      private

      attr_reader :orders

    end
  end
end
