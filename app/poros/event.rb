class Event
  attr_reader :id,
              :title,
              :description,
              :street_address,
              :zipcode,
              :date_time,
              :private_status,
              :host

  def initialize(data)
    @id = data[:id]
    @title = data[:attributes][:title]
    @description = data[:attributes][:description]
    @street_address = data[:attributes][:street_address]
    @zipcode = data[:attributes][:zipcode]
    @date_time = data[:attributes][:date_time]
    @private_status = data[:attributes][:private_status]
    @host = data[:attributes][:host]

  end
end