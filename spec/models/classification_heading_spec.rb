require 'spec_helper'

describe ClassificationHeading do

    before(:each) do
      @attr = {:classification_heading_name => "Designation" , :display_order => 1}
    end

    it { should have_many(:classifications)}

    describe "validation for classification heading name" do
      it "should require a name" do
        blank_classification_heading_name = ClassificationHeading.new(@attr.merge(:classification_heading_name => ""))
        blank_classification_heading_name.should_not be_valid
      end

      it "should reject duplicate classification heading name" do
        duplicate_classification_heading_name = ClassificationHeading.create(@attr)
        duplicate_classification_heading_name = ClassificationHeading.new(@attr)
        duplicate_classification_heading_name.should_not be_valid
      end
    end

    describe "validation for classification display order" do
      it "should require Display Order" do
        blank_display_order = ClassificationHeading.new(@attr.merge(:display_order => ""))
        blank_display_order.should_not be_valid
      end

      it "should reject duplicate display_order" do
        duplicate_display_order = ClassificationHeading.create(@attr)
        duplicate_display_order = ClassificationHeading.new(@attr)
        duplicate_display_order.should_not be_valid
      end

      it "should reject display_order if it contains other than numbers from 1 to 9" do
        invalid_display_order = ClassificationHeading.new(@attr.merge(:display_order => "invalid"))
        invalid_display_order.should_not be_valid
      end
    end

end
