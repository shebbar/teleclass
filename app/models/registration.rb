class Registration < ActiveRecord::Base
	belongs_to :pin
	belongs_to :user
	belongs_to :subject
end
