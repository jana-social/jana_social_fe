class Event
  attr_reader :title,
              :description,
              :street_address,
              :zipcode,
              :date_time,
              :private,
              :host

  def initialize(data)
    @title = data[:title]
    @description = data[:description]
    @street_address = data[:street_address]
    @zipcode = data[:zipcode]
    @date_time = data[:date_time]
    @private = data[:private]
    @host = data[:host] # might end up removing

    # @host = data[:attributes][:host]
  end
            
end