module PizzaModule
  class Mushroom < PizzaDecorator

    COST = 3.freeze
    COST_SIZE = {:small => 0, :medium => 2, :large => 4, :extra_large => 5}.freeze

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