class PagesController < ApplicationController
  def home
    @reports = Report.all.last(5).reverse
    @comments = Comment.all.last(5).reverse
  end

  def contacts
    @reports = Report.all
    
    respond_to do |format|
      format.html
      format.json { render :json => @reports.to_json(:only => [:latitude, :longtitude, :address, :subject, :id, :asset_file_name, :solved], :include => :assets).html_safe }
    end
  end

  def about
  end

end
