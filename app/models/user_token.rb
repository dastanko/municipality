# == Schema Information
# Schema version: 20110324095111
#
# Table name: user_tokens
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class UserToken < ActiveRecord::Base
  belongs_to :user
end
