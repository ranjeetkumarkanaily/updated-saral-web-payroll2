require 'spec_helper'

describe "classifications/index" do
  before(:each) do
    @classification_heading = FactoryGirl.create(:classification_heading)
    assign(:paramclassification_id, @classification_heading.id)
    assign(:classifications, [
      stub_model(Classification,
        :classification_heading => @classification_heading,
        :classification_name => "Classification Name"
      ),
      stub_model(Classification,
        :classification_heading => @classification_heading,
        :classification_name => "Classification Name"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of classifications" do
    render
    rendered.should have_content('Classification Name')
  end
end
