# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

puts 'Cleaning database...'
Location.destroy_all
Company.destroy_all
GazelleRunner.destroy_all
User.destroy_all
Task.destroy_all

puts 'Creating users...'
        # The gazelle users start here
gazelle_users = [{email: "fred@gazelle.com", password: 123456},
        {email: "tina@gazelle.com", password: 123456},
        {email: "magnus@minimus.latin", password: 123456}]

g_users = []
gazelle_users.each do |user|
  g_users << User.create!(user)
end

        # the companies start here
company_users= [{email: "ed@company.com", password: 123456},
        {email: "ted@me.com", password: 123456},
        {email: "fred@me.com", password: 123456},
        {email: "ned@me.com", password: 123456},
        {email: "shed@me.com", password: 123456},
        {email: "sed@me.com", password: 123456}]

c_users = []
company_users.each do |user|
  c_users << User.create!(user)
end



puts 'Creating Companies...'
companies = [{name: "Le Wagon"}, {name: "Copenhagen FC"}, {name: "Carbnb"}]
companies.each_with_index do |company_hash, index|
  company = Company.new(company_hash)
  company.user = c_users[index]
  company.save!
end

companies = Company.all


puts 'Creating Gazelle Runners...'
gazelle_runners = [
  { first_name: "Fred", last_name: "Fooks",
    photo: "https://avatars1.githubusercontent.com/u/37072793?s=400&u=a3da37beff2056ff305a13654be9aa05ceca92af&v=4", description: "Masters in Engineering Science at Sommerville College, University of Oxford. I want to learn to code to have a great understand of the applications of technology. After Le wagon I am working as a technology business analyst for Capgemini London",
    address: "Asminderødgade 14, Copenhagen" },

  { first_name: "Tina", last_name: "Turner",
    photo: "https://avatars0.githubusercontent.com/u/38000034?s=400&v=4", description: "After working for a few years for the UN and the Municipality of Copenhagen, I decided that I wanted to try something completely different. I found out that I wanted to try to become a web developer.",
    address: "Thorsgade 81, Copenhagen" },

 { first_name: "Magnus", last_name: "Parvus",
   photo: "https://avatars1.githubusercontent.com/u/37999937?s=400&v=4", description: "I just finished High School and have always been interested in Coding. In my off year I decided to do the Le Wagon Bootcamp as I had seen it was the best/only one in Denmark :)",
   address: "Ørholmgade 6, Copenhagen" }
]


gazelle_runners.each_with_index do |g_hash, index|
  gazelle_runner = GazelleRunner.new(g_hash)
  gazelle_runner.user = g_users[index]
  gazelle_runner.remote_photo_url = g_hash[:photo]
  puts "#{gazelle_runner.first_name} #{gazelle_runner.last_name} successfully created" if gazelle_runner.save
end

gazelle_runners = GazelleRunner.all

puts 'Creating Task Categories ...'
office_task = TaskCategory.create!(name: "Office")
pick_and_drop = TaskCategory.create!(name: "Pick and Drop")

puts 'Creating sample locations ...'
addresses = ["18 Gasværksvej copenhagen", "15 Ahornsgade", "5 Snaregade"]
addresses.each_with_index do |address_array, index|
  location = Location.new(address: address_array)
  location.company = companies[index]
  puts "Address for #{location.company.name} is on #{location.address}" if location.save
end

locations = Location.all

descriptions = ["get some milk", "We just need a health Gazelle to pronk around the office", "drop off some ink"]
titles = ["Milk Shop", "Office help", "Outta Ink", "Out of Cheese"]

puts 'Creating a Tasks ...'
locations.each_with_index do |location, index|
  task_hash = {cost_per_hour: 40, task_time: 4, task_category: office_task}
  sample_task = Task.new(task_hash)
  sample_task.first_location = locations[index]
  sample_task.company = sample_task.first_location.company
  sample_task.description = descriptions[index]
  sample_task.title = titles[index]
  sample_task.state = "pending"
  puts "The company #{sample_task.company.name} needs the #{sample_task.task_category.name} task to be completed at #{sample_task.first_location.address}Asap!" if sample_task.save
end








