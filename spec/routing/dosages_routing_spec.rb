require "rails_helper"

RSpec.describe DosagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dosages").to route_to("dosages#index")
    end

    it "routes to #show" do
      expect(get: "/dosages/1").to route_to("dosages#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dosages").to route_to("dosages#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dosages/1").to route_to("dosages#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dosages/1").to route_to("dosages#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dosages/1").to route_to("dosages#destroy", id: "1")
    end
  end
end
