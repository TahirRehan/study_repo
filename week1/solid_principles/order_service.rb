module Week1
  module SolidPrinciples
    class OrderService
      def initialize(args = {})
        @user = args[:user]
        @order = args[:order]
        @discount_type = args[:discount_type]
      end

      def apply
        checkout(order, user, discount_type)
      end

      private
      attr_reader :user, :order, :discount_type

      def checkout(order, user, discount_type)
        puts "The total amount is #{total_amount} for #{discount_type} subscription"
        notify_user
      end

      def total_amount
        service = "Week1::SolidPrinciples::DiscountService::#{discount_type.capitalize}"
        service.split("::").inject(Object) { |mod, class_name| mod.const_get(class_name) }.new(total_price).calculate
      end

      def total_price
        order.sum { |item| item[:price] * item[:quantity] }
      end

      def notify_user
        providers = [
          NotificationService::SendEmail.new(user[:email]),
          NotificationService::SendSms.new(user[:phone])
        ]

        providers.each { |provider| provider.send if provider.can_notify? }
      end
    end
  end
end
