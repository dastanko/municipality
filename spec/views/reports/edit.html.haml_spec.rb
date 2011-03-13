require 'spec_helper'

describe "reports/edit.html.haml" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :state_id => 1,
      :user_id => 1,
      :category_id => 1,
      :subject => "MyString",
      :description => "MyText",
      :coordinates => "MyString",
      :pincolor => "MyString",
      :address => "MyString",
      :solved => false,
      :approved => false
    ))
  end

  it "renders the edit report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reports_path(@report), :method => "post" do
      assert_select "input#report_state_id", :name => "report[state_id]"
      assert_select "input#report_user_id", :name => "report[user_id]"
      assert_select "input#report_category_id", :name => "report[category_id]"
      assert_select "input#report_subject", :name => "report[subject]"
      assert_select "textarea#report_description", :name => "report[description]"
      assert_select "input#report_coordinates", :name => "report[coordinates]"
      assert_select "input#report_pincolor", :name => "report[pincolor]"
      assert_select "input#report_address", :name => "report[address]"
      assert_select "input#report_solved", :name => "report[solved]"
      assert_select "input#report_approved", :name => "report[approved]"
    end
  end
end
