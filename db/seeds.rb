
 require 'faker'
 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.

 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.

 # The `save` method then saves this User to the database.

 #Create Posts
 50.times do
   Post.create!(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end

  Post.create!(
     title:  "TEST POST",
     body:   "TEST PARAGRAPH"
   )




 posts = Post.all

 #Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

  Advertisement.create!(
    title: "One Dollar 25 CENTS TEST",
    copy: "FREEDOLLAR",
    price: 25
    )
  20.times do
    Question.create!(
      title: Faker::Lorem.sentence,
      body:  Faker::Lorem.paragraph,
      resolved: false
      )
  end

   # Comment.create!(
   #  post: posts,
   #  body: "sample"
   #  )
 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'test6654@gmail.com',
   password: 'PASSWORD'
 )
 puts "Seed finished"
 puts "#{Advertisement.count} posts created"
 puts "#{Comment.count} comments created"
