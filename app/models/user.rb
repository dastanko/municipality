# == Schema Information
# Schema version: 20110313102110
#
# Table name: users
#
#  id                   :integer(4)      not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  name                 :string(255)
#  last_name            :string(255)
#  phone                :string(255)
#  is_anonym            :boolean(1)
#  is_admin             :boolean(1)
#  created_at           :datetime
#  updated_at           :datetime
#

class User < ActiveRecord::Base
  attr_accessor :password
  has_many :reports, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :validatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  #Validations
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/i

  validates_presence_of :name
  validates_format_of :name, :with => /^[^0-9`!@#\$%\^&*+_=-]+$/
  validates_presence_of :last_name
  validates_format_of :last_name, :with => /^[^0-9`!@#\$%\^&*+_=-]+$/
  validates_presence_of :email
  validates_presence_of :password
  validates_length_of :password, :minimum => 6
  validates_presence_of :password_confirmation
  validates_uniqueness_of :email
  validates_format_of :email, :with => EMAIL_REGEX
  validates_confirmation_of :password
  validates_numericality_of :phone, :allow_blank => true
  validates_length_of :phone, :within => 6..20, :allow_blank => true

  def full_name
    name + " " + last_name
  end

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me
end
