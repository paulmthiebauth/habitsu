class PersonalHabitsController < ApplicationController
  before_action :set_personal_habit, only: [:show, :edit, :update, :destroy]

  # GET /personal_habits
  # GET /personal_habits.json
  def index
    binding.pry
    @personal_habits = PersonalHabit.where(user_id: current_user.id).all
  end

  # GET /personal_habits/1
  # GET /personal_habits/1.json
  def show
  end

  # GET /personal_habits/new
  def new
    @personal_habit = PersonalHabit.new
  end

  # GET /personal_habits/1/edit
  def edit
  end

  # POST /personal_habits
  # POST /personal_habits.json
  def create
    @personal_habit = PersonalHabit.new(personal_habit_params)
    @personal_habit.user = current_user

    respond_to do |format|
      if @personal_habit.save
        format.html { redirect_to @personal_habit, notice: 'Personal habit was successfully created.' }
        format.json { render :show, status: :created, location: @personal_habit }
      else
        format.html { render :new }
        format.json { render json: @personal_habit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_habits/1
  # PATCH/PUT /personal_habits/1.json
  def update
    respond_to do |format|
      if @personal_habit.update(personal_habit_params)
        format.html { redirect_to @personal_habit, notice: 'Personal habit was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_habit }
      else
        format.html { render :edit }
        format.json { render json: @personal_habit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_habits/1
  # DELETE /personal_habits/1.json
  def destroy
    @personal_habit.destroy
    respond_to do |format|
      format.html { redirect_to personal_habits_url, notice: 'Personal habit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_habit
      @personal_habit = PersonalHabit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_habit_params
      params.require(:personal_habit).permit([:habit_name, :frequency => [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :daily]])
    end
end
