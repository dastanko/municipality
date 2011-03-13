require 'spec_helper'

describe "reports/show.html.haml" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :state_id => 1,
      :user_id => 1,
      :category_id => 1,
      :subject => "Subject",
      :description => "MyText",
      :coordinates => "Coordinates",
      :pincolor => "Pincolor",
      :address => "Address",
      :solved => false,
      :approved => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Coordinates/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pincolor/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
