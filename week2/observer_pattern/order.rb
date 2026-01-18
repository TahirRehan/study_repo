module Week2
  module ObserverPattern
    class Order
      def initialize(user_email:, user_phone:, status: 'pending', observers: [])
        @user_email = user_email
        @user_phone = user_phone
        @status = status
        @observers = observers || []
      end

      def process!
        puts "Processing order for #{user_email}"
        puts 'Order is still pending' and return if status == 'pending'
        puts "Order is #{status}"
        notify_user
      end

      private

      attr_reader :user_email, :user_phone, :status, :observers

      def notify_user
        actions = notification_actions
        observers.each do |observer|
          action = actions[observer]
          action.call if action
        end
      end

      def notification_actions
        email = NotificationService::SendEmail.new(user_email)
        sms = NotificationService::SendSms.new(user_phone)
        {
          'send_email' => -> { email.send if email.can_notify? },
          'send_sms' => -> { sms.send if sms.can_notify? },
          'update_dashboard' => -> { puts('Dashboard updated') }
        }
      end
    end
  end
end
