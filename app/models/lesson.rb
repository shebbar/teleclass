class Lesson < ActiveRecord::Base
	belongs_to :subject
	belongs_to :audio_file
	has_many :calls
end
