class Registration < ActiveRecord::Base
	belongs_to :pin
	belongs_to :user
	belongs_to :subject

	require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      registration_hash = row.to_hash
      registration = Registration.where(id: registration_hash["id"])

      if registration.count == 1
        registration.first.update_attributes(registration_hash)
      else
        Registration.create!(registration_hash)
      end
    end
  end

end
