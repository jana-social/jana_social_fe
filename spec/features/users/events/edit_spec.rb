require "rails_helper"

RSpec.describe "Update Event Form" do
  describe "edit form", type: :request do
    it "Shows edit form" do
      json_patch_event = File.read("spec/fixtures/event_patch.json")

      stub_request(:patch, event_update_path(1, 1))
        .to_return(status: 200, body: json_patch_event, headers: {})

      event_params = {
        title: "Austin's Edit"
      }

      headers = { "CONTENT_TYPE" => "application/json" }
      patch event_update_path(1, 1), headers: headers, params: JSON.generate(event_params)
      click_button "Update Event"
    end
  end
end
