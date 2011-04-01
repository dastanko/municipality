class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(:name => params[:name], :email => params[:email], :message => params[:message])

    if @feedback.save
      render :text => 'success'
    end
  end
end
