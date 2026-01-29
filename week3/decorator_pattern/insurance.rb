module Week3
  module DecoratorPattern
    class Insurance < Calculator
      def cost
        super + 10
      end
    end
  end
end
