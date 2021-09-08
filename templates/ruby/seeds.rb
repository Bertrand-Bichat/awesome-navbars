require 'faker'


puts 'cleaning database...'


User.destroy_all


puts 'generating users...'


user1 = User.create({
  email: Faker::Internet.email(domain: 'gmail'),
  password: 'password'
})


puts "#{User.count} users created !"


puts "Done!"
