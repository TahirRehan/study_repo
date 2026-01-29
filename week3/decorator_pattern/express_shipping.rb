module Week3
  module DecoratorPattern
    class ExpressShipping < Calculator
      def cost
        super + 15
      end
    end
  end
end
