require 'rails_helper'

RSpec.describe "personal_habit_completions/new", type: :view do
  before(:each) do
    assign(:personal_habit_completion, PersonalHabitCompletion.new())
  end

  it "renders new personal_habit_completion form" do
    render

    assert_select "form[action=?][method=?]", personal_habit_completions_path, "post" do
    end
  end
end
