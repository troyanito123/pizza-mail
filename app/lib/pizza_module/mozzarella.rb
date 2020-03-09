module PizzaModule
  class Mozzarella < PizzaDecorator

    COST = 5.freeze
    COST_SIZE = {small: 0, medium: 3, large: 5, extra_large: 8}.freeze

    def small
      super + COST + COST_SIZE[:small]
    end

    def medium
      super + COST + COST_SIZE[:medium]
    end

    def large
      super + COST + COST_SIZE[:large]
    end

    def extra_large
      super + COST + COST_SIZE[:extra_large]
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