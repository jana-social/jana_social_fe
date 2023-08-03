class UserSearch
  attr_reader :username,
              :bio,
              :likes,
              :dislikes,
              :photo_url,
              :id

  def initialize(data)
    @id             = data[:id]
    @username       = data[:attributes][:username]
    @bio            = data[:attributes][:bio]
    @likes          = data[:attributes][:likes]
    @dislikes       = data[:attributes][:dislikes]
    @photo_url      = data[:attributes][:profile_image_link]
  end
end
