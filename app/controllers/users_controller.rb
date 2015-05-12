class UsersController < ApplicationController
  require 'yelp'

  def index
    yelp = YelpApi.new
    params = {
      category_filter: "jazzandblues", 
      category_filter: "restaurants",
      radius_filter: 500
    }
    response = yelp.client.search("New York City", params)
    @responses = response.businesses

    # class price-description for price 
  end 

  def create
    # yelp = YelpApi.new
    # params = {
    #   limit: 1,
    # }
    # response = yelp.client.search('10 hunt road bedford ma', params)
    # @responses = response.businesses
  end 

  def show
  end 

end
