module Week1
  module StrategyPattern
    class ShippingCalculator
      def initialize(args = {})
        @weight = args[:order][:weight]
        @method = args[:method]
      end

      def apply
        source = "Week1::StrategyPattern::ShippingCostCalculator::#{method.capitalize}"
        shipping_cost = source.split("::").inject(Object) { |mod, class_name| mod.const_get(class_name) }.new(weight).calculate
        puts "The shipping cost is #{shipping_cost} using #{method} method"
      end

      private
      attr_reader :weight, :method
    end
  end
end
