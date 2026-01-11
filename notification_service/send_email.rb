module NotificationService
  class SendEmail < Base
    def send
      puts "Email was sent successfully to #{provider}"
    end

    def can_notify?
      !provider.to_s.empty?
    end
  end
end
