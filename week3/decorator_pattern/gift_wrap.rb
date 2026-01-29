module Week3
  module DecoratorPattern
    class GiftWrap < Calculator
      def cost
        super + 5
      end
    end
  end
end
