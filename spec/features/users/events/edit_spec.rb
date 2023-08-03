require "rails_helper"

RSpec.describe "Update Event Form" do
  describe "edit form", type: :request do
    xit "Shows edit form" do
      json_patch_event = File.read("spec/fixtures/event_patch.json")
      json_event_show = File.read("spec/fixtures/get_one_event.json")

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1/events/1/edit")
        .to_return(status: 200, body: json_event_show)

      stub_request(:patch, "https://jana-social-be.onrender.com/api/v1/users/1/events/1")
        .to_return(status: 200, body: json_patch_event)
      visit event_update_path(1, 1)

      event_params = {
        title: "Austin's Edit"
      }

      headers = { "CONTENT_TYPE" => "application/json" }
      patch event_update_path(1, 1), headers: headers, params: JSON.generate(event_params)
    end
  end
end
