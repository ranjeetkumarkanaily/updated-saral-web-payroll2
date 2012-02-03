require 'spec_helper'

describe ClassificationHeadingsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {:classification_heading_name => "Designation",
      :display_order => 1}
  end

  describe "GET index" do
    it "assigns all classification_headings as @classification_headings" do
      classification_heading = ClassificationHeading.create! valid_attributes
      get :index
      assigns(:classification_headings).should eq([classification_heading])
    end
  end

  describe "GET show" do
    it "assigns the requested classification_heading as @classification_heading" do
      classification_heading = ClassificationHeading.create! valid_attributes
      get :show, {:id => classification_heading.to_param}
      assigns(:classification_heading).should eq(classification_heading)
    end
  end

  describe "GET new" do
    it "assigns a new classification_heading as @classification_heading" do
      get :new
      assigns(:classification_heading).should be_a_new(ClassificationHeading)
    end
  end

  describe "GET edit" do
    it "assigns the requested classification_heading as @classification_heading" do
      classification_heading = ClassificationHeading.create! valid_attributes
      get :edit, {:id => classification_heading.to_param}
      assigns(:classification_heading).should eq(classification_heading)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ClassificationHeading" do
        expect {
          post :create, {:classification_heading => valid_attributes}
        }.to change(ClassificationHeading, :count).by(1)
      end

      it "assigns a newly created classification_heading as @classification_heading" do
        post :create, {:classification_heading => valid_attributes}
        assigns(:classification_heading).should be_a(ClassificationHeading)
        assigns(:classification_heading).should be_persisted
      end

      it "redirects to the created classification_headings" do
        post :create, {:classification_heading => valid_attributes}
        response.should redirect_to(classification_headings_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved classification_heading as @classification_heading" do
        # Trigger the behavior that occurs when invalid params are submitted
        ClassificationHeading.any_instance.stub(:save).and_return(false)
        post :create, {:classification_heading => {}}
        assigns(:classification_heading).should be_a_new(ClassificationHeading)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ClassificationHeading.any_instance.stub(:save).and_return(false)
        post :create, {:classification_heading => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested classification_heading" do
        classification_heading = ClassificationHeading.create! valid_attributes
        ClassificationHeading.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => classification_heading.to_param, :classification_heading => {'these' => 'params'}}
      end

      it "assigns the requested classification_heading as @classification_heading" do
        classification_heading = ClassificationHeading.create! valid_attributes
        put :update, {:id => classification_heading.to_param, :classification_heading => valid_attributes}
        assigns(:classification_heading).should eq(classification_heading)
      end

      it "redirects to the classification_headings" do
        classification_heading = ClassificationHeading.create! valid_attributes
        put :update, {:id => classification_heading.to_param, :classification_heading => valid_attributes}
        response.should redirect_to(classification_headings_url)
      end
    end

    describe "with invalid params" do
      it "assigns the classification_heading as @classification_heading" do
        classification_heading = ClassificationHeading.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ClassificationHeading.any_instance.stub(:save).and_return(false)
        put :update, {:id => classification_heading.to_param, :classification_heading => {}}
        assigns(:classification_heading).should eq(classification_heading)
      end

      it "re-renders the 'edit' template" do
        classification_heading = ClassificationHeading.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ClassificationHeading.any_instance.stub(:save).and_return(false)
        put :update, {:id => classification_heading.to_param, :classification_heading => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested classification_heading" do
      classification_heading = ClassificationHeading.create! valid_attributes
      expect {
        delete :destroy, {:id => classification_heading.to_param}
      }.to change(ClassificationHeading, :count).by(-1)
    end

    it "redirects to the classification_headings list" do
      classification_heading = ClassificationHeading.create! valid_attributes
      delete :destroy, {:id => classification_heading.to_param}
      response.should redirect_to(classification_headings_url)
    end
  end

end
