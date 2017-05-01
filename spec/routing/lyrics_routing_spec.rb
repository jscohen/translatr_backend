require "rails_helper"

RSpec.describe LyricsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lyrics").to route_to("lyrics#index")
    end

    it "routes to #new" do
      expect(:get => "/lyrics/new").to route_to("lyrics#new")
    end

    it "routes to #show" do
      expect(:get => "/lyrics/1").to route_to("lyrics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lyrics/1/edit").to route_to("lyrics#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lyrics").to route_to("lyrics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lyrics/1").to route_to("lyrics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lyrics/1").to route_to("lyrics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lyrics/1").to route_to("lyrics#destroy", :id => "1")
    end

  end
end
