class Group < ActiveRecord::Base
  attr_accessible :title
  extend FriendlyId
  friendly_id :title, use: :slugged
end
