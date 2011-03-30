require 'spec_helper'

describe "feedbacks/edit.html.haml" do
  before(:each) do
    @feedback = assign(:feedback, stub_model(Feedback))
  end

  it "renders the edit feedback form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feedbacks_path(@feedback), :method => "post" do
    end
  end
end
