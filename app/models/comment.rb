# == Schema Information
# Schema version: 20110324095111
#
# Table name: comments
#
#  id               :integer(4)      not null, primary key
#  title            :string(50)      default("")
#  comment          :text
#  commentable_id   :integer(4)
#  commentable_type :string(255)
#  user_id          :integer(4)
#  anonym_user_id   :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
  belongs_to :anonym_user
  accepts_nested_attributes_for :anonym_user

  validates_presence_of :comment

  def author
    if self.user.nil?
      self.anonym_user.name
    else
      self.user.name
    end
  end
end
