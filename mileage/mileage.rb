require 'csv'
require './auto_seeker'

data = CSV.read('foobarnian_autos.csv')

# creates new AutoSeeker, filtered by color, ARGV takes in
# commend line input, assigns it as value to :color key 

seeker = AutoSeeker.new data
autos = seeker.filter(:color, ARGV[0])

if autos.length == 0
  abort "no autos with color #{ARGV[0]} found"
end

mileage = AutoSeeker.median_mileage(autos)

puts "median mileage = #{mileage} MPG"

