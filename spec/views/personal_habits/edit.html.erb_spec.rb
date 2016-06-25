require 'rails_helper'

RSpec.describe "personal_habits/edit", type: :view do
  before(:each) do
    @personal_habit = assign(:personal_habit, PersonalHabit.create!())
  end

  it "renders the edit personal_habit form" do
    render

    assert_select "form[action=?][method=?]", personal_habit_path(@personal_habit), "post" do
    end
  end
end
