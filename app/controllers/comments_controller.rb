class CommentsController < ApplicationController
  before_filter :commentable
  before_filter :authenticate_admin, :except => [:create]

  def create
    commentable()
    if @commentable
      @comment = @commentable.comments.build(params[:comment])
      @comment.permalink = url_for(show_page_url) + "#comment-#{Comment.last.id + 1}"

      if user_signed_in?
        @comment.user = current_user
      end

      if @comment.save
        redirect_to show_page_url, :notice => "Thanks for the comment."
      else
        flash.now[:alert] = "You had some errors for your comment."
        render_error_page
      end
    else
      redirect_to root_url, :alert => "You can't do that."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
       redirect_to show_page_url
    end
  end

  private

  def commentable
    @commentable = Comment.find_commentable(params[:comment][:commentable_type], params[:comment][:commentable_id]) if params[:comment]
    @commentable = Comment.find(params[:id]).commentable if params[:id]
  end

  def show_page_url
    case @commentable.class.name
    when "Post" then post_url(@commentable.sequence)
    else @commentable
    end
  end

  def render_error_page
    model_name = @commentable.class.name
    instance_variable_set("@#{model_name.downcase}", @commentable)
    render "#{model_name.underscore.downcase.pluralize}/show"
  end

end
