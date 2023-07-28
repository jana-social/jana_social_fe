class User
  attr_reader :username,
              :email,
              :zipcode,
              :street_address,
              :bio,
              :likes,
              :dislikes,
              :photo_url

  def initialize(data)
    @name           = data[:username]
    @email          = data[:email]
    @zipcode        = data[:zipcode]
    @street_address = data[:street_address]
    @bio            = data[:bio]
    @likes          = data[:likes]
    @dislikes       = data[:dilikes]
    @photo_url      = data[:photo_url]
  end
end