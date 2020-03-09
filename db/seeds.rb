# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sizes = Size.create!([
                        {name: 'Small', code: 'small'},
                        {name: 'Medium', code: 'medium'},
                        {name: 'Large', code: 'large'},
                        {name: 'Extra Large', code: 'extra_large'},
                    ])
ingredients = Ingredient.create!([
                                    {name: 'Mozzarella', code: 'mozzarella'},
                                    {name: 'Mushroom', code: 'mushroom'},
                                    {name: 'Parmesan', code: 'parmesan'},
                                    {name: 'Pineapple', code: 'pineapple'},
                                ])
User.create!(name: 'admin', email: 'admin@test.com', address: 'san martin 123', password: '123123', password_confirmation: '123123')

Day.create!([
               {name: 'Monday', code: 'MONDAY'},
               {name: 'Tuesday', code: 'TUESDAY'},
               {name: 'Wednesday', code: 'WEDNESDAY'},
               {name: 'Thursday', code: 'THURSDAY'},
               {name: 'Friday', code: 'FRIDAY'},
               {name: 'Saturday', code: 'SATURDAY'},
               {name: 'Sunday', code: 'SUNDAY'},
           ])