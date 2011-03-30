class Feedback < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true, :format => { :with => User::EMAIL_REGEX }
  validates :message, :presence => true
end
