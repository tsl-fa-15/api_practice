require 'open-uri'
require 'json'

class ApiController < ApplicationController
  def pirate_form
  end

  def pirate_process
    #=== Instructions ===================================
    # Translate the text submitted from the pirate_form action
    # into pirate-speak
    #
    # Ref: http://isithackday.com/arrpi.php?
    #================================================
    text = URI.encode(params[:text])
    url = "http://isithackday.com/arrpi.php?text=#{text}&format=json"
    result = open(url).read
    parsed_result = JSON.parse(result)
    @result = parsed_result['translation']['pirate']
  end


  def coord_form
    #=== Instructions ===================================
    # Create a form to send a user's address to the coord_process
    # action
    #================================================
  end

  def coord_process
    #=== Instructions ===================================
    # Using the Google geocoding API, find latitude and longitude
    # coordinates based on a user-submitted address. Send the
    # coordinates down to the view.
    #
    # Ref: https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA
    # as an example
    #================================================
    @coords = "An array with your coordinates inside"
  end

  def meme_gen_form
    #=== Instructions ===================================
    # Create a form to send a info to the meme_gen_process
    # action
    #
    # Ref: http://apimeme.com/
    #================================================
  end

  def meme_process_form
    #=== Instructions ===================================
    # Create a meme based on user-submitted info
    #
    # Ref: http://apimeme.com/
    #================================================
  end

  def congress_form
    #=== Instructions ===================================
    # Create a form to send a keyword to the congress_process
    # action
    #================================================
  end

  def congress_process
    #=== Instructions ===================================
    # Use the Library of Congress image API to display a relevant
    # picture based on a user-submitted keyword
    #
    # Ref: http://www.loc.gov/pictures/search/?q=computer&fo=json
    #================================================
  end

  def random_user
    #=== Instructions ===================================
    # Use the Radom User API to create a dynamic profile page
    # that changes on page refresh. Use at least 3 items from
    # the API response
    #
    # Ref: http://api.randomuser.me/
    #================================================
  end

  def wiki_image_form
    #=== Instructions ===================================
    # Create a form to send a keyword to the wiki_image_process
    # action
    #================================================
  end

  def wiki_image_process
    #=== Instructions ===================================
    # Use the Wikipedia API to display a relevant
    # picture or set of pictures based on a user-submitted keyword
    #
    # Ref: http://techslides.com/grab-wikipedia-pictures-by-api-with-php
    #================================================
  end

  def nearest_station
    #=== Instructions ===================================
    # Use the Divvy API to display all stations that have at least
    # 5 bikes available
    #
    # Bonus: Sort the stations by distance from a user-submitted
    # address
    #
    # Ref: http://www.divvybikes.com/stations/json/
    #================================================

    # geocode user address
    address = "30 N Racine, Chicago"
    address_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{address}"
    address_result = open(address_url).read
    @parsed_address_result = JSON.parse(address_result)
    @lat = @parsed_address_result['results'][0]['geometry']['location']['lat']
    @lng = @parsed_address_result['results'][0]['geometry']['location']['lng']

    stations_result = open("http://www.divvybikes.com/stations/json/").read
    parsed_stations_result = JSON.parse(stations_result)
    @station_array = parsed_stations_result['stationBeanList']
    @sorted_stations = @station_array.sort_by do |station_hash|
      lat_dist = (@lat - station_hash['latitude']).abs
      lng_dist = (@lng - station_hash['longitude']).abs
      Math.sqrt(lat_dist**2 + lng_dist**2)
    end


    # result = open("http://www.divvybikes.com/stations/json/").read
    # parsed_result = JSON.parse(result)
    # @stations = []
    # parsed_result['stationBeanList'].each do |station_hash|
    #   if station_hash['availableBikes'] >= 5
    #     @stations << "#{station_hash['stationName']} - #{station_hash['availableBikes']} bikes"
    #   end
    # end
  end
end





