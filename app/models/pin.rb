class Pin < ActiveRecord::Base
	belongs_to :user
	has_one :registration
	
	require 'csv'

	def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      pin_hash = row.to_hash
      pin = Pin.where(id: pin_hash["id"])

      if pin.count == 1
        pin.first.update_attributes(pin_hash)
      else
        Pin.create!(pin_hash)
      end
    end 
  end
end
