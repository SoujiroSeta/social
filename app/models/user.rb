class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name

  def name
  	"#{first_name} #{last_name}"
  end
end