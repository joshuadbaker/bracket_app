class UsersController < ApplicationController
  require 'yelp'
  require 'httparty'


  # AIzaSyB6iJR4hMQD8rhUpz2W8HaRPxzLiVZh9yA
  def index
    @user = User.new
    # class price-description for price 
  end 

  def create

    location = params[:user][:address]
    yelp = YelpApi.new
    params = {
      sort: 2,
      category_filter: 'restaurants'
    }

    response = yelp.client.search(location, params)
    @yelp_responses = response.businesses

    nyc_api = "https://data.cityofnewyork.us/resource/xx67-kt59.json"
    good = "?grade=a"
    bad = "?grade=c"
    zipcode = "zipcode="+location

    @nyc_responces = HTTParty.get(nyc_api+bad+"&"+zipcode)

    @nyc_responces.each do |place|
      restaurant = Restaurant.find_by name: place["dba"]
      if restaurant && restaurant[:violations] && restaurant[:violations].exclude?(place["violation_code"])  && restaurant[:violation_descriptions] && restaurant[:violation_descriptions].exclude?(place["violation_description"])
              restaurant[:violations] << place["violation_code"]
              restaurant[:violation_descriptions] << place["violation_description"]
              restaurant.save
      elsif place["violation_description"] && place["violation_code"] && !Restaurant.find_by(name: place["dba"])
              Restaurant.create(:name => place["dba"], :zipcode => place["zipcode"], :violations => [place["violation_code"]], :violation_descriptions => [place["violation_description"]])
      end 
    end 

    @restaurants = Restaurant.where(zipcode: location)
  end  

end
