require 'rails_helper'

RSpec.describe "personal_habits/new", type: :view do
  before(:each) do
    assign(:personal_habit, PersonalHabit.new())
  end

  it "renders new personal_habit form" do
    render

    assert_select "form[action=?][method=?]", personal_habits_path, "post" do
    end
  end
end
