module PizzaModule
  class Parmesan < PizzaDecorator

    COST = 6.freeze
    COST_SIZE = {:small => 1, :medium => 3, :large => 5, :extra_large => 7}.freeze

    def small
      super + COST + COST_SIZE.fetch(:small) { 100 }
    end

    def medium
      super + COST + COST_SIZE.fetch(:medium) { 100 }
    end

    def large
      super + COST + COST_SIZE.fetch(:large) { 100 }
    end

    def extra_large
      super + COST + COST_SIZE.fetch(:extra_large) { 100 }
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