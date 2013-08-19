class Question < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

	validates :title, :message, presence: true
  attr_accessible :message, :title, :tag_list
  belongs_to :user
  has_many :comments, as: :commentable
  acts_as_taggable
end
