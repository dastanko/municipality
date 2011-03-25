require 'spec_helper'

describe "assets/show.html.haml" do
  before(:each) do
    @asset = assign(:asset, stub_model(Asset,
      :data_file_name => "Data File Name",
      :data_content_type => "Data Content Type",
      :data_file_size => 1,
      :attachable => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Data File Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Data Content Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
