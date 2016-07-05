require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PersonalHabitCompletionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # PersonalHabitCompletion. As you add validations to PersonalHabitCompletion, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PersonalHabitCompletionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all personal_habit_completions as @personal_habit_completions" do
      personal_habit_completion = PersonalHabitCompletion.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:personal_habit_completions)).to eq([personal_habit_completion])
    end
  end

  describe "GET #show" do
    it "assigns the requested personal_habit_completion as @personal_habit_completion" do
      personal_habit_completion = PersonalHabitCompletion.create! valid_attributes
      get :show, {:id => personal_habit_completion.to_param}, valid_session
      expect(assigns(:personal_habit_completion)).to eq(personal_habit_completion)
    end
  end

  describe "GET #new" do
    it "assigns a new personal_habit_completion as @personal_habit_completion" do
      get :new, {}, valid_session
      expect(assigns(:personal_habit_completion)).to be_a_new(PersonalHabitCompletion)
    end
  end

  describe "GET #edit" do
    it "assigns the requested personal_habit_completion as @personal_habit_completion" do
      personal_habit_completion = PersonalHabitCompletion.create! valid_attributes
      get :edit, {:id => personal_habit_completion.to_param}, valid_session
      expect(assigns(:personal_habit_completion)).to eq(personal_habit_completion)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new PersonalHabitCompletion" do
        expect {
          post :create, {:personal_habit_completion => valid_attributes}, valid_session
        }.to change(PersonalHabitCompletion, :count).by(1)
      end

      it "assigns a newly created personal_habit_completion as @personal_habit_completion" do
        post :create, {:personal_habit_completion => valid_attributes}, valid_session
        expect(assigns(:personal_habit_completion)).to be_a(PersonalHabitCompletion)
        expect(assigns(:personal_habit_completion)).to be_persisted
      end

      it "redirects to the created personal_habit_completion" do
        post :create, {:personal_habit_completion => valid_attributes}, valid_session
        expect(response).to redirect_to(PersonalHabitCompletion.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved personal_habit_completion as @personal_habit_completion" do
        post :create, {:personal_habit_completion => invalid_attributes}, valid_session
        expect(assigns(:personal_habit_completion)).to be_a_new(PersonalHabitCompletion)
      end

      it "re-renders the 'new' template" do
        post :create, {:personal_habit_completion => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested personal_habit_completion" do
        personal_habit_completion = PersonalHabitCompletion.create! valid_attributes
        put :update, {:id => personal_habit_completion.to_param, :personal_habit_completion => new_attributes}, valid_session
        personal_habit_completion.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested personal_habit_completion as @personal_habit_completion" do
        personal_habit_completion = PersonalHabitCompletion.create! valid_attributes
        put :update, {:id => personal_habit_completion.to_param, :personal_habit_completion => valid_attributes}, valid_session
        expect(assigns(:personal_habit_completion)).to eq(personal_habit_completion)
      end

      it "redirects to the personal_habit_completion" do
        personal_habit_completion = PersonalHabitCompletion.create! valid_attributes
        put :update, {:id => personal_habit_completion.to_param, :personal_habit_completion => valid_attributes}, valid_session
        expect(response).to redirect_to(personal_habit_completion)
      end
    end

    context "with invalid params" do
      it "assigns the personal_habit_completion as @personal_habit_completion" do
        personal_habit_completion = PersonalHabitCompletion.create! valid_attributes
        put :update, {:id => personal_habit_completion.to_param, :personal_habit_completion => invalid_attributes}, valid_session
        expect(assigns(:personal_habit_completion)).to eq(personal_habit_completion)
      end

      it "re-renders the 'edit' template" do
        personal_habit_completion = PersonalHabitCompletion.create! valid_attributes
        put :update, {:id => personal_habit_completion.to_param, :personal_habit_completion => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested personal_habit_completion" do
      personal_habit_completion = PersonalHabitCompletion.create! valid_attributes
      expect {
        delete :destroy, {:id => personal_habit_completion.to_param}, valid_session
      }.to change(PersonalHabitCompletion, :count).by(-1)
    end

    it "redirects to the personal_habit_completions list" do
      personal_habit_completion = PersonalHabitCompletion.create! valid_attributes
      delete :destroy, {:id => personal_habit_completion.to_param}, valid_session
      expect(response).to redirect_to(personal_habit_completions_url)
    end
  end

end
