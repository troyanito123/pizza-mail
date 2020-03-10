module PizzaModule

  class PizzaFactory

    def self.get_ingredient(ingredient)
      case ingredient
      when 'parmesan'
        PizzaModule::Parmesan
      when 'mozzarella'
        PizzaModule::Mozzarella
      when 'pineapple'
        PizzaModule::Pineapple
      when 'mushroom'
        PizzaModule::Mushroom
      end

    end
  end

end