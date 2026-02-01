module Week4
  module FactoryPattern
    class NotificationSenderFactory
      def initialize(record)
        @record = record
      end

      def create_sender
        service = "NotificationService::#{record[:type].split("_").map(&:capitalize).join}"
        service.split("::").inject(Object) { |mod, class_name| mod.const_get(class_name) }.new(record[:recipient])
      rescue NameError
        raise "Unknown type"
      end

      private

      attr_reader :record

    end
  end
end
