class Asset < ActiveRecord::Base
  #path is generally set by default, but i had to set mine
  has_attached_file :asset,
                    :styles => { :large => "640x480", :medium => "300x350>", :thumb => "100x100>" }

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