class ReportsController < ApplicationController
  before_filter :authenticate_admin, :only => [:destroy, :edit, :update]

  def index
    @reports = Report.order("created_at DESC").page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
    @comment = @report.comments.build

    unless user_signed_in?
      @report.comments.last.anonym_user = AnonymUser.new
    end

    @report.comments.pop
  end

  def new
    @report = Report.new

    unless user_signed_in?
      @report.build_anonym_user
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(params[:report])
    if user_signed_in?
      @report.user = current_user
    end

    if @report.save
      flash[:success] = 'Report was successfully created.'
      redirect_to @report
    else
      render :action => "new"
    end
  end

  def update
    @report = Report.find(params[:id])

    if @report.update_attributes(params[:report])
      flash[:success] = 'Report was successfully updated.'
      redirect_to @report
    else
      render :action => "edit"
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    redirect_to reports_url
  end
end
