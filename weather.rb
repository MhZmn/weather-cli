require "net/http"
require "json"
require "dotenv"

Dotenv.load
api_key = ENV["OPEN_WEATHER_API_KEY"]

puts "Welcome to Ruby Wether CLI!"
print "Enter city name: "
city_name = gets.chomp
puts

params = {
  appid: api_key,
  q: city_name,
  units: "metric"
}

uri = URI("https://api.openweathermap.org/data/2.5/weather")
uri.query = URI.encode_www_form(params)

response = Net::HTTP.get(uri)
data = JSON.parse(response)

puts "Weather in #{data["name"]}, #{data["sys"]["country"]}"
puts "Temperature: #{data["main"]["temp"]}"
puts "Description: #{data["weather"][0]["description"]}"
puts "Humidity: #{data["main"]["humidity"]}%"
puts "Wind Speed: #{data["wind"]["speed"]} m/s"
