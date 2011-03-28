# == Schema Information
# Schema version: 20110324095111
#
# Table name: anonym_users
#
#  id         :integer(4)      not null, primary key
#  email      :string(255)
#  name       :string(255)
#  last_name  :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class AnonymUser < ActiveRecord::Base

  has_one :report, :dependent => :destroy
  has_one :comment, :dependent => :destroy
  before_validation :check

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/i

  validates_presence_of :name
  validates_format_of :name, :with => /^[^0-9`!@#\$%\^&*+_=-]+$/
  validates_presence_of :last_name
  validates_format_of :last_name, :with => /^[^0-9`!@#\$%\^&*+_=-]+$/
  validates_presence_of :email
  validates_format_of :email, :with => EMAIL_REGEX
  validates_numericality_of :phone, :allow_blank => true
  validates_length_of :phone, :within => 6..20, :allow_blank => true

  def full_name
    name + " " + last_name
  end

  def check
    if self.last_name.blank?
      self.last_name = "Anonym User"
    end
  end
end
