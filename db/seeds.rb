# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

puts 'Cleaning database...'
Company.destroy_all
GazelleRunner.destroy_all
User.destroy_all

puts 'Creating Users...'
users = [{email: "fredfooks@me.com", password: 121212},
        {email: "tina@gotto.do", password: 232323},
        {email: "magnus@minimus.latin", password: 34343434},
        {email: "ed@me.com", password: 111111},
        {email: "ted@me.com", password: 111111},
        {email: "fred@me.com", password: 111111},
        {email: "ned@me.com", password: 111111},
        {email: "shed@me.com", password: 111111},
        {email: "sed@me.com", password: 111111}
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

companies = Company.all


puts 'Creating Gazelle Runners...'
gazelle_runners = [
  { first_name: "Fred", last_name: "Fooks",
    photo: "https://avatars1.githubusercontent.com/u/37072793?s=400&u=a3da37beff2056ff305a13654be9aa05ceca92af&v=4", description: "Masters in Engineering Science at Sommerville College, University of Oxford. I want to learn to code to have a great understand of the applications of technology. After Le wagon I am working as a technology business analyst for Capgemini London" },

  { first_name: "Tina", last_name: "Turner",
    photo: "https://avatars0.githubusercontent.com/u/38000034?s=400&v=4", description: "After working for a few years for the UN and the Municipality of Copenhagen, I decided that I wanted to try something completely different. I found out that I wanted to try to become a web developer." },

 { first_name: "Magnus", last_name: "Parvus",
   photo: "https://avatars1.githubusercontent.com/u/37999937?s=400&v=4", description: "I just finished High School and have always been interested in Coding. In my off year I decided to do the Le Wagon Bootcamp as I had seen it was the best/only one in Denmark :)" }
]


gazelle_runners.each do |g_hash|
  gazelle_runner = GazelleRunner.new(g_hash)
  gazelle_runner.user = users.sample
  gazelle_runner.remote_photo_url = g_hash[:photo]
  puts "#{gazelle_runner.first_name} #{gazelle_runner.last_name} successfully created" if gazelle_runner.save
end

gazelle_runners = GazelleRunner.all

puts 'Creating Task Categories ...'
office_task = TaskCategory.create!(name: "Office")
pick_and_drop = TaskCategory.create!(name: "Pick and Drop")
task_categories = [office_task, pick_and_drop]

puts 'Creating a single Task ...'
task_hash = {cost_per_hour: 40, task_time: 4}
sample_task = Task.new(task_hash)
sample_task.gazelle_runner = gazelle_runners.sample
sample_task.company = companies.sample
sample_task.task_category = pick_and_drop
sample_task.first_location = Location.new
sample_task.second_location = Location.new
puts " The company #{sample_task.company} needs the #{sample_task.task_category} task to be completed Asap!} successfully created" if sample_task.save







