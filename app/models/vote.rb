class Vote < ActiveRecord::Base
  attr_accessible :comment_id, :user_id, :vote_status
  belongs_to :user
  belongs_to :comment
end
