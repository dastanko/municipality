class AnonymUser < ActiveRecord::Base

  has_one :report, :dependent => :destroy


  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/i

  validates_presence_of :name
  validates_format_of :name, :with => /^[^0-9`!@#\$%\^&*+_=-]+$/
  validates_presence_of :last_name
  validates_format_of :last_name, :with => /^[^0-9`!@#\$%\^&*+_=-]+$/
  validates_presence_of :email
  validates_format_of :email, :with => EMAIL_REGEX
  validates_uniqueness_of :email
  validates_numericality_of :phone, :allow_blank => true
  validates_length_of :phone, :within => 6..20, :allow_blank => true

  def full_name
    name + " " + last_name
  end

end
