module PizzaModule
  class PizzaDefault

    attr_accessor :cost

    def initialize
      @cost = 10
    end

    def small
      @cost + 0
    end

    def medium
      @cost + 5
    end

    def large
      @cost + 10
    end

    def extra_large
      @cost + 13
    end

    def get_cost(size)
      case size
      when 'small'
        small
      when 'medium'
        medium
      when 'large'
        large
      when 'extra_large'
        extra_large
      end
    end

  end
end