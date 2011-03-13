# == Schema Information
# Schema version: 20110313114351
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Category < ActiveRecord::Base
  has_many :reports

end
