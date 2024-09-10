require "open-uri"

puts "removing all cafes from the database..."
Cafe.destroy_all

puts "Getting cafes from json..."
seed_url = 'https://gist.githubusercontent.com/yannklein/5d8f9acb1c22549a4ede848712ed651a/raw/3daec24bcd833f0dd3bcc8cee8616a731afd1f37/cafe.json'

# Make an HTTP request to get the json data back
json_cafes = URI.open(seed_url).read

# Convert json data into a ruby object
cafes = JSON.parse(json_cafes)

# iterate over the array of hashes to create instances of cafes
cafes.each do |cafe_hash|
  puts "Creating #{cafe_hash["title"]...}"
  Cafe.create!(
    title: cafe_hash["title"],
    address: cafe_hash["address"],
    picture: cafe_hash["picture"],
    criteria: cafe_hash["criteria"],
    hours: cafe_hash["hours"]
  )
end

puts "... created #{Cafe.count} cafes!"
