# SOLID Principles & Design Patterns Project

This project is intended to demonstrate both SOLID principles and common design patterns by Ruby

This section demonstrates the SOLID principles in Ruby using an order processing scenario. The code is organized to show how each principle can be applied in a real-world context.

- **dash_board.rb**: The main entry point and interactive dashboard for the project. It is a general-purpose launcher for all lessons and patterns. It presents available options, collects user input, and delegates to the appropriate service or example. Currently, it lets you select the SOLID Principles lesson and passes sample data to the service.

 ## How to Run (SOLID Principles)

 1. Run `ruby dash_board.rb` and follow the prompts to select the SOLID Principles lesson.
 2. The system will process a sample order, apply the selected discount, and send notifications.

---

 ## Structure (SOLID Principles)

- **week1/solid_principles/order_service.rb**: Main service class for processing orders, applying discounts, and notifying users. It delegates discount calculation and notification to specialized classes. The discount logic dynamically loads the correct discount class based on the type (e.g., Coupon, Vip, Seasonal) from the DiscountService module.
- **notification_service/notify.rb**: Handles user notifications (email and SMS) in a decoupled way, using the user’s email and phone fields.
- **week1/solid_principles/discount_service/**: (If present) Should contain discount strategy classes (e.g., Coupon, Vip, Seasonal) and a base Calculator class, each implementing their own calculation logic. **Note:** Some discount files are missing; ensure these exist for full functionality.

## SOLID Principles Demonstrated

 - **Single Responsibility Principle (SRP):**
	 - `OrderService` handles order logic only.
	 - Discount calculation is handled by separate classes in the `Discount` module.
	 - Notification logic is in its own class (`Notify`).

 - **Open/Closed Principle (OCP):**
	 - New discount types can be added by creating new classes inheriting from `DiscountService` without modifying existing code.

 - **Liskov Substitution Principle (LSP):**
	 - All discount classes (`Coupon`, `Vip`, `Seasonal`) inherit from `DiscountService` and can be used interchangeably.

 - **Interface Segregation Principle (ISP):**
	 - Each class exposes only the methods it needs (e.g., `calculate` for discounts, `send_email`/`send_sms` for notifications).

 - **Dependency Inversion Principle (DIP):**
	 - `OrderService` depends on abstractions (discount and notification interfaces), not concrete implementations.

## Example Problem (and Solution)

 **Original Problem:**
 A single `OrderService` class handled all logic, including order processing, discount calculation, and notifications, violating SRP and OCP. Example:

 ```ruby
 class OrderService
	 def checkout(order, user, discount_type)
		 total = 0
		 order.items.each do |item|
			 total += item.price * item.quantity
		 end
		 if discount_type == :vip
			 total *= 0.8
		 elsif discount_type == :coupon
			 total -= 20
		 elsif discount_type == :seasonal
			 total *= 0.9
		 end
		 if user.email
			 puts "Sending email to #{user.email}"
		 end
		 if user.phone
			 puts "Sending SMS to #{user.phone}"
		 end
		 puts "Saving order with total #{total}"
		 total
	 end
 end
 ```

 **Refactored Solution:**
 - Each responsibility is now in its own class.
 - Adding new discounts or notification types does not require modifying `OrderService`.

---

## Structure (StrategyPattern)

- **week1/strategy_pattren/shipping_calculator.rb**: Implements the Strategy Pattern for shipping cost calculation. The calculator dynamically loads the correct shipping provider class (e.g., Aramex, Fedex, DHL) based on the method name, improving extensibility and maintainability. This allows new shipping providers to be added without modifying the main calculator logic.

## Example Problem (StrategyPattern)

**Original Problem:**
A single `ShippingCalculator` class handled all shipping logic with a long conditional statement for each provider:

```ruby
class ShippingCalculator
  def calculate(order, method)
    if method == :fedex
      order.weight * 10 + 15
    elsif method == :aramex
      order.weight * 8 + 10
    elsif method == :dhl
      order.weight * 12 + 20
    else
      raise "Unknown shipping method"
    end
  end
end
calc = ShippingCalculator.new
puts calc.calculate(OpenStruct.new(weight: 5), :fedex)
```

**Refactored Solution:**
- The new implementation uses the Strategy Pattern. The dashboard passes the shipping method, and the calculator dynamically loads the correct provider class using Ruby's constant lookup. This makes it easy to add new shipping providers without modifying the main calculator logic.

In the original approach, the `ShippingCalculator` class used a series of `if`/`elsif` statements to determine which shipping provider's logic to use. This tightly coupled all shipping logic into one class, making it hard to add new providers or change existing ones without editing the main calculator. It also violated the Open/Closed Principle and made the code less maintainable.

With the Strategy Pattern, each shipping provider (e.g., Aramex, Fedex, DHL) is implemented as its own class, inheriting from a common `Base` class. The main calculator dynamically loads the correct provider class based on the method name, using Ruby's constant lookup. This means you can add new providers simply by creating a new class, without touching the main calculator logic. The dashboard passes the shipping method, and the calculator delegates the calculation to the appropriate provider class. This design is more extensible, maintainable, and adheres to SOLID principles.
