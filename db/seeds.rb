# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Goal.destroy_all
Like.destroy_all

lige = User.create(first_name: "Lige", last_name: "Williamson", username: "lige", bio: "I'm a cool guy and I want to do a lot of stuff", email: "lige@flatiron.com")

tina = User.create(first_name: "Tina", last_name: "Cristobal", username: "cristicriso", bio: "I likes things", email: "tina@flatiron.com")

jc = User.create(first_name: "JC", last_name: "Chang", username: "jchizzle", bio: "Haaayyoo", email: "jc@flatiron.com")

grand_c = Goal.create(title: "Grand Canyon")

lige_like = Like.create(user_id: lige.id, goal_id: grand_c.id, description: "I really want to go", timeline: DateTime.new(2020))

tc_like = Like.create(user_id: tina.id, goal_id: grand_c.id, description: "This is cool", timeline: DateTime.new(2020))
