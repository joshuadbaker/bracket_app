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
      sort: 2
    }
    nyc_api = "https://data.cityofnewyork.us/resource/xx67-kt59.json"
    good = "?grade=a"
    bad = "?grade=c"
    zipcode = "zipcode="+location

    response = yelp.client.search(location, params)
    @yelp_responses = response.businesses 
    @nyc_responces = HTTParty.get(nyc_api+bad+"&"+zipcode)

  end 

end
