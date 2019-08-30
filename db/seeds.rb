# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EXPEREINCE_TITLES = ["Watching the Moon Landing on Black & White TV, 1969", "Conceiving world's first conjoined twin", "Purchasing the first floppy disc", "Climbing Mt. Everest", "Front row at Elvis Concert, before he died on toilet", "Woodstock", "Beatles Concert"]

DESCRIPTION_TITLES = ["A feat that will surely never be experienced by human eyes, literally ever again.", "Feel this experience, one rarely felt by any other humans", "RARE EXPERIENCE: Feel the exhilaration without lifting a finger", "Buy this emotion before someone else does -- highly popular at this time of season."]

CATEGORY_NAMES = ['Adventure', 'High Adrenaline', 'Fuzzy & Nostalgic', 'Drugs', 'Religious', 'Dead Celebrities', 'Festivals & Concerts', 'Alive Celebrities', 'Historic Events', 'Single use events', 'Food', 'Alcohol', 'Knowledge', 'Achievement', 'Sports', 'Television']

puts 'Cleaning up revs...'
Review.destroy_all
puts 'Finished cleaning up revs!'

puts "Cleaning up bookings..."
Booking.destroy_all
puts "Finished cleaning up bookings!"

puts "Cleaning up categories..."
Category.destroy_all
puts "Finished cleaning up categories!"

puts 'Cleaning up expereinces...'
Experience.destroy_all
puts 'Finished cleaning up expereinces!'

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

puts "Creating #{EXPEREINCE_TITLES.length} Experiences..."
EXPEREINCE_TITLES.each do |title|
  experience = Experience.create!(
    title: title,
    description: DESCRIPTION_TITLES.sample,
    price: rand(45..400),
    picture_url: 'https://loremflickr.com/600/400/weird',
    owner: User.first,
    categories: Category.all
  )
  puts "Created: #{experience.title}"
end

