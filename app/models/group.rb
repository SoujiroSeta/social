class Group < ActiveRecord::Base
  attr_accessible :title
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_and_belongs_to_many :users
end