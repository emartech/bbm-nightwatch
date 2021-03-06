require "rails_helper"

RSpec.describe TransportsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/transports").to route_to("transports#index")
    end

    it "routes to #new" do
      expect(get: "/donations/1/transports/new").to route_to("transports#new", donation_id: "1")
    end

    it "routes to #create" do
      expect(post: "/donations/1/transports").to route_to("transports#create", donation_id: "1")
    end

    it "routes to #close" do
      expect(get: "/transports/2/close").to route_to("transports#close", id: "2")
    end

    it "routes to #finish" do
      expect(patch: "/transports/2/finish").to route_to("transports#finish", id: "2")
    end

  end
end
