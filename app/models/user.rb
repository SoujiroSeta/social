class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :token_authenticatable, :authentication_keys => [:login]
        
  attr_accessible :email, :password, :password_confirmation, :total_view,
                  :first_name, :last_name, :remember_me, :image, :username, 
                  :gender_id, :login

  has_many :questions 
  has_many :comments
  has_and_belongs_to_many :groups
  has_many :reputations
  has_many :votes
  belongs_to :gender
  
  # validates_length :password, minimum: 5, maximum: 64, on: :create
  # validates_uniqueness_of :email, :password
  # validates_format :username, with /^[A-Za-z0-9]+$/i
  # validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  # validates_presence_of :username, :email, :phone on: :create
  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end

  
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end


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