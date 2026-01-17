module NotificationService
  class SendSms < Base
    def send
      puts "SMS was sent successfully to #{provider}"
    end

    def can_notify?
      !provider.to_s.empty?
    end
  end
end
