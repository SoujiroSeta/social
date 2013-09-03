class Question < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

	validates :title, :message, presence: true
  attr_accessible :message, :title, :tag_list, :total_view
  belongs_to :user
  has_many :comments, as: :commentable
  acts_as_taggable
  

  # membuat total view
  def update_total_view
  	update_attributes(total_view: self.total_view.to_i + 1 )
    # sama seperti
    # self.total_view = self.total_view + 1
    # self.save
  end

end
