# == Schema Information
# Schema version: 20110324095111
#
# Table name: assets
#
#  id                 :integer(4)      not null, primary key
#  asset_file_name    :string(255)
#  asset_content_type :string(255)
#  asset_file_size    :integer(4)
#  attachable_id      :integer(4)
#  attachable_type    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Asset < ActiveRecord::Base
  #path is generally set by default, but i had to set mine
  has_attached_file :asset,
                    :styles => { :large => "640x480", :medium => "300x350>", :thumb => "100x100>", :small => "40x40#" }

  belongs_to :attachable, :polymorphic => true

  #Set number to the Max Attachments allowed for owner
  Max_Attachments = 3
  Max_Attachment_Size = 2.megabyte

  validates_attachment_content_type :asset, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/bmp' ]

  def url(*args)
    asset.url(*args)
  end

  def name
    asset_file_name
  end

  def type
    asset_content_type
  end

  def size
    asset_file_size
  end
end
