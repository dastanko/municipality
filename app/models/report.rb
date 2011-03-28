# == Schema Information
# Schema version: 20110324095111
#
# Table name: reports
#
#  id             :integer(4)      not null, primary key
#  state_id       :integer(4)
#  user_id        :integer(4)
#  category_id    :integer(4)
#  subject        :string(255)
#  description    :text
#  pincolor       :string(255)
#  address        :string(255)
#  solved         :boolean(1)
#  approved       :boolean(1)
#  created_at     :datetime
#  updated_at     :datetime
#  longtitude     :string(255)
#  latitude       :string(255)
#  anonym_user_id :integer(4)
#

class Report < ActiveRecord::Base
  acts_as_commentable
  belongs_to :state
  belongs_to :category
  belongs_to :user
  belongs_to :anonym_user
  has_many :assets, :as => :attachable, :dependent => :destroy

  validates_presence_of :subject
  validates_presence_of :description
  validates_presence_of :longtitude
  validates_presence_of :latitude
  validates_presence_of :address
  validates_associated :category
  validates_associated :state

  accepts_nested_attributes_for :anonym_user
  accepts_nested_attributes_for :assets

  default_scope :order => "created_at DESC"

  def reporter
    if self.user.nil?
      self.anonym_user.full_name
    else
      self.user.full_name
    end
  end

  def image
    assets.first
  end

end
