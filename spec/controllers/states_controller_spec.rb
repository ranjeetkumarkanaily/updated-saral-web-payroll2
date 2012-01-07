require 'spec_helper'

describe StatesController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
    :state_name => "TN"
    }
  end

  describe "GET index" do
    it "assigns all states as @states" do
      state = State.create! valid_attributes
      get :index
      assigns(:states).should eq([state])
    end
  end

  describe "GET show" do
    it "assigns the requested state as @state" do
      state = State.create! valid_attributes
      get :show, :id => state.id
      assigns(:state).should eq(state)
    end
  end

  describe "GET new" do
    it "assigns a new state as @state" do
      get :new
      assigns(:state).should be_a_new(State)
    end
  end

  describe "GET edit" do
    it "assigns the requested state as @state" do
      state = State.create! valid_attributes
      get :edit, :id => state.id
      assigns(:state).should eq(state)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new State" do
        expect {
          post :create, :state => valid_attributes
        }.to change(State, :count).by(1)
      end

      it "assigns a newly created state as @state" do
        post :create, :state => valid_attributes
        assigns(:state).should be_a(State)
        assigns(:state).should be_persisted
      end

      it "redirects to the created state" do
        post :create, :state => valid_attributes
        response.should redirect_to(states_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved state as @state" do
        # Trigger the behavior that occurs when invalid params are submitted
        State.any_instance.stub(:save).and_return(false)
        post :create, :state => {}
        assigns(:state).should be_a_new(State)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        State.any_instance.stub(:save).and_return(false)
        post :create, :state => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested state" do
        state = State.create! valid_attributes
        # Assuming there are no other states in the database, this
        # specifies that the State created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        State.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => state.id, :state => {'these' => 'params'}
      end

      it "assigns the requested state as @state" do
        state = State.create! valid_attributes
        put :update, :id => state.id, :state => valid_attributes
        assigns(:state).should eq(state)
      end

      it "redirects to the state" do
        state = State.create! valid_attributes
        put :update, :id => state.id, :state => valid_attributes
        response.should redirect_to(states_url)
      end
    end

    describe "with invalid params" do
      it "assigns the state as @state" do
        state = State.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        State.any_instance.stub(:save).and_return(false)
        put :update, :id => state.id, :state => {}
        assigns(:state).should eq(state)
      end

      it "re-renders the 'edit' template" do
        state = State.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        State.any_instance.stub(:save).and_return(false)
        put :update, :id => state.id, :state => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested state" do
      state = State.create! valid_attributes
      expect {
        delete :destroy, :id => state.id
      }.to change(State, :count).by(-1)
    end

    it "redirects to the states list" do
      state = State.create! valid_attributes
      delete :destroy, :id => state.id
      response.should redirect_to(states_url)
    end
  end

end
