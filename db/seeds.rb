# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EXPEREINCE_TITLES = ["Watching the Moon Landing on Black & White TV", "1969", "Conceiving world's first conjoined twin", "Purchasing the first floppy disc", "Climbing Mt. Everest", "Front row at Elvis Concert, before he died on toilet", "Woodstock", "Beatles Concert"]

DESCRIPTION_TITLES = ["A feat that will surely never be experienced by human eyes, literally ever again.", "Feel this experience, one rarely felt by any other humans", "RARE EXPERIENCE: Feel the exhilaration without lifting a finger", "Buy this emotion before someone else does -- highly popular at this time of season."]

CATEGORY_NAMES = ['Adventure', 'High Adrenaline', 'Fuzzy & Nostalgic', 'Drugs', 'Religious', 'Dead Celebrities', 'Festivals & Concerts', 'Alive Celebrities', 'Historic Events', 'Single use events', 'Food', 'Alcohol', 'Knowledge', 'Achievement', 'Sports', 'Television']

puts 'Cleaning up revs...'
Review.destroy_all
puts 'Finished cleaning up revs!'

puts "Cleaning up bookings..."
Booking.destroy_all
puts "Finished cleaning up bookings!"


puts 'Cleaning up expereinces...'
Experience.destroy_all
puts 'Finished cleaning up expereinces!'

puts "Cleaning up categories..."
Category.destroy_all
puts "Finished cleaning up categories!"

puts 'Cleaning up Users...'
User.destroy_all
puts 'Finished cleaning up users!'

puts 'Creating Users...'
5.times do |i|
  user = User.create!(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    profile_picture_url: 'https://loremflickr.com/400/400/user',
    password: '123456'
  )
  puts "#{i + 1}. #{user.name}"
end
puts "Finished creating #{User.count} users!"

puts "Creating categories..."
CATEGORY_NAMES.each do |name|
  category = Category.create!(name: name)
  puts "Created: #{category.name}"
end
puts "Finished creating #{Category.count} categories!"
puts 'Finished!'

# puts "Creating #{EXPEREINCE_TITLES.length} Experiences..."
# EXPEREINCE_TITLES.each do |title|
#   experience = Experience.create!(
#     title: title,
#     description: DESCRIPTION_TITLES.sample,
#     price: rand(45..400),
#     picture_url: 'https://loremflickr.com/600/400/weird',
#     owner: User.first,
#     categories: Category.all
#   )
#   puts "Created: #{experience.title}"
# end

category_ids = []
category_ids << Category.order('RANDOM()').first
category_ids << Category.order('RANDOM()').first

Experience.create!(
  title: 'Watching the Moon Landing on Black & White TV',
  description: 'A feat that will surely never be experienced by human eyes',
  price: 501,
  picture_url: 'exp_images/moon_landing.jpeg',
  owner: User.first,
  categories: category_ids
  )

category_ids = []
category_ids << Category.order('RANDOM()').first.id
category_ids << Category.order('RANDOM()').first.id

Experience.create!(
  title: "Conceiving world's first conjoined twin",
  description: 'Feel this experience, one rarely felt by any other humans',
  price: 635,
  picture_url: 'exp_images/twins.jpg',
  owner: User.last,
  categories: Category.where(id: category_ids[0])
  )

category_ids = []
category_ids << Category.order('RANDOM()').first.id
category_ids << Category.order('RANDOM()').first.id

Experience.create!(
  title: "Woodstock, 1969",
  description: "Jimi Hendrix, Janis Joplin, Mud sliding, Bad Acid, should I keep going?" ,
  price: 1302,
  picture_url: 'exp_images/woodstock.jpg',
  owner: User.last,
  categories: Category.where(id: category_ids[0])
  )

category_ids = []
category_ids << Category.order('RANDOM()').first.id
category_ids << Category.order('RANDOM()').first.id

Experience.create!(
  title: "French revolution",
  description: "Be at the tennis court oath , 20th june, 1789" ,
  price: 1500,
  picture_url: 'exp_images/french_revolution.jpg',
  owner: User.last,
  categories: Category.where(id: category_ids[0])
  )

category_ids = []
category_ids << Category.order('RANDOM()').first.id
category_ids << Category.order('RANDOM()').first.id

Experience.create!(
  title: "Climbing Mt. Everest",
  description: "RARE EXPERIENCE: Feel the exhilaration without lifting a finger",
  price: 690,
  picture_url: 'exp_images/everest.jpg',
  owner: User.last,
  categories: Category.where(id: category_ids[0])
  )

category_ids = []
category_ids << Category.order('RANDOM()').first.id
category_ids << Category.order('RANDOM()').first.id

Experience.create!(
  title: "Eat 50 red chillies",
  description: "Be brave, without being brave" ,
  price: 25,
  picture_url: 'exp_images/red_chillies.jpg',
  owner: User.last,
  categories: Category.where(id: category_ids[0])
  )



