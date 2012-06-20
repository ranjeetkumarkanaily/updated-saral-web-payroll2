require 'spec_helper'

describe ClassificationsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {:classification_heading_id => 1,:classification_name => "WDO"}
  end

  describe "GET index" do
    it "assigns all classifications as @classifications" do
      classification_heading = FactoryGirl.create(:classification_heading)
      classification = Classification.create! valid_attributes.merge(:classification_heading_id => classification_heading.id)
      get :index, {:params1 => classification_heading.id}
      assigns(:classifications).should eq([classification])
    end
  end

  describe "GET new" do
    it "assigns a new classification as @classification" do
      classification_heading = FactoryGirl.create(:classification_heading)
      get :new, {:params1 => classification_heading.id}
      assigns(:classification).should be_a_new(Classification)
    end
  end

  describe "GET edit" do
    it "assigns the requested classification as @classification" do
      classification_heading = FactoryGirl.create(:classification_heading)
      classification = Classification.create! valid_attributes
      get :edit, {:id => classification.to_param,:params1=>classification_heading.id}
      assigns(:classification).should eq(classification)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do
        @classification_heading = FactoryGirl.create(:classification_heading)
      end
      it "creates a new Classification" do
        expect {
          post :create, {:classification => valid_attributes}
        }.to change(Classification, :count).by(1)
      end

      it "assigns a newly created classification as @classification" do
        post :create, {:classification => valid_attributes}
        assigns(:classification).should be_a(Classification)
        assigns(:classification).should be_persisted
      end

      it "redirects to the created classification" do
        post :create, {:classification => valid_attributes.merge(:classification_heading_id => @classification_heading.id)}
        response.should redirect_to(classifications_url(:params1 => @classification_heading.id))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved classification as @classification" do
        # Trigger the behavior that occurs when invalid params are submitted
        Classification.any_instance.stub(:save).and_return(false)
        post :create, {:classification => {}}
        assigns(:classification).should be_a_new(Classification)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Classification.any_instance.stub(:save).and_return(false)
        post :create, {:classification => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested classification" do
        classification = Classification.create! valid_attributes
        Classification.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => classification.to_param, :classification => {'these' => 'params'}}
      end

      it "assigns the requested classification as @classification" do
        classification = Classification.create! valid_attributes
        put :update, {:id => classification.to_param, :classification => valid_attributes}
        assigns(:classification).should eq(classification)
      end

      it "redirects to the classification" do
        classification_heading = FactoryGirl.create(:classification_heading)
        classification = Classification.create! valid_attributes
        put :update, {:id => classification.to_param, :classification => valid_attributes.merge(:classification_heading_id => classification_heading.id)}
        response.should redirect_to(classifications_url(:params1 => classification_heading.id))
      end
    end

    describe "with invalid params" do
      it "assigns the classification as @classification" do
        classification = Classification.create! valid_attributes
        Classification.any_instance.stub(:save).and_return(false)
        put :update, {:id => classification.to_param, :classification => {}}
        assigns(:classification).should eq(classification)
      end

      it "re-renders the 'edit' template" do
        classification = Classification.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Classification.any_instance.stub(:save).and_return(false)
        put :update, {:id => classification.to_param, :classification => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested classification" do
      clasficn_hd = FactoryGirl.create(:classification_heading)
      classification = FactoryGirl.create(:classification, :classification_heading_id => clasficn_hd.id)
      expect {
        delete :destroy, {:id => classification.id}
      }.to change(Classification, :count).by(-1)
    end

    it "redirects to the classifications list" do
      classification_heading = FactoryGirl.create(:classification_heading)
      classification = Classification.create! valid_attributes.merge(:classification_heading_id => classification_heading.id)
      delete :destroy, {:id => classification.to_param}
      response.should redirect_to(classifications_url(:params1 => classification_heading.id))
    end

    it "gives error 'Classification is being used. Not allow to delete.'" do
      clasficn_hd = FactoryGirl.create(:classification_heading)
      classification = FactoryGirl.create(:classification, :classification_heading_id => clasficn_hd.id, :classification_name => "development")
      emp = FactoryGirl.create(:employee)
      sal_grp = FactoryGirl.create(:salary_group)
      brnc = FactoryGirl.create(:branch)
      fin = FactoryGirl.create(:financial_institution)
      attendance_configuration = FactoryGirl.create(:attendance_configuration)

      emp_dtl = FactoryGirl.create(:employee_detail, :employee_id => emp.id, :salary_group_id => sal_grp.id, :branch_id => brnc.id, :financial_institution_id => fin.id, :attendance_configuration_id => attendance_configuration.id)
      delete :destroy, {:id => classification.id}
      response.should redirect_to(classifications_url(:params1 => clasficn_hd.id))
    end
  end

end
