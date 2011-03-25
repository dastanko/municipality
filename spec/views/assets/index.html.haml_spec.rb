require 'spec_helper'

describe "assets/index.html.haml" do
  before(:each) do
    assign(:assets, [
      stub_model(Asset,
        :data_file_name => "Data File Name",
        :data_content_type => "Data Content Type",
        :data_file_size => 1,
        :attachable => nil
      ),
      stub_model(Asset,
        :data_file_name => "Data File Name",
        :data_content_type => "Data Content Type",
        :data_file_size => 1,
        :attachable => nil
      )
    ])
  end

  it "renders a list of assets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Data File Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Data Content Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
