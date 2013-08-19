class Reputation < ActiveRecord::Base
  attr_accessible :from_id, :message, :point, :user_id, :from, :user
  belongs_to :user
  belongs_to :from, class_name: 'User', foreign_key: :from_id
end
