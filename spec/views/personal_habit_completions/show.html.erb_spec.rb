require 'rails_helper'

RSpec.describe "personal_habit_completions/show", type: :view do
  before(:each) do
    @personal_habit_completion = assign(:personal_habit_completion, PersonalHabitCompletion.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
