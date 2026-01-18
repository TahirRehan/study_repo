module Week2
  module ObserverPattern
    class OrderService
      def initialize(records = [])
        @records = records
      end

      def apply
        records.each do |record|
          process_record(record)
        end
      end

      private

      attr_reader :records

      def process_record(order)
        Order.new(
          user_email: order[:user_email],
          user_phone: order[:user_phone],
          status: order[:status],
          observers: order[:observers]
        ).process!
      end
    end
  end
end
