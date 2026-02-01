module NotificationService
  class PushNotifier < Base
    def send
      puts "Notification was pushed successfully to #{provider}"
    end

    def can_notify?
      !provider.to_s.empty?
    end
  end
end
