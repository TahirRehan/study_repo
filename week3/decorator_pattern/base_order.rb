module Week3
  module DecoratorPattern
    class BaseOrder
      def cost
        raise NotImplementedError, 'sub must implement the cost method'
      end
    end
  end
end
