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
  has_many :reports

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :validatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me
end
