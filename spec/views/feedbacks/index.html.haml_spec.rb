require 'spec_helper'

describe "feedbacks/index.html.haml" do
  before(:each) do
    assign(:feedbacks, [
      stub_model(Feedback),
      stub_model(Feedback)
    ])
  end

  it "renders a list of feedbacks" do
    render
  end
end
