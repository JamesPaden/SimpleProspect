class Campaign < ActiveRecord::Base
  	has_many :templates, :dependent => :destroy
	has_many :recipients, :dependent => :destroy

	belongs_to :user
  	attr_accessible :name
end
