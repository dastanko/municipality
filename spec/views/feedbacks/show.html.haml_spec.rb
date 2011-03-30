require 'spec_helper'

describe "feedbacks/show.html.haml" do
  before(:each) do
    @feedback = assign(:feedback, stub_model(Feedback))
  end

  it "renders attributes in <p>" do
    render
  end
end
