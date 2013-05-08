class Recipient < ActiveRecord::Base
	belongs_to :campaign
	has_many :emails, :dependent => :destroy
	attr_accessible :email, :name, :enabled
end
