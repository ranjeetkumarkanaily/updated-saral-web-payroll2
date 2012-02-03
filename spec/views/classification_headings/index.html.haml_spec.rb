require 'spec_helper'

describe "classification_headings/index" do
  before(:each) do
    assign(:classification_headings, [
      stub_model(ClassificationHeading,
        :classification_heading_name => "Classification Heading Name",
        :display_order => 1
      ),
      stub_model(ClassificationHeading,
        :classification_heading_name => "Classification Heading Name",
        :display_order => 1
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of classification_headings" do
    render
    rendered.should have_content('Classification Heading Name')
  end
end

