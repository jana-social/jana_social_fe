class UserSearch
  attr_reader :username,
              :bio,
              :likes,
              :dislikes,
              :photo_url

  def initialize(data)
    @username       = data[:username]
    @bio            = data[:bio]
    @likes          = data[:likes]
    @dislikes       = data[:dislikes]
    @photo_url      = data[:profile_image_link]
  end
end
