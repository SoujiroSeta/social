class Gender < ActiveRecord::Base
  attr_accessible :name

  has_many :users

  def self.male 
  	find_by_name('male')
  end

  def self.female
  	find_by_name('female')
  end
end
