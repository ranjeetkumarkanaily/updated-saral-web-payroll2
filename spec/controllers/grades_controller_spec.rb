require 'spec_helper'

describe GradesController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
        :grade => "First"
    }
  end

  describe "GET index" do
    it "assigns all grades as @grades" do
      grade = Grade.create! valid_attributes
      get :index
      assigns(:grades).should eq([grade])
    end
  end

  describe "GET show" do
    it "assigns the requested grade as @grade" do
      grade = Grade.create! valid_attributes
      get :show, {:id => grade.to_param}
      assigns(:grade).should eq(grade)
    end
  end

  describe "GET new" do
    it "assigns a new grade as @grade" do
      get :new
      assigns(:grade).should be_a_new(Grade)
    end
  end

  describe "GET edit" do
    it "assigns the requested grade as @grade" do
      grade = Grade.create! valid_attributes
      get :edit, {:id => grade.to_param}
      assigns(:grade).should eq(grade)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Grade" do
        expect {
          post :create, {:grade => valid_attributes}
        }.to change(Grade, :count).by(1)
      end

      it "assigns a newly created grade as @grade" do
        post :create, {:grade => valid_attributes}
        assigns(:grade).should be_a(Grade)
        assigns(:grade).should be_persisted
      end

      it "redirects to the created grade" do
        post :create, {:grade => valid_attributes}
        response.should redirect_to(Grade.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved grade as @grade" do
        # Trigger the behavior that occurs when invalid params are submitted
        Grade.any_instance.stub(:save).and_return(false)
        post :create, {:grade => {}}
        assigns(:grade).should be_a_new(Grade)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Grade.any_instance.stub(:save).and_return(false)
        post :create, {:grade => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested grade" do
        grade = Grade.create! valid_attributes
        # Assuming there are no other grades in the database, this
        # specifies that the Grade created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Grade.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => grade.to_param, :grade => {'these' => 'params'}}
      end

      it "assigns the requested grade as @grade" do
        grade = Grade.create! valid_attributes
        put :update, {:id => grade.to_param, :grade => valid_attributes}
        assigns(:grade).should eq(grade)
      end

      it "redirects to the grade" do
        grade = Grade.create! valid_attributes
        put :update, {:id => grade.to_param, :grade => valid_attributes}
        response.should redirect_to(grade)
      end
    end

    describe "with invalid params" do
      it "assigns the grade as @grade" do
        grade = Grade.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Grade.any_instance.stub(:save).and_return(false)
        put :update, {:id => grade.to_param, :grade => {}}
        assigns(:grade).should eq(grade)
      end

      it "re-renders the 'edit' template" do
        grade = Grade.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Grade.any_instance.stub(:save).and_return(false)
        put :update, {:id => grade.to_param, :grade => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested grade" do
      grade = Grade.create! valid_attributes
      expect {
        delete :destroy, {:id => grade.to_param}
      }.to change(Grade, :count).by(-1)
    end

    it "redirects to the grades list" do
      grade = Grade.create! valid_attributes
      delete :destroy, {:id => grade.to_param}
      response.should redirect_to(grades_url)
    end
  end

end
