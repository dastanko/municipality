class PagesController < ApplicationController
  def home
    @reports = Report.all
  end

  def contacts
  end

  def about
  end

end
