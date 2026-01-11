base_files = Dir[File.join(__dir__, '**', 'base.rb')].sort
other_files = Dir[File.join(__dir__, '**', '*.rb')].sort.reject { |f| f.end_with?('base.rb') }
(base_files + other_files).each { |file| require file }
class DashBoard
  class << self
    LESSONS = {
      '1' => ['SOLID Principles', Week1::SolidPrinciples::OrderService],
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
        }
      }
    end
  end
end
