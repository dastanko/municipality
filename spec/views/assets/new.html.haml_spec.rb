require 'spec_helper'

describe "assets/new.html.haml" do
  before(:each) do
    assign(:asset, stub_model(Asset,
      :data_file_name => "MyString",
      :data_content_type => "MyString",
      :data_file_size => 1,
      :attachable => nil
    ).as_new_record)
  end

  it "renders new asset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assets_path, :method => "post" do
      assert_select "input#asset_data_file_name", :name => "asset[data_file_name]"
      assert_select "input#asset_data_content_type", :name => "asset[data_content_type]"
      assert_select "input#asset_data_file_size", :name => "asset[data_file_size]"
      assert_select "input#asset_attachable", :name => "asset[attachable]"
    end
  end
end
