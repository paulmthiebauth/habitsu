require 'rails_helper'

RSpec.describe "PersonalHabitCompletions", type: :request do
  describe "GET /personal_habit_completions" do
    it "works! (now write some real specs)" do
      get personal_habit_completions_path
      expect(response).to have_http_status(200)
    end
  end
end
