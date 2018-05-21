# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Company.destroy_all
User.destroy_all

puts 'Creating Users...'

users = [{email: "fredfooks@me.com", password: 121212},
        {email: "tina@gotto.do", password: 232323},
        {email: "magnus@minimus.latin", password: 34343434}
]


users.each do |user|
  User.create!(user)
end

users = User.all

puts 'Creating Companies...'
companies = [{name: "Le wagon"}, {name: "Copenhagen FC"}, {name: "Carbnb"}]

companies.each do |company_hash|
  company = Company.new(company_hash)
  company.user = users.sample
  company.save!
end





puts 'Creating Legs...'
gazelle_runners = [
  { first_name: "Fred", last_name: "Fooks",
    photo: "https://avatars1.githubusercontent.com/u/37072793?s=400&u=a3da37beff2056ff305a13654be9aa05ceca92af&v=4", description: "Masters in Engineering Science at Sommerville College, University of Oxford. I want to learn to code to have a great understand of the applications of technology. After Le wagon I am working as a technology business analyst for Capgemini London" },

  { first_name: "Tina", last_name: "Turner",
    photo: "https://avatars0.githubusercontent.com/u/38000034?s=400&v=4", description: "After working for a few years for the UN and the Municipality of Copenhagen, I decided that I wanted to try something completely different. I found out that I wanted to try to become a web developer." },

 { first_name: "Magnus", last_name: "Parvus",
   photo: "https://avatars1.githubusercontent.com/u/37999937?s=400&v=4", description: "I just finished High School and have always been interested in Coding. In my off year I decided to do the Le Wagon Bootcamp as I had seen it was the best/only one in Denmark :)" }
]



