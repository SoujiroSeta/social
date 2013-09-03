class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
        
  attr_accessible :email, :password, :password_confirmation, :total_view,
                  :first_name, :last_name, :remember_me, :image, :username

  has_many :questions 
  has_many :comments
  has_and_belongs_to_many :groups
  has_many :reputations
  has_many :votes
  
  # validates_length :password, minimum: 5, maximum: 64, on: :create
  # validates_uniqueness_of :email, :password
  # validates_format :username, with /^[A-Za-z0-9]+$/i
  # validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  # validates_presence_of :username, :email, :phone on: :create
  def name
  	"#{first_name} #{last_name}"
  end

  # membuat total view
  def update_total_view
    update_attributes(total_view: self.total_view.to_i + 1 )
    # sama seperti
    # self.total_view = self.total_view + 1
    # self.save
  end
  
  mount_uploader :image, UserImageUploader
end