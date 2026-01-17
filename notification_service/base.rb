module NotificationService
  class Base
    def initialize(provider)
      @provider = provider
    end

    def send
      raise NotImplementedError, "Subclasses must implement #send"
    end

    def can_notify?
      raise NotImplementedError, "Subclasses must implement #can_notify?"
    end

    private
    attr_reader :provider
  end
end
