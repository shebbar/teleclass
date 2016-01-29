class Call < ActiveRecord::Base
	belongs_to :pin
	belongs_to :lesson
end
