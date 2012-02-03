require 'spec_helper'

describe Classification do

  before(:each) do
    @attr = {:classification_heading_id => 1 , :classification_name => "WDO"}
  end

  it { should belong_to(:classification_heading)}

  describe "validation for classification name" do
    it "should require a name" do
      blank_classification_name = Classification.new(@attr.merge(:classification_name => ""))
      blank_classification_name.should_not be_valid
    end

    it "should reject duplicate classification heading name" do
      duplicate_classification_name = Classification.create(@attr)
      duplicate_classification_name = Classification.new(@attr)
      duplicate_classification_name.should_not be_valid
    end
  end


end
