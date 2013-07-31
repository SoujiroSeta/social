class Question < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

	validates :title, presence: true
  attr_accessible :message, :title
end
