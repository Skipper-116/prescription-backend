require "rails_helper"

RSpec.describe FrequencyTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/frequency_types").to route_to("frequency_types#index")
    end

    it "routes to #show" do
      expect(get: "/frequency_types/1").to route_to("frequency_types#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/frequency_types").to route_to("frequency_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/frequency_types/1").to route_to("frequency_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/frequency_types/1").to route_to("frequency_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/frequency_types/1").to route_to("frequency_types#destroy", id: "1")
    end
  end
end
