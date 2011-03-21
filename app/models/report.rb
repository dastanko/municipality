# == Schema Information
# Schema version: 20110313114351
#
# Table name: reports
#
#  id          :integer(4)      not null, primary key
#  state_id    :integer(4)
#  user_id     :integer(4)
#  category_id :integer(4)
#  subject     :string(255)
#  description :text
#  coordinates :string(255)
#  pincolor    :string(255)
#  address     :string(255)
#  solved      :boolean(1)
#  approved    :boolean(1)
#  created_at  :datetime
#  updated_at  :datetime
#

class Report < ActiveRecord::Base
  acts_as_commentable
  belongs_to :state
  belongs_to :category
  belongs_to :user
  belongs_to :anonym_user

  validates_presence_of :subject
  validates_presence_of :description
  validates_associated :category
  validates_presence_of :longtitude
  validates_presence_of :latitude
  validates_presence_of :address
  validates_associated :state

  accepts_nested_attributes_for :anonym_user

  def reporter
    if self.user.nil?
      self.anonym_user.full_name
    else
      self.user.full_name
    end
  end

end
