# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

MEDIA_FILE = Rails.root.join('db', 'data_seeds', 'works_seeds.csv')

media_failures = []

CSV.foreach(MEDIA_FILE, :headers => true) do |row|
  media = Media.new
  media.category = row['category']
  media.title = row['title']
  media.creator = row['creator']
  media.publication_year = row['publication_year']
  media.description = row['description']

  successful = media.save
  if !successful
    media_failures << media
    puts "Failed to save media: #{media.inspect}"
  else
    puts "Created media: #{media.inspect}"
  end
end

puts "Added #{Media.count} media records"
puts "#{media_failures.length} media failed to save"