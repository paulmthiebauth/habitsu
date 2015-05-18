class HabitsController < ApplicationController
  def new
    @habit = Habit.new
  end
end
