base_files = Dir[File.join(__dir__, '**', 'base.rb')].sort
other_files = Dir[File.join(__dir__, '**', '*.rb')].sort.reject { |f| f.end_with?('base.rb') }
(base_files + other_files).each { |file| require file }
class DashBoard
  class << self
    LESSONS = {
      '1' => ['SOLID Principles', Week1::SolidPrinciples::OrderService],
      '2' => ['Strategy Pattern', Week1::StrategyPattern::ShippingCalculator],
      '3' => ['Observer Pattern', Week2::ObserverPattern::OrderService],
      '4' => ['Decorator Pattern', Week3::DecoratorPattern::OrderService],
      '5' => ['Factory Pattern', Week4::FactoryPattern::NotificationSender]
    }

    def show
      puts 'Select the number of lesson you want to apply:'
      LESSONS.each { |key, value| puts "#{key} => #{value}" }
      print 'Enter lesson number: '
      input = gets.chomp
      if LESSONS.key?(input)
        puts "You selected: #{LESSONS[input][0]}"
        LESSONS[input][1].new(records[input]).apply
      else
        puts 'Invalid selection.'
      end
    end

    def records
      {
        '1' => {
           user: {id: 1, name: 'SOLID Principles User', email: 'solid@example.com', phone: '1234567890'},
           order: [
              {name: 'Item 1', price: 50, quantity: 6},
              {name: 'Item 2', price: 100, quantity: 4},
              {name: 'Item 3', price: 150, quantity: 2}
            ],
           discount_type: 'coupon'
        },
        '2' => {
          order: {weight: 10},
          method: 'aramex'
        },
        '3' => [
          {
            status: 'confirmed',
            user_email: 'observer@confirmed.com',
            user_phone: '0237403871341',
            observers: [
              'send_email',
              'update_dashboard'
            ]
          },
          {
            status: 'cancelled',
            user_email: 'observer@cancelled.com',
            user_phone: '364983648964',
            observers: [
              'send_sms',
              'update_dashboard'
            ]
          }
        ],
        '4' => {
          'Order One': 100,
          'Order Two': 200
        },
        '5' => [
          { type: 'send_email', recipient: 'factory@pattren.com '},
          { type: 'send_sms', recipient: '9876543210' },
          { type: 'push_notifier', recipient: 'SAM 123' },
          { type: 'unknown_type', recipient: 'test' }
        ]
      }
    end
  end
end
