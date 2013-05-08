class Template < ActiveRecord::Base
	belongs_to :campaign
	attr_accessible :body, :delay, :subject
	default_scope :order => 'id ASC'
end
