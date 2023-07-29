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
    @username       = data[:username]
    @email          = data[:email]
    @zipcode        = data[:zipcode]
    @street_address = data[:street_address]
    @bio            = data[:bio]
    @likes          = data[:likes]
    @dislikes       = data[:dislikes]
    @photo_url      = data[:profile_image_link]
  end
end