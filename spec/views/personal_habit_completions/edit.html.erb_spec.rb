require 'rails_helper'

RSpec.describe "personal_habit_completions/edit", type: :view do
  before(:each) do
    @personal_habit_completion = assign(:personal_habit_completion, PersonalHabitCompletion.create!())
  end

  it "renders the edit personal_habit_completion form" do
    render

    assert_select "form[action=?][method=?]", personal_habit_completion_path(@personal_habit_completion), "post" do
    end
  end
end
