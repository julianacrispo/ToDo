require 'faker'

#create users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all

# Create Posts
50.times do
  List.create(
    name:  Faker::Lorem.sentence,
    description:   Faker::Lorem.paragraph
  )
end
lists = List.all

# Create Items
# 100.times do
#   Item.create(
#     list: lists.sample,
#     description: Faker::Lorem.paragraph
#   )
# end

User.first.update_attributes(
  email: 'email@example.com',
  password: 'helloworld',
)


puts "Seed finished"
puts "#{User.count} users"
puts "#{List.count} lists created"
# puts "#{Items.count} items created"