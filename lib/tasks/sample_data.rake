### run rake db:populate for the default single admin 
### delete "=begin" on line 14 for sample data

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

# creates an admin user    
    admin = User.create!(name: "Admin",
                         email: "admin@example.com",
                         password: "admin123",
                         password_confirmation: "admin123")
    admin.toggle! (:admin)

=begin ### MAKE SURE TO UNCOMMENT ATTR-ACCESSIBLE FOR post_id IN COMMENTS MODEL TO RUN LAST COMMAND
#creates 30 blog posts hopefully by admin
    user = admin
    30.times do |i|
      title   = Faker::Lorem.sentence
      content = Faker::Lorem.sentence(75)
      Post.create!(title: title, content: content)
    end

#creates 99 additional users
    99.times do |n|
      name  = Faker::Name.name
      email = Faker::Internet.email
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

#create 50 comments for admin
    users = User.all(limit: 2)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.comments.create!(content: content, post_id: 1) }
    end
  end
end