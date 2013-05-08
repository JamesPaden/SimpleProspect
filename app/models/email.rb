class Email < ActiveRecord::Base
	belongs_to :recipient
	attr_accessible :body, :send_time, :sent, :subject
	default_scope :order => 'id ASC'
	
end
