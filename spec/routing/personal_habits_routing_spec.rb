require "rails_helper"

RSpec.describe PersonalHabitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/personal_habits").to route_to("personal_habits#index")
    end

    it "routes to #new" do
      expect(:get => "/personal_habits/new").to route_to("personal_habits#new")
    end

    it "routes to #show" do
      expect(:get => "/personal_habits/1").to route_to("personal_habits#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/personal_habits/1/edit").to route_to("personal_habits#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/personal_habits").to route_to("personal_habits#create")
    end

    it "routes to #update" do
      expect(:put => "/personal_habits/1").to route_to("personal_habits#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/personal_habits/1").to route_to("personal_habits#destroy", :id => "1")
    end

  end
end
