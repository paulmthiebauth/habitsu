require 'rails_helper'

RSpec.describe "personal_habits/show", type: :view do
  before(:each) do
    @personal_habit = assign(:personal_habit, PersonalHabit.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
