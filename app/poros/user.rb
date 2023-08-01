class User
  attr_reader :username,
              :email,
              :zipcode,
              :street_address,
              :bio,
              :likes,
              :dislikes,
              :id,
              :photo_url

  def initialize(data)
    @id             = data[:id]
    @username       = data[:attributes][:username]
    @email          = data[:attributes][:email]
    @zipcode        = data[:attributes][:zipcode]
    @street_address = data[:attributes][:street_address]
    @bio            = data[:attributes][:bio]
    @likes          = data[:attributes][:likes]
    @dislikes       = data[:attributes][:dislikes]
    @photo_url      = data[:attributes][:profile_image_link]
  end
end
