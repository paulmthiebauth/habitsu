require "rails_helper"

RSpec.describe PersonalHabitCompletionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/personal_habit_completions").to route_to("personal_habit_completions#index")
    end

    it "routes to #new" do
      expect(:get => "/personal_habit_completions/new").to route_to("personal_habit_completions#new")
    end

    it "routes to #show" do
      expect(:get => "/personal_habit_completions/1").to route_to("personal_habit_completions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/personal_habit_completions/1/edit").to route_to("personal_habit_completions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/personal_habit_completions").to route_to("personal_habit_completions#create")
    end

    it "routes to #update" do
      expect(:put => "/personal_habit_completions/1").to route_to("personal_habit_completions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/personal_habit_completions/1").to route_to("personal_habit_completions#destroy", :id => "1")
    end

  end
end
