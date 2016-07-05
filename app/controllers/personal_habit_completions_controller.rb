class PersonalHabitCompletionsController < ApplicationController
  before_action :set_personal_habit_completion, only: [:show, :edit, :update, :destroy]

  # GET /personal_habit_completions
  # GET /personal_habit_completions.json
  def index
  end

  # GET /personal_habit_completions/1
  # GET /personal_habit_completions/1.json
  def show
  end

  # GET /personal_habit_completions/new
  def new
    @personal_habit_completion = PersonalHabitCompletion.new
  end

  # GET /personal_habit_completions/1/edit
  def edit
  end

  # POST /personal_habit_completions
  # POST /personal_habit_completions.json
  def create
    binding.pry
    @personal_habit_completion = PersonalHabitCompletion.new(personal_habit_completion_params)

    respond_to do |format|
      if @personal_habit_completion.save
        format.html { redirect_to @personal_habit_completion, notice: 'Personal habit completion was successfully created.' }
        format.json { render :show, status: :created, location: @personal_habit_completion }
      else
        format.html { render :new }
        format.json { render json: @personal_habit_completion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_habit_completions/1
  # PATCH/PUT /personal_habit_completions/1.json
  def update
    respond_to do |format|
      if @personal_habit_completion.update(personal_habit_completion_params)
        format.html { redirect_to @personal_habit_completion, notice: 'Personal habit completion was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_habit_completion }
      else
        format.html { render :edit }
        format.json { render json: @personal_habit_completion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_habit_completions/1
  # DELETE /personal_habit_completions/1.json
  def destroy
    @personal_habit_completion.destroy
    respond_to do |format|
      format.html { redirect_to personal_habit_completions_url, notice: 'Personal habit completion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_habit_completion
      @personal_habit_completion = PersonalHabitCompletion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_habit_completion_params
      params[:personal_habit_completion]
    end
end
