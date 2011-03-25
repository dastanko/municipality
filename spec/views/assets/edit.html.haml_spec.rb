require 'spec_helper'

describe "assets/edit.html.haml" do
  before(:each) do
    @asset = assign(:asset, stub_model(Asset,
      :data_file_name => "MyString",
      :data_content_type => "MyString",
      :data_file_size => 1,
      :attachable => nil
    ))
  end

  it "renders the edit asset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assets_path(@asset), :method => "post" do
      assert_select "input#asset_data_file_name", :name => "asset[data_file_name]"
      assert_select "input#asset_data_content_type", :name => "asset[data_content_type]"
      assert_select "input#asset_data_file_size", :name => "asset[data_file_size]"
      assert_select "input#asset_attachable", :name => "asset[attachable]"
    end
  end
end
