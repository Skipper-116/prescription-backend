require "rails_helper"

RSpec.describe PrescriptionDosagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/prescription_dosages").to route_to("prescription_dosages#index")
    end

    it "routes to #show" do
      expect(get: "/prescription_dosages/1").to route_to("prescription_dosages#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/prescription_dosages").to route_to("prescription_dosages#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/prescription_dosages/1").to route_to("prescription_dosages#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/prescription_dosages/1").to route_to("prescription_dosages#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/prescription_dosages/1").to route_to("prescription_dosages#destroy", id: "1")
    end
  end
end
