# == Schema Information
# Schema version: 20110324095111
#
# Table name: users
#
#  id                   :integer(4)      not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  password_salt        :string(255)
#  name                 :string(255)
#  last_name            :string(255)
#  phone                :string(255)
#  is_anonym            :boolean(1)
#  is_admin             :boolean(1)
#  created_at           :datetime
#  updated_at           :datetime
#

class User < ActiveRecord::Base
  has_many :reports, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :user_tokens, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :validatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :encryptable, :encryptor => "sha512"

  #Validations
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
  validates_presence_of :password, :if => :password_required?
  validates_length_of :password, :minimum => 6, :if => :password_required?
  validates_presence_of :password_confirmation, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?

  def full_name
    name + " " + last_name
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create an user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0, 20])
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session[:omniauth]
        user.user_tokens.build(:provider => data['provider'], :uid => data['uid'])
      end
    end
  end

  def apply_omniauth(omniauth)
    #add some info about the user
    #self.nickname = omniauth['user_info']['nickname'] if nickname.blank?
    if omniauth['provider'] == 'facebook'
      self.name = omniauth['user_info']['first_name'] if name.blank?
      self.last_name = omniauth['user_info']['last_name'] if last_name.blank?
    elsif omniauth['provider'] == 'twitter'
      self.name = omniauth['user_info']['name'].split(' ').first if name.blank?
      self.last_name = omniauth['user_info']['name'].split(' ').last if last_name.blank?
    end

    unless omniauth['credentials'].blank?
      user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    else
      user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    end
    #self.confirm!# unless user.email.blank?
  end

  def password_required?
    user_tokens.empty? || !password.blank? && super
  end

  def admin
    is_admin?
  end
  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me
end
