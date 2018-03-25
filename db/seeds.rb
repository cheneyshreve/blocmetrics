# populate db with some registered applications and associated events

10.times do
  User.create!(
  email: Faker::Internet.unique.email,
  password: "password",
  password_confirmation: "password"
)
end
users = User.all

seed_user = User.create!(
  email: "admin@admin.com",
  password: "password",
  password_confirmation: "password"
)
seed_user.skip_confirmation!
seed_user.save!
# adding some fake appications for seed_user
10.times do
  RegisteredApplication.create!(
    user: seed_user,
    name: Faker::Internet.unique.domain_word,
    url: Faker::Internet.unique.url
  )
end
registered_applications = RegisteredApplication.all
seed_application = registered_applications.first


10.times do
   Event.create!(
     registered_application: registered_applications.sample,
     name: Faker::Internet.unique.domain_word
   )
end
events = Event.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
