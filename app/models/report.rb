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
  belongs_to :state
  belongs_to :category
  belongs_to :user

  accepts_nested_attributes_for :user
end
