class Pin < ActiveRecord::Base
	belongs_to :user
	has_one :registration
	has_many :calls

#  def to_label
#    "#{pincode}"
#  end

end
