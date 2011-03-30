require 'spec_helper'

describe "feedbacks/new.html.haml" do
  before(:each) do
    assign(:feedback, stub_model(Feedback).as_new_record)
  end

  it "renders new feedback form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feedbacks_path, :method => "post" do
    end
  end
end
