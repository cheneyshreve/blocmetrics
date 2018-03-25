# populate db with some registered applications and associated events



10.times do
  User.create!(
  email: Faker::Internet.unique.email,
  password: "password",
  password_confirmation: "password"
)
end
users = User.all

# using a real user because of confirmation requirements
admin_user = User.find([id= 1])
admin_application = RegisteredApplication.find([id = 1])

# adding some fake appications for admin_user
10.times do
  RegisteredApplication.create!(
    user: admin_user,
    name: Faker::Internet.unique.domain_word,
    url: Faker::Internet.unique.url
  )
end
registered_applications = RegisteredApplication.all

# adding some fake events for admin_user, admin_application
10.times do
   Event.create!(
     user: admin_user,
     registered_application: admin_application,
     name: Faker::Internet.unique.domain_word
   )
end
events = Event.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
