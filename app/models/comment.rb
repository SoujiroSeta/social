class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :message
end
