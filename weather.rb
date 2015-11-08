#weather app using a Yahoo Weather API
require 'rubygems'
require 'yahoo_weatherman'

#prompt user for their zipcode
puts "What is your zipcode?"
location = gets.chomp

def get_location(location)
    client = Weatherman::Client.new
    client.lookup_by_location(location)
end

weather = get_location(location)

# http://apidock.com/ruby/DateTime/strftime for more into on strftime
today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

day = forecast['date']
# show days of Today, Tomorrow
weekday = day.strftime('%w').to_i

      if weekday == today
          dayName = 'Today'
      elsif weekday == today + 1
          dayName = 'Tomorrow'
      else
          dayName = day.strftime('%A')
      end
# give the user information for
puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s

end
