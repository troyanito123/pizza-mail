module PizzaModule
  class Pineapple < PizzaDecorator

    COST = 5.freeze
    COST_SIZE = {:small => 0, :medium => 4, :large => 6, :extra_large => 7}.freeze

    # def small
    #   super + COST + COST_SIZE[:small]
    # end
    #
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