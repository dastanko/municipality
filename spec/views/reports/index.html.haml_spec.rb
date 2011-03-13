require 'spec_helper'

describe "reports/index.html.haml" do
  before(:each) do
    assign(:reports, [
      stub_model(Report,
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
      ),
      stub_model(Report,
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
      )
    ])
  end

  it "renders a list of reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Coordinates".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pincolor".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
