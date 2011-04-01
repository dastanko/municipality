class PagesController < ApplicationController
  def home
    @reports = Report.all.last(5).reverse
    @comments = Comment.all.last(5).reverse
  end

  def contacts
  end

  def about
  end

end
