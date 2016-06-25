require 'rails_helper'

RSpec.describe "personal_habits/index", type: :view do
  before(:each) do
    assign(:personal_habits, [
      PersonalHabit.create!(),
      PersonalHabit.create!()
    ])
  end

  it "renders a list of personal_habits" do
    render
  end
end
