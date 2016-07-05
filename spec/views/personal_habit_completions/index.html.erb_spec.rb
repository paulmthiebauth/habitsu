require 'rails_helper'

RSpec.describe "personal_habit_completions/index", type: :view do
  before(:each) do
    assign(:personal_habit_completions, [
      PersonalHabitCompletion.create!(),
      PersonalHabitCompletion.create!()
    ])
  end

  it "renders a list of personal_habit_completions" do
    render
  end
end
