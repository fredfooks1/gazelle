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

gazelle_users = [{email: "fred@gazelle.com", password: 123456},
              {email: "tina@gazelle.com", password: 123456},
              {email: "magnus@minimus.latin", password: 123456},
              {email: "magnus@gazelle.com", password: 123456},
               {email: "jeff@gazelle.com", password: 123456},
               {email: "eugenia@gazelle.com", password: 123456},
               {email: "nick@gazelle.com", password: 123456},
               {email: "sussan@gazelle.com", password: 123456}
             ]

g_users = []
gazelle_users.each do |user|
  g_users << User.create!(user)
end

        # the companies start here
company_users= [{email: "ed@company.com", password: 123456},
        {email: "ted@company.com", password: 123456},
        {email: "shed@company.com", password: 123456},
        {email: "ned@company.com", password: 123456},
        {email: "fred@company.com", password: 123456},
        {email: "red@company.com", password: 123456},
        {email: "bed@company.com", password: 123456},
        {email: "lead@company.com", password: 123456}
    ]

c_users = []
company_users.each do |user|
  c_users << User.create!(user)
end



puts 'Creating Companies...'


companies = [{name: "The Sports Company", address: "Prins Jørgens Gård 1"}, {name: "Copenhagen FC", address: "Per Henrik Lings Allé 2"}, {name: "Carbnb", address: "Fabriksområdet 52"}, {name: "Exact Editions", address: "Adelgade 5"},{name: "Liverpool FC", address: "Struenseegade 7"},{name: "Arsenal FC", address: " Adelgade 5"},{name: "Ninos", address: "Carsten Niebuhrs Gade 11"},{name: "Ed's Company", address: "Sankt Peders Stræde 34"}]

companies.each_with_index do |company_hash, index|
  company = Company.new(company_hash)
  company.user = c_users[index]
  company.save!
end

companies = Company.all


puts 'Creating Gazelle Runners...'
gazelle_runners = [
  { first_name: "Julius", last_name: "Lehmann",
    photo: "https://media.licdn.com/dms/image/C4D03AQGVMaOvMIyDoA/profile-displayphoto-shrink_800_800/0?e=1533168000&v=beta&t=BiKKzLjlwCsjelJ_iqWEtMYlct-oHYy0puWN9V9AZok", description: "swede",
    address: "Asminderødgade 14, Copenhagen" },

  { first_name: "Tina", last_name: "Turner",
    photo: "https://avatars0.githubusercontent.com/u/38000034?s=400&v=4", description: "After working for a few years for the UN and the Municipality of Copenhagen, I decided that I wanted to try something completely different. I found out that I wanted to try to become a web developer.",
    address: "Thorsgade 81, Copenhagen" },

 { first_name: "Magnus", last_name: "Parvus",
   photo: "https://avatars1.githubusercontent.com/u/37999937?s=400&v=4", description: "I just finished High School and have always been interested in Coding. In my off year I decided to do the Le Wagon Bootcamp as I had seen it was the best/only one in Denmark :)",
   address: "Ørholmgade 6, Copenhagen" },

 { first_name: "Steve", last_name: "Jobs",
   photo: "https://www.biography.com/.image/t_share/MTE5NDg0MDU0NTIzODQwMDE1/steven-jobs-9354805-2-402.jpg", description: "I just finished High School and have always been interested in Coding. In my off year I decided to do the Le Wagon Bootcamp as I had seen it was the best/only one in Denmark :)",
   address: "Prins Jørgens Gård 1" },

 { first_name: "Freddie", last_name: "Ljungberg",
   photo: "http://im.rediff.com/sports/2004/may/25fred.jpg", description: "I just finished High School and have always been interested in Coding. In my off year I decided to do the Le Wagon Bootcamp as I had seen it was the best/only one in Denmark :)",
   address: "Per Henrik Lings Allé 2" },

 { first_name: "Mr F", last_name: "Springbok",
   photo: "https://avatars1.githubusercontent.com/u/37999937?s=400&v=4", description: "I just finished High School and have always been interested in Coding. In my off year I decided to do the Le Wagon Bootcamp as I had seen it was the best/only one in Denmark :)",
   address: "Adelgade 5" },

 { first_name: "Thierry", last_name: "Henry",
   photo: "http://www4.pictures.zimbio.com/gi/Thierry+Henry+AxQVPiNae-6m.jpg", description: "I just finished High School and have always been interested in Coding. In my off year I decided to do the Le Wagon Bootcamp as I had seen it was the best/only one in Denmark :)",
   address: "Carsten Niebuhrs Gade 11" },

 { first_name: "Unai", last_name: "Emery",
   photo: "https://www.telegraph.co.uk/content/dam/football/2018/05/23/TELEMMGLPICT000164415640_trans_NvBQzQNjv4BqFM8JNviqypEqpEVTJZDkiZ5MFS61F7xI8764b2mnKYQ.jpeg?imwidth=450", description: "I just finished High School and have always been interested in Coding. In my off year I decided to do the Le Wagon Bootcamp as I had seen it was the best/only one in Denmark :)",
   address: "Sankt Peders Stræde 34" }
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

titles = ["Get some Ink","Make Coffee for the office","Take minutes at a meeting", "Therapy help for Joe", "Coach England to the world cup final", "make Lampard and Gerrard work" ]
s_descriptions = ["We need some blue inject ink from whsmith","We are brainstorming how to beat belgium", "Mr Hart needs a confidence boost having been dropped for england", "Southgate isn't quite upto the task", "Both the central midfield"]
states = ["pending", "assigned", "completed", "completed", "completed"]
photos = ["task-route1and2.png","task-route1and2.png","task-route3.png","task-route4.png","task-route5.png"]


puts 'Creating Tasks for the sports company...'
titles.each_with_index do |title, index|
  t_hash = {cost_per_hour: 2 , task_time: 1}
  puts "im at #{index}"
  s_task = Task.new(t_hash)
  s_task.title = titles[index]
  s_task.description = s_descriptions[index]
  s_task.state = states[index]
  s_task.company = Company.first
  s_task.photo = photos[index%photos.size]
  s_task.first_location = Location.first
  unless s_task.state == "pending"
    s_task.gazelle_runner = gazelle_runners.sample
  end
  puts "The task #{s_task.title} for #{s_task.company.name} is #{s_task.state}" if s_task.save
end

descriptions = ["get some milk", "We just need a health Gazelle to pronk around the office", "drop off some ink"]
titles = ["Milk Shop", "Office help", "Outta Ink", "Out of Cheese"]

puts 'Creating a Tasks ...'
locations.each_with_index do |location, index|
  task_hash = {cost_per_hour: 40, task_time: 4}
  sample_task = Task.new(task_hash)
  sample_task.first_location = locations[index]
  sample_task.company = sample_task.first_location.company
  sample_task.description = descriptions[index]
  sample_task.title = titles[index]
  sample_task.photo = "task-route3.png"
  sample_task.state = "pending"
  puts "The company #{sample_task.company.name} needs the #{sample_task.company.name} task to be completed at #{sample_task.first_location.address}Asap!" if sample_task.save
end




