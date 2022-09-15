require "csv"
require "open-uri"
require 'uri'

filepath = "db/fixtures/experts.csv"

puts "Cleaning the database"

puts "Creating the experts"

CSV.foreach(filepath, headers: :first_row) do |row|
  expert = Expert.new(
    name: row['name'],
    city: row['city'],
    score_a: row['score_a'],
    score_b: row['score_b'],
    score_c: row['score_c'],
    nb_sales: row['nb_sales']
  )
  expert.save!
end

puts "Creating experts done"
