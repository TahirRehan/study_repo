module Week4
  module FactoryPattern
    class NotificationSender
      def initialize(record = [])
        @record = record
      end

      def apply
        record.each do |record|
          notification = Week4::FactoryPattern::NotificationSenderFactory.new(record).create_sender
          notification.send
        end
      end

      private

      attr_reader :record

    end
  end
end
