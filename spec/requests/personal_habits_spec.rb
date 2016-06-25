require 'rails_helper'

RSpec.describe "PersonalHabits", type: :request do
  describe "GET /personal_habits" do
    it "works! (now write some real specs)" do
      get personal_habits_path
      expect(response).to have_http_status(200)
    end
  end
end
