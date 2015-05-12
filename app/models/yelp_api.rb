class YelpApi < ActiveRecord::Base
  def client
      Yelp::Client.new({ consumer_key: "lTBCW1WtmPiVuoloIelVmw",
                            consumer_secret: "tZO5l-DA6n4QVAV6XzOLfMw3iLY",
                            token: "bR8QbAoFwL7h_D-weS-zamKIsHI-WcaH",
                            token_secret: "w3TfoJj3A5LqaLZAmXViQd_sX8Q"
                        })
  end 
end
